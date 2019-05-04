ControlledRecruitmentPools = {
    HumanFaction = {},
    -- Default spawn coordinates before the char is moved
    -- These need to be on a spawn area, ie not mountains or
    -- dense forest.
    DefaultXCoordinate = 0,
    DefaultYCoordinate = 0,
    -- Separate object which controls UI scraping and display
    UIController = {},
    -- Separate object which handles character generator functionality
    CharacterGenerator = {},
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

    if self.CRPLordsInPools == nil then
        Custom_Log("Lord pool is blank");
        self.CRPLordsInPools = {};
    end
    -- Setup character generator
    self.CharacterGenerator = CharacterGenerator:new({

    });
    self.CharacterGenerator:Initialise(self.CRPLordsInPools);

    -- Setup UI
    self.UIController = CRPUI:new({

    });

    Custom_Log("Finished default values");
    out("CRP: Finished default values");
end

-- There are several factions which are excluded from the system but have a valid subculture
function ControlledRecruitmentPools:IsExcludedFaction(faction)
    local factionName = faction:name();
    if factionName == "wh_main_grn_skull-takerz" then
        return false;
    end

    if factionName == "rebels" or
    string.match(factionName, "waaagh") or
    string.match(factionName, "brayherd") or
    string.match(factionName, "intervention") or
    string.match(factionName, "incursion") or
    string.match(factionName, "separatists") or
    string.match(factionName, "qb") or
    factionName == "wh_dlc03_bst_beastmen_chaos" or
    factionName == "wh2_dlc11_cst_vampire_coast_encounters"
    then
        --Custom_Log("Faction is excluded");
        return true;
    end

    return false;
end

function ControlledRecruitmentPools:NewGameStartUp()
    Custom_Log("New game startup");
	local faction_list = cm:model():world():faction_list();
    cm:disable_event_feed_events(true, "wh_event_category_agent", "", "");
    Custom_Log("Faction Start up");
	for i = 0, faction_list:num_items() - 1 do
        local faction = faction_list:item_at(i);
        if faction:is_quest_battle_faction() == false then
            Custom_Log(faction:name().." STARTUP");
            -- After replacing calculate the current pools for the faction
            local factionPoolResources = GetFactionPoolResources(faction);
            if (IsSupportedSubCulture(faction:subculture()) or IsRogueArmy(faction:name())) and self:IsExcludedFaction(faction) == false then
                Custom_Log("Faction is supported, performing startup procedure");
                -- Replace existing lords with specified values (if any)
                -- The current faction pools will be updated with these values
                self:ReplaceExistingLords(faction, factionPoolResources);
                if faction:name() == self.HumanFaction:name() then
                    Custom_Log("Setting minimum for player faction "..faction:name());
                    -- Then set the initial pools for human faction
                    local currentFactionPools = self:GetCurrentPoolForFaction(faction);
                    self:SetupInitialMinimumValues(faction, currentFactionPools, factionPoolResources);
                    Custom_Log("Finished setting up minimum values");
                end
            end
            -- This will replace any vmp_lord_replacements present at the start of the game
            -- This will usually be from armies spawned by scripted. Eg the Artois army for Kemmler start.
            local currentFactionPools = self:GetCurrentPoolForFaction(faction);
           self:RemoveAliveCharacterInPoolAtGameStart(faction, currentFactionPools, factionPoolResources);
           self:ApplyArmyLimits(faction, factionPoolResources);
           self:TrackInitialLords(faction);
           Custom_Log_Finished();
        end
    end
    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_agent","",""); end, 1);
end

function ControlledRecruitmentPools:TrackInitialLords(faction)
    local factionName = faction:name();
    local character_list = faction:character_list();
    Custom_Log("Tracking initial lords for faction "..factionName);
    for i = 0, character_list:num_items() - 1 do
        local character = character_list:item_at(i);
        if character:is_null_interface() == false then
            local charSubType = character:character_subtype_key();
            if (cm:char_is_mobile_general_with_army(character) or character:is_wounded() == true) then
                local generatedName = {
                    clan_name = character:get_forename(),
                    forename = character:get_surname(),
                };
                Custom_Log("Tracking subtype "..charSubType);
                local homeRegion = self.CharacterGenerator:GetRegionForFaction(faction);
                self:TrackCharacterInPoolData(factionName, generatedName, "", charSubType, "", homeRegion, false);
            end
        end
    end
end

function ControlledRecruitmentPools:ApplyArmyLimits(faction, factionPoolResources)
    Custom_Log("Applying army limits");
    local factionName = faction:name();
    if factionPoolResources ~= nil then
        for i = 1, factionPoolResources.PoolMaxSize do
            cm:apply_effect_bundle("wh2_dlc09_ritual_crafting_tmb_army_capacity_"..i, factionName, 0);
        end
    end
end

function ControlledRecruitmentPools:ReplaceExistingLords(faction, factionPoolResources)
    -- Grab faction resources and check if any lords need to be replaced for this faction
    if factionPoolResources.LordsToReplace == nil then
        Custom_Log("No lords to replace");
        return;
    end
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    local character_list = faction:character_list();
    Custom_Log("Replacing existing lords");
    for i = 0, character_list:num_items() - 1 do
        local character = character_list:item_at(i);
        local charSubType = character:character_subtype_key();
        --Custom_Log("Checking character subtype: "..charSubType);
        if factionPoolResources.LordsToReplace[charSubType] ~= nil
        and cm:char_is_mobile_general_with_army(character) then
            Custom_Log("Replacing character subtype: "..charSubType)
            local replaceType = factionPoolResources.LordsToReplace[charSubType].replacementKey;
            Custom_Log("Replace type is "..replaceType);
            --[[if currentFactionPools[charSubType] == nil then
                Custom_Log(charSubType.." is not initialised");
            end
            currentFactionPools[charSubType] = currentFactionPools[charSubType] - 1;
            if currentFactionPools[replaceType] == nil then
                currentFactionPools[replaceType] = 1;
            else
                currentFactionPools[replaceType] = currentFactionPools[replaceType] + 1;
            end--]]
            Custom_Log("Before replace character");
            self:ReplaceCharacter(faction, character, replaceType, factionPoolResources, nil, nil);
        end
    end
end

function ControlledRecruitmentPools:ReplaceCharacter(faction, character, replaceSubType, factionPoolResources, artSetId, traitOverride)
    Custom_Log("Replacing character "..character:cqi());
    local factionName = faction:name();
    --Custom_Log("In replace got pool resources");

    local selectedTrait = traitOverride;
    if selectedTrait == nil and factionPoolResources ~= nil then
        selectedTrait = self.CharacterGenerator:GetRandomTraitForLord(factionPoolResources, character:character_subtype_key());
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

    local invalidUnitList = false;
    local charUnitList = GetStringifiedUnitList(character);

    -- If no unit string is supplied, set it to the default value. Will be removed by the callback function, assuming this is the only unit.
    if charUnitList == "" then
        Custom_Log("Character has no units");
        charUnitList = "wh_main_grn_inf_savage_orcs";
        invalidUnitList = true;
    end

    local xPosition, yPosition = cm:find_valid_spawn_location_for_character_from_position(factionName, character:logical_position_x(), character:logical_position_y(), false);
    local teleportCharacter = false;

    Custom_Log("Got replacement spawn position");
    Custom_Log("xPosition is "..xPosition);
    Custom_Log("yPosition is "..yPosition);
    if xPosition == -1 or yPosition == -1 then
        xPosition = character:logical_position_x() + 1;
        yPosition = character:logical_position_y();
        teleportCharacter = true;
    end

    -- Copied into local var so data can be accessed later
    local characterData = {
        oldCharCqi = character:command_queue_index(),
        factionName = factionName,
        unitList = charUnitList,
        regionName = characterRegion,
        xPos = xPosition,
        yPos = yPosition,
        subType = replaceSubType,
        foreName = character:get_forename(),
        surname = character:get_surname(),
        isFactionLeader = character:cqi() == faction:faction_leader():cqi();
        traitKey = selectedTrait,
        artSetId = artSetId,
        noUnits = invalidUnitList,
        teleportPosition = teleportCharacter,
    }

    -- Remove faction leader immortality
    if characterData.isFactionLeader == true then
        Custom_Log("Disabling immortality for faction leader");
        cm:set_character_immortality("character_cqi:"..characterData.oldCharCqi, false);
    end

    -- Create the new character with units
    cm:callback(function() self:CreateForceWithGeneral(characterData); end, 0);
    Custom_Log("Finished replacing general");
    return characterData;
end

function ControlledRecruitmentPools:CreateForceWithGeneral(character, isRebel)
    cm:disable_event_feed_events(true, "wh_event_category_diplomacy", "", "");
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
                cm:disable_event_feed_events(true, "wh_event_category_traits_ancillaries", "", "");
                cm:force_add_trait("character_cqi:"..cqi, character.traitKey, true);
                cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_traits_ancillaries", "", ""); end, 1);
            end

            -- Move character back to original position
            if character.teleportPosition == true then
                cm:teleport_to("character_cqi:"..cqi, character.xPos - 1, character.yPos, true);
            end

            if character.noUnits == true then
                Custom_Log("Removing units");
                local char = cm:get_character_by_cqi(cqi);
                cm:remove_all_units_from_general(char);
            end

            --Custom_Log("Finished character callback");
            Custom_Log_Finished();
        end
    );
    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_diplomacy", "", ""); end, 1);

    cm:disable_event_feed_events(true, "wh_event_category_character", "", "");
    cm:kill_character(character.oldCharCqi, true);
    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", ""); end, 1);
    Custom_Log("Finished CreateForceWithGeneral");
