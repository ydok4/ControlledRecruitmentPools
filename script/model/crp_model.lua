ControlledRecruitmentPools = {
    HumanFaction = {},
    CRPResources = {},
    -- Default spawn coordinates before the char is moved
    -- These need to be on a spawn area, ie not mountains or
    -- dense forest. 
    DefaultXCoordinate = 0,
    DefaultYCoordinate = 0,
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
    self:RecalculatePoolLimits();
    -- Clear the loaded data
    _G.CRPResources = nil;
end

-- The pool limit should be greater than or equal to the highest Agent Sub Type 
-- maximum limit in that pool
function ControlledRecruitmentPools:RecalculatePoolLimits()
    for subcultureKey, subcultureLimits in pairs(self.CRPResources.CultureResources) do
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
    Custom_Log("Checking subculture "..tostring(subculture));
    if subculture == "rebels" or self.CRPResources.CultureResources[subculture] then
        Custom_Log("Found supported subculture "..tostring(subculture));
        return true;
    else
        return false;
    end
end

function ControlledRecruitmentPools:IsRogueArmy(factionName)
    Custom_Log("In rogue army check: "..factionName);
    if self.CRPResources.CultureResources["wh_rogue_armies"][factionName] then
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
            Custom_Log("INITIALISING: "..tostring(faction:name()));
            -- After replacing calculate the current pools for the faction
            local currentFactionPools = self:GetCurrentPoolForFaction(faction);
            -- Replace existing lords with specified values (if any)
            -- The current faction pools will be updated with these values+
            self:ReplaceExistingLords(faction, currentFactionPools);
            -- Then set the initial pools for the faction
            self:SetupInitialMinimumValues(faction, currentFactionPools);
        end
    end
    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_agent","",""); end, 1);
end

function ControlledRecruitmentPools:ReplaceExistingLords(faction, currentFactionPools)
    -- Grab faction resources and check if any lords need to be replaced for this faction
    local factionResources = self:GetFactionResources(faction);
    if factionResources.LordsToReplace == nil then
        return;
    end
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    local character_list = faction:character_list();
    Custom_Log("Replacing existing lords");
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

            self:ReplaceCharacter(faction, character, replaceType);
        end
    end
end

function ControlledRecruitmentPools:ReplaceCharacter(faction, character, replaceSubType)
    local factionName = faction:name();
    local factionResources = self:GetFactionResources(faction);
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
    Custom_Log("Copied lord data");
    -- Remove faction leader immortality
    if characterData.isFactionLeader == true then
        cm:set_character_immortality("character_cqi:"..characterData.oldCharCqi, false);
    end
    -- Kill the old character
    cm:kill_character(characterData.oldCharCqi, true, true);

    -- Create the new character with units
    self:CreateForceWithGeneral(characterData);

    Custom_Log("Finished replacing general");
end

function ControlledRecruitmentPools:GetRandomTraitForLord(factionResources, originalSubType)
    Custom_Log("Getting random trait");
    local traitPool = factionResources.LordsToReplace[originalSubType].traitKeyPool;
    local selectedTrait = GetRandomObjectFromList(traitPool);
    Custom_Log("Trait selected: "..selectedTrait)
    return selectedTrait;
end

function ControlledRecruitmentPools:CreateForceWithGeneral(character)
    Custom_Log("Creating force with general");
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
            Custom_Log("In created character callback");
            -- This is added to a callback because more time is required if the character was
            -- made a faction leader. Without the callback is_faction_leader always returned false
            if character.isFactionLeader then
                Custom_Log("In create_force_with_general_callback for faction "..tostring(character.factionName).." cqi "..tostring(cqi));
                cm:set_character_immortality("character_cqi:"..cqi, true);
            end
            Custom_Log("Giving character trait "..character.traitKey)
            -- Give them a random starting trait (skill)
            -- Commented out since this doesn't work
            --[[cm:callback(function()
                cm:force_add_skill("character_cqi:"..cqi, character.traitKey);
                Custom_Log("Successfully added trait");
             end, 0.5);--]]
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
    self:ReplaceAnyVampireLords(faction, currentPoolCounts);

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
    local factionResources = self:GetFactionResources(faction);
    local character_list = faction:character_list();
    for i = 0, character_list:num_items() - 1 do
        local character = character_list:item_at(i);
        local charSubType = character:character_subtype_key();
        if charSubType == "vmp_lord" and faction:subculture() == "wh_main_sc_vmp_vampire_counts" then
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

    return currentPoolCounts;
end

function ControlledRecruitmentPools:SetupInitialMinimumValues(faction, currentPoolCounts)
    self:EnforceMinimumValues(faction, currentPoolCounts);
    local factionResources = self:GetFactionResources(faction);
    for poolKey, pool in pairs(factionResources.FactionPools) do
        local currentPoolMinimum = 0;
        for agentKey, agentSubType in pairs(pool.AgentSubTypes) do
            currentPoolMinimum = currentPoolMinimum + agentSubType.MinimumAmount;
        end

        while currentPoolMinimum < pool.SubPoolInitialMinSize do
            local agentSubTypeKey = self:SelectGeneralToGenerateFromPool(factionResources, currentPoolCounts, poolKey);
            cm:callback(function() self:GenerateGeneral(agentSubTypeKey, faction:name(), nil) end, 1);
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
    Custom_Log("Enforcing minimum values");

    local factionName = faction:name();
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    local factionResources = self:GetFactionResources(faction);

    for poolKey, pool in pairs(factionResources.FactionPools) do
        -- Generate minimums for each agent type
        for agentKey, agentSubType in pairs(pool.AgentSubTypes) do
            if agentSubType.MinimumAmount > 0 then
                local count = currentPoolCounts[agentKey];
                if count == nil then
                    count = 0;
                end
                while count < agentSubType.MinimumAmount do
                    cm:callback(function() self:GenerateGeneral(agentKey, factionName, nil) end, 1);
                    count = count + 1;
                    currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
                end
                currentPoolCounts[agentKey] = count;
            end
        end
    end
end

function ControlledRecruitmentPools:AddGeneralsToPool(faction, currentPoolCounts, maximumAmount)
    if maximumAmount == 0 then
        return;
    end

    Custom_Log("Generating extras for pool");
    local factionResources = self:GetFactionResources(faction);

    for i = 0, maximumAmount do
        if currentPoolCounts["total"] < factionResources.PoolMaxSize then
            -- Select a general to generate
            local agentSubTypeKey = self:SelectGeneralToGenerate(factionResources, currentPoolCounts);
            -- Generate the general
            cm:callback(function() self:GenerateGeneral(agentSubTypeKey, faction:name(), nil) end, 1);
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

function ControlledRecruitmentPools:GetFactionResources(faction)
    local subCultureResources = self.CRPResources.CultureResources[faction:subculture()];
    local factionName = faction:name();
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    if subCultureResources == nil then
        return self.CRPResources.CultureResources["wh_rogue_armies"][factionName];
    elseif subCultureResources[factionName] then
        return subCultureResources[factionName];
    else
        return subCultureResources[faction:subculture()];
    end
end

function ControlledRecruitmentPools:SelectGeneralToGenerate(factionResources, currentPoolCounts)

    local validAgentSubTypes = {};
    -- Find agent types which aren't at the maximum count
    for poolKey, pool in pairs(factionResources.FactionPools) do
        local agentSubTypesBelowMax = {};
        local currentSubPoolCount = 0;
        Custom_Log("Checking agent pool "..tostring(poolKey));
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

function ControlledRecruitmentPools:GenerateGeneral(generalSubType, factionName, callbackFunction)
    -- So this function actually works with general but the call back does work
    -- because it only checks the other agent types. This probably indicates that
    -- it was only intended for agents but luckily we can take advantage of this.
    Custom_Log("Generating general "..tostring(generalSubType));
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
    --cm:spawn_character_to_pool(factionName, "", "", "", "", 18, true, "general", generalSubType, false, "");
    self:TriggerCallbackForNewGeneral(callbackFunction);
end

function ControlledRecruitmentPools:GenerateAgent(agentSubType)
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
end

function ControlledRecruitmentPools:TriggerCallbackForNewGeneral(callbackFunction)
    if not callbackFunction then
        return;
    end

    local character_list = self.HumanFaction:character_list();
    local character_list_count = character_list:num_items() - 1;
    Custom_Log("Got character list. Num items: "..tostring(character_list_count));
    Custom_Log("Getting last character at position "..tostring(character_list_count));
    local char = character_list:item_at(character_list_count);
    Custom_Log("Char coordinates: X "..tostring(char:logical_position_x().." Y "..tostring(char:logical_position_y())));
    if char:logical_position_x() == self.DefaultXCoordinate
        and char:logical_position_y() == self.DefaultYCoordinate then
        local charCQI = char:cqi();
        callbackFunction(charCQI);
    end
end

-- This exists to convert the human faction list to just an object.
-- This also means it will only work for one player.
function ControlledRecruitmentPools:GetHumanFaction()
    local allHumanFactions = cm:get_human_factions();
    if allHumanFactions == nil then
        return
    end
    for key, humanFaction in pairs(allHumanFactions) do
        Custom_Log("Human faction "..tostring(humanFaction));
        return cm:model():world():faction_by_key(humanFaction);
    end
end