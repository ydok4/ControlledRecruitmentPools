local crp = nil;
local core = nil;
local find_uicomponent = nil; 
require 'script/_lib/core/listeners/poolmodifierlisteners';

function CRP_InitialiseListenerData()
    out("CRP: SetupListeners");
    InitialisePoolModifier();
end

function CRP_SetupPostUIListeners(crpObject, coreObject, find_uicomponent_function)
    core = coreObject;
    find_uicomponent = find_uicomponent_function;
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
            0.1);
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
            0.1);
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
            crp.Logger:Log_Finished();
            local faction = context:faction();
            local factionName = faction:name();
            return (IsSupportedSubCulture(faction:subculture()) or IsRogueArmy(factionName)) and crp:IsExcludedFaction(faction) == false;
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
                elseif character:character_type("colonel") and (character:military_force():is_armed_citizenry() == false or character:is_politician() == true) then
                    crp.Logger:Log("Found colonel");
                    if character:has_military_force() == true then
                        crp.Logger:Log("Killing colonel for faction "..character:faction():name().." "..character:character_subtype_key());
                        cm:kill_character(character:cqi(), true, true);
                    end
                    crp.Logger:Log_Finished();
                else
                    crp:ProcessNewCharacter(character);
                end
            end,
            true
        );

        -- This listener exists to remove the previous listener
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
                SetupCharacterCreatedListenerPostTurn1();
                core:remove_listener("CRP_CharacterCreated_Removal");
                crp.Logger:Log_Finished();
            end,
            false
        );
    else
        SetupCharacterCreatedListenerPostTurn1();
    end
    core:add_listener(
        "CRP_OutputPlayerPool",
        "FactionTurnStart",
        function(context)
            local factionKey = context:faction():name();
            return crp.HumanFaction:name() == factionKey;
        end,
        function(context)
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
            return (IsSupportedSubCulture(faction:subculture())
            or (IsRogueArmy(factionName)) and crp:IsExcludedFaction(faction) == false);
        end,
        function(context)
            local faction = context:faction();
            -- Tomb kings and Nakai have caps applied as per the vanilla system (for now)
            if faction:subculture() ~= "wh2_dlc09_sc_tmb_tomb_kings"
            and faction:name() ~= "wh2_dlc13_lzd_spirits_of_the_jungle" then
                crp:ApplyArmyLimits(faction);
            end
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
            return not char:character_type("colonel");
        end,
        function(context)
            local char = context:character();
            crp:ProcessKilledCharacter(char);
        end,
        true
    );

    CRP_PoolModifierListeners(crpObject, core);
end

function SetupCharacterCreatedListenerPostTurn1()
    crp.Logger:Log("Setting up CRP_CharacterCreated listener");
    core:add_listener(
        "CRP_CharacterCreated",
        "CharacterCreated",
        function(context) return true; end,
        function(context)
            crp.Logger:Log("CRP_CharacterCreated");
            local character = context:character();
            if character:faction():is_quest_battle_faction() == true then
                crp.Logger:Log("Character is in quest battle faction, ignoring");
                crp.Logger:Log_Finished();
            elseif character:character_type("colonel") and (character:military_force():is_armed_citizenry() == false or character:is_politician() == true) then
                crp.Logger:Log("Found colonel");
                -- We need to wrap this in a callback because the pending battle cache isn't populated
                -- when the character is created and we can't just blanket kill the colonels because
                -- it breaks some quest battles
                --[[cm:callback(function()
                    crp.Logger:Log("In colonel callback");
                    if character:is_null_interface()
                    --or (character:has_military_force() == true and (cm:pending_battle_cache_char_is_attacker(character) == true or cm:pending_battle_cache_char_is_defender(character) == true)) then
                    or ((cm:pending_battle_cache_char_is_attacker(character) == true or cm:pending_battle_cache_char_is_defender(character) == true)) then
                        crp.Logger:Log("Ignoring character because they are taking part in a battle");
                    else
                        crp.Logger:Log("In kill character condition");
                        --crp.Logger:Log("Killing colonel for faction "..character:faction():name().." "..character:character_subtype_key());
                        cm:kill_character(character:cqi(), true, true);
                    end
                    crp.Logger:Log_Finished();
                end, 0);--]]
                crp.Logger:Log_Finished();
            else
                crp:ProcessNewCharacter(character);
            end
        end,
        true
    );
end

function CRP_GetGeneralCandidates(humanFaction, generalsList, lordsInPool, hideDefault)
    crp.Logger:Log("Get general candidates");
    if hideDefault == nil then
        hideDefault = true;
    end
    local humanFactionName = humanFaction:name();
    local humanFactionSubculture = humanFaction:subculture();

    local factionIntrigue = 0;
    local charIsSelected = false;
    if humanFactionSubculture == "wh2_main_sc_hef_high_elves" then
        local intrigueText = find_uicomponent(core:get_ui_root(), "layout", "resources_bar", "topbar_list_parent", "dy_intrigue"):GetStateText();
        factionIntrigue = tonumber(intrigueText);
    end

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
            if _G.IsIDE == true then
                for keyName, keyData in pairs(lordsInPool[humanFactionName]) do
                    poolData = keyData;
                    break;
                end
            end
            if lordsInPool[humanFactionName] == nil then
                crp.Logger:Log("No lords for human faction");
            elseif lordsInPool[humanFactionName][keyName] ~= nil then
                poolData = lordsInPool[humanFactionName][keyName];
            elseif subType ~= "Legendary Lord" then
                crp.Logger:Log("Char is not legendary lords");
                for characterKey, characterData in pairs(lordsInPool[humanFactionName]) do
                    if characterData.Name == nil then
                        --crp.Logger:Log("Name is nil");
                    else
                        --crp.Logger:Log("Checking nameText "..nameText.." and character data name "..characterData.Name);
                        if (string.match(nameText, characterData.Name) or string.match(characterData.Name, nameText)) and characterData.Name ~= nameText then
                            crp.Logger:Log("Found partial match with nameText "..nameText.." and character data name "..characterData.Name);
                            -- We need to update the key and the name
                            local remappedLord = {
                                ArtSetId = characterData.ArtSetId,
                                HomeRegion = characterData.HomeRegion,
                                InnateTrait = characterData.InnateTrait,
                                Name = nameText,
                                Mounts = characterData.Mounts,
                                SubType = characterData.SubType,
                                RemoveImmortality = characterData.RemoveImmortality,
                                IsRecruited = characterData.IsRecruited,
                                ExtraCost = characterData.ExtraCost
                            };
                            crp.CRPLordsInPools[humanFactionName][characterKey] = nil;
                            crp.CRPLordsInPools[humanFactionName][keyName] = remappedLord;
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
            if poolData == nil then
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
                            crp.Logger:Log("Untracked but valid character");
                        end
                    else
                        crp.Logger:Log("Untracked but valid character");
                    end
                end
            else
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
            and canPlayerAffordCharacter == false then
                generalPanel:SetState("inactive");
            end
            if humanFactionSubculture == "wh2_main_sc_hef_high_elves" then
                crp.Logger:Log("Human is high elves");
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
end

function HideGeneralPanel(generalPanel, hideDefault)
    if hideDefault == true then
        generalPanel:SetState("deselected");
        generalPanel:SetVisible(false);
    end
end