end

--[[function ControlledRecruitmentPools:SetupRebellionForce(cqi, character)

    --force_character_force_into_stance("faction:chosokabe,forename:2147274846", "MILITARY_FORCE_ACTIVE_STANCE_TYPE_AMBUSH");
    cm:cai_disable_movement_for_character("character_cqi:"..cqi);
    cm:apply_effect_bundle_to_characters_force("wh_main_bundle_military_upkeep_free_force", cqi, 0, true);
    cm:apply_effect_bundle_to_characters_force("wh2_dlc11_bundle_immune_all_attrition", cqi, 0, true);

    core:add_listener(
        "CRP_RevivedFactionOccupiedGarrison_"..cqi,
        "GarrisonOccupiedEvent",
        function(context)
           return context:character():cqi() == cqi;
        end,
        function(context)
            Custom_Log("Removing upkeep free bundle");
            cm:remove_effect_bundle_from_characters_force("wh_main_bundle_military_upkeep_free_force", cqi);
            Custom_Log("Removing attrition immue bundle");
            cm:remove_effect_bundle_from_characters_force("wh2_dlc11_bundle_immune_all_attrition", cqi);

            core:remove_listener("CRP_RevivedFactionOccupiedGarrison_"..cqi);
        end,
        true
    );

    local turnCounter = 0;
    core:add_listener(
        "CRP_RevivedRebelTurnCounter_"..cqi,
        "FactionTurnEnd",
        function(context)
           return context:faction():name() == character.factionName;
        end,
        function(context)
            Custom_Log("Turn counter "..turnCounter);
            if turnCounter == 3 then
                cm:enable_movement_for_character("character_cqi:"..cqi);
                core:remove_listener("CRP_RevivedRebelTurnCounter_"..cqi);
            else
                turnCounter = turnCounter + 1;
            end
        end,
        true
    );

    core:add_listener(
        "CRP_CharacterKilled_"..cqi,
        "CharacterConvalescedOrKilled",
        function(context)
           return context:character():cqi() == cqi;
        end,
        function(context)
            Custom_Log("Character "..cqi.." killed");
            Custom_Log("Cleaning up listeners");
            core:remove_listener("CRP_RevivedFactionOccupiedGarrison_"..cqi);
            core:remove_listener("CRP_RevivedRebelTurnCounter_"..cqi);
            core:remove_listener("CRP_CharacterKilled_"..cqi);
            Custom_Log("Cleaned up listeners");
        end,
        true
    );

    Custom_Log("Setting character to attack region "..character.regionName);
    cm:attack_region("character_cqi:"..cqi, character.regionName, true);
end--]]

