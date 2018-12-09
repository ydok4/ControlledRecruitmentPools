ControlledRecruitmentPools = {
    HumanFaction = {},
    CRPResources = {},
    -- Default spawn coordinates before the char is moved
    -- These need to be on a spawn area, ie not mountains or
    -- dense forest.
    DefaultXCoordinate = 0,
    DefaultYCoordinate = 0,
    -- Separate object which controls UI scraping and display
    UIController = {},
    CRPLordsInPools = {},
    PreBattleData = {};
}

function ControlledRecruitmentPools:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function ControlledRecruitmentPools:Initialise()
    out("CRP: Setting default values");
    Custom_Log("Setting default values");
    self.HumanFaction = self:GetHumanFaction();
    -- These coordinates are between Lustria and
    -- the Southlands in ME
    self.DefaultXCoordinate = 231;
    self.DefaultYCoordinate = 94;
    self.CRPResources = _G.CRPResources;
    if self.CRPLordsInPools == nil then
        Custom_Log("Lord pool is blank");
        self.CRPLordsInPools = {};
    end
    self:RecalculatePoolLimits();
    -- Clear the loaded data
    _G.CRPResources = nil;
    -- Setup UI
    self.UIController = CRPUI:new({

    });
    Custom_Log("Finished default values");
    out("CRP: Finished default values");
end

-- The pool limit should be greater than or equal to the highest Agent Sub Type
-- maximum limit in that pool
function ControlledRecruitmentPools:RecalculatePoolLimits()
    Custom_Log("Recalculating pool limits");
    for subcultureKey, subcultureLimits in pairs(self.CRPResources.CulturePoolResources) do
        for factionKey, factionLimits in pairs(subcultureLimits) do
            for factionPoolKey, factionPool in pairs(factionLimits.FactionPools) do
                local subPoolMax = factionPool.SubPoolMaxSize;
                if subPoolMax == nil then
                    subPoolMax = 0;
                end
                local subPoolMin = factionPool.SubPoolInitialMinSize;
                if subPoolMin == nil then
                    subPoolMin = 0;
                end
                local highestMinimum = 0;
                local highestMaximum = 0;
                local calculatedMinimum = 0;

                for agentSubTypeKey, agentSubType in pairs(factionPool.AgentSubTypes) do
                    if agentSubType.MinimumAmount > highestMinimum then
                        highestMinimum = agentSubType.MinimumAmount;
                    end

                    if agentSubType.MaximumAmount > highestMaximum then
                        highestMaximum = agentSubType.MaximumAmount;
                    end

                    calculatedMinimum = calculatedMinimum + agentSubType.MinimumAmount;
                end
                if subPoolMin < calculatedMinimum then
                    factionPool.SubPoolInitialMinSize = calculatedMinimum;
                end
                if subPoolMax < calculatedMinimum + highestMaximum then
                    factionPool.SubPoolMaxSize = calculatedMinimum + highestMaximum;
                end
            end
        end
    end
end

function ControlledRecruitmentPools:IsSupportedSubCulture(subculture)
    if subculture == "rebels" or self.CRPResources.CulturePoolResources[subculture] then
        return true;
    else
        return false;
    end
end

function ControlledRecruitmentPools:IsRogueArmy(factionName)
    --Custom_Log("In rogue army check: "..factionName);
    if self.CRPResources.CulturePoolResources["wh_rogue_armies"][factionName] then
        return true;
    else
        return false;
    end
end

function ControlledRecruitmentPools:NewGameStartUp()
    Custom_Log("New game startup");
	local faction_list = cm:model():world():faction_list();
    cm:disable_event_feed_events(true, "wh_event_category_agent", "", "");
    Custom_Log("Faction Start up");
	for i = 0, faction_list:num_items() - 1 do
        local faction = faction_list:item_at(i);
        if faction:is_quest_battle_faction() == false then
            -- After replacing calculate the current pools for the faction
            local currentFactionPools = self:GetCurrentPoolForFaction(faction);
            if self:IsSupportedSubCulture(faction:subculture()) or self:IsRogueArmy(faction:name()) then
                -- Replace existing lords with specified values (if any)
                -- The current faction pools will be updated with these values
                self:ReplaceExistingLords(faction, currentFactionPools);
                if faction:name() == self.HumanFaction:name() then
                    Custom_Log("Setting minimum for player faction "..faction:name());
                    -- Then set the initial pools for human faction
                    self:SetupInitialMinimumValues(faction, currentFactionPools);
                end
            end
            -- This will replace any vmp_lord_replacements present at the start of the game
            -- This will usually be from armies spawned by scripted. Eg the Artois army for Kemmler start.
           self:RemoveAnyVampireLordReplacementsInFaction(faction, currentFactionPools);
        end
    end
    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_agent","",""); end, 1);
end

function ControlledRecruitmentPools:ReplaceExistingLords(faction, currentFactionPools)
    -- Grab faction resources and check if any lords need to be replaced for this faction
    local factionResources = self:GetFactionPoolResources(faction);
    if factionResources.LordsToReplace == nil then
        return;
    end
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    local character_list = faction:character_list();
    --Custom_Log("Replacing existing lords");
    for i = 0, character_list:num_items() - 1 do
        local character = character_list:item_at(i);
        local charSubType = character:character_subtype_key();

        if factionResources.LordsToReplace[charSubType] ~= nil
        and cm:char_is_mobile_general_with_army(character) then
            Custom_Log("Replacing character subtype: "..tostring(charSubType))
            local replaceType = factionResources.LordsToReplace[charSubType].replacementKey;
            currentFactionPools[charSubType] = currentFactionPools[charSubType] - 1;
            if currentFactionPools[replaceType] == nil then
                currentFactionPools[replaceType] = 1;
            else
                currentFactionPools[replaceType] = currentFactionPools[replaceType] + 1;
            end

            self:ReplaceCharacter(faction, character, replaceType, nil, nil);
        end
    end
