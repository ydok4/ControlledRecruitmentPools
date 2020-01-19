ControlledRecruitmentPoolsController = {
    Logger = {},
    HumanFaction = {},
    -- Default spawn coordinates before the char is moved
    -- These need to be on a spawn area, ie not mountains or
    -- dense forest.
    DefaultXCoordinate = 0,
    DefaultYCoordinate = 0,
    -- Separate object which controls UI scraping and display
    UIController = {},
    -- Holds the cached localised agent subtypes
    LocalisedSubTypeCache = {},
    -- Separate object which handles character generator functionality
    CharacterGenerator = {},
    CRPLordsInPools = {},
    PreBattleData = {},
    CachedAgentData = {},
}

function ControlledRecruitmentPoolsController:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function ControlledRecruitmentPoolsController:Initialise(enableLogging)
    out("CRP: Setting default values");
    self.HumanFaction = self:GetHumanFaction();
    -- These coordinates are between Lustria and
    -- the Southlands in ME
    self.DefaultXCoordinate = 231;
    self.DefaultYCoordinate = 94;

    if self.CRPLordsInPools == nil then
        self.Logger:Log("Lord pool is blank");
        self.CRPLordsInPools = {};
    end
    -- Setup character generator
    self.CharacterGenerator = CharacterGenerator:new({

    });
    --RecalculatePoolLimits(self.HumanFaction:name());
    self.CharacterGenerator:Initialise(enableLogging, self.CRPLordsInPools);

    -- Setup UI
    self.UIController = CRPUIController:new({

    });
    -- Setup the UI subtype cache
    self.LocalisedSubTypeCache = {};
    local subcultureResources = GetAgentSubTypeResourcesForFaction(self.HumanFaction);
    for agentSubtypeKey, agentSubtypeData in pairs(subcultureResources) do
        local localisedSubTypeKey = effect.get_localised_string("agent_subtypes_onscreen_name_override_"..agentSubtypeKey);
        self.LocalisedSubTypeCache[localisedSubTypeKey] = agentSubtypeKey;
    end
    self.Logger = Logger:new({});
    self.Logger:Initialise("ControlledRecruitmentPools.txt", enableLogging);
    self.Logger:Log_Start();
    out("CRP: Finished default values");
end

-- There are several factions which are excluded from the system but have a valid subculture
function ControlledRecruitmentPoolsController:IsExcludedFaction(faction)
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
        --self.Logger:Log("Faction is excluded");
        return true;
    end

    return false;
end

function ControlledRecruitmentPoolsController:NewGameStartUp()
    self.Logger:Log("New game startup");
	local faction_list = cm:model():world():faction_list();
    cm:disable_event_feed_events(true, "wh_event_category_agent", "", "");
    self.Logger:Log("Faction Start up");
	for i = 0, faction_list:num_items() - 1 do
        local faction = faction_list:item_at(i);
        if faction:is_quest_battle_faction() == false then
            self.Logger:Log(faction:name().." STARTUP");
            if (IsSupportedSubCulture(faction:subculture()) or IsRogueArmy(faction:name())) and self:IsExcludedFaction(faction) == false then
                self.Logger:Log("Faction is supported, performing startup procedure");
                local factionPoolResources = GetFactionPoolResources(faction);
                -- Replace existing lords with specified values (if any)
                -- The current faction pools will be updated with these values
                self:ReplaceExistingLords(faction, factionPoolResources);
                -- This will replace any vmp_lord_replacements present at the start of the game
                -- This will usually be from armies spawned by scripted. Eg the Artois army for Kemmler start.
                self:RemoveAliveCharacterInPoolAtGameStart(faction);
                if faction:name() == self.HumanFaction:name() then
                    self.Logger:Log("Setting minimum for player faction "..faction:name());
                    -- Then set the initial pools for human faction
                    local currentFactionPools = self:GetCurrentPoolForFaction(faction);
                    self:SetupInitialMinimumValues(faction, currentFactionPools, factionPoolResources);
                    self.Logger:Log("Finished setting up minimum values");
                    if faction:subculture() ~= "wh2_dlc09_sc_tmb_tomb_kings"
                    and faction:name() ~= "wh2_dlc13_lzd_spirits_of_the_jungle" then
                        self:ApplyHeroAndArmyLimits(faction);
                    end
                end
                self:EnableHeroRecruitment(faction);
                self:TrackInitialLords(faction);
                self.Logger:Log_Finished();
            else
                self.Logger:Log("Faction is unsupported");
                self.Logger:Log_Finished();
            end
        end
    end
    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_agent","",""); end, 1);
end

function ControlledRecruitmentPoolsController:TrackInitialLords(faction)
    local factionName = faction:name();
    local character_list = faction:character_list();
    self.Logger:Log("Tracking initial lords for faction "..factionName);
    for i = 0, character_list:num_items() - 1 do
        local character = character_list:item_at(i);
        if character:is_null_interface() == false then
            local charSubType = character:character_subtype_key();
            if (cm:char_is_mobile_general_with_army(character) or character:is_wounded() == true) then
                local generatedName = {
                    clan_name = character:get_forename(),
                    forename = character:get_surname(),
                };
                self.Logger:Log("Tracking subtype "..charSubType);
                local homeRegion = self.CharacterGenerator:GetRegionForFaction(faction);
                self:TrackCharacterInPoolData(factionName, generatedName, charSubType, "", homeRegion, false, true);
            end
        end
    end
end

function ControlledRecruitmentPoolsController:ApplyHeroAndArmyLimits(faction)
    self:CreateCachedAgentData(faction);
    local factionKey = faction:name();
    self.Logger:Log("Applying army limits for faction: "..factionKey);
    local customEffectBundle = cm:create_new_custom_effect_bundle("wh_main_effect_crp_dummy_army_cap");
    customEffectBundle:add_effect("wh2_dlc09_effect_increase_army_capacity", "faction_to_faction_own_unseen", self.CachedAgentData.LordCap);
    customEffectBundle:set_duration(0);
    cm:apply_custom_effect_bundle_to_faction(customEffectBundle, faction);
    self.Logger:Log_Finished();
    self:ApplyHeroLimits(faction);
end