function ControlledRecruitmentPools:UpdateRecruitmentPool(faction, amountToGenerate, forceGenerate)
    local factionName = faction:name();
    -- Iterate over all existing characters and calculate the current pool
    -- values
    Custom_Log("STARTING pool update for "..tostring(faction:name()));
    if faction:name() == self.HumanFaction:name() then
        cm:disable_event_feed_events(true, "wh_event_category_agent", "", "");
    end

    local currentPoolCounts = self:GetCurrentPoolForFaction(faction);
    local factionPoolResources = GetFactionPoolResources(faction);
    if self.CRPLordsInPools[factionName] == nil then
        Custom_Log("INITIALISING "..factionName);
        -- Set the initial pools for the faction
        self:SetupInitialMinimumValues(faction, currentPoolCounts, factionPoolResources);
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
    Custom_Log("Completed pool update for "..tostring(faction:name()));
    return addedGenerals;
end

function ControlledRecruitmentPools:RemoveAliveCharacterInPoolAtGameStart(faction, currentPoolCounts, factionPoolResources)
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    local character_list = faction:character_list();
    for i = 0, character_list:num_items() - 1 do
        local char = character_list:item_at(i);
        if char:has_military_force() == false and cm:char_is_agent(char) == false and char:is_wounded() == false then
            Custom_Log("Found alive character in faction pool at game start "..char:faction():name().." cqi "..char:cqi());
            cm:kill_character(char:cqi(), true, true);
        end
    end
