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
}

function ControlledRecruitmentPools:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function ControlledRecruitmentPools:Initialise()
    Custom_Log("Setting default values");
    self.HumanFaction = self:GetHumanFaction();
    -- These coordinates are between Lustria and
    -- the Southlands in ME
    self.DefaultXCoordinate = 231;
    self.DefaultYCoordinate = 94;
    self.CRPResources = _G.CRPResources;
    self.CRPLordsInPools = {};
    self:RecalculatePoolLimits();
    -- Clear the loaded data
    _G.CRPResources = nil;
    -- Setup UI
    self.UIController = CRPUI:new({

    });
    self.UIController:InitialiseUI(self.HumanFaction, self.CRPLordsInPools);
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
    --Custom_Log("Checking subculture "..tostring(subculture));
    if subculture == "rebels" or self.CRPResources.CulturePoolResources[subculture] then
        --Custom_Log("Found supported subculture "..tostring(subculture));
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

function ControlledRecruitmentPools:FactionStartup()
	local faction_list = cm:model():world():faction_list();

    cm:disable_event_feed_events(true, "wh_event_category_agent", "", "");
    Custom_Log("Faction Start up");
	for i = 0, faction_list:num_items() - 1 do
        local faction = faction_list:item_at(i);
        if self:IsSupportedSubCulture(faction:subculture()) or self:IsRogueArmy(faction:name()) then
            --if faction:name() == self.HumanFaction:name() then
                Custom_Log("INITIALISING: "..tostring(faction:name()));
                -- After replacing calculate the current pools for the faction
                local currentFactionPools = self:GetCurrentPoolForFaction(faction);
                -- Replace existing lords with specified values (if any)
                -- The current faction pools will be updated with these values
                self:ReplaceExistingLords(faction, currentFactionPools);
                -- Then set the initial pools for the faction
                self:SetupInitialMinimumValues(faction, currentFactionPools);
            --end
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
            --Custom_Log("Replacing character subtype: "..tostring(charSubType))
            local replaceType = factionResources.LordsToReplace[charSubType].replacementKey;
            currentFactionPools[charSubType] = currentFactionPools[charSubType] - 1;
            if currentFactionPools[replaceType] == nil then
                currentFactionPools[replaceType] = 1;
            else
                currentFactionPools[replaceType] = currentFactionPools[replaceType] + 1;
            end

            self:ReplaceCharacter(faction, character, replaceType);
        end
    end
end

function ControlledRecruitmentPools:ReplaceCharacter(faction, character, replaceSubType)
    local factionName = faction:name();
    local factionResources = self:GetFactionPoolResources(faction);
    -- Copied into local var so data can be accessed later
    local characterData = {
        oldCharCqi = character:command_queue_index(),
        factionName = factionName,
        unitList = GetStringifiedUnitList(character),
        regionName = character:region():name(),
        xPos = character:logical_position_x(),
        yPos = character:logical_position_y(),
        subType = replaceSubType,
        foreName = character:get_forename(),
        surname = character:get_surname(),
        isFactionLeader = character:cqi() == faction:faction_leader():cqi();
        traitKey = self:GetRandomTraitForLord(factionResources, character:character_subtype_key());
    }
    --Custom_Log("Copied lord data");
    -- Create the new character with units
    self:CreateForceWithGeneral(characterData);

    -- Remove faction leader immortality
    if characterData.isFactionLeader == true then
    cm:set_character_immortality("character_cqi:"..characterData.oldCharCqi, false);
    end
    -- Kill the old character
    cm:kill_character(characterData.oldCharCqi, true, true);
    --cm:spawn_character_to_pool(factionName, characterData.foreName, characterData.surname, "", "", 18, false, "general", replaceSubType, true, "");
    --Custom_Log("Finished replacing general");
end