function ControlledRecruitmentPoolsController:CreateCachedAgentData(faction)
    local factionKey = faction:name();
    local subcultureKey = faction:subculture();
    local overallAgentCap = 1;
    local overallLordCap = 0;
    if faction:is_allowed_to_capture_territory() == false then
        self.Logger:Log("Faction is horde "..factionKey);
        if subcultureKey == "wh_main_sc_chs_chaos" then
            overallLordCap = 9;
            overallAgentCap = 25;
        elseif subcultureKey == "wh_dlc03_sc_bst_beastmen" then
            overallLordCap = 7;
            overallAgentCap = 18;
        else
            overallLordCap = 4;
        end
    else
        self.Logger:Log("Faction is not horde");
        local regionList = faction:region_list();
        for i = 0, regionList:num_items() - 1 do
            local region = regionList:item_at(i);
            --self.Logger:Log("Checking region: "..region:name());
            local settlement = region:settlement();
            local climateKey = settlement:get_climate();
            local isSuitableClimate = faction:get_climate_suitability(climateKey);
            if isSuitableClimate == "suitability_good" then
                self.Logger:Log("Region: "..region:name().." is suitable.");
                if region:is_province_capital() == true then
                    overallLordCap = overallLordCap + 1;
                else
                    overallAgentCap = overallAgentCap + 1;
                end
            end
        end
        self.Logger:Log("Finished checking climates...");
    end
    local sameCultureFactions = faction:factions_of_same_culture();
    for i = 0, sameCultureFactions:num_items() - 1 do
        local sameCultureFaction = sameCultureFactions:item_at(i);
        if not sameCultureFaction:is_null_interface()
        and sameCultureFaction:at_war_with(faction) == false then
            --self.Logger:Log("Checking same culture faction: "..sameCultureFaction:name());
            local hasDefensiveAlliance = sameCultureFaction:military_allies_with(faction);
            local hasMilitaryAlliance = sameCultureFaction:defensive_allies_with(faction);
            if hasDefensiveAlliance == true
            or hasMilitaryAlliance == true then
                self.Logger:Log("Has alliance with : "..sameCultureFaction:name());
                overallLordCap = overallLordCap + 1;
            end
        end
    end
    self:UpdateAgentCache(faction);
    self.Logger:Log("Finished checking heroes");
    self.Logger:Log("overallLordCap: "..overallLordCap);
    self.Logger:Log("overallAgentCap: "..overallAgentCap);
    self.CachedAgentData.FactionKey = factionKey;
    self.CachedAgentData.LordCap = overallLordCap;
    self.CachedAgentData.AgentCap = overallAgentCap;
end

function ControlledRecruitmentPoolsController:UpdateAgentCache(faction)
    local agentTypeCounts = {};
    local totalNumberOfHeroes = 0;
    local factionHeroes = GetAgentSubTypeResourcesForFaction(faction);
    local character_list = faction:character_list();
    for i = 0, character_list:num_items() - 1 do
        local char = character_list:item_at(i);
        if char:has_military_force() == false
        and cm:char_is_agent(char) == true
        and char:is_wounded() == false then
            local agentType = char:character_type_key();
            if agentTypeCounts[agentType] == nil then
                agentTypeCounts[agentType] = 0;
            end
            agentTypeCounts[agentType] = agentTypeCounts[agentType] + 1;
            if factionHeroes[char:character_subtype_key()] == nil then
                self.Logger:Log("Found unsupported subtype: "..char:character_subtype_key());
            else
                self.Logger:Log("Found supported subtype: "..char:character_type_key());
                totalNumberOfHeroes = totalNumberOfHeroes + 1;
            end
        end
    end
    self.CachedAgentData.AgentCount = totalNumberOfHeroes;
    self.CachedAgentData.AgentTypeCounts = agentTypeCounts;
end

function ControlledRecruitmentPoolsController:UpdateCharacterInAgentCache(character)
    local factionHeroes = GetAgentSubTypeResourcesForFaction(character:faction());
    if character:has_military_force() == false
    and cm:char_is_agent(character) == true
    and character:is_wounded() == false then
        local agentType = character:character_type_key();
        if self.CachedAgentData.AgentTypeCounts[agentType] == nil then
            self.CachedAgentData.AgentTypeCounts[agentType] = 0;
        end
        self.CachedAgentData.AgentTypeCounts[agentType] = self.CachedAgentData.AgentTypeCounts[agentType] + 1;
        if factionHeroes[character:character_subtype_key()] == nil then
            self.Logger:Log("Found unsupported subtype: "..character:character_type_key());
        else
            self.Logger:Log("Found supported subtype: "..character:character_type_key());
            self.CachedAgentData.AgentCount = self.CachedAgentData.AgentCount + 1;
        end
    end
end

function ControlledRecruitmentPoolsController:ApplyHeroLimits(faction)
    self.Logger:Log("Applying hero limits for faction: "..faction:name());
    local customEffectBundle = cm:create_new_custom_effect_bundle("wh_main_effect_crp_dummy_hero_caps");
    local agentTypesCapEffects = {
        champion = "wh_main_effect_crp_increase_cap_champion",
        dignitary = "wh_main_effect_crp_increase_cap_dignitary",
        engineer = "wh_main_effect_crp_increase_cap_engineer",
        runesmith = "wh_main_effect_crp_increase_cap_runesmith",
        spy = "wh_main_effect_crp_increase_cap_spy",
        wizard = "wh_main_effect_crp_increase_cap_wizard",
    };
    for agentType, effectKey in pairs(agentTypesCapEffects) do
        local agentCount = -1;
        if self.CachedAgentData.AgentTypeCounts[agentType] ~= nil then
            agentCount = agentCount + self.CachedAgentData.AgentTypeCounts[agentType];
        end
        local limit = self.CachedAgentData.AgentCap - self.CachedAgentData.AgentCount + agentCount;
        if limit < -1 then
            limit = -1;
        end
        self.Logger:Log(agentType.." limit is: "..limit);
        customEffectBundle:add_effect(effectKey, "faction_to_faction_own_unseen", limit);
    end
    customEffectBundle:set_duration(0);
    cm:apply_custom_effect_bundle_to_faction(customEffectBundle, faction);
    self.Logger:Log("Finished setting up hero limits");
    self.Logger:Log_Finished();