end

function ControlledRecruitmentPools:GetCurrentPoolForFaction(faction)
    local currentPoolCounts = {};
    currentPoolCounts["total"] = 0;
    local factionName = faction:name();
    -- I couldn't store skull-takerz as a key in the lua table because of the -
    -- So this takes care of that edge case
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    if self.CRPLordsInPools[factionName] ~= nil then
        local character_list = faction:character_list();
        for i = 0, character_list:num_items() - 1 do
            local character = character_list:item_at(i);
            local charSubType = character:character_subtype_key();

            local forename = effect.get_localised_string(character:get_forename());
            local surname = effect.get_localised_string(character:get_surname());
            local nameKey = forename..surname;
            local characterKey = CreateValidLuaTableKey(nameKey);

            -- We do not want to count garrison commands and agents
            if self.CRPLordsInPools[factionName][characterKey] == nil and character:has_military_force()
            and character:military_force():is_armed_citizenry() == false and cm:char_is_agent(character) == false
            and charSubType ~= "vmp_lord_replacement" then
                Custom_Log("Found existing character subtype: "..tostring(charSubType).." name is "..characterKey);
                if currentPoolCounts[charSubType] then
                    currentPoolCounts[charSubType] = currentPoolCounts[charSubType] + 1;
                else
                    currentPoolCounts[charSubType] = 1;
                end
                currentPoolCounts["total"] = currentPoolCounts["total"] + 1;
            end
        end
        Custom_Log("Finished check existing characters");
        Custom_Log("Checking tracked lords");
        for key, char in pairs(self.CRPLordsInPools[factionName]) do
            Custom_Log("Found tracked character subtype: "..tostring(char.SubType).." name is "..key);
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
    Custom_Log("Got pool counts. Total is "..currentPoolCounts["total"]);
    return currentPoolCounts;
end

function ControlledRecruitmentPools:IsThereACharacterInPool(faction)
    local character_list = faction:character_list();
    for i = 0, character_list:num_items() - 1 do
        local character = character_list:item_at(i);
        if character:has_military_force() == false
        and cm:char_is_agent(character) == false
        and character:is_wounded() == false then
            Custom_Log("Found character in pool");
            return true;
        end
    end
    local factionName = faction:name();
    -- I couldn't store skull-takerz as a key in the lua table because of the -
    -- So this takes care of that edge case
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    if self.CRPLordsInPools[factionName] ~= nil then
        for key, char in pairs(self.CRPLordsInPools[factionName]) do
            if key ~= "initialised" then
                Custom_Log("Found tracked character in pool");
                return true;
            end
        end
    end
    return false;
end