end

function ControlledRecruitmentPools:ReplaceCharacter(faction, character, replaceSubType, artSetId, traitOverride)
    Custom_Log("Replacing character "..character:cqi());
    local factionName = faction:name();
    local factionResources = self:GetFactionPoolResources(faction);
    --Custom_Log("In replace got pool resources");

    local selectedTrait = traitOverride;
    if selectedTrait == nil then
        selectedTrait = self:GetRandomTraitForLord(factionResources, character:character_subtype_key());
    end
    if traitKey ~= "" then
        --Custom_Log("Got trait "..selectedTrait);
    else
        --Custom_Log("No traits available");
    end
    local characterRegion = "";
    if character:has_region() == true then
        characterRegion = character:region():name();
    else
        characterRegion = "wh_main_ice_tooth_mountains_icedrake_fjord";
    end

    -- Copied into local var so data can be accessed later
    local characterData = {
        oldCharCqi = character:command_queue_index(),
        factionName = factionName,
        unitList = GetStringifiedUnitList(character),
        regionName = characterRegion,
        xPos = character:logical_position_x(),
        yPos = character:logical_position_y(),
        subType = replaceSubType,
        foreName = character:get_forename(),
        surname = character:get_surname(),
        isFactionLeader = character:cqi() == faction:faction_leader():cqi();
        traitKey = selectedTrait,
        artSetId = artSetId,
    }

    -- Remove faction leader immortality
    if characterData.isFactionLeader == true then
        Custom_Log("Disabling immortality for faction leader");
        cm:set_character_immortality("character_cqi:"..characterData.oldCharCqi, false);
    end

    -- Create the new character with units
    cm:callback(function() self:CreateForceWithGeneral(characterData); end, 0);
    -- Kill the old character
    --cm:callback(function() cm:kill_character(characterData.oldCharCqi, true); end, 1);
    --self:CreateForceWithGeneral(characterData, characterData.oldCharCqi)
    Custom_Log("Finished replacing general");
end

function ControlledRecruitmentPools:GetRandomTraitForLord(factionResources, originalSubType)
    --Custom_Log("Getting random trait for originalSubType "..originalSubType);
    if factionResources.LordsToReplace == nil then
        --Custom_Log("No lords to replace");
        return "";
    end
    local traitPool = factionResources.LordsToReplace[originalSubType].traitKeyPool;
    if traitPool == nil then
        --Custom_Log("Trait pool is null");
        return "";
    end
    local selectedTrait = GetRandomObjectFromList(traitPool);
    --Custom_Log("Trait selected: "..selectedTrait)
    return selectedTrait;
end

function ControlledRecruitmentPools:CreateForceWithGeneral(character)
    cm:create_force_with_general(
        character.factionName,
        character.unitList,
        character.regionName,
        -- X and Y coordinates are used as identifiers in the callback.
        -- So we offset by a little bit to make it unique. This might
        -- cause issues if the position is invalid but an offset of 1
        -- is very small.
        character.xPos + 1,
        character.yPos,
        "general",
        character.subType,
        character.foreName,
        "",
        character.surname,
        "",
        character.isFactionLeader,
        function(cqi)
            Custom_Log("In created character callback for faction "..character.factionName.." with subtype "..character.subType);
            Custom_Log("Character cqi is "..cqi);
            -- This is added to a callback because more time is required if the character was
            -- made a faction leader. Without the callback is_faction_leader always returned false
            if character.isFactionLeader then
                Custom_Log("In create_force_with_general_callback for faction "..tostring(character.factionName).." cqi "..tostring(cqi));
                cm:set_character_immortality("character_cqi:"..cqi, true);
            end

            if character.artSetId ~= nil then
                Custom_Log("Setting art set as "..character.artSetId);
                cm:add_unit_model_overrides(cm:char_lookup_str(cqi), character.artSetId);
            end

            if character.traitKey ~= nil and character.traitKey ~= "" then
                Custom_Log("Giving character trait "..character.traitKey);
                cm:force_add_trait("character_cqi:"..cqi, character.traitKey, true);
            end

            -- Move character back to original position
            cm:teleport_to("character_cqi:"..cqi, character.xPos - 1, character.yPos, true);
            --Custom_Log("Finished character callback");
            Custom_Log_Finished();
        end
    );
    cm:kill_character(character.oldCharCqi, true);
end

function ControlledRecruitmentPools:UpdateRecruitmentPool(faction, amountToGenerate, forceGenerate)
    local factionName = faction:name();
    -- Iterate over all existing characters and calculate the current pool
    -- values
    Custom_Log("STARTING pool update for "..tostring(faction:name()));
    if faction:name() == self.HumanFaction:name() then
        cm:disable_event_feed_events(true, "wh_event_category_agent", "", "");
    end

    local currentPoolCounts = self:GetCurrentPoolForFaction(faction);
    if self.CRPLordsInPools[factionName] == nil then
        Custom_Log("INITIALISING "..factionName);
        -- Set the initial pools for the faction
        self:SetupInitialMinimumValues(faction, currentPoolCounts);
        -- Add the initialised value
        self.CRPLordsInPools[factionName] = {};
        self.CRPLordsInPools[factionName]["initialised"] = {"initialised"};
    else
        -- Enforce the recruitment pool minimums for this faction
        self:EnforceMinimumValues(faction, currentPoolCounts);
    end

    -- Generate extra characters up to the pool size for that faction
    local addedGenerals = self:AddGeneralsToPool(faction, currentPoolCounts, amountToGenerate, forceGenerate);
    if faction:name() == self.HumanFaction:name() then
        cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_agent","",""); end, 1);
    end
    Custom_Log("FINISHED pool update for "..tostring(faction:name()));
    return addedGenerals;