end

function ControlledRecruitmentPoolsController:EnableHeroRecruitment(faction, factionPoolResources)
    self.Logger:Log("Enabling hero recruitment");
    local factionHeroes = GetHeroesForFaction(faction);
    if factionHeroes ~= nil then
        local customEffectBundle = cm:create_new_custom_effect_bundle("wh_main_effect_crp_dummy_hero_recruitment");
        customEffectBundle:set_duration(0);
        for index, heroSubtypeKey in pairs(factionHeroes) do
            self.Logger:Log("Adding hero recruitment effect: "..heroSubtypeKey);
            if faction:is_allowed_to_capture_territory() == true then
                customEffectBundle:add_effect(heroSubtypeKey.."_enable_recruitment", "faction_to_province_own", 1);
            else
                customEffectBundle:add_effect(heroSubtypeKey.."_enable_recruitment", "faction_to_force_own", 4);
            end
        end
        cm:apply_custom_effect_bundle_to_faction(customEffectBundle, faction);
    end
end

function ControlledRecruitmentPoolsController:ReplaceExistingLords(faction, factionPoolResources)
    -- Grab faction resources and check if any lords need to be replaced for this faction
    if factionPoolResources.LordsToReplace == nil then
        self.Logger:Log("No lords to replace");
        return;
    end
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    local character_list = faction:character_list();
    self.Logger:Log("Replacing existing lords");
    for i = 0, character_list:num_items() - 1 do
        local character = character_list:item_at(i);
        local charSubType = character:character_subtype_key();
        --self.Logger:Log("Checking character subtype: "..charSubType);
        if factionPoolResources.LordsToReplace[charSubType] ~= nil
        and cm:char_is_mobile_general_with_army(character) then
            self.Logger:Log("Replacing character subtype: "..charSubType)
            local replaceType = factionPoolResources.LordsToReplace[charSubType].replacementKey;
            self.Logger:Log("Replace type is "..replaceType);
            self:ReplaceCharacter(faction, character, replaceType, factionPoolResources, nil, nil);
        end
    end
end

function ControlledRecruitmentPoolsController:ReplaceCharacter(faction, character, replaceSubType, factionPoolResources, artSetId, traitOverride)
    self.Logger:Log("Replacing character "..character:cqi());
    local factionName = faction:name();
    --self.Logger:Log("In replace got pool resources");

    local selectedTrait = traitOverride;
    if selectedTrait == nil and factionPoolResources ~= nil then
        selectedTrait = self.CharacterGenerator:GetRandomTraitForLord(factionPoolResources, character:character_subtype_key());
    end
    if traitKey ~= "" then
        self.Logger:Log("Got trait "..selectedTrait);
    else
        self.Logger:Log("No traits available");
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
        self.Logger:Log("Character has no units");
        charUnitList = "wh_main_grn_inf_savage_orcs";
        invalidUnitList = true;
    end
    self.Logger:Log("Before find valid spawn location");
    local xPosition, yPosition = cm:find_valid_spawn_location_for_character_from_position(factionName, character:logical_position_x(), character:logical_position_y(), true);
    local teleportCharacter = false;

    self.Logger:Log("Got replacement spawn position");
    self.Logger:Log("xPosition is "..xPosition);
    self.Logger:Log("yPosition is "..yPosition);
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
        self.Logger:Log("Disabling immortality for faction leader");
        cm:set_character_immortality("character_cqi:"..characterData.oldCharCqi, false);
    end

    -- Create the new character with units
    cm:callback(function() self:CreateForceWithGeneral(characterData); end, 0);
    self.Logger:Log("Finished replacing general");
    return characterData;
end

function ControlledRecruitmentPoolsController:CreateForceWithGeneral(character, isRebel)
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
            self.Logger:Log("In created character callback for faction "..character.factionName.." with subtype "..character.subType);
            self.Logger:Log("Character cqi is "..cqi);
            -- This is added to a callback because more time is required if the character was
            -- made a faction leader. Without the callback is_faction_leader always returned false
            if character.isFactionLeader == true then
                self.Logger:Log("In create_force_with_general_callback for faction "..tostring(character.factionName).." cqi "..tostring(cqi));
                cm:set_character_immortality("character_cqi:"..cqi, true);
            end

            if character.artSetId ~= nil then
                self.Logger:Log("Setting art set as "..character.artSetId);
                cm:add_unit_model_overrides(cm:char_lookup_str(cqi), character.artSetId);
            end

            if character.traitKey ~= nil and character.traitKey ~= "" then
                self.Logger:Log("Giving character trait "..character.traitKey);
                cm:disable_event_feed_events(true, "wh_event_category_traits_ancillaries", "", "");
                cm:force_add_trait("character_cqi:"..cqi, character.traitKey, true);
                cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_traits_ancillaries", "", ""); end, 1);
            end

            -- Move character back to original position
            if character.teleportPosition == true then
                cm:teleport_to("character_cqi:"..cqi, character.xPos - 1, character.yPos, true);
            end

            if character.noUnits == true then
                self.Logger:Log("Removing units");
                local char = cm:get_character_by_cqi(cqi);
                cm:remove_all_units_from_general(char);
            end

            --self.Logger:Log("Finished character callback");
            self.Logger:Log_Finished();
        end
    );
    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_diplomacy", "", ""); end, 1);

    cm:disable_event_feed_events(true, "wh_event_category_character", "", "");
    cm:kill_character(character.oldCharCqi, true);
    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_character", "", ""); end, 1);
    self.Logger:Log("Finished CreateForceWithGeneral");
end

--[[function ControlledRecruitmentPoolsController:SetupRebellionForce(cqi, character)

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
            self.Logger:Log("Removing upkeep free bundle");
            cm:remove_effect_bundle_from_characters_force("wh_main_bundle_military_upkeep_free_force", cqi);
            self.Logger:Log("Removing attrition immue bundle");
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
            self.Logger:Log("Turn counter "..turnCounter);
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
            self.Logger:Log("Character "..cqi.." killed");
            self.Logger:Log("Cleaning up listeners");
            core:remove_listener("CRP_RevivedFactionOccupiedGarrison_"..cqi);
            core:remove_listener("CRP_RevivedRebelTurnCounter_"..cqi);
            core:remove_listener("CRP_CharacterKilled_"..cqi);
            self.Logger:Log("Cleaned up listeners");
        end,
        true
    );

    self.Logger:Log("Setting character to attack region "..character.regionName);
    cm:attack_region("character_cqi:"..cqi, character.regionName, true);
end--]]

