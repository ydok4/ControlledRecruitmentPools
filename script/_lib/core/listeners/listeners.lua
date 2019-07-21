local crp = nil;

require 'script/_lib/core/listeners/poolmodifierlisteners';

Custom_Log("Loading Listeners");
function InitialiseListenerData()
    out("CRP: SetupListeners");
    Custom_Log("InitialiseListenerData");
    InitialisePoolModifier();
    Custom_Log_Finished();
end

function SetupPostUIListeners(crpObject)
    Custom_Log("Initialising post UI listeners");
    if not core then
        Custom_Log("Error: core is not defined");
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
                GetGeneralCandidates(crp.HumanFaction, generalsList, crp.CRPLordsInPools, false);
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
                local generalsList = find_uicomponent(core:get_ui_root(), "character_panel", "general_selection_panel", "character_list_parent", "character_list", "listview", "list_clip", "list_box");
                GetGeneralCandidates(crp.HumanFaction, generalsList, crp.CRPLordsInPools);
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
                GetGeneralCandidates(crp.HumanFaction, generalsList, crp.CRPLordsInPools);
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
                --cm:apply_effect_bundle_to_characters_force("increase_recruitment_cost", character:cqi(), 0, true);
                --Custom_Log("Finished char created listener");
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

    PoolModifierListeners(crpObject);
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
            --cm:apply_effect_bundle_to_characters_force("increase_recruitment_cost", character:cqi(), 0, true);
            --Custom_Log("Finished char created listener");
        end,
        true
    );
end

function GetGeneralCandidates(humanFaction, generalsList, lordsInPool, hideDefault)
    if hideDefault == nil then
        hideDefault = true;
    end
    Custom_Log("Get general candidates");
    local humanFactionName = humanFaction:name();
    local humanFactionSubculture = humanFaction:subculture();

    local factionIntrigue = 0;
    local charIsSelected = false;
    if humanFactionSubculture == "wh2_main_sc_hef_high_elves" then
        --cm:trigger_incident(humanFactionName, "wh2_main_hef_add_influence", true);
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
                        --[[for replacementSubType, replacementData in pairs(replacementLords) do
                            Custom_Log("Replacement type is "..replacementSubType);
                            if arePresentSubTypesReplaceable[replacementSubType] == true or (arePresentSubTypesReplaceable[replacementSubType] == nil and subType == effect.get_localised_string("agent_subtypes_onscreen_name_override_"..replacementSubType)) then
                                generalPanel:SetState("deselected");
                                generalPanel:SetVisible(false);
                                arePresentSubTypesReplaceable[replacementSubType] = true;
                                Custom_Log("Hiding character "..keyName);
                            else
                                arePresentSubTypesReplaceable[replacementSubType] = false;
                                Custom_Log("Untracked but valid character, adding details button");
                                crp.UIController:SetupCharacterDetailsButton(generalPanel, nameComponent, poolData);
                            end
                        end--]]
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
            --[[for j = 0, generalPanel:ChildCount() - 1  do
                local child = UIComponent(generalPanel:Find(j));
                Custom_Log("generalPanel ID "..child:Id());
                for k = 0, child:ChildCount() - 1  do
                    local subChild = UIComponent(child:Find(k));
                    Custom_Log("Sub child Id: "..subChild:Id());
                    --Custom_Log(subChild:GetTooltipText());
                end
            end--]]
            local skillIcon = find_uicomponent(generalPanel, "icon_background_skill");
            --[[if lordsInPool[humanFactionName] ~= nil then
                Custom_Log("Checking Key: "..keyName);
                if lordsInPool[humanFactionName][keyName] ~= nil then
                    local poolData = lordsInPool[humanFactionName][keyName];
                    Custom_Log("General Found In List "..keyName);
                    local traitKey = poolData.InnateTrait;
                    Custom_Log("Trait Key: "..traitKey);
                    local traitName = self:BuildTraitNameString(traitKey);
                    --Custom_Log("Trait Name: "..traitName);
                    local traitDescription = self:BuildTraitLocString(traitKey, traitName);
                    --Custom_Log("Built trait description");
                    local traitImagePath = self:GetImagePathForTrait(traitKey);
                    --Custom_Log("trait image path: "..traitImagePath);
                    --Custom_Log("TraitName: "..traitName);
                    skillIcon:SetStateText(traitName);
                    skillIcon:SetTooltipText(traitDescription);
                    skillIcon:SetImage(traitImagePath);
                    skillIcon:SetVisible(true);
                end
            else
                Custom_Log("Human subculture has no data "..humanFactionName);
            end

            local toolTipText = skillIcon:GetTooltipText();--]]
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