function ControlledRecruitmentPools:SetupInitialMinimumValues(faction, currentPoolCounts, factionPoolResources)
    self:EnforceMinimumValues(faction, currentPoolCounts);
    local factionName = faction:name();
    --Custom_Log("Enforced minimum values");
    for poolKey, pool in pairs(factionPoolResources.FactionPools) do
        local currentPoolMinimum = 0;
        for agentKey, agentSubType in pairs(pool.AgentSubTypes) do
            currentPoolMinimum = currentPoolMinimum + agentSubType.MinimumAmount;
        end
        --Custom_Log(poolKey.." Current pool minimum "..tostring(currentPoolMinimum).." Initial minimum size"..tostring(pool.SubPoolInitialMinSize));
        while currentPoolMinimum < pool.SubPoolInitialMinSize do
            local isHumanPlayerFaction = factionName == self.HumanFaction:name();
            local agentSubTypeKey = self:SelectGeneralToGenerateFromPool(factionPoolResources, currentPoolCounts, poolKey, isHumanPlayerFaction);
            --Custom_Log("Selected "..agentSubTypeKey);
            local artSetId = self.CharacterGenerator:GetArtSetForSubType(agentSubTypeKey);
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
    local factionResources = GetFactionPoolResources(faction);
    local factionName = faction:name();
    local IsHumanPlayerFaction = factionName == self.HumanFaction:name();
    for poolKey, pool in pairs(factionResources.FactionPools) do
        --Custom_Log("Enforcing minimums for pool "..poolKey);
        -- Generate minimums for each agent type
        for agentSubTypeKey, agentSubType in pairs(pool.AgentSubTypes) do
            --Custom_Log(agentSubTypeKey.." minimum "..agentSubType.MinimumAmount);
            if agentSubType.MinimumAmount > 0 and ((IsHumanPlayerFaction == false and not agentSubType.HumanPlayerOnly) or (IsHumanPlayerFaction == true)) then
                --Custom_Log(agentSubTypeKey.." is above 0");
                local count = currentPoolCounts[agentSubTypeKey];
                if count == nil then
                    count = 0;
                end
                while count < agentSubType.MinimumAmount do
                    -- If this is the players faction this should happen straight away
                    -- so the recruitment event message can be supressed
                    --Custom_Log("Enforcing minimum for subtype "..agentSubTypeKey);
                    local artSetId = self.CharacterGenerator:GetArtSetForSubType(agentSubTypeKey);
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
    Custom_Log("Finished enforcing minimum values");
end

function ControlledRecruitmentPools:AddGeneralsToPool(faction, currentPoolCounts, maximumAmount, forceGenerate)
    if maximumAmount == 0 then
        return;
    end
    local factionName = faction:name();
    Custom_Log("Generating "..maximumAmount.." extras for pool");
    if forceGenerate == true then
        Custom_Log("forceGenerate is specified. General(s) will be created");
    end
    local newGenerals = {};
    local factionResources = GetFactionPoolResources(faction);
    for i = 1, maximumAmount do
        Custom_Log("Generating general "..i);
        if currentPoolCounts["total"] < factionResources.PoolMaxSize or forceGenerate == true then
            -- Select a general to generate
            local isHumanPlayerFaction = factionName == self.HumanFaction:name();
            local agentSubTypeKey = self:SelectGeneralToGenerate(factionResources, currentPoolCounts, isHumanPlayerFaction, forceGenerate, false);
            if agentSubTypeKey == nil then
                Custom_Log("Found no valid general");
                break;
            end
            Custom_Log("Selected general "..agentSubTypeKey);
            -- Generate the general
            -- If this is the players faction this should happen straight away
            -- so the recruitment event message can be supressed
            local artSetId = self.CharacterGenerator:GetArtSetForSubType(agentSubTypeKey);
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

function ControlledRecruitmentPools:SelectGeneralToGenerate(factionResources, currentPoolCounts, isHumanPlayerFaction, forceGenerationIfNoValues, overrideLimit)
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
        Custom_Log("Checking agent pool "..tostring(poolKey));
        for agentKey, agentSubType in pairs(pool.AgentSubTypes) do
            Custom_Log("Checking agent key "..agentKey);
            local count = currentPoolCounts[agentKey];
            if count == nil then
                count = 0;
            end
            Custom_Log("Current count "..count);
            -- If the number of agents currently in the pool is less than their maximum value
            -- they might be generated
            if count < agentSubType.MaximumAmount and ((isHumanPlayerFaction == false and not agentSubType.HumanPlayerOnly) or (isHumanPlayerFaction == true)) then
                agentSubTypesBelowMax[agentKey] = agentKey;
            elseif overrideLimit then
                agentSubTypesBelowMax[agentKey] = agentKey;
            else
                Custom_Log("Sub type is not below max");
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
            return self:SelectGeneralToGenerate(factionResources, currentPoolCounts, isHumanPlayerFaction, true, true);
        else
            return nil;
        end
    end
    -- Randomly select type from valid agents
    return GetRandomObjectFromList(validAgentSubTypes);