function ControlledRecruitmentPoolsController:UpdateRecruitmentPool(faction, amountToGenerate, forceGenerate)
    local factionName = faction:name();
    -- Iterate over all existing characters and calculate the current pool
    -- values
    self.Logger:Log("STARTING pool update for "..tostring(faction:name()));
    if faction:name() == self.HumanFaction:name() then
        cm:disable_event_feed_events(true, "wh_event_category_agent", "", "");
    end

    local currentPoolCounts = self:GetCurrentPoolForFaction(faction);
    local factionPoolResources = GetFactionPoolResources(faction);
    if factionPoolResources == nil then
        self.Logger:Log("MISSING FACTION RESOURCES ");
    end
    if self.CRPLordsInPools[factionName] == nil then
        self.Logger:Log("INITIALISING "..factionName);
        -- Add the initialised value
        self.CRPLordsInPools[factionName] = {};
        -- Set the initial pools for the faction
        self:SetupInitialMinimumValues(faction, currentPoolCounts, factionPoolResources);
    end

    -- Generate extra characters up to the pool size for that faction
    self:AddCharactersToPool(faction, currentPoolCounts, amountToGenerate, forceGenerate);
    if faction:name() == self.HumanFaction:name() then
        cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_agent","",""); end, 1);
    end
    self.Logger:Log("Completed pool update for "..tostring(faction:name()));
end

function ControlledRecruitmentPoolsController:RemoveAliveCharacterInPoolAtGameStart(faction)
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    local character_list = faction:character_list();
    for i = 0, character_list:num_items() - 1 do
        local char = character_list:item_at(i);
        local subcultureKey = faction:subculture();
        if char:has_military_force() == false and cm:char_is_agent(char) == false and char:is_wounded() == false then
            self.Logger:Log("Found alive character in faction pool at game start "..char:faction():name().." cqi "..char:cqi());
            cm:kill_character(char:cqi(), true, true);
        elseif cm:char_is_agent(char) == true
        and (char:character_subtype_key() == "grn_goblin_big_boss" or char:character_subtype_key() == "grn_orc_shaman")
        and subcultureKey ~= "wh_main_sc_grn_greenskins" then
            self.Logger:Log("Killing existing default agent.");
            cm:kill_character(char:cqi(), true, true);
        end
    end
end

function ControlledRecruitmentPoolsController:GetCurrentPoolForFaction(faction)
    local currentPoolCounts = {};
    currentPoolCounts["HeroTotal"] = 0;
    currentPoolCounts["LordTotal"] = 0;
    local factionName = faction:name();
    -- I couldn't store skull-takerz as a key in the lua table because of the -
    -- So this takes care of that edge case
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    -- Grab all characters in the faction. This includes recruited and
    -- characters in the pool
    if self.CRPLordsInPools[factionName] ~= nil then
        local activeCharacterKeys = {};
        local character_list = faction:character_list();
        for i = 0, character_list:num_items() - 1 do
            local character = character_list:item_at(i);
            local charSubType = character:character_subtype_key();

            local forename = effect.get_localised_string(character:get_forename());
            local surname = effect.get_localised_string(character:get_surname());
            local nameKey = forename..surname;
            local characterKey = CreateValidLuaTableKey(nameKey);
            -- We do not want to count garrison commands and agents
            if cm:char_is_mobile_general_with_army(character) then
                self.Logger:Log("Found existing general subtype: "..tostring(charSubType).." name is "..characterKey);
                if currentPoolCounts[charSubType] then
                    currentPoolCounts[charSubType] = currentPoolCounts[charSubType] + 1;
                else
                    currentPoolCounts[charSubType] = 1;
                end
                currentPoolCounts["LordTotal"] = currentPoolCounts["LordTotal"] + 1;
                activeCharacterKeys[characterKey] = true;
            elseif cm:char_is_agent(character) then
                self.Logger:Log("Found existing hero subtype: "..tostring(charSubType).." name is "..characterKey);
                if currentPoolCounts[charSubType] then
                    currentPoolCounts[charSubType] = currentPoolCounts[charSubType] + 1;
                else
                    currentPoolCounts[charSubType] = 1;
                end
                currentPoolCounts["HeroTotal"] = currentPoolCounts["HeroTotal"] + 1;
                activeCharacterKeys[characterKey] = true;
            end
        end
        self.Logger:Log("Finished check existing characters");
        for agentSubtypeKey, agentSubtypeData in pairs(self.CRPLordsInPools[factionName]) do
            for key, char in pairs(agentSubtypeData) do
                if activeCharacterKeys[key] == nil then
                    if currentPoolCounts[char.SubType] == nil then
                        currentPoolCounts[char.SubType] = 1;
                    else
                        currentPoolCounts[char.SubType] = currentPoolCounts[char.SubType] + 1;
                    end
                    local agentType = self.CharacterGenerator:GetAgentTypeForSubtype(char.SubType);
                    if agentType == "general" then
                        self.Logger:Log("Found tracked general subtype: "..tostring(char.SubType).." name is "..key);
                        currentPoolCounts["LordTotal"] = currentPoolCounts["LordTotal"] + 1;
                    else
                        self.Logger:Log("Found tracked hero subtype: "..tostring(char.SubType).." name is "..key);
                        currentPoolCounts["HeroTotal"] = currentPoolCounts["HeroTotal"] + 1;
                    end
                end
            end
        end
    end
    self.Logger:Log("Got pool counts. Total lords is: "..currentPoolCounts["LordTotal"]..", Total heroes is: "..currentPoolCounts["HeroTotal"]);
    return currentPoolCounts;
end