end

function ControlledRecruitmentPools:RemoveAnyVampireLordReplacementsInFaction(faction, currentPoolCounts)
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    local factionResources = self:GetFactionPoolResources(faction);
    local character_list = faction:character_list();
    for i = 0, character_list:num_items() - 1 do
        local char = character_list:item_at(i);
        local charSubType = char:character_subtype_key();
        if char:character_subtype_key() == "vmp_lord_replacement" and (char:has_military_force() == true and char:military_force():is_armed_citizenry() == false) then
            Custom_Log("Found the vmp_lord_replacement for faction "..faction:name());
            -- Select a general to generate
            if not currentPoolCounts then
                currentPoolCounts = self:GetCurrentPoolForFaction(faction);
            end
            local agentSubTypeKey = self:SelectGeneralToGenerate(factionResources, currentPoolCounts, true, false);
            Custom_Log("Replacing character with "..agentSubTypeKey);
            self:ReplaceCharacter(faction, char, agentSubTypeKey, nil, nil);
            -- This has been removed because I was not able to find a way to kill the characters successfully from within the pool
            -- but will attempt again in the future if it is required
            -- Otherwise they are in the recruitement pool. Typically this happens when killing a lord
            -- with immortality and (I think) the immortality command doesn't process
            --[[elseif charSubType == "vmp_lord" then
                --cm:teleport_to("character_cqi:"..char:cqi(), 231, 94, true);
                cm:callback(function() cm:kill_character(char:cqi(), true, true); end, 1); 
                --cm:set_character_immortality("character_cqi:"..char:cqi(), false);
                --cm:callback(function() Custom_Log("Killing character "..char:cqi());  end, 1);
            end--]]
        elseif char:character_subtype_key() == "vmp_lord" and (char:has_military_force() == false) then
            Custom_Log("Found vampire_lord in faction pool "..char:faction():name().." cqi "..char:cqi());
            cm:kill_character(char:cqi(), true, true);
        end
    end
end

function ControlledRecruitmentPools:GetCurrentPoolForFaction(faction)
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    local character_list = faction:character_list();

    local currentPoolCounts = {};
    currentPoolCounts["total"] = 0;
    for i = 0, character_list:num_items() - 1 do
        local character = character_list:item_at(i);
        local charSubType = character:character_subtype_key();
        -- We do not want to count garrison commands and agents
        if character:has_military_force() and character:military_force():is_armed_citizenry() == false
        and cm:char_is_agent(character) == false and charSubType ~= "vmp_lord_replacement" then
            --Custom_Log("Found existing character subtype: "..tostring(charSubType));
            if currentPoolCounts[charSubType] then
                currentPoolCounts[charSubType] = currentPoolCounts[charSubType] + 1;
            else
                currentPoolCounts[charSubType] = 1;
            end
            currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
        end
    end
    --Custom_Log("Finished check existing characters");
    local factionName = faction:name();
        -- I couldn't store skull-takerz as a key in the lua table because of the -
    -- So this takes care of that edge case
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    if self.CRPLordsInPools[factionName] ~= nil then
        --Custom_Log("Checking tracked lords");
        for key, char in pairs(self.CRPLordsInPools[factionName]) do
            --Custom_Log("Found tracked character subtype: "..tostring(char.SubType));
            if key ~= "initialised" then
                if currentPoolCounts[char.SubType] then
                    currentPoolCounts[char.SubType] = currentPoolCounts[char.SubType] + 1;
                else
                    currentPoolCounts[char.SubType] = 1;
                end
                currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
            end
        end
    end
    return currentPoolCounts;
end

function ControlledRecruitmentPools:SetupInitialMinimumValues(faction, currentPoolCounts)
    self:EnforceMinimumValues(faction, currentPoolCounts);
    --Custom_Log("Enforced minimum values");
    local factionPoolResources = self:GetFactionPoolResources(faction);
    for poolKey, pool in pairs(factionPoolResources.FactionPools) do
        local currentPoolMinimum = 0;
        for agentKey, agentSubType in pairs(pool.AgentSubTypes) do
            currentPoolMinimum = currentPoolMinimum + agentSubType.MinimumAmount;
        end
        --Custom_Log(poolKey.." Current pool minimum "..tostring(currentPoolMinimum).." Initial minimum size"..tostring(pool.SubPoolInitialMinSize));
        while currentPoolMinimum < pool.SubPoolInitialMinSize do
            local agentSubTypeKey = self:SelectGeneralToGenerateFromPool(factionPoolResources, currentPoolCounts, poolKey);
            Custom_Log("Selected "..agentSubTypeKey);
            local artSetId = self:GetArtSetForSubType(agentSubTypeKey);
            --Custom_Log("Art set Id: "..artSetId);
            -- If this is the players faction this should happen straight away - Not right now. 
            -- so the recruitment event message can be supressed
            --if faction:name() == self.HumanFaction:name() then
                self:GenerateGeneral(agentSubTypeKey, faction, artSetId);
            --else
            --    cm:callback(function() self:GenerateGeneral(agentSubTypeKey, faction, artSetId); end, 1);
            --end
            currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
            if currentPoolCounts[agentSubTypeKey] == nil then
                currentPoolCounts[agentSubTypeKey] = 0;
            end
            currentPoolCounts[agentSubTypeKey] = currentPoolCounts[agentSubTypeKey] + 1;
            currentPoolMinimum = currentPoolMinimum + 1;
        end
    end
    --Custom_Log("Finished initial values");
