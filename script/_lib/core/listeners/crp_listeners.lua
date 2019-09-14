local crp = nil;
local core = nil;
local find_uicomponent = nil; 
require 'script/_lib/core/listeners/poolmodifierlisteners';

Custom_Log("Loading Listeners");
function CRP_InitialiseListenerData()
    out("CRP: SetupListeners");
    Custom_Log("InitialiseListenerData");
    InitialisePoolModifier();
    Custom_Log_Finished();
end

function CRP_SetupPostUIListeners(crpObject, coreObject, find_uicomponent_function)
    Custom_Log("Initialising post UI listeners");
    core = coreObject;
    find_uicomponent = find_uicomponent_function;
    if not core then
        Custom_Log("Error: core is not defined");
        if not crpObject then
            Custom_Log("Error: crpObject is not defined");
        end
        return;
    end

    crp = crpObject;
    Custom_Log("AppointGeneralOpened");
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
                Custom_Log_Finished();
            end,
            0);
        end,
        true
    );

    Custom_Log("ClickedButtonCreateArmy");
    core:add_listener(
        "CRP_ClickedCreateArmyButton",
        "ComponentLClickUp",
        function(context)
            return context.string == "button_create_army";
        end,
        function(context)
            Custom_Log("\n"..context.string.." clicked");
            local uiContext = context.string;
            cm:callback(function()
                Custom_Log("button_create_army callback");
                if not find_uicomponent then
                    Custom_Log("find_uicomponent is nil");
                end
                local generalsList = find_uicomponent(core:get_ui_root(), "character_panel", "general_selection_panel", "character_list_parent", "character_list", "listview", "list_clip", "list_box");
                Custom_Log("Got generals list");
                CRP_GetGeneralCandidates(crp.HumanFaction, generalsList, crp.CRPLordsInPools);
                Custom_Log_Finished();
            end,
            0);
        end,
        true
    );
    Custom_Log("ClickedReplaceButton");
    core:add_listener(
        "ClickedReplaceButton",
        "ComponentLClickUp",
        function(context)
            return context.string == "button_replace_general";
        end,
        function(context)
            Custom_Log("Clicked replace");
            cm:callback(function()
                local generalsList = find_uicomponent(core:get_ui_root(), "character_details_panel", "general_selection_panel", "character_list", "listview", "list_clip", "list_box");
                CRP_GetGeneralCandidates(crp.HumanFaction, generalsList, crp.CRPLordsInPools);
                Custom_Log_Finished();
            end,
            0);
        end,
        true
    );
    Custom_Log("GeneralRecruitmentClosed");
    core:add_listener(
        "GeneralRecruitmentClosed",
        "PanelClosedCampaign",
        function(context)
            return context.string == "character_panel"
            or context.string == "appoint_new_general"
            or context.string == "character_details_panel";
        end,
        function(context)
            Custom_Log("Panel closed\n");
            Custom_Log_Finished();
        end,
        true
    );

    Custom_Log("UpdateRecruitmentPool");
    -- Handles the basic faction lord replenishment
    core:add_listener(
        "UpdateRecruitmentPool",
        "FactionTurnEnd",
        function(context)
            Custom_Log_Finished();
            local faction = context:faction();
            local factionName = faction:name();
            return (IsSupportedSubCulture(faction:subculture()) or IsRogueArmy(factionName)) and crp:IsExcludedFaction(faction) == false;
        end,
        function(context)
            Custom_Log("UpdateRecruitmentPool");
            if context:faction():name() == crp.HumanFaction:name() then
                Custom_Log_Start();
            end
            crp:UpdateRecruitmentPool(context:faction(), 1);
            Custom_Log_Finished();
        end,
        true
    );
    Custom_Log("CRP_CharacterCreated");
    -- Performs post character created/recruited functionality
    -- like adding traits
    -- We have 2 different versions of the listener for game start and regular gameplay
    -- because we can skip some of the checks for colonels. This is both for speed
    -- and stability (it crashes).
    if cm:turn_number() == 1 then
        core:add_listener(
            "CRP_CharacterCreatedTurn1",
            "CharacterCreated",
            cm:turn_number() == 1,
            function(context)
                Custom_Log("CRP_CharacterCreatedTurn1");
                local character = context:character();
                if character:faction():is_quest_battle_faction() == true then
                    Custom_Log("Character is in quest battle faction, ignoring");
                    Custom_Log_Finished();
                elseif character:character_type("colonel") and (character:military_force():is_armed_citizenry() == false or character:is_politician() == true) then
                    Custom_Log("Found colonel");
                    if character:has_military_force() == true then
                        Custom_Log("Killing colonel for faction "..character:faction():name().." "..character:character_subtype_key());
                        cm:kill_character(character:cqi(), true, true);
                    end
                    Custom_Log_Finished();
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
                Custom_Log("Removing CRP_CharacterCreatedTurn1 listener");
                core:remove_listener("CRP_CharacterCreatedTurn1");
                SetupCharacterCreatedListenerPostTurn1();
                core:remove_listener("CRP_CharacterCreated_Removal");
                Custom_Log_Finished();
            end,
            false
        );
    else
        SetupCharacterCreatedListenerPostTurn1();
    end
    -- Performs post character created/recruited functionality
    -- like adding traits
    --[[core:add_listener(
        "CRP_CharacterEnteredPool",
        "NewCharacterEnteredRecruitmentPool",
        true,
        function(context)
            Custom_Log("Character entered recruitment pool listener");
            local character = context:character();
            local charSubTypeKey = character:character_subtype_key();
            local factionName = character:faction():name();
            Custom_Log("Character entered pool "..charSubTypeKey.." faction name "..factionName);
        end,
        true
    );--]]

    Custom_Log("CRP_CharacterKilled");
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
    Custom_Log("Setting up CRP_CharacterCreated listener");
    core:add_listener(
        "CRP_CharacterCreated",
        "CharacterCreated",
        function(context) return true; end,
        function(context)
            Custom_Log("CRP_CharacterCreated");
            local character = context:character();
            if character:faction():is_quest_battle_faction() == true then
                Custom_Log("Character is in quest battle faction, ignoring");
                Custom_Log_Finished();
            elseif character:character_type("colonel") and (character:military_force():is_armed_citizenry() == false or character:is_politician() == true) then
                Custom_Log("Found colonel");
                -- We need to wrap this in a callback because the pending battle cache isn't populated
                -- when the character is created and we can't just blanket kill the colonels because
                -- it breaks some quest battles
                cm:callback(function()
                    Custom_Log("In colonel callback");
                    if character:has_military_force() == true and (cm:pending_battle_cache_char_is_attacker(character) == true or cm:pending_battle_cache_char_is_defender(character) == true) then
                        Custom_Log("Ignoring character because they are taking part in a battle");
                    else
                        Custom_Log("Killing colonel for faction "..character:faction():name().." "..character:character_subtype_key());
                        cm:kill_character(character:cqi(), true, true);
                    end
                    Custom_Log_Finished();
                end, 0);
                Custom_Log_Finished();
            else
                crp:ProcessNewCharacter(character);
            end
        end,
        true
    );