function ControlledRecruitmentPools:GetRandomTraitForLord(factionResources, originalSubType)
    --Custom_Log("Getting random trait");
    local traitPool = factionResources.LordsToReplace[originalSubType].traitKeyPool;
    local selectedTrait = GetRandomObjectFromList(traitPool);
    --Custom_Log("Trait selected: "..selectedTrait)
    return selectedTrait;
end

function ControlledRecruitmentPools:CreateForceWithGeneral(character)
    --Custom_Log("Creating force with general");
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
            --Custom_Log("In created character callback");
            -- This is added to a callback because more time is required if the character was
            -- made a faction leader. Without the callback is_faction_leader always returned false
            if character.isFactionLeader then
                --Custom_Log("In create_force_with_general_callback for faction "..tostring(character.factionName).." cqi "..tostring(cqi));
                cm:set_character_immortality("character_cqi:"..cqi, true);
            end
            --Custom_Log("Giving character trait "..character.traitKey);
            cm:force_add_trait("character_cqi:"..cqi, character.traitKey, true);
            -- Move character back to original position
            cm:teleport_to("character_cqi:"..cqi, character.xPos - 1, character.yPos, true);
        end
    );
end

function ControlledRecruitmentPools:UpdateRecruitmentPool(faction, amountToGenerate)
    -- Iterate over all existing characters and calculate the current pool
    -- values
    Custom_Log("STARTING pool update for "..tostring(faction:name()));
    cm:disable_event_feed_events(true, "wh_event_category_agent", "", "");

    local currentPoolCounts = self:GetCurrentPoolForFaction(faction);
    -- Replace any instances of the default lord which is vmp_lord
    --self:ReplaceAnyVampireLords(faction, currentPoolCounts);

    -- Enforce the recruitment pool minmums for this faction
    self:EnforceMinimumValues(faction, currentPoolCounts);

    -- Generate extra characters up to the pool size for that faction
    self:AddGeneralsToPool(faction, currentPoolCounts, amountToGenerate);
    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_agent","",""); end, 1);
    Custom_Log("FINISHED pool update for "..tostring(faction:name()));
end

function ControlledRecruitmentPools:ReplaceAnyVampireLords(faction, currentPoolCounts)
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    local factionResources = self:GetFactionPoolResources(faction);
    local character_list = faction:character_list();
    for i = 0, character_list:num_items() - 1 do
        local character = character_list:item_at(i);
        local charSubType = character:character_subtype_key();
        if charSubType == "vmp_lord" and faction:subculture() ~= "wh_main_sc_vmp_vampire_counts" then
            -- Select a general to generate
            local agentSubTypeKey = self:SelectGeneralToGenerate(factionResources, currentPoolCounts);
            self:ReplaceCharacter(faction, character, agentSubTypeKey);
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
        if (character:has_military_force() and character:military_force():is_armed_citizenry()) == false
        and cm:char_is_agent(character) == false then
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
    if self.CRPLordsInPools[factionName] ~= nil then
        --Custom_Log("Checking tracked lords");
        for key, char in pairs(self.CRPLordsInPools[factionName]) do
            if currentPoolCounts[char.subType] then
                currentPoolCounts[char.subType] = currentPoolCounts[char.subType] + 1;
            else
                currentPoolCounts[char.subType] = 1;
            end
            currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
        end
    end
    return currentPoolCounts;
end

