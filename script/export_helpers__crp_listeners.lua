crp = _G.crp;

function SetupListeners(lordsInPool)
    out("CRP: SetupListeners");

    -- Clears the log file on human faction turn end
    core:add_listener(
        "ClearLog",
        "FactionTurnEnd",
        function(context)
            return crp.HumanFaction:name() == context:faction():name();
        end,
        function(context)
            Custom_Log_Start();
            out("CRP: Human turn end");
            local turnNumber = cm:turn_number();
            Custom_Log("Ending turn "..turnNumber);
            if turnNumber == 1 then
                if crp.HumanFaction:subculture() == "wh_dlc05_sc_wef_wood_elves" then
                    Custom_Log("Human is wood elves");
                    AssignGeneralsToForBeastmenInvasion();
                elseif crp.HumanFaction:subculture() == "wh_main_sc_nor_norsca" then
                    --Custom_Log("Human is norsca");
                    --AssignGeneralsToForNorscaInvasion();
                end
            end
            Custom_Log_Finished();
        end,
        true
    );

    -- Handles the basic faction lord replenishment
    core:add_listener(
        "UpdateRecruitmentPool",
        "FactionTurnEnd",
        function(context)
            Custom_Log_Finished();
            Custom_Log("Checking faction: "..tostring(context:faction():name()));
            return crp:IsSupportedSubCulture(context:faction():subculture()) or crp:IsRogueArmy(context:faction():name());
        end,
        function(context)
            if context:faction():subculture() == "rebels" then
                Custom_Log("Updating rebels");
            else
                crp:UpdateRecruitmentPool(context:faction(), 1);
            end
            Custom_Log_Finished();
        end,
        true
    );

    -- Performs post character created/recruited functionality
    -- like adding traits
    core:add_listener(
        "CRP_CharacterCreated",
        "CharacterCreated",
        true,
        function(context)
            local char = context:character();
            local factionName = char:faction():name();
            Custom_Log("Character Created Listener "..factionName);

            if lordsInPool[factionName] ~= nil then
                local localisedForeName = effect.get_localised_string(char:get_forename());
                local localisedSurname = "";
                local surnameKey =  char:get_surname();
                if surnameKey ~= nil and surnameKey ~= "" then
                    localisedSurname = effect.get_localised_string(char:get_surname());
                end
                local keyName = localisedForeName..localisedSurname;
                -- This removes any spaces within names, eg the surname "Von Carstein";
                -- Otherwise the key is invalid and the character won't be tracked
                keyName = keyName:gsub("%s+", "");
                keyName = keyName:gsub("'", "_");
                keyName = keyName:gsub("-", "_");
                keyName = keyName:gsub("é", "e");
                keyName = keyName:gsub("‘", "_");
                keyName = keyName:gsub(",", "_");
                --Custom_Log("Character key: "..keyName.."end");
                if lordsInPool[factionName][keyName] ~= nil then
                    --Custom_Log("Character is in pool for faction: "..factionName);
                    -- If the character is tracked in the pool
                    local poolData = lordsInPool[factionName][keyName];
                    local subCulture = char:faction():subculture();
                    if poolData then
                        if subCulture == "wh2_main_sc_def_dark_elves" or subCulture == "wh2_main_sc_skv_skaven" then
                            --Custom_Log("Found skaven or dark elves");
                            --crp:ReplaceCharacter(char:faction(), char, poolData.SubType, poolData.ArtSetId, poolData.InnateTrait);
                            --Custom_Log("Finished replacing general");
                            --cm:remove_all_units_from_general(char);
                            --Custom_Log("Increased loyalty");
                        else
                            --Custom_Log("Adding trait: "..poolData.InnateTrait.." for character: "..keyName);
                            cm:disable_event_feed_events(true, "wh_event_category_traits_ancillaries", "", "");
                            -- Add their trait
                            --cm:force_add_trait("character_cqi:"..char:cqi(), poolData.InnateTrait, true);
                            -- Then remove from the pool
                            lordsInPool[factionName][keyName] = nil;
                            --cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_traits_ancillaries", "", "") end, 1);
                            -- Note: Removal is necessary since we now track the character from the faction's character_list

                            if subCulture == "wh2_main_sc_hef_high_elves" and factionName == crp.HumanFaction:name() then
                                Custom_Log("High elf character recruited listener");
                                if poolData.SubType == "wh2_main_hef_prince_mid" or poolData.SubType == "wh2_main_hef_princess_mid" then
                                    cm:suppress_all_event_feed_messages(true);
                                    cm:trigger_incident(factionName, "wh2_main_hef_mid_lord_influence_cost", true);
                                    cm:suppress_all_event_feed_messages(false);
                                    Custom_Log("Lord is mid prince or princess");
                                elseif poolData.SubType == "wh2_main_hef_prince_high"or poolData.SubType == "wh2_main_hef_princess_high" then
                                    cm:suppress_all_event_feed_messages(true);
                                    cm:trigger_incident(factionName, "wh2_main_hef_high_lord_influence_cost", true);
                                    cm:suppress_all_event_feed_messages(false);
                                    Custom_Log("Lord is high prince or princess");
                                end
                            end
                        end
                    else
                        Custom_Log("Character is not in pool");
                    end
                end
            elseif char:character_subtype_key() == "vmp_lord_replacement" then
                local faction = char:faction();
                Custom_Log("Character is a vampire replacement");
                crp:UpdateRecruitmentPool(faction, 1);
                crp:ReplaceAnyVampireLordReplacementsInFaction(faction);
            end
           Custom_Log("Finished Character created listener");
        end,
        true
    );

    -- Handles character pool updates and the setting of general art sets
    -- after battle is completed for battles ONLY containing ai
    -- There is another listener for battles involving humans inside
    -- controlled_recruitment_pools.lua which listens for a UI panel
    core:add_listener(
        "BattleCompletedListener",
        "BattleCompleted",
        function(context)
            return cm:model():pending_battle():has_been_fought();
        end,
        function(context)
            out("CRP: BattleCompletedListener");
            cm:callback(function() PendingBattleResult(crp.HumanFaction:name(), false) end, 0);
        end,
        true
    );
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
                local generalCQI = general:cqi();
                if general:is_null_interface() == false and char_cqi ~= generalCQI then
                    local generalSubType = general:character_subtype_key();
                    Custom_Log("Current general type is "..generalSubType);
                    if generalSubType == "vmp_lord_replacement" then
                        local preBattleSubTypeForCharacter = crp:GetPreBattleSubTypeForCharacter(char_cqi, type);
                        Custom_Log("Got pre battle sub type "..preBattleSubTypeForCharacter);
                        local artSetId = crp:GetArtSetForSubType(preBattleSubTypeForCharacter);
                        Custom_Log("Setting character with art set id "..artSetId);
                        cm:add_unit_model_overrides(cm:char_lookup_str(generalCQI), artSetId);
                    else
                        Custom_Log("CRP: Setting "..generalCQI.." with new artset");
                        local generalFaction = general:faction();
                        local generalFactionName = generalFaction:name();
                        Custom_Log("General faction "..generalFactionName);
                        if crp:IsSupportedSubCulture(general:faction():subculture()) or crp:IsRogueArmy(generalFactionName) then
                            crp:UpdateRecruitmentPool(generalFaction, 1);
                        end
                        -- Then find an art set for the faction and set the temporary lord as that
                        local artSetId = crp:GetValidAgentArtSetForFaction(generalFaction);
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
                    local artSetId = crp:GetValidAgentArtSetForFaction(character:faction());
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
    if not isPreBattle then
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
    local generatedName = crp:GetCharacterNameForSubculture(faction, agentSubType);
    Custom_Log("Got name for invasion general");
    local invasion_object = invasion_manager:get_invasion(invasionKey);
    Custom_Log("Got invasion object maybe");
    if invasion_object ~= nil then
        invasion_object:create_general(false, agentSubType, generatedName.forename, generatedName.clan_name, "", "");
        --invasion_object:assign_general(char:cqi());
        Custom_Log("Assigned general to "..invasionKey);
    end

end