end

function ControlledRecruitmentPools:EnforceMinimumValues(faction, currentPoolCounts)
    local factionResources = self:GetFactionPoolResources(faction);
    for poolKey, pool in pairs(factionResources.FactionPools) do
        --Custom_Log("Enforcing minimums for pool "..poolKey);
        -- Generate minimums for each agent type
        for agentSubTypeKey, agentSubType in pairs(pool.AgentSubTypes) do
            --Custom_Log(agentSubTypeKey.." minimum "..agentSubType.MinimumAmount);
            if agentSubType.MinimumAmount > 0 then
                local count = currentPoolCounts[agentSubTypeKey];
                if count == nil then
                    count = 0;
                end
                while count < agentSubType.MinimumAmount do
                    -- If this is the players faction this should happen straight away
                    -- so the recruitment event message can be supressed
                    --Custom_Log("Enforcing minimum for subtype "..agentSubTypeKey);
                    local artSetId = self:GetArtSetForSubType(agentSubTypeKey);
                    --Custom_Log("Selected art set: "..artSetId);
                    --if faction:name() == self.HumanFaction:name() then
                        self:GenerateGeneral(agentSubTypeKey, faction, artSetId);
                    --else
                    --    cm:callback(function() self:GenerateGeneral(agentSubTypeKey, faction, artSetId); end, 1);
                    --end
                    count = count + 1;
                    currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
                end
                currentPoolCounts[agentSubTypeKey] = count;
            end
        end
    end
    --Custom_Log("Finished enforcing minimum values");
end

function ControlledRecruitmentPools:AddGeneralsToPool(faction, currentPoolCounts, maximumAmount, forceGenerate)
    if maximumAmount == 0 then
        return;
    end

    Custom_Log("Generating "..maximumAmount.." extras for pool");
    if forceGenerate == true then
        Custom_Log("forceGenerate is specified. General(s) will be created");
    end
    local newGenerals = {};
    local factionResources = self:GetFactionPoolResources(faction);
    for i = 1, maximumAmount do
        Custom_Log("Generating general "..i);
        if currentPoolCounts["total"] < factionResources.PoolMaxSize or forceGenerate == true then
            -- Select a general to generate
            local agentSubTypeKey = self:SelectGeneralToGenerate(factionResources, currentPoolCounts, forceGenerate, false);
            Custom_Log("Selected general "..agentSubTypeKey);
            -- Generate the general
            -- If this is the players faction this should happen straight away
            -- so the recruitment event message can be supressed
            local artSetId = self:GetArtSetForSubType(agentSubTypeKey);
            --if faction:name() == self.HumanFaction:name() then
                local trackedCharacter = self:GenerateGeneral(agentSubTypeKey, faction, artSetId);
            --else
             --   cm:callback(function() self:GenerateGeneral(agentSubTypeKey, faction, artSetId); end, 1);
            --end

            -- Update existing counts
            local count = currentPoolCounts[agentSubTypeKey];
            if count == nil then
                count = 0;
            end
            currentPoolCounts[agentSubTypeKey] = count + 1;
            currentPoolCounts["total"] = currentPoolCounts["total"] + 1;

            newGenerals[#newGenerals + 1] = {
                AgentSubType = agentSubTypeKey,
                ArtSetId = artSetId,
            };
        else
            Custom_Log("Hit poolsize already "..factionResources.PoolMaxSize);
            break;
        end
    end

    return newGenerals;
end

function ControlledRecruitmentPools:GetFactionPoolResources(faction)
    local subCulturePoolResources = self.CRPResources.CulturePoolResources[faction:subculture()];
    local factionName = faction:name();
    -- I couldn't store skull-takerz as a key in the lua table because of the -
    -- So this takes care of that edge case
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end

    if subCulturePoolResources == nil then
        return self.CRPResources.CulturePoolResources["wh_rogue_armies"][factionName];
    elseif subCulturePoolResources[factionName] then
        return subCulturePoolResources[factionName];
    else
        return subCulturePoolResources[faction:subculture()];
    end
end

function ControlledRecruitmentPools:SelectGeneralToGenerate(factionResources, currentPoolCounts, forceGenerationIfNoValues, overrideLimit)
    local validAgentSubTypes = {};
    if overrideLimit then
        Custom_Log("Forcing general to generate");
    end
    if currentPoolCounts == nil then
        Custom_Log("Current pool counts is nil");
        currentPoolCounts = {};
    end

    -- Find agent types which aren't at the maximum count
    for poolKey, pool in pairs(factionResources.FactionPools) do
        local agentSubTypesBelowMax = {};
        local currentSubPoolCount = 0;
        --Custom_Log("Checking agent pool "..tostring(poolKey));
        for agentKey, agentSubType in pairs(pool.AgentSubTypes) do
            --Custom_Log("Checking agent key "..agentKey);
            local count = currentPoolCounts[agentKey];
            if count == nil then
                count = 0;
            end
            --Custom_Log("Current count "..count);
            -- If the number of agents currently in the pool is less than their maximum value
            -- they might be generated
            if count < agentSubType.MaximumAmount then
                agentSubTypesBelowMax[agentKey] = agentKey;
            elseif overrideLimit then
                agentSubTypesBelowMax[agentKey] = agentKey;
            else
                --Custom_Log("Sub type is not below max");
            end

            currentSubPoolCount = currentSubPoolCount + count;
        end
        Custom_Log("Finished checking pool "..poolKey);
        if currentSubPoolCount < pool.SubPoolMaxSize or overrideLimit == true then
            ConcatTableWithKeys(validAgentSubTypes, agentSubTypesBelowMax);
        end
    end

    if next(validAgentSubTypes) == nil then
        Custom_Log("There are no valid agent sub types");
        if forceGenerationIfNoValues == true and overrideLimit == false then
            return self:SelectGeneralToGenerate(factionResources, currentPoolCounts, true, true);
        end
    end
    -- Randomly select type from valid agents
    return GetRandomObjectFromList(validAgentSubTypes);