function ControlledRecruitmentPoolsController:IsThereACharacterInPool(faction)
    local character_list = faction:character_list();
    for i = 0, character_list:num_items() - 1 do
        local character = character_list:item_at(i);
        if character:has_military_force() == false
        and cm:char_is_agent(character) == false
        and character:is_wounded() == false then
            self.Logger:Log("Found character in pool");
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
        for key, agentSubTypeData in pairs(self.CRPLordsInPools[factionName]) do
            for agentSubtType, characters in pairs(agentSubTypeData) do
                self.Logger:Log("Found tracked character in pool");
                return true;
            end
        end
    end
    return false;
end

function ControlledRecruitmentPoolsController:SetupInitialMinimumValues(faction, currentPoolCounts, factionPoolResources)
    self.Logger:Log("Enforced minimum values");
    self:SetupInitialMinimumValuesForPool(faction, currentPoolCounts, factionPoolResources.HeroPools);
    self:SetupInitialMinimumValuesForPool(faction, currentPoolCounts, factionPoolResources.FactionPools);
    self.Logger:Log("Finished initial values");
end

function ControlledRecruitmentPoolsController:SetupInitialMinimumValuesForPool(faction, currentPoolCounts, poolResources)
    local factionName = faction:name();
    for poolKey, pool in pairs(poolResources) do
        local currentPoolMinimum = 0;
        self.Logger:Log(poolKey.." Initial minimum size: "..tostring(pool.SubPoolInitialMinSize));
        while currentPoolMinimum < pool.SubPoolInitialMinSize do
            local isHumanPlayerFaction = (factionName == self.HumanFaction:name());
            local agentSubTypeKey = self:SelectCharacterToGenerateFromSpecifiedPool(pool, currentPoolCounts, isHumanPlayerFaction);
            if agentSubTypeKey ~= nil then
                self.Logger:Log("Selected "..agentSubTypeKey);
                local artSetId = self.CharacterGenerator:GetArtSetForSubType(agentSubTypeKey);
                -- If this is the players faction this should happen straight away - Not right now.
                -- so the recruitment event message can be supressed
                cm:callback(function()
                    self:GenerateCharacter(agentSubTypeKey, faction, artSetId);
                    self.Logger:Log_Finished();
                end, 1);
                local agentType = self.CharacterGenerator:GetAgentTypeForSubtype(agentSubTypeKey);
                if agentType == "general" then
                    currentPoolCounts["LordTotal"] = currentPoolCounts["LordTotal"] + 1;
                    if currentPoolCounts[agentSubTypeKey] == nil then
                        currentPoolCounts[agentSubTypeKey] = 0;
                    end
                    currentPoolCounts[agentSubTypeKey] = currentPoolCounts[agentSubTypeKey] + 1;
                    currentPoolMinimum = currentPoolMinimum + 1;
                else
                    currentPoolCounts["HeroTotal"] = currentPoolCounts["HeroTotal"] + 1;
                    if currentPoolCounts[agentSubTypeKey] == nil then
                        currentPoolCounts[agentSubTypeKey] = 0;
                    end
                    currentPoolCounts[agentSubTypeKey] = currentPoolCounts[agentSubTypeKey] + 1;
                    currentPoolMinimum = currentPoolMinimum + 1;
                end
            end
        end
    end
end

function ControlledRecruitmentPoolsController:AddCharactersToPool(faction, currentPoolCounts, numberOfCharacters, forceGenerate)
    if numberOfCharacters == 0 then
        return;
    end
    local factionName = faction:name();
    self.Logger:Log("Generating "..numberOfCharacters.." extras for pool");
    if forceGenerate == true then
        self.Logger:Log("forceGenerate is specified. General(s) will be created");
    end
    local factionResources = GetFactionPoolResources(faction);
    for i = 1, numberOfCharacters do
        self.Logger:Log("Generating character number "..i);
        if currentPoolCounts["HeroTotal"] < factionResources.HeroPoolMaxSize
        or forceGenerate == true then
            local isHumanPlayerFaction = (factionName == self.HumanFaction:name());
            local agentSubTypeKey = self:SelectCharacterToGenerateFromAnyPool(factionResources.HeroPools, currentPoolCounts, isHumanPlayerFaction);
            if agentSubTypeKey ~= nil then
                self.Logger:Log("Selected "..agentSubTypeKey);
                local artSetId = self.CharacterGenerator:GetArtSetForSubType(agentSubTypeKey);
                -- If this is the players faction this should happen straight away - Not right now.
                -- so the recruitment event message can be supressed
                cm:callback(function()
                    self:GenerateCharacter(agentSubTypeKey, faction, artSetId);
                    self.Logger:Log_Finished();
                end, 1);
                -- Update existing counts
                local count = currentPoolCounts[agentSubTypeKey];
                if count == nil then
                    count = 0;
                end
                currentPoolCounts[agentSubTypeKey] = count + 1;
                currentPoolCounts["HeroTotal"] = currentPoolCounts["HeroTotal"] + 1;
            end
            self.Logger:Log_Finished();
        else
            self.Logger:Log("Hit hero poolsize already "..factionResources.HeroPoolMaxSize);
        end
        if currentPoolCounts["LordTotal"] < factionResources.LordPoolMaxSize
        or forceGenerate == true then
            local isHumanPlayerFaction = (factionName == self.HumanFaction:name());
            local agentSubTypeKey = self:SelectCharacterToGenerateFromAnyPool(factionResources.FactionPools, currentPoolCounts, isHumanPlayerFaction);
            if agentSubTypeKey ~= nil then
                self.Logger:Log("Selected "..agentSubTypeKey);
                local artSetId = self.CharacterGenerator:GetArtSetForSubType(agentSubTypeKey);
                -- If this is the players faction this should happen straight away - Not right now.
                -- so the recruitment event message can be supressed
                cm:callback(function()
                    self:GenerateCharacter(agentSubTypeKey, faction, artSetId);
                    self.Logger:Log_Finished();
                end, 1);
                -- Update existing counts
                local count = currentPoolCounts[agentSubTypeKey];
                if count == nil then
                    count = 0;
                end
                currentPoolCounts[agentSubTypeKey] = count + 1;
                currentPoolCounts["LordTotal"] = currentPoolCounts["LordTotal"] + 1;
                self.Logger:Log_Finished();
            end
        else
            self.Logger:Log("Hit general poolsize already "..factionResources.LordPoolMaxSize);
        end
    end