-- This should only run if the battle contains the human faction
function PendingBattleResult(humanFactionName, canContainHuman, isPreBattle)
    if isPreBattle then
        Custom_Log("CRP: Battle is about to begin");
    else
        Custom_Log("CRP: Battle has been fought");
    end

    local num_defenders = cm:pending_battle_cache_num_defenders();
    local defenders = {};
    for i = 1, num_defenders do
        local defender_cqi, defender_force_cqi, defender_faction_name = cm:pending_battle_cache_get_defender(i);
        Custom_Log("CRP: defender faction name "..defender_faction_name);
        if canContainHuman == false and humanFactionName == defender_faction_name then
            Custom_Log("CRP: Defender is human and must exit");
            Custom_Log_Finished();
            return;
        end
        local defender_sub_type = "";

        if defender_cqi ~= nil then
            local character = cm:model():character_for_command_queue_index(defender_cqi);
            if character and not character:is_null_interface() then
                defender_sub_type = character:character_subtype_key();
            end
        end

        defenders[tostring(defender_force_cqi)] = {
            character_cqi = defender_cqi,
            character_faction_name = defender_faction_name,
            character_sub_type = defender_sub_type,
        };
    end
    Custom_Log("CRP: Got defenders");
    ProcessBattleCacheData(defenders, "defenders", isPreBattle);
    if isPreBattle then
        Custom_Log("Adding prebattle data defenders");
        crp:AddPreBattleData(defenders, "defenders");
    end
    Custom_Log_Finished();

    local num_attackers = cm:pending_battle_cache_num_attackers();
    local attackers = {};

    for i = 1, num_attackers do
        local attacker_cqi, attacker_force_cqi, attacker_faction_name = cm:pending_battle_cache_get_attacker(i);
        Custom_Log("CRP: attacker faction name "..attacker_faction_name);
        if canContainHuman == false and humanFactionName == attacker_faction_name then
            Custom_Log("CRP: Attacker is human and must exit");
            return;
        end
        local attacker_sub_type = "";
        if attacker_cqi ~= nil then
            local character = cm:model():character_for_command_queue_index(attacker_cqi);
            if character and not character:is_null_interface() then
                attacker_sub_type = character:character_subtype_key();
            end
        end
        attackers[tostring(attacker_force_cqi)] = {
            character_cqi = attacker_cqi,
            character_faction_name = attacker_faction_name,
            character_sub_type = attacker_sub_type,
        };
    end

    Custom_Log("CRP: Got attackers");
    ProcessBattleCacheData(attackers, "attackers", isPreBattle);
    if isPreBattle then
        Custom_Log("Adding prebattle data attackers");
        crp:AddPreBattleData(attackers, "attackers");
    end
    Custom_Log_Finished();
end