end

function ControlledRecruitmentPools:SelectGeneralToGenerateFromPool(factionResources, currentPoolCounts, poolKey)
    local agentSubTypesBelowMax = {};
    local currentSubPoolCount = 0;
    Custom_Log("SelectGeneralToGenerateFromPool "..tostring(poolKey));
    for agentKey, agentSubType in pairs(factionResources.FactionPools[poolKey].AgentSubTypes) do
        local count = currentPoolCounts[agentKey];
        if count == nil then
            count = 0;
        end
        -- If the number of agents currently in the pool is less than their maximum value
        -- they might be generated
        if count < agentSubType.MaximumAmount then
            agentSubTypesBelowMax[agentKey] = agentKey;
        end

        currentSubPoolCount = currentSubPoolCount + count;
    end
    -- Randomly select type from valid agents
    return GetRandomObjectFromList(agentSubTypesBelowMax);
end

function ControlledRecruitmentPools:GenerateGeneral(generalSubType, faction, artSetId)
    Custom_Log("Generating general");
    local factionName = faction:name();
    if factionName == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    if artSetId == nil then
        artSetId = "";
    end

    -- So this function actually works with a general but the call back does not work
    -- because it only checks the other agent types. This probably indicates that
    -- it was only intended for agents but luckily we can take advantage of this.
    --Custom_Log("Generating general "..tostring(generalSubType));
    --[[cm:create_agent(
        faction:name(),
        "general",
        generalSubType,
        -- Used to identify the recent spawned lord and get cqi for callback
        self.DefaultXCoordinate,
        self.DefaultYCoordinate,
        false,
        nil
    );
    -- Grab the name from the generated character
    local generatedName = self:GetCharacterNameFromNewGeneral(faction);--]]
    local generatedName = self:GetCharacterNameForSubculture(faction, generalSubType);
    -- Generate a trait from the trait pool (WIP)
    local innateTrait = self:GetRandomCharacterTrait(faction, generalSubType);
    --Custom_Log("Giving character innate trait "..innateTrait);
    -- Then spawn the character so that they appear normally
    --Custom_Log("Forename/clan_name "..generatedName.clan_name.." surename/forename "..generatedName.forename);
    cm:spawn_character_to_pool(faction:name(), generatedName.clan_name, generatedName.forename, "", "", 20, true, "general", generalSubType, false, artSetId);
    --Custom_Log("Spawned character into pool");
    -- Add the character to the pool table so we can track them
    local trackedData = self:TrackCharacterInPoolData(factionName, generatedName, innateTrait, generalSubType, artSetId);
    Custom_Log("Finished generating general");
    return trackedData;
end

function ControlledRecruitmentPools:GetCharacterNameForSubculture(faction, agentSubType)
    local factionName = faction:name();
    if factionName == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    --Custom_Log("Getting name for faction "..factionName);
    local factionSubculture = faction:subculture();
    --Custom_Log("In subculture "..factionSubculture);
    local subcultureResources = self.CRPResources.CulturePoolResources[factionSubculture];
    if subcultureResources == nil then
        subcultureResources = self.CRPResources.CulturePoolResources["wh_rogue_armies"];
    end
    local factionResources = subcultureResources[factionName];

    local nameGroup = -1;
    if factionResources ~= nil and factionResources.NameGroup ~= nil then
        nameGroup = factionResources.NameGroup;
    else
        local dbNameGroup = self.CRPResources.DBResources.faction_to_name_groups[factionName];
        if dbNameGroup ~= nil then
            nameGroup = dbNameGroup.NameGroup;
        else
            Custom_Log("Non supported faction found, using alternate method");
            local generatedName = self:GetCharacterNameFromNewGeneral(faction);
            return generatedName;
        end
    end
    nameGroup = "name_group_"..nameGroup;
    local namePool = self.CRPResources.DBResources.name_groups_to_names[nameGroup];
    local canUseFemaleNames = self:GetGenderForAgentSubType(agentSubType);

    local doOnce = false;
    local nameKey = "";
    local clan_name_object = "";
    local forename_object = "";
    local forename_chance = self:GetForeNameChance(factionSubculture);

    local factionLords = self.CRPLordsInPools[factionName];
    while doOnce == false or factionLords[nameKey] ~= nil or nameKey == "" do
        clan_name_object = self:GetValidNameForType(namePool, canUseFemaleNames, "clan_name");
        if Roll100(forename_chance) then
            --Custom_Log("Generating forename");
            forename_object = self:GetValidNameForType(namePool, canUseFemaleNames, "forename");
        else
            --Custom_Log("Not Generating forename");
            forename_object = {};
            forename_object.Text = "";
            forename_object.Id = "";
        end

        nameKey = clan_name_object.Text..forename_object.Text;
        nameKey = CreateValidLuaTableKey(nameKey);
        Custom_Log("Generated name key is "..nameKey);
        doOnce = true;
        if factionLords == nil and nameKey ~= "" then
            Custom_Log("Faction has no tracked lords. Using first generated name.");
            break;
        end
    end

    local generatedName = {
        clan_name = clan_name_object.Id,
        forename = forename_object.Id,
    };
    --Custom_Log("Got generated name");
    return generatedName;