end

function ControlledRecruitmentPoolsController:SelectCharacterToGenerateFromSpecifiedPool(poolResources, currentPoolCounts, isHumanPlayerFaction, overrideLimit)
    local validAgentSubTypes = {};
    if overrideLimit then
        self.Logger:Log("Forcing character to generate");
    end
    if currentPoolCounts == nil then
        self.Logger:Log("Current pool counts is nil");
        currentPoolCounts = {};
    end

    local agentSubTypesBelowMax = {};
    local currentSubPoolCount = 0;
    for agentKey, agentSubType in pairs(poolResources.AgentSubTypes) do
        --self.Logger:Log("Checking agent key "..agentKey);
        local count = currentPoolCounts[agentKey];
        if count == nil then
            count = 0;
        end
        --self.Logger:Log("Current count "..count);
        -- If the number of agents currently in the pool is less than their maximum value
        -- they might be generated
        if count < agentSubType.MaximumPercentage
        and ((isHumanPlayerFaction == false and not agentSubType.HumanPlayerOnly)
        or (isHumanPlayerFaction == true)) then
            agentSubTypesBelowMax[agentKey] = agentKey;
        elseif overrideLimit then
            agentSubTypesBelowMax[agentKey] = agentKey;
        else
            --self.Logger:Log("Sub type is not below max");
        end
        currentSubPoolCount = currentSubPoolCount + count;
    end
    --self.Logger:Log("Finished checking pool "..poolKey);
    if currentSubPoolCount < poolResources.SubPoolMaxSize
    or overrideLimit == true then
        ConcatTableWithKeys(validAgentSubTypes, agentSubTypesBelowMax);
    end
    if next(validAgentSubTypes) == nil then
        self.Logger:Log("There are no valid agent sub types...overriding limits");
        return self:SelectCharacterToGenerateFromSpecifiedPool(poolResources, currentPoolCounts, isHumanPlayerFaction, true);
    end
    -- Randomly select type from valid agents
    return GetRandomObjectFromList(validAgentSubTypes);
end

function ControlledRecruitmentPoolsController:SelectCharacterToGenerateFromAnyPool(poolResources, currentPoolCounts, isHumanPlayerFaction)
    local agentSubTypesBelowMax = {};
    for poolKey, poolData in pairs(poolResources) do
        local totalPoolCount = 0;
        local validCharacterFromPool = {};
        if poolData.SubPoolMaxSize > 0 then
            for agentKey, agentSubType in pairs(poolData.AgentSubTypes) do
                local count = currentPoolCounts[agentKey];
                if count == nil then
                    count = 0;
                end
                -- If the number of agents currently in the pool is less than their maximum value
                -- they might be generated
                local agentPercentage = (count / poolData.SubPoolMaxSize) * 100;
                self.Logger:Log("Agent: "..agentKey.." is at percentage: "..agentPercentage);
                if (count / poolData.SubPoolMaxSize) * 100 < agentSubType.MaximumPercentage
                and ((isHumanPlayerFaction == false and not agentSubType.HumanPlayerOnly)
                or (isHumanPlayerFaction == true)) then
                    validCharacterFromPool[agentKey] = agentKey;
                end
                totalPoolCount = totalPoolCount + count;
            end
            if totalPoolCount < poolData.SubPoolMaxSize then
                ConcatTableWithKeys(agentSubTypesBelowMax, validCharacterFromPool);
            end
        end
    end
    if next(agentSubTypesBelowMax) == nil then
        self.Logger:Log("There are no valid agent sub types");
        return nil;
    end
    -- Randomly select type from valid agents
    return GetRandomObjectFromList(agentSubTypesBelowMax);
end

function ControlledRecruitmentPoolsController:GenerateCharacter(characterSubtype, faction, artSetId)
    self.Logger:Log("Generating character: "..characterSubtype);
    local factionName = faction:name();
    if factionName == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    if artSetId == nil then
        artSetId = "";
    end
    local generatedName = self.CharacterGenerator:GetCharacterNameForSubculture(faction, characterSubtype);
    -- Generate a trait from the trait pool (WIP)
    --local innateTrait = self.CharacterGenerator:GetRandomCharacterTrait(faction, characterSubtype);
    --self.Logger:Log("Giving character innate trait "..innateTrait);
    local agentSubtypeResources = self.CharacterGenerator:GetSubtypeData(characterSubtype);
    local isMale = not toboolean(agentSubtypeResources.IsFemale);
    self.Logger:Log("Character type: "..agentSubtypeResources.AgentType);
    self.Logger:Log("Art set id: "..artSetId);
    if agentSubtypeResources.AgentType == "general"
    or characterSubtype == "wef_shadowdancer"
    or characterSubtype == "cst_ancient_syreen" then
        isMale = true;
    end
    -- Note: The character is spawned as immortal because otherwise the game will despawn them after certain events
    cm:spawn_character_to_pool(factionName, generatedName.clan_name, generatedName.forename, "", "", 20, isMale, agentSubtypeResources.AgentType, characterSubtype, true, "");
    -- Add the character to the pool table so we can track them
    local homeRegion = self.CharacterGenerator:GetRegionForFaction(faction);
    local trackedData = self:TrackCharacterInPoolData(factionName, generatedName, characterSubtype, artSetId, homeRegion, true, false);
    self.Logger:Log("Finished generating: "..agentSubtypeResources.AgentType);
    return trackedData;
end

