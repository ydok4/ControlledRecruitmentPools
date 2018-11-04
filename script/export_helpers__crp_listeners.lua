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
        end,
        true
    );

    -- Handles the basic faction lord replenishment
    core:add_listener(
        "UpdateRecruitmentPool",
        "FactionTurnStart",
        function(context)
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
            --Custom_Log("Character Created Listener");
            local char = context:character();
            local factionName = char:faction():name();
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

            if lordsInPool[factionName] ~= nil then
                --Custom_Log("Character key: "..keyName.."end");
                if lordsInPool[factionName][keyName] ~= nil then
                    --Custom_Log("Character is in pool for faction: "..factionName);
                    -- If the character is tracked in the pool
                    local poolData = lordsInPool[factionName][keyName];
                    --Custom_Log("Adding trait: "..poolData.InnateTrait.." for character: "..keyName);
                    cm:disable_event_feed_events(true, "wh_event_category_traits_ancillaries", "", "");
                    -- Add their trait
                    cm:force_add_trait("character_cqi:"..char:cqi(), poolData.InnateTrait, true);
                    -- Then remove from the pool
                    lordsInPool[factionName][keyName] = nil;
                    cm:callback(function() cm:disable_event_feed_events(false, "wh_event_category_traits_ancillaries", "", "") end, 1);
                    -- Note: Removal is necessary since we now track the character from the faction's character_list
                end
            end
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
function PendingBattleResult(humanFactionName, canContainHuman)
    Custom_Log("CRP: Battle has been fought");

    local num_attackers = cm:pending_battle_cache_num_attackers();
    local attackers = {};

    for i = 1, num_attackers do
        local attacker_cqi, attacker_force_cqi, attacker_faction_name = cm:pending_battle_cache_get_attacker(i);
        Custom_Log("CRP: attacker faction name "..attacker_faction_name);
        if canContainHuman == false and humanFactionName == attacker_faction_name then
            Custom_Log("CRP: Attacker is human and must exit");
            return;
        end
        attackers[tostring(attacker_force_cqi)] = attacker_cqi;
    end
    Custom_Log("CRP: Got attackers");
    local num_defenders = cm:pending_battle_cache_num_defenders();
    local defenders = {};
    for i = 1, num_defenders do
        local defender_cqi, defender_force_cqi, defender_faction_name = cm:pending_battle_cache_get_defender(i);
        Custom_Log("CRP: attacker faction name "..defender_faction_name);
        if canContainHuman == false and humanFactionName == defender_faction_name then
            Custom_Log("CRP: Defender is human and must exit");
            return;
        end
        defenders[tostring(defender_force_cqi)] = defender_cqi;
    end
    Custom_Log("CRP: Got defenders");
    Custom_Log_Finished();
    ProcessBattleCacheData(attackers, "attackers");
    ProcessBattleCacheData(defenders, "defenders");
    Custom_Log_Finished();
end

function ProcessBattleCacheData(cachedBattleData, type)
    for force_cqi, char_cqi in pairs(cachedBattleData) do
        Custom_Log("CRP: Getting character: "..char_cqi);
        local character = nil;

        if char_cqi ~= nil then
            character = cm:get_character_by_cqi(char_cqi);
        end
        if not character or character:is_null_interface() or character:is_wounded() then
            Custom_Log("CRP: "..type.." is dead/wounded");
            local militaryForce = cm:get_military_force_by_cqi(force_cqi);
            if militaryForce ~= false then
                Custom_Log("CRP: Found military force")
                local general = militaryForce:general_character();
                if general:is_null_interface() == false then
                    Custom_Log("CRP: Setting "..general:cqi().." with new artset");
                    local factionName = general:faction();
                    -- Add a new character to replace the dead character
                    crp:UpdateRecruitmentPool(factionName, 1);
                    -- Then find an art set for the faction and set the temporary lord as that
                    local artSetId = crp:GetValidAgentArtSetForFaction(general:faction());
                    cm:add_unit_model_overrides(cm:char_lookup_str(general:cqi()), artSetId);
                else
                    Custom_Log("CRP: General is null interface");
                end
            else
                Custom_Log("CRP: Military force was wiped Custom_Log");
            end
        elseif character:has_military_force() and character:military_force():is_armed_citizenry() == false and cm:char_is_agent(character) == false then
            Custom_Log("CRP: Character is still alive");
        elseif character:has_military_force() == false and character:military_force():is_armed_citizenry() == false and cm:char_is_agent(character) == false then
            Custom_Log("CRP: "..type.." does not have military force");
        else
            Custom_Log("CRP: Other");
        end
    end

    Custom_Log("CRP: Finished "..type);
end