end

function ControlledRecruitmentPools:GetForeNameChance(factionSubculture)
    if factionSubculture == "wh_main_sc_chs_chaos" then
        return 100 - 60;
    elseif factionSubculture == "wh2_main_sc_skv_skaven" then
        return 100 - 75;
    elseif factionSubculture == "wh_main_sc_nor_norsca" then
        return 100 - 30;
    elseif factionSubculture == "wh_dlc03_sc_bst_beastmen" then
        return 100 - 75;
    elseif factionSubculture == "wh_main_sc_grn_greenskins" or factionSubculture == "wh_main_sc_grn_savage_orcs" then
        return 100 - 40;
    end
    return 100;
end

function ControlledRecruitmentPools:GetValidNameForType(namePool, canUseFemaleNames, nameType)
    local genderNames = {};
    if canUseFemaleNames then
        genderNames = namePool.Gender["Female"];
    else
        if namePool.Gender["Male"] ~= nil and namePool.Gender["Special"]  ~= nil then
            ConcatTableWithKeys(genderNames, namePool.Gender["Male"]);
            ConcatTableWithKeys(genderNames, namePool.Gender["Special"]);
        elseif namePool.Gender["Male"] ~= nil then
            genderNames = namePool.Gender["Male"];
        elseif namePool.Gender["Special"]  ~= nil then
            genderNames = namePool.Gender["Special"];
        end
    end

    if genderNames ~= nil then
        local nameTypes = genderNames[nameType];
        if nameTypes ~= nil then
            local randomName = GetRandomObjectKeyFromList(nameTypes);
            --Custom_Log("Generating name "..randomName);
            local nameId = nameTypes[randomName];
            --Custom_Log("Name id "..nameId);
            local nameObject = {
                Id = "names_name_"..tostring(nameId),
                Text = randomName,
            };
            return nameObject;
        end
    end
    local nameObject = {
        Id = "",
        Text = "",
    };
    return nameObject;
end

function ControlledRecruitmentPools:GetGenderForAgentSubType(agentSubType)
    local agentResources = self.CRPResources.DBResources.campaign_character_data[agentSubType];
    if agentResources ~= nil then
        return agentResources.IsFemale == "true";
    end
    Custom_Log("Error: Could not find agent resources");
end

function ControlledRecruitmentPools:GetRandomCharacterTrait(faction, generalSubType)
    local subculture = faction:subculture();
    local factionName = faction:name();
    if factionName == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    local isRogueArmy = false;
    local cultureData = self.CRPResources.CulturePoolResources[subculture];
    if cultureData == nil then
        cultureData = self.CRPResources.CulturePoolResources["wh_rogue_armies"];
        isRogueArmy = true;
    end

    local defaultSubCultureData = cultureData[subculture];

    local cultureTraits = {};
    local foundCultureTraits = false;
    -- Get traits for the subculture
    if defaultSubCultureData ~= nil and defaultSubCultureData.Traits ~= nil then
        ConcatTableWithKeys(cultureTraits, defaultSubCultureData.Traits);
        foundCultureTraits = true;
    end

    local defaultFactionData = cultureData[factionName];
    -- Then get the traits for the factions
    if defaultFactionData ~= nil and defaultFactionData.Traits ~= nil then
        ConcatTableWithKeys(cultureTraits, defaultFactionData.Traits);
        foundCultureTraits = true;
    end

    if defaultFactionData ~= nil and defaultFactionData.ExcludedTraits ~= nil then
        -- Then remove any excluded traits
        for index, traitKey in pairs(defaultFactionData.ExcludedTraits) do
            if cultureTraits[traitKey] ~= nil then
                cultureTraits[traitKey] = nil;
            end
        end
    end

    -- There is a flat 50% chance to get a culture / faction trait
    if foundCultureTraits == true and Roll100(50) then
        return GetRandomObjectKeyFromList(cultureTraits);
    end

    -- Otherwise get a random trait from the shared traits
    local sharedTraits = self.CRPResources.CulturePoolResources["shared"]["shared"].Traits;

    if defaultFactionData ~= nil and defaultFactionData.ExcludedTraits ~= nil then
        -- Then remove any excluded traits
        for index, traitKey in pairs(defaultFactionData.ExcludedTraits) do
            if sharedTraits[traitKey] ~= nil then
                sharedTraits[traitKey] = nil;
            end
        end
    end

    if defaultSubCultureData ~= nil and defaultSubCultureData.ExcludedTraits ~= nil then
        -- Then remove any excluded traits
        for index, traitKey in pairs(defaultSubCultureData.ExcludedTraits) do
            if sharedTraits[traitKey] ~= nil then
                sharedTraits[traitKey] = nil;
            end
        end
    end

    return GetRandomObjectKeyFromList(sharedTraits)
end