function ControlledRecruitmentPoolsController:TrackCharacterInPoolData(factionName, generatedName, subType, artSetId, homeRegion, removeImmortality, isRecruited)
    local faction = cm:get_faction(factionName);
    if self.CRPLordsInPools[factionName] == nil then
        self.CRPLordsInPools[factionName] = {};
    end
    local factionPoolResources = GetFactionPoolResources(faction);
    -- Now we add mounts for their social class (if there are any)
    local mountData = "";
    local extraCost = 0;
    local subcultureAgentTypeResources = GetAgentSubTypeResourcesForFaction(faction);
    local mountResources = GetMountResources(faction);
    local agentSubTypeResources = subcultureAgentTypeResources[subType];
    local turnNumber = cm:turn_number();
    if agentSubTypeResources ~= nil
    and agentSubTypeResources.Mounts ~= nil then
        local agentMountData = {};
        for ancillaryKey, ancillaryData in pairs(agentSubTypeResources.Mounts) do
            -- We always include ancillaries with weightings more than 5
            -- The rest only kick in after a certain threshold (turns 50 - 100)
            if turnNumber > (100 - (mountResources[ancillaryData.MountData].Weighting * 10))
            or mountResources[ancillaryData.MountData].Weighting > 5 then
                agentMountData[ancillaryKey] = mountResources[ancillaryData.MountData];
            end
        end
        local selectedMount = GetRandomItemFromWeightedList(agentMountData, true);
        mountData = selectedMount.."/"..agentSubTypeResources.Mounts[selectedMount].MountData;
        extraCost = agentMountData[selectedMount].BonusCost;
        self.Logger:Log("Adding ancillary: "..selectedMount);
    end
    if agentSubTypeResources ~= nil
    and agentSubTypeResources.BonusCost ~= nil then
        extraCost = extraCost + agentSubTypeResources.BonusCost;
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
        Mounts = mountData,
        InnateTrait = "",
        SubType = subType,
        ArtSetId = artSetId,
        HomeRegion = homeRegion,
        RemoveImmortality = removeImmortality,
        IsRecruited = isRecruited,
        ExtraCost = extraCost,
    };
    if self.CRPLordsInPools[factionName][subType] == nil then
        self.CRPLordsInPools[factionName][subType] = {};
    end
    self.CRPLordsInPools[factionName][subType][keyName] = general;
    self.Logger:Log("Tracking "..keyName.." for faction "..factionName);
    return general;
end

function ControlledRecruitmentPoolsController:GetCharacterNameFromNewGeneral(faction)
    local character_list = faction:character_list();
    local character_list_count = character_list:num_items() - 1;
    local char = character_list:item_at(character_list_count);
    if char:logical_position_x() == self.DefaultXCoordinate
        and char:logical_position_y() == self.DefaultYCoordinate then
        --self.Logger:Log("Found character");
        local charForeName = char:get_forename();
        local charSurname = char:get_surname();

        local name = {
            clan_name = charForeName,
            forename = charSurname,
        };
        --self.Logger:Log("Got name "..char:get_surname());
        -- Remove immortality
        -- Once we have the name, kill them
        cm:kill_character(char:cqi(), true);
        return name;
    end
end

-- This exists to convert the human faction list to just an object.
-- This also means it will only work for one player.
function ControlledRecruitmentPoolsController:GetHumanFaction()
    local allHumanFactions = cm:get_human_factions();
    if allHumanFactions == nil then
        return allHumanFactions;
    end
    for key, humanFaction in pairs(allHumanFactions) do
        return cm:model():world():faction_by_key(humanFaction);
    end
end

function ControlledRecruitmentPoolsController:AddPreBattleData(preBattleData, type)
    self.PreBattleData[type] = preBattleData;
end

function ControlledRecruitmentPoolsController:GetPreBattleFactionForCharacter(char_cqi, type)
    self.Logger:Log("Getting pre battle faction for character");
    local preBattleDataForType = self.PreBattleData[type];
    for key, preBattleCombatant in pairs(preBattleDataForType) do
        self.Logger:Log("CQI is "..preBattleCombatant.character_cqi);
        if preBattleCombatant.character_cqi == char_cqi then
            self.Logger:Log("Found matching character. Faction is: "..preBattleCombatant.character_faction);
            return preBattleCombatant.character_faction;
        end
    end
end

function ControlledRecruitmentPoolsController:GetPreBattleSubTypeForCharacter(char_cqi, type)
    self.Logger:Log("Getting pre battle subtype for character. This is for "..type);
    local preBattleDataForType = self.PreBattleData[type];
    if preBattleDataForType == nil then
        self.Logger:Log("PreBattleData is not set");
        return;
    end
    for key, preBattleCombatant in pairs(preBattleDataForType) do
        self.Logger:Log("CQI is "..preBattleCombatant.character_cqi);
        if preBattleCombatant.character_cqi == char_cqi then
            self.Logger:Log("Found matching character. Subtype is: "..preBattleCombatant.character_sub_type);
            return preBattleCombatant.character_sub_type;
        end
    end
end