end

function ControlledRecruitmentPools:SelectGeneralToGenerateFromPool(factionResources, currentPoolCounts, poolKey, isHumanPlayerFaction)
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
        if count < agentSubType.MaximumAmount and ((isHumanPlayerFaction == false and not agentSubType.HumanPlayerOnly) or (isHumanPlayerFaction == true)) then
            agentSubTypesBelowMax[agentKey] = agentKey;
        end

        currentSubPoolCount = currentSubPoolCount + count;
    end
    -- Randomly select type from valid agents
    return GetRandomObjectFromList(agentSubTypesBelowMax);
end

function ControlledRecruitmentPools:GenerateGeneral(generalSubType, faction, artSetId)
    Custom_Log("Generating general "..generalSubType);
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
    --Custom_Log("Before name generation");
    local generatedName = self.CharacterGenerator:GetCharacterNameForSubculture(faction, generalSubType);
    --Custom_Log("After name generation");
    -- Generate a trait from the trait pool (WIP)
    local innateTrait = self.CharacterGenerator:GetRandomCharacterTrait(faction, generalSubType);
    Custom_Log("Giving character innate trait "..innateTrait);
    -- Then spawn the character so that they appear normally
    --Custom_Log("Forename/clan_name "..generatedName.clan_name.." surename/forename "..generatedName.forename);
    -- Note: The character is spawned as immortal because otherwise the game will despawn them after certain events
    cm:spawn_character_to_pool(faction:name(), generatedName.clan_name, generatedName.forename, "", "", 20, true, "general", generalSubType, true, artSetId);
    --Custom_Log("Spawned character into pool");
    -- Add the character to the pool table so we can track them
    local homeRegion = self.CharacterGenerator:GetRegionForFaction(faction);
    local trackedData = self:TrackCharacterInPoolData(factionName, generatedName, innateTrait, generalSubType, artSetId, homeRegion, true);
    Custom_Log("Finished generating general");
    return trackedData;
end

function ControlledRecruitmentPools:TrackCharacterInPoolData(factionName, generatedName, innateTrait, subType, artSetId, homeRegion, removeImmortality)
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
        Name = localisedForeName.." "..localisedSurname,
        SocialClass = "Gold",
        InnateTrait = innateTrait,
        SubType = subType,
        ArtSetId = artSetId,
        HomeRegion = homeRegion,
        RemoveImmortality = removeImmortality,
    };

    self.CRPLordsInPools[factionName][keyName] = general;
    Custom_Log("Tracking "..keyName.." for faction "..factionName);
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
        return cm:model():world():faction_by_key(humanFaction);
    end
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