function ControlledRecruitmentPools:TrackCharacterInPoolData(factionName, generatedName, innateTrait, subType, artSetId)
    if self.CRPLordsInPools[factionName] == nil then
        self.CRPLordsInPools[factionName] = {};
    end


    local localisedForeName = "";
    if generatedName.clan_name ~= "" then
        localisedForeName = effect.get_localised_string(generatedName.clan_name);
    end
    local localisedSurname = "";
    if generatedName.forename ~= "" then
        localisedSurname = effect.get_localised_string(generatedName.forename);
    end

    local keyName = localisedForeName..localisedSurname;
    keyName = CreateValidLuaTableKey(keyName);
    local general = {
        InnateTrait = innateTrait,
        SubType = subType,
        ArtSetId = artSetId,
    };

    self.CRPLordsInPools[factionName][keyName] = general;
    --Custom_Log("Tracking "..keyName);
    return general;
end
--[[function ControlledRecruitmentPools:GenerateAgent(agentSubType)
    -- So this function actually works with general but the call back does work
    -- because it only checks the other agent types. This probably indicates that
    -- it was only intended for agents but luckily we can take advantage of this.
    Custom_Log("Generating Spy "..tostring(agentSubType));
    cm:create_agent(
        self.HumanFaction:name(),
        "spy",
        agentSubType,
        -- agentSubType to identify the recent spawned lord and get cqi for callback
        self.DefaultXCoordinate,
        self.DefaultYCoordinate,
        false,
        nil
    );
    Custom_Log("Created Spy "..tostring(agentSubType));
    --self:TriggerCallbackForNewGeneral(callbackFunction);
end--]]

function ControlledRecruitmentPools:GetCharacterNameFromNewGeneral(faction)
    local character_list = faction:character_list();
    local character_list_count = character_list:num_items() - 1;
    local char = character_list:item_at(character_list_count);
    if char:logical_position_x() == self.DefaultXCoordinate
        and char:logical_position_y() == self.DefaultYCoordinate then
        --Custom_Log("Found character");
        local charForeName = char:get_forename();
        local charSurname = char:get_surname();

        local name = {
            clan_name = charForeName,
            forename = charSurname,
        };
        --Custom_Log("Got name "..char:get_surname());
        -- Remove immortality
        -- Once we have the name, kill them
        cm:kill_character(char:cqi(), true);
        return name;
    end
end

-- This exists to convert the human faction list to just an object.
-- This also means it will only work for one player.
function ControlledRecruitmentPools:GetHumanFaction()
    local allHumanFactions = cm:get_human_factions();
    if allHumanFactions == nil then
        return allHumanFactions;
    end
    for key, humanFaction in pairs(allHumanFactions) do
        Custom_Log("Human faction "..tostring(humanFaction));
        return cm:model():world():faction_by_key(humanFaction);
    end
end

function ControlledRecruitmentPools:GetArtSetForSubType(subType)
    --Custom_Log("Getting art set for sub type: "..subType);
    local subTypeData = self.CRPResources.DBResources.campaign_character_data[subType];
    local artSetId = GetRandomObjectFromList(subTypeData.ArtSetIds);
    return artSetId;
end

function ControlledRecruitmentPools:GetValidAgentArtSetForFaction(faction)
    local currentFactionPools = self:GetCurrentPoolForFaction(faction);
    currentFactionPools["total"] = nil;
    local agentSubType = GetRandomObjectKeyFromList(currentFactionPools);
    Custom_Log("Selected random agent sub type "..agentSubType);

    if agentSubType == "vmp_lord_replacement" then
        Custom_Log("Current faction pools is null, try and get an art set from the faction pool resources");
        local factionPoolResources = self:GetFactionPoolResources(faction);
        --Custom_Log("Got faction pools resources for faction");
        local poolData = GetRandomObjectFromList(factionPoolResources.FactionPools);
        --Custom_Log("Got poolkey");
        local agentSubTypeKey = GetRandomObjectKeyFromList(poolData.AgentSubTypes);
        --Custom_Log("Selected "..agentSubTypeKey);
        local artSetId = self:GetArtSetForSubType(agentSubTypeKey);
        --Custom_Log("Got artset "..artSetId);
        return artSetId;
    end

    local artSetId = self:GetArtSetForSubType(agentSubType);
    --Custom_Log("Selected random art set for sub type: "..artSetId);
    return artSetId;
end

function ControlledRecruitmentPools:IsFactionInitialised(factionName)
    if self.CRPLordsInPools[factionName] ~= nil and self.CRPLordsInPools[factionName]["initialised"] then
        return true;
    end
    return false;
end

function ControlledRecruitmentPools:AddPreBattleData(preBattleData, type)
    self.PreBattleData[type] = preBattleData;
end

function ControlledRecruitmentPools:GetPreBattleFactionForCharacter(char_cqi, type)
    Custom_Log("Getting pre battle faction for character");
    local preBattleDataForType = self.PreBattleData[type];
    for key, preBattleCombatant in pairs(preBattleDataForType) do
        Custom_Log("CQI is "..preBattleCombatant.character_cqi);
        if preBattleCombatant.character_cqi == char_cqi then
            Custom_Log("Found matching character. Faction is: "..preBattleCombatant.character_faction);
            return preBattleCombatant.character_faction;
        end
    end
end

function ControlledRecruitmentPools:GetPreBattleSubTypeForCharacter(char_cqi, type)
    Custom_Log("Getting pre battle subtype for character. This is for "..type);
    local preBattleDataForType = self.PreBattleData[type];
    if preBattleDataForType == nil then
        Custom_Log("PreBattleData is not set");
        return;
    end
    for key, preBattleCombatant in pairs(preBattleDataForType) do
        Custom_Log("CQI is "..preBattleCombatant.character_cqi);
        if preBattleCombatant.character_cqi == char_cqi then
            Custom_Log("Found matching character. Subtype is: "..preBattleCombatant.character_sub_type);
            return preBattleCombatant.character_sub_type;
        end
    end