function ControlledRecruitmentPools:SetupInitialMinimumValues(faction, currentPoolCounts)
    self:EnforceMinimumValues(faction, currentPoolCounts);
    local factionPoolResources = self:GetFactionPoolResources(faction);
    for poolKey, pool in pairs(factionPoolResources.FactionPools) do
        local currentPoolMinimum = 0;
        for agentKey, agentSubType in pairs(pool.AgentSubTypes) do
            currentPoolMinimum = currentPoolMinimum + agentSubType.MinimumAmount;
        end
        --Custom_Log(poolKey.." Current pool minimum "..tostring(currentPoolMinimum).." Initial minimum size"..tostring(pool.SubPoolInitialMinSize));
        while currentPoolMinimum < pool.SubPoolInitialMinSize do
            local agentSubTypeKey = self:SelectGeneralToGenerateFromPool(factionPoolResources, currentPoolCounts, poolKey);
            --Custom_Log("Selected "..agentSubTypeKey);
            local artSetId = self:GetArtSetForSubType(agentSubTypeKey);
            --Custom_Log("Art set Id: "..artSetId);
            -- If this is the players faction this should happen straight away
            -- so the recruitment event message can be supressed
            if faction:name() == self.HumanFaction:name() then
                self:GenerateGeneral(agentSubTypeKey, faction, artSetId);
            else
                cm:callback(function() self:GenerateGeneral(agentSubTypeKey, faction, artSetId); end, 1);
            end
            currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
            if currentPoolCounts[agentSubTypeKey] == nil then
                currentPoolCounts[agentSubTypeKey] = 0;
            end
            currentPoolCounts[agentSubTypeKey] = currentPoolCounts[agentSubTypeKey] + 1;
            currentPoolMinimum = currentPoolMinimum + 1;
        end
    end
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
                    --Custom_Log("Before getting art set for subtype "..agentSubTypeKey);
                    local artSetId = self:GetArtSetForSubType(agentSubTypeKey);
                    --Custom_Log("Selected art set: "..artSetId);
                    if faction:name() == self.HumanFaction:name() then
                        self:GenerateGeneral(agentSubTypeKey, faction, artSetId);
                    else
                        cm:callback(function() self:GenerateGeneral(agentSubTypeKey, faction, artSetId); end, 1);
                    end
                    count = count + 1;
                    currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
                end
                currentPoolCounts[agentSubTypeKey] = count;
            end
        end
    end
    --Custom_Log("Finished enforcing minimum values");
end

function ControlledRecruitmentPools:AddGeneralsToPool(faction, currentPoolCounts, maximumAmount)
    if maximumAmount == 0 then
        return;
    end

    --Custom_Log("Generating extras for pool");
    local factionResources = self:GetFactionPoolResources(faction);
    for i = 0, maximumAmount do
        if currentPoolCounts["total"] < factionResources.PoolMaxSize then
            -- Select a general to generate
            local agentSubTypeKey = self:SelectGeneralToGenerate(factionResources, currentPoolCounts);
            -- Generate the general
            -- If this is the players faction this should happen straight away
            -- so the recruitment event message can be supressed
            local artSetId = self:GetArtSetForSubType(agentSubTypeKey);
            if faction:name() == self.HumanFaction:name() then
                self:GenerateGeneral(agentSubTypeKey, faction, artSetId);
            else
                cm:callback(function() self:GenerateGeneral(agentSubTypeKey, faction, artSetId); end, 1);
            end
            -- Update existing counts

            local count = currentPoolCounts[agentSubTypeKey];
            if count == nil then
                count = 0;
            end
            currentPoolCounts[agentSubTypeKey] = count + 1;
            currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
        else
            Custom_Log("Hit poolsize already");
            break;
        end
    end
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

function ControlledRecruitmentPools:GetFactionAgentResources(faction)
    return self.CRPResources.CultureSubTypeResources[faction:subculture()];
end

function ControlledRecruitmentPools:SelectGeneralToGenerate(factionResources, currentPoolCounts)

    local validAgentSubTypes = {};
    -- Find agent types which aren't at the maximum count
    for poolKey, pool in pairs(factionResources.FactionPools) do
        local agentSubTypesBelowMax = {};
        local currentSubPoolCount = 0;
        --Custom_Log("Checking agent pool "..tostring(poolKey));
        for agentKey, agentSubType in pairs(pool.AgentSubTypes) do
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
        if currentSubPoolCount < pool.SubPoolMaxSize then
            ConcatTableWithKeys(validAgentSubTypes, agentSubTypesBelowMax);
        end
    end
    -- Randomly select type from valid agents
    return GetRandomObjectFromList(validAgentSubTypes);
end

