local crp = nil;
local core = nil;
local find_uicomponent = nil;
local UIComponent = nil;
require 'script/_lib/core/listeners/poolmodifierlisteners';

function CRP_InitialiseListenerData()
    out("CRP: SetupListeners");
    InitialisePoolModifier();
end

function CRP_SetupPostUIListeners(crpObject, coreObject, find_uicomponent_function, uicomponent_function)
    core = coreObject;
    find_uicomponent = find_uicomponent_function;
    UIComponent = uicomponent_function;
    crpObject.UIController:InitialiseUIReferences(find_uicomponent_function, uicomponent_function);
    if not core then
        return;
    end
    crp = crpObject;
    crpObject.Logger:Log("Initialising post UI listeners");
    crp.Logger:Log("AppointGeneralOpened");
    local panelOpened = false;
    core:add_listener(
        "CRP_CharacterPanelOpened",
        "PanelOpenedCampaign",
        function(context)
            return context.string == "character_panel";
        end,
        function(context)
            crp.Logger:Log("\nCharacter panel opened");
            panelOpened = true;
            crp.Logger:Log_Finished();
        end,
        true
    );

    core:add_listener(
        "CRP_AppointGeneralOpened",
        "PanelOpenedCampaign",
        function(context)
            return context.string == "appoint_new_general";
        end,
        function(context)
            out("CRP: AppointGeneralOpened");
            cm:callback(function()
                local generalsList = find_uicomponent(core:get_ui_root(), "panel_manager", "appoint_new_general", "event_appoint_new_general", "general_selection_panel", "character_list", "listview", "list_clip", "list_box");
                CRP_GetGeneralCandidates(crp.HumanFaction, generalsList, crp.CRPLordsInPools, false);
                crp.Logger:Log_Finished();
            end,
            0.1);
        end,
        true
    );

    crp.Logger:Log("ClickedButtonCreateArmy");
    core:add_listener(
        "CRP_ClickedCreateArmyButton",
        "ComponentLClickUp",
        function(context)
            return context.string == "button_create_army"
            or context.string == "button_cycle_left"
            or context.string == "button_cycle_right"
            or context.string == "button_agents"
            or context.string == "champion"
            or context.string == "wizard"
            or context.string == "dignitary"
            or context.string == "engineer"
            or context.string == "runesmith"
            or context.string == "spy"
            or crp.CharacterGenerator:GetSubtypeData(context.string) ~= nil;
        end,
        function(context)
            crp.Logger:Log("\n"..context.string.." clicked");
            local uiContext = context.string;
            cm:callback(function()
                crp.Logger:Log("button_create_army callback");
                if not find_uicomponent then
                    crp.Logger:Log("find_uicomponent is nil");
                end
                local generalsList = find_uicomponent(core:get_ui_root(), "character_panel", "general_selection_panel", "character_list_parent", "character_list", "listview", "list_clip", "list_box");
                crp.Logger:Log("Got generals list");
                CRP_GetGeneralCandidates(crp.HumanFaction, generalsList, crp.CRPLordsInPools);
                crp.Logger:Log_Finished();
            end,
            0.2);
        end,
        true
    );
    crp.Logger:Log("ClickedReplaceButton");
    core:add_listener(
        "ClickedReplaceButton",
        "ComponentLClickUp",
        function(context)
            return context.string == "button_replace_general";
        end,
        function(context)
            crp.Logger:Log("Clicked replace");
            cm:callback(function()
                local generalsList = find_uicomponent(core:get_ui_root(), "character_details_panel", "general_selection_panel", "character_list", "listview", "list_clip", "list_box");
                CRP_GetGeneralCandidates(crp.HumanFaction, generalsList, crp.CRPLordsInPools);
                crp.Logger:Log_Finished();
            end,
            0.2);
        end,
        true
    );

    core:add_listener(
        "CRP_SettlementSelected",
        "SettlementSelected",
        function(context)
            return true;
        end,
        function(context)
            crp.Logger:Log("Settlement selected");
            if panelOpened == true then
                cm:callback(function(context)
                    local generalsList = find_uicomponent(core:get_ui_root(), "character_panel", "general_selection_panel", "character_list_parent", "character_list", "listview", "list_clip", "list_box");
                    CRP_GetGeneralCandidates(crp.HumanFaction, generalsList, crp.CRPLordsInPools);
                    crp.Logger:Log_Finished();
                end,
                0.2);
            end
            crp.Logger:Log_Finished();
        end,
        true
    );
    crp.Logger:Log("GeneralRecruitmentClosed");
    core:add_listener(
        "GeneralRecruitmentClosed",
        "PanelClosedCampaign",
        function(context)
            return context.string == "character_panel"
            or context.string == "appoint_new_general"
            or context.string == "character_details_panel";
        end,
        function(context)
            crp.Logger:Log("Panel closed\n");
            panelOpened = false;
            crp.UIController:ClearCharacterCostCache();
            crp.Logger:Log_Finished();
        end,
        true
    );

    crp.Logger:Log("UpdateRecruitmentPool");
    -- Handles the basic faction lord replenishment
    core:add_listener(
        "UpdateRecruitmentPool",
        "FactionTurnEnd",
        function(context)
            local faction = context:faction();
            local factionName = faction:name();
            return (crp:IsExcludedFaction(faction) == false and IsSupportedSubCulture(faction:subculture()) and IsRogueArmy(factionName) == false);
        end,
        function(context)
            crp.Logger:Log("UpdateRecruitmentPool");
            if context:faction():name() == crp.HumanFaction:name() then
                crp.Logger:Log_Start();
            end
            crp:UpdateRecruitmentPool(context:faction(), 1);
            crp.Logger:Log_Finished();
        end,
        true
    );

    crp.Logger:Log("CRP_CharacterCreated");
    -- Performs post character created/recruited functionality
    -- like adding traits
    -- We have 2 different versions of the listener for game start and regular gameplay
    -- because we can skip some of the checks for colonels. This is both for speed
    -- and stability (it crashes).
    if cm:turn_number() == 1 then
        crp.Logger:Log("Adding turn 1 listeners");
        core:add_listener(
            "CRP_CharacterCreatedTurn1",
            "CharacterCreated",
            cm:turn_number() == 1,
            function(context)
                crp.Logger:Log("CRP_CharacterCreatedTurn1");
                local character = context:character();
                if character:faction():is_quest_battle_faction() == true then
                    crp.Logger:Log("Character is in quest battle faction, ignoring");
                    crp.Logger:Log_Finished();
                elseif character:character_type("colonel")
                and (character:military_force():is_armed_citizenry() == false or character:is_politician() == true) then
                    crp.Logger:Log("Found colonel");
                    if character:has_military_force() == true then
                        crp.Logger:Log("Killing colonel for faction "..character:faction():name().." "..character:character_subtype_key());
                        cm:kill_character(character:cqi(), true, true);
                    end
                    crp.Logger:Log_Finished();
                elseif character:character_subtype_key() == "default" then
                    cm:callback(function()
                        cm:kill_character(character:cqi(), true, true);
                    end,
                    0);
                else
                    crp:ProcessNewCharacter(character);
                    if cm:model():world():whose_turn_is_it():name() == character:faction():name() then
                        crp:UpdateCharacterInAgentCache(character, 1);
                        crp:ApplyHeroLimits(character:faction());
                    end
                end
            end,
            true
        );

        core:add_listener(
            "CRP_InitialLordTracking",
            "FactionTurnEnd",
            cm:turn_number() == 1,
            function(context)
                local faction = context:faction();
                crp.Logger:Log("CRP_InitialLordTracking");
                crp:TrackInitialLords(faction);
                crp.Logger:Log_Finished();
            end,
            true
        );

        -- This listener exists to remove the previous listeners
        -- It should only fire once
        core:add_listener(
            "CRP_CharacterCreated_Removal",
            "FactionTurnStart",
            function(context)
                return cm:turn_number() == 2;
            end,
            function(context)
                crp.Logger:Log("Removing CRP_CharacterCreatedTurn1 listener");
                core:remove_listener("CRP_CharacterCreatedTurn1");
                core:remove_listener("CRP_CharacterCreated_Removal");
                crp.Logger:Log_Finished();
            end,
            false
        );

        core:add_listener(
            "CRP_InitialLordTracking_Removal",
            "FactionTurnEnd",
            function(context)
                return cm:turn_number() == 2;
            end,
            function(context)
                crp.Logger:Log("Removing CRP_InitialLordTracking listener");
                core:remove_listener("CRP_InitialLordTracking");
                core:remove_listener("CRP_InitialLordTracking_Removal");
                crp.Logger:Log_Finished();
            end,
            false
        );
    else

    end
    crp.Logger:Log("Setting up CRP_CharacterCreated listener");
    core:add_listener(
        "CRP_CharacterCreated",
        "CharacterCreated",
        function(context)
            local char = context:character();
            local faction = char:faction();
            return cm:turn_number() >= 2
            and (not char:character_type("colonel") and crp:IsExcludedFaction(faction) == false and IsSupportedSubCulture(faction:subculture()));
        end,
        function(context)
            crp.Logger:Log("CRP_CharacterCreated");
            local character = context:character();
            if character:faction():is_quest_battle_faction() == true then
                crp.Logger:Log("Character is in quest battle faction, ignoring");
                crp.Logger:Log_Finished();
            elseif character:character_type("colonel") and (character:military_force():is_armed_citizenry() == false or character:is_politician() == true) then
                crp.Logger:Log("Found colonel");
                crp.Logger:Log_Finished();
            elseif character:character_subtype_key() == "default" then
                crp.Logger:Log("Found default...Killing it");
                cm:callback(function()
                    cm:kill_character(character:cqi(), true, true);
                    crp.Logger:Log_Finished();
                end,
                0);
            else
                crp:ProcessNewCharacter(character);
                if cm:model():world():whose_turn_is_it():name() == character:faction():name() then
                    crp:UpdateCharacterInAgentCache(character, 1);
                    crp:ApplyHeroLimits(character:faction());
                end
            end
        end,
        true
    );

    core:add_listener(
        "CRP_OutputPlayerPool",
        "FactionTurnStart",
        function(context)
            local factionKey = context:faction():name();
            return crp.HumanFaction:name() == factionKey;
        end,
        function(context)
            crp.Logger:Log("Outputting player faction");
            local faction = context:faction();
            local factionKey = faction:name();
            local factionLords = crp.CRPLordsInPools[factionKey];
            for key, data in pairs(factionLords) do
                crp.Logger:Log("Tracked character: "..key);
            end
            crp.Logger:Log_Finished();
        end,
        true
    );
    -- Handles updates of agent limits
    core:add_listener(
        "CRP_UpdateAgentLimits",
        "FactionTurnStart",
        function(context)
            local faction = context:faction();
            local factionName = faction:name();
            return not faction:is_dead()
            and crp:IsExcludedFaction(faction) == false
            and IsSupportedSubCulture(faction:subculture())
            and IsRogueArmy(factionName) == false;
        end,
        function(context)
            local faction = context:faction();
            -- When using Lichemaster and we are updating Kemmler's faction
            -- we can skip this logic
            if core:is_mod_loaded("liche_init")
            and faction:name() == "wh2_dlc11_vmp_the_barrow_legion" then
                return;
            end
            crp:ApplyHeroAndArmyLimits(faction);
            crp.Logger:Log("Rolling pool size increase for faction: "..faction:name());
            -- Random chance to increase size of the lord pool
            local turnNumber = cm:turn_number();
            local factionPoolResources = GetFactionPoolResources(faction);
            crp.Logger:Log("Lord pool max size is: "..factionPoolResources.LordPoolMaxSize);
            local withinLordRange = factionPoolResources.LordPoolMaxSize < (turnNumber / 10) + 2;
            if withinLordRange == true
            and factionPoolResources.LordPoolMaxSize < 16
            and (Roll100(((math.floor((turnNumber % 20) / 2)) * 10)) == true
            or _G.IsIDE == true) then
                factionPoolResources.LordPoolMaxSize = factionPoolResources.LordPoolMaxSize + 1;
                crp.Logger:Log("Lord pool size is now: "..factionPoolResources.LordPoolMaxSize);
                if faction:name() == crp.HumanFaction:name() then
                    local factionCqi = crp.HumanFaction:command_queue_index();
                    cm:trigger_incident_with_targets(factionCqi, "crp_lord_pool_size_expands", factionCqi, 0, 0, 0, 0, 0);
                end
            end
            -- Random chance to increase size of the hero pool
            crp.Logger:Log("Hero pool max size is: "..factionPoolResources.HeroPoolMaxSize);
            local withinHeroRange = factionPoolResources.HeroPoolMaxSize < (turnNumber / 10) + 3;
            if withinHeroRange == true then
                crp.Logger:Log("Faction is within hero range");
                crp.Logger:Log("Hero chance is: "..((turnNumber % 10) * 10));
            else
                crp.Logger:Log("Faction is not within hero range");
                crp.Logger:Log("HeroPoolMaxSize: "..factionPoolResources.HeroPoolMaxSize);
            end
            if withinHeroRange == true
            and (factionPoolResources.HeroPoolMaxSize < 26
            and Roll100(((turnNumber % 10) * 10)) == true)
            or _G.IsIDE == true then
                factionPoolResources.HeroPoolMaxSize = factionPoolResources.HeroPoolMaxSize + 1;
                crp.Logger:Log("Hero pool size is now: "..factionPoolResources.HeroPoolMaxSize);
                if faction:name() == crp.HumanFaction:name() then
                    local factionCqi = crp.HumanFaction:command_queue_index();
                    cm:trigger_incident_with_targets(factionCqi, "crp_hero_pool_size_expands", factionCqi, 0, 0, 0, 0, 0);
                end
            end
            crp.Logger:Log_Finished();
        end,
        true
    );

    -- Performs post character created/recruited functionality
    -- like adding traits
    crp.Logger:Log("CRP_CharacterKilled");
    core:add_listener(
        "CRP_CharacterKilled",
        "CharacterConvalescedOrKilled",
        function(context)
            local char = context:character();
            local faction = char:faction();
            local factionName = faction:name();
            --crp.Logger:Log("Character killed for faction: "..factionName);
            return (not char:character_type("colonel")
            and crp:IsExcludedFaction(faction) == false
            and IsSupportedSubCulture(faction:subculture())
            and IsRogueArmy(factionName) == false);
        end,
        function(context)
            local char = context:character();
            local killedCharacterData = {
                CQI = char:command_queue_index(),
                SubType = char:character_subtype_key(),
                Faction = char:faction(),
                ForeName = char:get_forename(),
                Surname = char:get_surname(),
            };
            if cm:model():world():whose_turn_is_it():name() == char:faction():name() then
                crp:UpdateCharacterInAgentCache(char, -1);
                crp:ApplyHeroLimits(killedCharacterData.Faction);
                crp.Logger:Log_Finished();
            end
            crp:ProcessKilledCharacter(char, killedCharacterData);
        end,
        true
    );
    -- Merge pools when a confederation occurs and kill off any duplicates
    core:add_listener(
        "CRP_ConfederationListener",
        "FactionJoinsConfederation",
        function(context)
            return true;
        end,
        function(context)
            local confederee = context:faction();
            local sourceFactionName = confederee:name();
            local destinationFaction = context:confederation();
            cm:callback(function()
                crp.Logger:Log("Faction has been confederated: "..sourceFactionName);
                local destinationFactionName = destinationFaction:name();
                crp.Logger:Log("Faction is destination faction: "..destinationFactionName);
                local destinationFactionPool = crp.CRPLordsInPools[destinationFactionName];
                local sourceFactionPool = crp.CRPLordsInPools[sourceFactionName];
                local homeRegion = crp.CharacterGenerator:GetRegionForFaction(destinationFaction);
                local duplicateCharacterKeys = {};
                local character_list = destinationFaction:character_list();
                for i = 0, character_list:num_items() - 1 do
                    local character = character_list:item_at(i);
                    if not character:is_null_interface() then
                        local characterSubtypeKey = character:character_subtype_key();
                        if destinationFactionPool[characterSubtypeKey] == nil then
                            destinationFactionPool[characterSubtypeKey] = {};
                        end
                        if cm:char_is_mobile_general_with_army(character)
                        or cm:char_is_agent(character) == true
                        or character:is_wounded() == true then
                            crp.Logger:Log("Checking character subtype: "..characterSubtypeKey);
                            local generatedName = {
                                clan_name = character:get_forename(),
                                forename = character:get_surname(),
                            };
                            local keyName = crp:GetCleansedNameKey(generatedName)
                            crp.Logger:Log("Checking for valid character: "..keyName);
                            if destinationFactionPool[characterSubtypeKey] == nil then
                                destinationFactionPool[characterSubtypeKey] = {};
                            end
                            if destinationFactionPool[characterSubtypeKey][keyName] == nil then
                                if sourceFactionPool[characterSubtypeKey] ~= nil
                                and sourceFactionPool[characterSubtypeKey][keyName] then
                                    crp.Logger:Log("Character is not tracked...Tracking in pool.");
                                    local sourceCharacterData = sourceFactionPool[characterSubtypeKey][keyName];
                                    crp.Logger:Log("Got source character data");
                                    destinationFactionPool[characterSubtypeKey][keyName] = {
                                        CQI = sourceCharacterData.CQI,
                                        Name = sourceCharacterData.Name,
                                        Mounts = sourceCharacterData.MountData,
                                        InnateTrait = sourceCharacterData.InnateTrait,
                                        SubType = sourceCharacterData.SubType,
                                        ArtSetId = sourceCharacterData.ArtSetId,
                                        HomeRegion = sourceCharacterData.HomeRegion,
                                        RemoveImmortality = sourceCharacterData.RemoveImmortality,
                                        IsRecruited = sourceCharacterData.IsRecruited,
                                        ExtraCost = sourceCharacterData.ExtraCost,
                                    };

                                else
                                    crp.Logger:Log("Character is missing in both pools...tracking it.");
                                    local charSubType = character:character_subtype_key();
                                    crp.Logger:Log("Tracking subtype "..charSubType);
                                    crp:TrackCharacterInPoolData(destinationFactionName, generatedName, charSubType, "", homeRegion, false, true);
                                    crp.CRPLordsInPools[destinationFactionName][charSubType][keyName].CQI = character:command_queue_index();
                                end
                            elseif destinationFactionPool[characterSubtypeKey] ~= nil
                            and destinationFactionPool[characterSubtypeKey][keyName] ~= nil
                            and sourceFactionPool[characterSubtypeKey] ~= nil
                            and sourceFactionPool[characterSubtypeKey][keyName] ~= nil
                            and sourceFactionPool[characterSubtypeKey][keyName].IsRecruited == true then
                                crp.Logger:Log("Same character key is in both factions.");
                                duplicateCharacterKeys[#duplicateCharacterKeys + 1] = character;
                            end
                        end
                    else
                        crp.Logger:Log("Character: "..i.." is a null interface");
                    end
                end
                if #duplicateCharacterKeys > 0 then
                    crp.Logger:Log("Found duplicate confederation keys between factions");
                    for index, character in pairs(duplicateCharacterKeys) do
                        local generatedName = {
                            clan_name = character:get_forename(),
                            forename = character:get_surname(),
                        };
                        local keyName = crp:GetCleansedNameKey(generatedName);
                        local characterSubtypeKey = character:character_subtype_key();
                        local destinationPoolData = destinationFactionPool[characterSubtypeKey][keyName];
                        if character:command_queue_index() ~= destinationPoolData.CQI then
                            crp.Logger:Log("Killing confederee duplicate: "..keyName.." subtype: "..characterSubtypeKey);
                            cm:kill_character(character:command_queue_index(), true);
                        end
                    end
                end
                crp.Logger:Log_Finished();
            end,
            0);
        end,
        true
    );
    CRP_PoolModifierListeners(crpObject, core);
end
function CRP_GetGeneralCandidates(humanFaction, generalsList, lordsInPool, hideDefault)
    crp.Logger:Log("Get general candidates");
    if hideDefault == nil then
        hideDefault = true;
    end
    local humanFactionName = humanFaction:name();
    if humanFactionName == "wh_main_grn_skull-takerz" then
        humanFactionName = "wh_main_grn_skull_takerz";
    end
    local humanFactionSubculture = humanFaction:subculture();

    local charIsSelected = false;
    if generalsList and generalsList:ChildCount() > 0 then
        crp.Logger:Log("There are "..generalsList:ChildCount().." in the list");
        -- Get the localised strings of the defaults lords so we know who to hide if they aren't tracked
        local defaultLordKeysForFaction = GetDefaultLordsForFaction(humanFaction);
        local localisedDefaultLordsForFaction = {};
        if defaultLordKeysForFaction ~= nil then
            for index, defaultLordKey in pairs(defaultLordKeysForFaction) do
                local localisedDefaultLord = effect.get_localised_string("agent_subtypes_onscreen_name_override_"..defaultLordKey);
                crp.Logger:Log("Default lord is "..localisedDefaultLord);
                localisedDefaultLordsForFaction[localisedDefaultLord] = true;
            end
        else
            crp.Logger:Log("Missing default lord keys");
        end
        crp.Logger:Log_Finished();
        -- This keeps track of what character types should be hidden because they are replaceable. There could be overlap with the default lords.
        local arePresentSubTypesReplaceable = {};
        local numGenerals = generalsList:ChildCount() - 1 ;
        for i = 0, numGenerals  do
            local generalPanel = UIComponent(generalsList:Find(i));
            local nameComponent = find_uicomponent(generalPanel, "dy_name");
            local nameText = nameComponent:GetStateText();
            local keyName = "";
            keyName = CreateValidLuaTableKey(nameText);
            crp.Logger:Log("Key is "..keyName);
            local subType = find_uicomponent(generalPanel, "dy_subtype"):GetStateText();
            if string.match(subType, "Wizard level") then
                subType = string.match(subType, "(.*) %- Wizard level");
            end
            crp.Logger:Log("Subtype text is "..subType);

            local poolData = nil;
            local agentSubtype = crp.LocalisedSubTypeCache[subType];
            if agentSubtype ~= nil then
                crp.Logger:Log("Subtype key is: "..agentSubtype);
            end
            if _G.IsIDE == true then
                for agentKey, agentData in pairs(lordsInPool[humanFactionName]) do
                    agentSubtype = agentKey;
                    for keyName, keyData in pairs(agentData) do
                        poolData = keyData;
                        break;
                    end
                    break;
                end
            end
            if lordsInPool[humanFactionName] == nil then
                crp.Logger:Log("No lords for human faction");
            elseif lordsInPool[humanFactionName][agentSubtype] ~= nil
                and lordsInPool[humanFactionName][agentSubtype][keyName] ~= nil then
                crp.Logger:Log("Character is tracked");
                poolData = lordsInPool[humanFactionName][agentSubtype][keyName];
            elseif subType ~= "Legendary Lord" then
                crp.Logger:Log("Char is not a legendary lord");
                for characterKey, characterData in pairs(lordsInPool[humanFactionName]) do
                    if characterData.Name == nil then
                        --crp.Logger:Log("Name is nil");
                    else
                        --crp.Logger:Log("Checking nameText "..nameText.." and character data name "..characterData.Name);
                        if (string.match(nameText, characterData.Name) or string.match(characterData.Name, nameText))
                        and characterData.Name ~= nameText then
                            crp.Logger:Log("Found partial match with nameText "..nameText.." and character data name "..characterData.Name);
                            -- We need to update the key and the name
                            local remappedLord = {
                                CQI = characterData.CQI,
                                Name = nameText,
                                ArtSetId = characterData.ArtSetId,
                                HomeRegion = characterData.HomeRegion,
                                InnateTrait = characterData.InnateTrait,
                                Mounts = characterData.Mounts,
                                SubType = characterData.SubType,
                                RemoveImmortality = characterData.RemoveImmortality,
                                IsRecruited = characterData.IsRecruited,
                                ExtraCost = characterData.ExtraCost
                            };
                            crp.CRPLordsInPools[humanFactionName][characterData.SubType][characterKey] = nil;
                            crp.CRPLordsInPools[humanFactionName][characterData.SubType][keyName] = remappedLord;
                            poolData = remappedLord;
                            break;
                        end
                    end
                end
            end
            crp.Logger:Log("Finished trying to find data");

            -- If the character isn't tracked, see if it is a replacement type
            -- If it is, hide these characters from the player
            local isCharHidden = false;
            local canPlayerAffordCharacter = false;
            if poolData == nil
            and subType ~= "Legendary Lord" then
                crp.Logger:Log("No pool data found");
                if localisedDefaultLordsForFaction[subType] == true then
                    HideGeneralPanel(generalPanel, hideDefault);
                else
                    local replacementLords = GetReplacementLordsForFaction(humanFaction);
                    if replacementLords ~= nil then
                        crp.Logger:Log("Got replacement lords");
                        if arePresentSubTypesReplaceable[subType] == nil then
                            local replacementSubTypeKeys = GetKeysFromTable(replacementLords);
                            local subTypeKey = GetMatchingKeyMatchingLocalisedString(replacementSubTypeKeys, subType, "agent_subtypes_onscreen_name_override_");
                            if subTypeKey ~= nil then
                                arePresentSubTypesReplaceable[subType] = true;
                                HideGeneralPanel(generalPanel, hideDefault);
                                isCharHidden = true;
                            else
                                arePresentSubTypesReplaceable[subType] = false;
                            end
                        elseif arePresentSubTypesReplaceable[subType] == true then
                            HideGeneralPanel(generalPanel, hideDefault);
                            isCharHidden = true;
                        else
                            crp.Logger:Log("No replacement lords and this is an untracked but valid character");
                            canPlayerAffordCharacter = true;
                        end
                    else
                        local foundPartialMatch = false;
                        for agentSubTypeKey, agentSubTypeData in pairs(crp.CRPLordsInPools[humanFactionName]) do
                            for key, data in pairs(agentSubTypeData) do
                                if string.match(keyName, key) and keyName ~= key then
                                    crp.Logger:Log("Found partial match");
                                    poolData = data;
                                    foundPartialMatch = true;
                                    break;
                                end
                            end
                        end
                        if foundPartialMatch == false then
                            crp.Logger:Log("Untracked but valid character");
                        end
                        canPlayerAffordCharacter = true;
                    end
                end
            end
            if poolData ~= nil then
                crp.Logger:Log("Tracked character, adding extra details");
                local newRecruitmentCost = crp.UIController:SetupCharacterDetailsButton(generalPanel, nameComponent, poolData);
                if newRecruitmentCost ~= nil then
                    local factionTreasuryComponent = find_uicomponent(core:get_ui_root(), "layout", "resources_bar", "topbar_list_parent", "dy_treasury");
                    local factionTreasuryText = factionTreasuryComponent:GetStateText();
                    crp.Logger:Log("Current faction treasury is: "..factionTreasuryText);
                    crp.Logger:Log("New recruitment cost is: "..newRecruitmentCost);
                    if tonumber(factionTreasuryText) >= newRecruitmentCost then
                        canPlayerAffordCharacter = true;
                    end
                end
            end

            if isCharHidden == false
            and charIsSelected == false
            and canPlayerAffordCharacter == true
            and humanFactionSubculture ~= "wh2_main_sc_hef_high_elves" then
                generalPanel:SimulateLClick();
                charIsSelected = true;
            elseif humanFactionSubculture ~= "wh2_main_sc_hef_high_elves"
            and canPlayerAffordCharacter == false
            and poolData ~= nil then
                generalPanel:SetState("inactive");
                local recruitmentCostComponent = find_uicomponent(generalPanel, "RecruitmentCost", "Cost");
                local colouredStateText = "[[col:dark_r]]"..recruitmentCostComponent:GetStateText().."[[/col]]";
                recruitmentCostComponent:SetStateText(colouredStateText);
            end
            if humanFactionSubculture == "wh2_main_sc_hef_high_elves" then
                crp.Logger:Log("Human is high elves");
                local factionIntrigue = 0;
                if humanFactionSubculture == "wh2_main_sc_hef_high_elves" then
                    local intrigueText = find_uicomponent(core:get_ui_root(), "layout", "resources_bar", "topbar_list_parent", "dy_intrigue"):GetStateText();
                    factionIntrigue = tonumber(intrigueText);
                    if factionIntrigue == nil then
                        factionIntrigue = 0;
                    end
                end
                local intrigueCostContainer = find_uicomponent(generalPanel, "IntrigueCost");
                if intrigueCostContainer ~= nil then
                    local intrigueCost = find_uicomponent(intrigueCostContainer, "Cost");
                    if intrigueCost ~= nil then
                        crp.Logger:Log("Checking "..keyName);
                        if poolData then
                            if (poolData.SubType == "wh2_main_hef_prince_mid" or poolData.SubType == "wh2_main_hef_princess_mid")
                            and poolData.IsRecruited == false then
                                crp.Logger:Log("Lord is mid prince or princess");
                                intrigueCost:SetStateText("15");
                                intrigueCostContainer:SetVisible(true);
                                if factionIntrigue < 15
                                or canPlayerAffordCharacter == false then
                                    generalPanel:SetState("inactive");
                                    local recruitmentCostComponent = find_uicomponent(generalPanel, "RecruitmentCost", "Cost");
                                    local colouredStateText = "[[col:dark_r]]"..recruitmentCostComponent:GetStateText().."[[/col]]";
                                    recruitmentCostComponent:SetStateText(colouredStateText);
                                    intrigueCost:SetStateText("[[col:dark_r]]15[[/col]]");
                                elseif charIsSelected == false then
                                    generalPanel:SimulateLClick();
                                    charIsSelected = true;
                                end
                            elseif (poolData.SubType == "wh2_main_hef_prince_high" or poolData.SubType == "wh2_main_hef_princess_high")
                            and poolData.IsRecruited == false then
                                crp.Logger:Log("Lord is high prince or princess");
                                intrigueCost:SetStateText("60");
                                intrigueCostContainer:SetVisible(true);
                                if factionIntrigue < 60
                                or canPlayerAffordCharacter == false then
                                    generalPanel:SetState("inactive");
                                    local recruitmentCostComponent = find_uicomponent(generalPanel, "RecruitmentCost", "Cost");
                                    local colouredStateText = "[[col:dark_r]]"..recruitmentCostComponent:GetStateText().."[[/col]]";
                                    recruitmentCostComponent:SetStateText(colouredStateText);
                                    intrigueCost:SetStateText("[[col:dark_r]]60[[/col]]");
                                elseif charIsSelected == false then
                                    generalPanel:SimulateLClick();
                                    charIsSelected = true;
                                end
                            elseif charIsSelected == false then
                                crp.Logger:Log("Setting lord as selected "..keyName);
                                intrigueCostContainer:SetVisible(false);
                                generalPanel:SimulateLClick();
                                charIsSelected = true;
                            end
                        end
                    else
                        crp.Logger:Log("Intrigue cost is nil");
                    end
                else
                    crp.Logger:Log("Intrigue container is nil");
                end
            end
            crp.Logger:Log_Finished();
        end

        if charIsSelected == false then
            crp.Logger:Log("No character can be recruited");
            local raiseForcesButton = find_uicomponent(core:get_ui_root(), "character_panel", "raise_forces_options", "button_raise");
            raiseForcesButton:SetState("inactive");
            local unitInfoPopup = find_uicomponent(core:get_ui_root(), "UnitInfoPopup");
            unitInfoPopup:SetVisible(false);
        end
    else
        crp.Logger:Log("There are no generals in the list");
    end
    if humanFaction:name() ~= crp.CachedAgentData.FactionKey then
        crp:CreateCachedAgentData(humanFaction);
    end
     -- When using Lichemaster and we are updating Kemmler's faction
    -- we can skip this logic
    if not core:is_mod_loaded("liche_init")
    or humanFaction:name() ~= "wh2_dlc11_vmp_the_barrow_legion" then
        local agentCapComponent = find_uicomponent(core:get_ui_root(), "character_panel", "agent_parent", "dy_agent_cap");
        local newCapText = crp.CachedAgentData.AgentCount.." / "..crp.CachedAgentData.AgentCap;
        agentCapComponent:SetStateText(newCapText);
    end
end

function HideGeneralPanel(generalPanel, hideDefault)
    if hideDefault == true then
        generalPanel:SetState("deselected");
        generalPanel:SetVisible(false);
    end
end