function ProcessBattleCacheData(cachedBattleData, type, isPreBattle)
    for force_cqi, characterData in pairs(cachedBattleData) do
        local char_cqi = characterData.character_cqi;
        Custom_Log("CRP: Getting character cqi: "..char_cqi);
        local character = nil;

        if char_cqi ~= nil then
            character = cm:model():character_for_command_queue_index(char_cqi);
        end

        if not character or character:is_null_interface() or character:is_wounded() then
            Custom_Log("CRP: "..type.." is dead/wounded");
            local militaryForce = cm:get_military_force_by_cqi(force_cqi);
            if militaryForce ~= false then
                Custom_Log("CRP: Found military force");
                local general = militaryForce:general_character();
                local generalFaction = general:faction();
                local generalCQI = general:cqi();
                if general:is_null_interface() == false and char_cqi ~= generalCQI then
                    local generalSubType = general:character_subtype_key();
                    if generalSubType == "vmp_lord_replacement" and (general:faction():name() == "rebels" or crp:IsExcludedFaction(generalFaction) == true) then
                        local preBattleSubTypeForCharacter = crp:GetPreBattleSubTypeForCharacter(char_cqi, type);
                        Custom_Log("Got pre battle sub type "..preBattleSubTypeForCharacter);
                        local artSetId = crp:GetArtSetForSubType(preBattleSubTypeForCharacter);
                        Custom_Log("Setting character with art set id "..artSetId);
                        cm:add_unit_model_overrides(cm:char_lookup_str(generalCQI), artSetId);
                    else
                        Custom_Log("CRP: Setting "..generalCQI.." with new artset");
                        local generalFactionName = generalFaction:name();
                        Custom_Log("General faction "..generalFactionName);
                        if crp:IsSupportedSubCulture(generalFaction:subculture()) or crp:IsRogueArmy(generalFactionName) then
                            Custom_Log("Found supported faction");
                            if crp:IsThereACharacterInPool(generalFaction) == false then
                                Custom_Log("No more characters in the pool");
                                crp:UpdateRecruitmentPool(generalFaction, 1, true);
                                Custom_Log("Updated recruitment pool");
                            else
                                Custom_Log("There are already characters in the pool, no need to generate a new one");
                            end
                        end
                        -- Then find an art set for the faction and set the temporary lord as that
                        local artSetId = crp.CharacterGenerator:GetValidAgentArtSetForFaction(generalFaction);
                        Custom_Log("Setting character with art set id "..artSetId);
                        cm:add_unit_model_overrides(cm:char_lookup_str(generalCQI), artSetId);
                    end
                else
                    Custom_Log("CRP: General is null interface");
                end
            else
                Custom_Log("CRP: Military force was wiped out");
            end
        elseif character:has_military_force() and character:military_force():is_armed_citizenry() == false and cm:char_is_agent(character) == false then
            if character:character_subtype_key() == "vmp_lord_replacement" then
                Custom_Log("Living character is vmp lord replacement");
                local factionName = character:faction():name();
                Custom_Log("Got character faction");
                if string.match(factionName, "qb") then
                    Custom_Log("Quest battle faction has vampire lord");
                    local artSetId = crp.CharacterGenerator:GetValidAgentArtSetForFaction(character:faction());
                    Custom_Log("Setting character with art set id "..artSetId);
                    cm:add_unit_model_overrides(cm:char_lookup_str(character:cqi()), artSetId);
                else
                    Custom_Log("But they are not a qb faction");
                end
            end
            Custom_Log("CRP: Character is still alive");
        elseif character:has_military_force() == false and character:military_force():is_armed_citizenry() == false and cm:char_is_agent(character) == false then
            Custom_Log("CRP: "..type.." does not have military force");
        else
            Custom_Log("CRP: Other");
        end
    end
    if not isPreBattle and crp.PreBattleData[type] ~= nil then
        Custom_Log("Clearing pre battle data");
        crp.PreBattleData[type] = nil;
    end
    Custom_Log("CRP: Finished "..type);
end

function AssignGeneralsToForBeastmenInvasion()
    Custom_Log("Assigning generals for beastmen invasion");
    local beastmen_faction = cm:get_faction("wh_dlc03_bst_beastmen");
    Custom_Log("Got beastmen faction");
    AssignNewCharacterAsInvasionGeneral(beastmen_faction, "beastmen_force_raid", "dlc03_bst_beastlord");
    AssignNewCharacterAsInvasionGeneral(beastmen_faction, "beastmen_force_easy", "dlc03_bst_beastlord");
    AssignNewCharacterAsInvasionGeneral(beastmen_faction, "beastmen_force_normal", "dlc03_bst_beastlord");
    AssignNewCharacterAsInvasionGeneral(beastmen_faction, "beastmen_force_hard", "dlc03_bst_beastlord");
end

function AssignGeneralsToForNorscaInvasion()
    Custom_Log("Assigning generals for norsca invasion");
    local norsca_chaos_invasion_faction = cm:get_faction("wh_main_chs_chaos");
    AssignNewCharacterAsInvasionGeneral(norsca_chaos_invasion_faction, "NCI_extra", "dlc07_chs_sorcerer_lord_shadow", 1);
end

function AssignNewCharacterAsInvasionGeneral(faction, invasionKey, agentSubType)
    local factionName = faction:name();
    Custom_Log("Got faction");
    local generatedName = crp.CharacterGenerator:GetCharacterNameForSubculture(faction, agentSubType);
    Custom_Log("Got name for invasion general");
    local invasion_object = invasion_manager:get_invasion(invasionKey);
    Custom_Log("Got invasion object maybe");
    if invasion_object ~= nil then
        invasion_object:create_general(false, agentSubType, generatedName.forename, generatedName.clan_name, "", "");
        --invasion_object:assign_general(char:cqi());
        Custom_Log("Assigned general to "..invasionKey);
    end

end