function ControlledRecruitmentPools:SelectGeneralToGenerateFromPool(factionResources, currentPoolCounts, poolKey)
    local agentSubTypesBelowMax = {};
    local currentSubPoolCount = 0;
    --Custom_Log("SelectGeneralToGenerateFromPool "..tostring(poolKey));
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
    local factionName = faction:name();
    if factionName == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    if artSetId == nil then
        artSetId = "";
    end
    -- So this function actually works with general but the call back does work
    -- because it only checks the other agent types. This probably indicates that
    -- it was only intended for agents but luckily we can take advantage of this.
    --Custom_Log("Generating general "..tostring(generalSubType));
    cm:create_agent(
        factionName,
        "general",
        generalSubType,
        -- Used to identify the recent spawned lord and get cqi for callback
        self.DefaultXCoordinate,
        self.DefaultYCoordinate,
        false,
        nil
    );
    -- Grab the name from the generated character
    local generatedName = self:GetCharacterNameFromNewGeneral(faction);
    -- Generate a trait from the trait pool (WIP)
    local innateTrait = self:GetRandomCharacterTrait(faction, generalSubType);
    --Custom_Log("Giving character innate trait "..innateTrait);
    -- Then spawn the character so that they appear normally
    cm:spawn_character_to_pool(factionName, generatedName.foreName, generatedName.surname, "", "", 18, true, "general", generalSubType, false, artSetId);
    -- Add the character to the pool table so we can track them
    self:TrackCharacterInPoolData(factionName, generatedName, innateTrait, generalSubType, artSetId)
end

function ControlledRecruitmentPools:GetRandomCharacterTrait(faction, generalSubType)
    local subculture = faction:subculture();
    local factionName = faction:name();
    local isRogueArmy = false;
    local cultureData = self.CRPResources.CulturePoolResources[subculture];
    if cultureData == nil then
        cultureData = self.CRPResources.CulturePoolResources["wh_rogue_armies"];
        isRogueArmy = true;
    end

    local cultureTraits = {};
    if cultureData[factionName].Traits ~= nil then
        ConcatTable(cultureTraits, cultureData[factionName].Traits);
    end

    if cultureData[subculture].Traits ~= nil then
        ConcatTable(cultureTraits, cultureData[subculture].Traits);
    end

    -- There is a flat 30% chance to get a culture / faction trait
    if Roll100(30) then
        return GetRandomObjectFromList(cultureTraits);
    end

    -- Otherwise get a random trait from the shared traits
    local sharedTraits = self.CRPResources.CulturePoolResources["shared"]["shared"].Traits;
    return GetRandomObjectFromList(sharedTraits)
end

function ControlledRecruitmentPools:TrackCharacterInPoolData(factionName, generatedName, innateTrait, subType, artSetId)
    if self.CRPLordsInPools[factionName] == nil then
        self.CRPLordsInPools[factionName] = {};
    end


    local localisedForeName = "";
    if generatedName.foreName ~= "" then
        localisedForeName = effect.get_localised_string(generatedName.foreName);
    end
    local localisedSurname = "";
    if generatedName.surname ~= "" then
        localisedSurname = effect.get_localised_string(generatedName.surname);
    end

    local nameAsKey = localisedForeName..localisedSurname;
    local general = {
        InnateTrait = innateTrait,
        SubType = subType,
        ArtSetId = artSetId,
    };

    self.CRPLordsInPools[factionName][nameAsKey] = general;
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
        local charForeName = char:get_forename();
        local charSurname = char:get_surname();

        local name = {
            foreName = charForeName,
            surname = charSurname,
        };
        --Custom_Log("Got name "..char:get_surname());
        -- Once we have the name, kill them
        cm:kill_character(char:cqi(), true, false);
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
    local subTypeData = self.CRPResources.DBResources.campaign_character_art_sets[subType];
    local artSetId = GetRandomObjectFromList(subTypeData.ArtSetIds);
    return artSetId;
end