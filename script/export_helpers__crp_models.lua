cm = get_cm();

ControlledRecruitmentPools = {
    HumanFaction = {},
    CRPResources = {},
    -- Default spawn coordinates before the char is moved
    -- These need to be on a spawn area, ie not mountains or
    -- dense forest. 
    DefaultXCoordinate = 0,
    DefaultYCoordinate = 0,
    -- These coordinates are in an un moveable area
    -- This is where characters will be moved to after the initial spawn
    -- and callback function has been called. This is required to give each
    -- char a unique spawn point which can then be used to idenfity them
    LastUsedTeleportCoordinateX = 0,
    LastUsedTeleportCoordinateY = 0,
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
    -- Clear existing generals
    self:FactionStartup();
end

-- The pool limit should be greater than or equal to the highest Agent Sub Type 
-- maximum limit in that pool
function ControlledRecruitmentPools:RecalculatePoolLimits()
    for subcultureKey, subcultureLimits in pairs(self.CRPResources.CultureResources) do
        for factionKey, factionLimits in pairs(subcultureLimits) do
            for factionPoolKey, factionPool in pairs(factionLimits.FactionPools) do
                local currentLimit = factionPool.SubPoolMaxSize;
                if currentLimit == nil then
                    currentLimit = 0;
                end
                for agentSubTypeKey, agentSubType in pairs(factionPool.AgentSubTypes) do
                    if agentSubType.MaximumAmount > currentLimit then
                        currentLimit = agentSubType.MaximumAmount;
                    end
                end
                factionPool.SubPoolMaxSize = currentLimit;
            end
        end
    end
end

function ControlledRecruitmentPools:IsSupportedSubCulture(subculture)
    Custom_Log("Checking subculture "..tostring(subculture));
    if self.CRPResources.CultureResources[subculture] then
        Custom_Log("Found supported subculture "..tostring(subculture));
        return true;
    else
        return false;
    end
end

function ControlledRecruitmentPools:FactionStartup()
	local faction_list = cm:model():world():faction_list();

	for i = 0, faction_list:num_items() - 1 do
        local faction = faction_list:item_at(i);
        if self:IsSupportedSubCulture(faction:subculture()) then
            self:KillAllExistingNonRecruitedGenerals(faction);
        end
    end
end

function ControlledRecruitmentPools:KillAllExistingNonRecruitedGenerals(faction)
    Custom_Log("Killing existing generals for faction: "..tostring(faction:name()));
    local factionLeader = {};
    if faction:has_faction_leader() == true then
        Custom_Log("Has faction leader");
        factionLeader = faction:faction_leader();
    end
    local character_list = faction:character_list();
    local character_list_count = character_list:num_items() - 1;
    for i = 0, character_list_count do
        local  character = character_list:item_at(i);
        if character:has_military_force()
        and character:military_force():is_armed_citizenry() then
            Custom_Log("Found armed citizenry. Leader: "..tostring(character:character_subtype_key()))
        elseif cm:char_is_agent(character) == false 
        and cm:char_is_mobile_general_with_army(character) == false then
            Custom_Log("Killing: "..tostring(character:character_subtype_key()));
            cm:kill_character(character:cqi(), true, false);
        else
            Custom_Log("Found valid character: "..tostring(character:character_subtype_key()));
        end
    end
end

function ControlledRecruitmentPools:UpdateRecruitmentPool(faction, amountToGenerate)
    -- Iterate over all existing characters and calculate the current pool
    -- values
    Custom_Log("STARTING pool update for "..tostring(faction:name()));
    cm:disable_event_feed_events(true, "wh_event_category_agent", "", "");

    local currentPoolCounts = self:GetCurrentPoolForFaction(faction);

    -- Enforce the recruitment pool minmums for this faction
    self:EnforceMinimumValues(faction, currentPoolCounts);

    -- Generate extra characters up to the pool size for that faction
    self:FillPoolWithGenerals(faction, currentPoolCounts, amountToGenerate);
    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_agent","","")end, 1);
    Custom_Log("FINISHED pool update for "..tostring(faction:name()));
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

        if character:has_military_force()
        and character:military_force():is_armed_citizenry() then
            Custom_Log("Found garrrison commander: "..tostring(charSubType));
        else
            Custom_Log("Found existing character subtype: "..tostring(charSubType));
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

function ControlledRecruitmentPools:EnforceMinimumValues(faction, currentPoolCounts)
    Custom_Log("Enforcing minimum values");

    local factionName = faction:name();
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    local factionResources = self:GetFactionResources(faction);

    for poolKey, pool in pairs(factionResources.FactionPools) do
        Custom_Log("Checking agent pool "..tostring(poolKey));
        for agentKey, agentSubType in pairs(pool.AgentSubTypes) do
            Custom_Log(tostring(agentKey).." count:"..tostring(currentPoolCounts[agentKey]).." - "..tostring(agentSubType.MinimumAmount));
            if agentSubType.MinimumAmount > 0 then
                local count = currentPoolCounts[agentKey];
                if count == nil then
                    count = 0;
                end
                while count < agentSubType.MinimumAmount do
                    self:GenerateGeneral(agentKey, factionName, nil);
                    count = count + 1;
                    currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
                end
                currentPoolCounts[agentKey] = count;
            end
        end
    end
end

function ControlledRecruitmentPools:FillPoolWithGenerals(faction, currentPoolCounts, overrideAmount)
    if overrideAmount == 0 then
        return;
    end

    Custom_Log("Generating extras for pool");
    local factionResources = self:GetFactionResources(faction);

    for i = 0, overrideAmount do
        if currentPoolCounts["total"] < factionResources.PoolMaxSize then
            -- Select a general to generate
            local agentSubTypeKey = self:SelectGeneralToGenerate(factionResources, currentPoolCounts);
            -- Generate the general
            self:GenerateGeneral(agentSubTypeKey, faction:name(), nil);
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
    if subCultureResources[factionName] then
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
    --[[for i = 0, character_list:num_items() - 1 do
        Custom_Log("Checking character "..tostring(i));
        local char = character_list:item_at(i);
        --Custom_Log(""..tostring(char:get_forename()));
        Custom_Log("X "..tostring(char:logical_position_x().." Y "..tostring(char:logical_position_y())));
        if char:logical_position_x() == self.DefaultXCoordinate
        and char:logical_position_y() == self.DefaultYCoordinate then
            Custom_Log("CHAR AT POS. Running callback");
            local charCQI = char:cqi();
            --local charCQI = cm:char_lookup_str(char:cqi()
            callbackFunction(charCQI);
            self:TeleportCharacterToUniqueCoordinates(charCQI);
        end
    end--]]
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