function ControlledRecruitmentPoolsController:ProcessNewCharacter(char)
    self.Logger:Log("ProcessNewCharacter");
    local faction = char:faction();
    local factionName = faction:name();
    if factionName == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    local factionLords = self.CRPLordsInPools[factionName];
    local localisedForeName = effect.get_localised_string(char:get_forename());
    local localisedSurname = "";
    local surnameKey = char:get_surname();
    if surnameKey ~= nil and surnameKey ~= "" then
        localisedSurname = effect.get_localised_string(surnameKey);
    end
    local factionPoolResources = GetFactionPoolResources(faction);
    local keyName = localisedForeName..localisedSurname;
    -- This removes any spaces within names, eg the surname "Von Carstein";
    -- Otherwise the key is invalid and the character won't be tracked
    keyName = CreateValidLuaTableKey(keyName);
    local characterSubTypeKey = char:character_subtype_key();
    self.Logger:Log("Character key: "..keyName.." Character subtype: "..characterSubTypeKey);
    if factionLords ~= nil
    and factionLords[characterSubTypeKey] ~= nil
    and factionLords[characterSubTypeKey][keyName] ~= nil then
        self.Logger:Log("Character is in pool for faction: "..factionName);
        -- If the character is tracked in the pool
        local poolData = factionLords[characterSubTypeKey][keyName];
        if _G.IsIDE == true then
            for factionPoolKey, factionPoolData in pairs(factionLords) do
                poolData = factionPoolData;
                break;
            end
        end
        local subCulture = faction:subculture();
        if poolData then
            if subCulture == "wh2_main_sc_hef_high_elves" and factionName == self.HumanFaction:name() and poolData.IsRecruited == false then
                self.Logger:Log("High elf character recruited listener");
                if poolData.SubType == "wh2_main_hef_prince_mid" or poolData.SubType == "wh2_main_hef_princess_mid" then
                    cm:disable_event_feed_events(true, "all", "", "");
                    cm:trigger_incident(factionName, "wh2_main_hef_mid_lord_influence_cost", true);
                    cm:callback(function() cm:disable_event_feed_events(false, "all", "", ""); end, 1);
                    self.Logger:Log("Lord is mid prince or princess");
                elseif poolData.SubType == "wh2_main_hef_prince_high" or poolData.SubType == "wh2_main_hef_princess_high" then
                    cm:disable_event_feed_events(true, "all", "", "");
                    cm:trigger_incident(factionName, "wh2_main_hef_high_lord_influence_cost", true);
                    cm:callback(function() cm:disable_event_feed_events(false, "all", "", ""); end, 1);
                    self.Logger:Log("Lord is high prince or princess");
                end
            end
            if poolData.IsRecruited == false then
                -- Since we have a valid, tracked character we set IsRecruited as true so we know we don't need to pay recruitment costs if they get wounded
                -- and re-recruited
                poolData.IsRecruited = true;
                if poolData.Mounts ~= '' then
                    self.Logger:Log("Attempting to add mounts");
                    local ancillaryKey = string.match(poolData.Mounts, "(.*)/");
                    if ancillaryKey ~= "unmounted" then
                        self.Logger:Log("Adding ancillary: "..ancillaryKey);
                        cm:force_add_ancillary(char, ancillaryKey, false, false);
                    end
                end
                if poolData.ExtraCost ~= 0 then
                    self.Logger:Log("Removing "..poolData.ExtraCost.." from treasury");
                    cm:treasury_mod(factionName, -1 * poolData.ExtraCost);
                end
                -- Note: Removal is necessary since we now track the character from the faction's character_list
                if poolData.RemoveImmortality == true then
                    self.Logger:Log("Removing immortality");
                    -- Remove immortality that we gave them when we spawned them
                    cm:set_character_immortality("character_cqi:"..char:command_queue_index(), false);
                end
            else
                self.Logger:Log("Character has been recruited previously");
            end
        end
    elseif cm:char_is_mobile_general_with_army(char) then
        self.Logger:Log("Checking replacement data for faction "..factionName);
        -- If the character isn't tracked, that means CRP didn't spawn it. It could be an auto generated lord or it could be spawned in another way.
        local replacementLords = GetReplacementLordsForFaction(faction);
        if replacementLords ~= nil then
            local isReplacement = false;
            local replaceSubType = "";
            local replacementTrait = "";
            for replacementKey, replacementData in pairs(replacementLords) do
                if replacementKey == char:character_subtype_key() then
                    self.Logger:Log("Spawned char is replacement original sub type "..char:character_subtype_key());
                    isReplacement = true;
                    replaceSubType = replacementData.replacementKey;
                    replacementTrait = GetRandomObjectFromList(replacementData.traitKeyPool);
                    self.Logger:Log("Replacement Type is "..replaceSubType);
                    break;
                end
            end
            -- Replacement lords, should be replaced. This is mostly for the AI
            if not cm:is_new_game() and isReplacement == true then
                self.Logger:Log("Starting replacement");
                local artSetId = self.CharacterGenerator:GetArtSetForSubType(replaceSubType);
                self.Logger:Log("Replacement is using art set id "..artSetId);
                self:ReplaceCharacter(faction, char, replaceSubType, factionPoolResources, artSetId, replacementTrait);
            else
                -- Otherwise we should track it
                local name = {
                    clan_name = char:get_forename(),
                    forename = char:get_surname(),
                };
                self.Logger:Log("Character "..characterSubTypeKey.." is not in pool. Tracking them for faction "..factionName);
                local homeRegion = self.CharacterGenerator:GetRegionForFaction(faction);
                cm:callback(function()
                    self:TrackCharacterInPoolData(factionName, name, characterSubTypeKey, "", homeRegion, false, true);
                end, 1);
            end
        end
    else
        -- Typically this case if for garrison leaders but it also happens when a Dark Elf character gains a word of power
        self.Logger:Log("Character is not a general with a force");
        -- Now we check if this character is already existing but had their name changed
        if factionLords ~= nil then
            for key, data in pairs(factionLords) do
                if string.match(keyName, key) and keyName ~= key then
                    self.Logger:Log("Found partial match of "..key.." new key is "..keyName);
                    -- We need to update the key and the name
                    local remappedLord = {
                        ArtSetId = data.ArtSetId,
                        HomeRegion = data.HomeRegion,
                        InnateTrait = data.InnateTrait,
                        Name = localisedForeName.." "..localisedSurname,
                        Mounts = data.Mounts,
                        SubType = data.SubType,
                        RemoveImmortality = data.RemoveImmortality,
                        IsRecruited = true,
                        ExtraCost = data.ExtraCost,
                    };
                    self.CRPLordsInPools[factionName][characterSubTypeKey][key] = nil;
                    self.CRPLordsInPools[factionName][characterSubTypeKey][keyName] = remappedLord;
                end
            end
        end
    end
    self.Logger:Log("Finished processing new character");
    self.Logger:Log_Finished();
end

function ControlledRecruitmentPoolsController:ProcessKilledCharacter(char)
    local factionName = char:faction():name();
    if factionName == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    self.Logger:Log("Process killed character for faction "..factionName);
    if char:is_null_interface() or char:is_wounded() == false then
        self.Logger:Log("Killed Character Details "..factionName.." sub type "..char:character_subtype_key().." cqi "..char:cqi());
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
            --self.Logger:Log("Character is in pool for faction: "..factionName);
            -- If the character is tracked in the pool
            if factionLords[char:character_subtype_key()] ~= nil
            and factionLords[char:character_subtype_key()][keyName] ~= nil then
                self.Logger:Log("Setting "..keyName.." as nil");
                factionLords[keyName] = nil;
            end
        end
    elseif char:is_wounded() == true then
        self.Logger:Log("Character in "..factionName.." is only wounded");
    end
    if cm:model():world():whose_turn_is_it():name() == char:faction():name() then
        self:UpdateCharacterInAgentCache(char);
        self:ApplyHeroLimits(char:faction());
    end
    self.Logger:Log_Finished();
end