end

function CRP_GetGeneralCandidates(humanFaction, generalsList, lordsInPool, hideDefault)
    Custom_Log("Get general candidates");
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
        Custom_Log("There are "..generalsList:ChildCount().." in the list");
        -- Get the localised strings of the defaults lords so we know who to hide if they aren't tracked
        local defaultLordKeysForFaction = GetDefaultLordForFaction(humanFaction);
        local localisedDefaultLordsForFaction = {};
        if defaultLordKeysForFaction ~= nil then
            for index, defaultLordKey in pairs(defaultLordKeysForFaction) do
                local localisedDefaultLord = effect.get_localised_string("agent_subtypes_onscreen_name_override_"..defaultLordKey);
                Custom_Log("Default lord is "..localisedDefaultLord);
                localisedDefaultLordsForFaction[localisedDefaultLord] = true;
            end
        else
            Custom_Log("Missing default lord keys");
        end
        -- This keeps track of what character types should be hidden because they are replaceable. There could be overlap with the default lords.
        local arePresentSubTypesReplaceable = {};
        local numGenerals = generalsList:ChildCount() - 1 ;
        for i = 0, numGenerals  do
            local generalPanel = UIComponent(generalsList:Find(i));

            local nameComponent = find_uicomponent(generalPanel, "dy_name");
            local nameText = nameComponent:GetStateText();
            local keyName = "";
            keyName = CreateValidLuaTableKey(nameText);
            Custom_Log("Key is "..keyName);
            local subType = find_uicomponent(generalPanel, "dy_subtype"):GetStateText();
            Custom_Log("Subtype text is "..subType);

            local poolData = nil;
            if lordsInPool[humanFactionName] == nil then
                Custom_Log("No lords for human faction");
            elseif lordsInPool[humanFactionName][keyName] ~= nil then
                poolData = lordsInPool[humanFactionName][keyName];
            elseif subType ~= "Legendary Lord" then
                for characterKey, characterData in pairs(lordsInPool[humanFactionName]) do
                    --Custom_Log("Checking nameText "..nameText.." and character data name "..characterData.Name);
                    if (string.match(nameText, characterData.Name) or string.match(characterData.Name, nameText)) and characterData.Name ~= nameText then
                        --Custom_Log("Found partial match with nameText "..nameText.." and character data name "..characterData.Name);
                        -- We need to update the key and the name
                        local remappedLord = {
                            ArtSetId = characterData.ArtSetId,
                            HomeRegion = characterData.HomeRegion,
                            InnateTrait = characterData.InnateTrait,
                            Name = nameText,
                            SocialClass = characterData.SocialClass,
                            SubType = characterData.SubType,
                            RemoveImmortality = characterData.RemoveImmortality,
                            IsRecruited = characterData.IsRecruited,
                        };
                        crp.CRPLordsInPools[humanFactionName][characterKey] = nil;
                        crp.CRPLordsInPools[humanFactionName][keyName] = remappedLord;
                        poolData = remappedLord;
                        break;
                    end
                end
            end
            Custom_Log("Finished trying to find data");

            -- If the character isn't tracked, see if it is a replacement type
            -- If it is, hide these characters from the player
            if poolData == nil then
                Custom_Log("No pool data found");
                if localisedDefaultLordsForFaction[subType] == true then
                    HideGeneralPanel(generalPanel, hideDefault);
                else
                    local replacementLords = GetReplacementLordsForFaction(humanFaction);
                    if replacementLords ~= nil then
                        Custom_Log("Got replacement lords");
                        if arePresentSubTypesReplaceable[subType] == nil then
                            local replacementSubTypeKeys = GetKeysFromTable(replacementLords);
                            local subTypeKey = GetMatchingKeyMatchingLocalisedString(replacementSubTypeKeys, subType, "agent_subtypes_onscreen_name_override_");
                            if subTypeKey ~= nil then
                                arePresentSubTypesReplaceable[subType] = true;
                                HideGeneralPanel(generalPanel, hideDefault);
                            else
                                arePresentSubTypesReplaceable[subType] = false;
                                if charIsSelected == false and humanFactionSubculture ~= "wh2_main_sc_hef_high_elves" then
                                    generalPanel:SimulateLClick();
                                    charIsSelected = true;
                                end
                            end
                        elseif arePresentSubTypesReplaceable[subType] == true then
                            HideGeneralPanel(generalPanel, hideDefault);
                        else
                            Custom_Log("Untracked but valid character, adding details button");
                            crp.UIController:SetupCharacterDetailsButton(generalPanel, nameComponent, poolData);
                            if charIsSelected == false and humanFactionSubculture ~= "wh2_main_sc_hef_high_elves" then
                                generalPanel:SimulateLClick();
                                charIsSelected = true;
                            end
                        end
                    else
                        Custom_Log("Untracked but valid character, adding details button");
                        crp.UIController:SetupCharacterDetailsButton(generalPanel, nameComponent, poolData);
                        if charIsSelected == false and humanFactionSubculture ~= "wh2_main_sc_hef_high_elves" then
                            generalPanel:SimulateLClick();
                            charIsSelected = true;
                        end
                    end
                end
            else
                Custom_Log("Tracked character, adding details button");
                crp.UIController:SetupCharacterDetailsButton(generalPanel, nameComponent, poolData);
                if charIsSelected == false and humanFactionSubculture ~= "wh2_main_sc_hef_high_elves" then
                    generalPanel:SimulateLClick();
                    charIsSelected = true;
                end
            end

            if humanFactionSubculture == "wh2_main_sc_hef_high_elves" then
                Custom_Log("Human is high elves");
                local intrigueCostContainer = find_uicomponent(generalPanel, "IntrigueCost");
                if intrigueCostContainer ~= nil then
                    local intrigueCost = find_uicomponent(intrigueCostContainer, "Cost");
                    if intrigueCost ~= nil then
                        Custom_Log("Checking "..keyName);
                        if poolData then
                            if (poolData.SubType == "wh2_main_hef_prince_mid" or poolData.SubType == "wh2_main_hef_princess_mid")
                            and poolData.IsRecruited == false then
                                Custom_Log("Lord is mid prince or princess");
                                intrigueCost:SetStateText("15");
                                intrigueCostContainer:SetVisible(true);
                                if factionIntrigue < 15 then
                                    generalPanel:SetState("inactive");
                                elseif charIsSelected == false then
                                    generalPanel:SimulateLClick();
                                    charIsSelected = true;
                                end
                            elseif (poolData.SubType == "wh2_main_hef_prince_high" or poolData.SubType == "wh2_main_hef_princess_high")
                            and poolData.IsRecruited == false then
                                Custom_Log("Lord is high prince or princess");
                                intrigueCost:SetStateText("60");
                                intrigueCostContainer:SetVisible(true);
                                if factionIntrigue < 60 then
                                    generalPanel:SetState("inactive");
                                elseif charIsSelected == false then
                                    generalPanel:SimulateLClick();
                                    charIsSelected = true;
                                end
                            elseif charIsSelected == false then
                                Custom_Log("Setting lord as selected "..keyName);
                                intrigueCostContainer:SetVisible(false);
                                generalPanel:SimulateLClick();
                                charIsSelected = true;
                            end
                        end
                    else
                        Custom_Log("Intrigue cost is nil");
                    end
                else
                    Custom_Log("Intrigue container is nil");
                end
            end
        end

        if charIsSelected == false then
            Custom_Log("No character can be recruited");
            local raiseForcesButton = find_uicomponent(core:get_ui_root(), "character_panel", "raise_forces_options", "button_raise");
            raiseForcesButton:SetState("inactive");
            local unitInfoPopup = find_uicomponent(core:get_ui_root(), "UnitInfoPopup");
            unitInfoPopup:SetVisible(false);
        end
    else
        Custom_Log("There are no generals in the list");
    end
end

function HideGeneralPanel(generalPanel, hideDefault)
    if hideDefault == true then
        generalPanel:SetState("deselected");
        generalPanel:SetVisible(false);
    end
end