function ControlledRecruitmentPools:ProcessNewCharacter(char)
    Custom_Log("ProcessNewCharacter");
    local faction = char:faction();
    local factionName = faction:name();
    local humanFaction = self:GetHumanFaction();
    local factionLords = self.CRPLordsInPools[factionName];
    local localisedForeName = effect.get_localised_string(char:get_forename());
    local localisedSurname = "";
    local surnameKey = char:get_surname();
    if surnameKey ~= nil and surnameKey ~= "" then
        localisedSurname = effect.get_localised_string(surnameKey);
    end

    local keyName = localisedForeName..localisedSurname;
    -- This removes any spaces within names, eg the surname "Von Carstein";
    -- Otherwise the key is invalid and the character won't be tracked
    keyName = CreateValidLuaTableKey(keyName);
    Custom_Log("Character key: "..keyName);
    if factionLords ~= nil and factionLords[keyName] ~= nil then
        Custom_Log("Character is in pool for faction: "..factionName);
        -- If the character is tracked in the pool
        local poolData = factionLords[keyName];
        local subCulture = faction:subculture();
        if poolData then
            --Custom_Log("Adding trait: "..poolData.InnateTrait.." for character: "..keyName);
            --cm:disable_event_feed_events(true, "wh_event_category_traits_ancillaries", "", "");
            -- Add their trait
            --cm:force_add_trait("character_cqi:"..char:cqi(), poolData.InnateTrait, true);
            -- Then remove from the pool
            --factionLords[keyName] = nil;
            --cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_traits_ancillaries", "", "") end, 1);
            -- Note: Removal is necessary since we now track the character from the faction's character_list
            if poolData.RemoveImmortality == true then
                Custom_Log("Removing immortality");
                -- Remove immortality that we gave them when we spawned them
                cm:set_character_immortality("character_cqi:"..char:cqi(), false);
            end
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
        end
    -- This check is to specifically check the "Extra" spawned characters from the system. This occurs when using kill_character() and create_force_with_general().
    -- Weirdly enough this won't use vmp_lord_replacement but vmp_lord (even though it does in every other case).
    -- We also don't want to do this with characters without military forces and definitely not on garrison commands.
    -- Also since this character is not tracked, it means we can safely delete vmp_lords for the Vampire Counts factions.
    --[[elseif char:character_subtype_key() == "vmp_lord" and (char:has_military_force() == false or char:military_force():is_armed_citizenry() == false) then
        Custom_Log("Character is a vampire lord");
        Custom_Log("Character Details "..factionName.." sub type "..char:character_subtype_key().." cqi "..char:cqi());
        local faction = char:faction();
        if faction:subculture() ~= "wh_main_sc_vmp_vampire_counts" then
            if factionName == self.HumanFaction:name() then
                Custom_Log("Player has vmp_lord");
                cm:callback(function() cm:kill_character(char:cqi(), true, true); end, 1);
                Custom_Log("Killed character "..char:cqi());
            elseif factionName == "rebels" then
                Custom_Log("Rebels have vampire lord. This must be a revived faction.");

                local unitList = GetStringifiedUnitList(char);
                Custom_Log("Got unit list "..unitList);
                local appropriateSubCulture = GetSubCultureFromUnitList(unitList);
                Custom_Log("Sub culture "..appropriateSubCulture);
                local replacementRebelFactionKey = GetValidNonActiveFactionForSubCulture(self, appropriateSubCulture);
                Custom_Log("Rebel faction "..replacementRebelFactionKey);
                local replacementFaction = cm:get_faction(replacementRebelFactionKey);
                Custom_Log("Got faction object");
                local factionResources = GetFactionPoolResources(replacementFaction);
                Custom_Log("Got factionr resources");
                local currentPoolCounts = self:GetCurrentPoolForFaction(replacementFaction);
                Custom_Log("Got pool counts");
                local replacementSubType = self:SelectGeneralToGenerate(factionResources, currentPoolCounts, true, false);
                Custom_Log("Picked sub type "..replacementSubType);
                local artSetId = crp:GetArtSetForSubType(replacementSubType);
                Custom_Log("Picked art set "..artSetId);

                -- Copied into local var so data can be accessed later
                local characterData = {
                    oldCharCqi = char:command_queue_index(),
                    factionName = replacementRebelFactionKey,
                    unitList = unitList,
                    regionName = char:region():name(),
                    xPos = char:logical_position_x(),
                    yPos = char:logical_position_y(),
                    subType = replacementSubType,
                    foreName = char:get_forename(),
                    surname = char:get_surname(),
                    isFactionLeader = false;
                    traitKey = "",
                    artSetId = artSetId,
                }
                local owningRegionFaction = char:region():owning_faction();
                local replacementRebelFaction = cm:get_faction(replacementRebelFactionKey);
                self:CreateForceWithGeneral(characterData, true);
                Custom_Log("ReplacementRebel faction "..replacementRebelFaction:name().." owning region faction "..owningRegionFaction:name());
                cm:force_declare_war(replacementRebelFaction:name(), owningRegionFaction:name(), false, false);
            end
        end
        Custom_Log("Finished Character created listener");
        Custom_Log_Finished();
    -- This condition checks for armies created with create_force
    -- This army will be replaced
    elseif char:character_subtype_key() == "vmp_lord_replacement" and (char:has_military_force() == true and char:military_force():is_armed_citizenry() == false) then
        Custom_Log("Found spawned vmp_lord_replacement");
        Custom_Log("Character Details "..factionName.." sub type "..char:character_subtype_key().." cqi "..char:cqi());
        Custom_Log("Finished Character created listener");
        Custom_Log_Finished();--]]
    elseif cm:char_is_mobile_general_with_army(char) then
        Custom_Log("Checking replacement data for faction "..factionName);
        -- If the character isn't tracked, that means CRP didn't spawn it. It could be an auto generated lord or it could be spawned in another way.
        local replacementLords = GetReplacementLordsForFaction(faction);
        local isReplacement = false;
        local replaceSubType = "";
        local replacementTrait = "";
        for replacementKey, replacementData in pairs(replacementLords) do
            if replacementKey == char:character_subtype_key() then
                Custom_Log("Spawned char is replacement original sub type "..char:character_subtype_key());
                isReplacement = true;
                replaceSubType = replacementData.replacementKey;
                replacementTrait = GetRandomObjectFromList(replacementData.traitKeyPool);
                Custom_Log("Replacement Type is "..replaceSubType);
                break;
            end
        end
        -- Replacement lords, should be replaced. This is mostly for the AI
        if not cm:is_new_game() and isReplacement == true then
            Custom_Log("Starting replacement");
            local factionPoolResources = GetFactionPoolResources(faction);
            local artSetId = self.CharacterGenerator:GetArtSetForSubType(replaceSubType);
            Custom_Log("Replacement is using art set id "..artSetId);
            self:ReplaceCharacter(faction, char, replaceSubType, factionPoolResources, artSetId, replacementTrait);
        else
            -- Otherwise we should track it
            local name = {
                clan_name = char:get_forename(),
                forename = char:get_surname(),
            };
            Custom_Log("Character "..char:character_subtype_key().." is not in pool. Tracking them for faction "..factionName);
            local homeRegion = self.CharacterGenerator:GetRegionForFaction(faction);
            self:TrackCharacterInPoolData(factionName, name, "", char:character_subtype_key(), "", homeRegion, false);
        end
    else
        -- Typically this case if for garrison leaders but it also happens when a Dark Elf character gains a word of power
        Custom_Log("Character is not a general with a force");
        -- Now we check if this character is already existing but had their name changed
        if factionLords ~= nil then
            for key, data in pairs(factionLords) do
                if string.match(keyName, key) and keyName ~= key then
                    Custom_Log("Found partial match of "..key.." new key is "..keyName);
                    -- We need to update the key and the name
                    local remappedLord = {
                        ArtSetId = data.ArtSetId,
                        HomeRegion = data.HomeRegion,
                        InnateTrait = data.InnateTrait,
                        Name = localisedForeName.." "..localisedSurname,
                        SocialClass = data.SocialClass,
                        SubType = data.SubType,
                        RemoveImmortality = data.RemoveImmortality,
                    };
                    self.CRPLordsInPools[factionName][key] = nil;
                    self.CRPLordsInPools[factionName][keyName] = remappedLord;
                end
            end
        end
    end

    --[[local factionResources = GetFactionPoolResources(char:faction());
    local charSubType = char:character_subtype_key();
    Custom_Log("Character Details "..factionName.." sub type "..char:character_subtype_key().." cqi "..char:cqi());
    if not char:is_null_interface() and (char:has_military_force() == true and char:military_force():is_armed_citizenry() == false) and
    factionResources.LordsToReplace ~= nil and factionResources.LordsToReplace[charSubType] ~= nil then
        Custom_Log("New character must be replaced!");
        local replacementData = factionResources.LordsToReplace[charSubType];
        local trait = GetRandomObjectKeyFromList(replacementData.traitKeyPool);
        Custom_Log("Replacing new character with "..replacementData.replacementKey);
        cm:callback(function() self:ReplaceCharacter(char:faction(), char, replacementData.replacementKey, factionResources, nil, trait); end, 0);
    end--]]

    Custom_Log("Finished processing new character");
    Custom_Log_Finished();
end

function ControlledRecruitmentPools:ProcessKilledCharacter(char)
    local factionName = char:faction():name();
    Custom_Log("Process killed character for faction "..factionName);
    if char:is_null_interface() or char:is_wounded() == false then
        Custom_Log("Killed Character Details "..factionName.." sub type "..char:character_subtype_key().." cqi "..char:cqi());
        local factionLords = self.CRPLordsInPools[factionName];
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
    elseif char:is_wounded() == true then
        Custom_Log("Character in "..factionName.." is only wounded");
    end
    Custom_Log_Finished();
end