end

function ControlledRecruitmentPools:ProcessNewCharacter(context)
    local char = context:character();
    local factionName = char:faction():name();
    local factionLords = self.CRPLordsInPools[factionName];

    local localisedForeName = effect.get_localised_string(char:get_forename());
    local localisedSurname = "";
    local surnameKey =  char:get_surname();
    if surnameKey ~= nil and surnameKey ~= "" then
        localisedSurname = effect.get_localised_string(char:get_surname());
    end
    local keyName = localisedForeName..localisedSurname;
    -- This removes any spaces within names, eg the surname "Von Carstein";
    -- Otherwise the key is invalid and the character won't be tracked
    keyName = CreateValidLuaTableKey(keyName);
    --Custom_Log("Character key: "..keyName.."end");
    if factionLords ~= nil and factionLords[keyName] ~= nil then
        --Custom_Log("Character is in pool for faction: "..factionName);
        -- If the character is tracked in the pool
        local poolData = factionLords[keyName];
        local subCulture = char:faction():subculture();
        if poolData then
            --Custom_Log("Adding trait: "..poolData.InnateTrait.." for character: "..keyName);
            --cm:disable_event_feed_events(true, "wh_event_category_traits_ancillaries", "", "");
            -- Add their trait
            --cm:force_add_trait("character_cqi:"..char:cqi(), poolData.InnateTrait, true);
            -- Then remove from the pool
            factionLords[keyName] = nil;
            --cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_traits_ancillaries", "", "") end, 1);
            -- Note: Removal is necessary since we now track the character from the faction's character_list

            if subCulture == "wh2_main_sc_hef_high_elves" and factionName == self.HumanFaction:name() then
                Custom_Log("High elf character recruited listener");
                if poolData.SubType == "wh2_main_hef_prince_mid" or poolData.SubType == "wh2_main_hef_princess_mid" then
                    cm:suppress_all_event_feed_messages(true);
                    cm:trigger_incident(factionName, "wh2_main_hef_mid_lord_influence_cost", true);
                    cm:suppress_all_event_feed_messages(false);
                    Custom_Log("Lord is mid prince or princess");
                elseif poolData.SubType == "wh2_main_hef_prince_high" or poolData.SubType == "wh2_main_hef_princess_high" then
                    cm:suppress_all_event_feed_messages(true);
                    cm:trigger_incident(factionName, "wh2_main_hef_high_lord_influence_cost", true);
                    cm:suppress_all_event_feed_messages(false);
                    Custom_Log("Lord is high prince or princess");
                end
            end
        else
            Custom_Log("Character is not in pool");
        end
    -- If the character isn't tracked, that means CRP didn't spawn it.
    -- This check is to specifically check the "Extra" spawned characters from the system. This occurs when using kill_character() and create_force_with_general().
    -- Weirdly enough this won't use vmp_lord_replacement but vmp_lord (even though it does in every other case).
    -- We also don't want to do this with characters without military forces and definitely not on garrison commands.
    -- Also since this character is not tracked, it means we can safely delete vmp_lords for the Vampire Counts factions.
    elseif char:character_subtype_key() == "vmp_lord" and (char:has_military_force() == false or char:military_force():is_armed_citizenry() == false) then
        Custom_Log("Character is a vampire lord");
        Custom_Log("Character Details "..factionName.." sub type "..char:character_subtype_key().." cqi "..char:cqi());
        local faction = char:faction();
        if faction:name() == self.HumanFaction:name() and faction:subculture() ~= "wh_main_sc_vmp_vampire_counts" then
            if faction:name() ~= "rebels" then
                cm:callback(function() cm:kill_character(char:cqi(), true, true); end, 1);
                Custom_Log("Killed character "..char:cqi());
            end
        end
        Custom_Log("Finished Character created listener");
        Custom_Log_Finished();
    -- This condition checks for armies created with create_force
    -- This army will be replaced
    elseif char:character_subtype_key() == "vmp_lord_replacement" and (char:has_military_force() == true and char:military_force():is_armed_citizenry() == false) then
        Custom_Log("Found spawned replacement");
        Custom_Log("Character Details "..factionName.." sub type "..char:character_subtype_key().." cqi "..char:cqi());
        Custom_Log("Finished Character created listener");
        Custom_Log_Finished();
    end
end

function ControlledRecruitmentPools:ProcessKilledCharacter(context)
    local char = context:character();
    local factionName = char:faction():name();
    local factionLords = self.CRPLordsInPools[factionName];
    --Custom_Log("Killed Character Details "..factionName.." sub type "..char:character_subtype_key().." cqi "..char:cqi());
    if factionLords ~= nil then
        local localisedForeName = effect.get_localised_string(char:get_forename());
        local localisedSurname = "";
        local surnameKey =  char:get_surname();
        if surnameKey ~= nil and surnameKey ~= "" then
            localisedSurname = effect.get_localised_string(char:get_surname());
        end
        local keyName = localisedForeName..localisedSurname;
        -- This removes any spaces within names, eg the surname "Von Carstein";
        -- Otherwise the key is invalid and the character won't be tracked
        keyName = CreateValidLuaTableKey(keyName);
        --Custom_Log("Character is in pool for faction: "..factionName);
        -- If the character is tracked in the pool
        if factionLords[keyName] ~= nil then
            Custom_Log("Setting "..keyName.." as nil");
            factionLords[keyName] = nil;
        end
    end
    --Custom_Log_Finished();
end