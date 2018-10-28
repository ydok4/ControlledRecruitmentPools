crp = _G.crp;

function SetupListeners(lordsInPool)
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

    core:add_listener(
        "CRP_CharacterCreated",
        "CharacterCreated",
        true,
        function(context)
            local char = context:character();
            local factionName = char:faction():name();
            local localisedForeName = effect.get_localised_string(char:get_forename());
            local localisedSurname = effect.get_localised_string(char:get_surname());

            local keyName = localisedForeName..localisedSurname;
            -- This removes any spaces within names, eg the surname "Von Carstein";
            -- Otherwise the key is invalid and the character won't be tracked
            keyName = keyName:gsub("%s+", "");

            if lordsInPool[factionName] ~= nil then
                if lordsInPool[factionName][keyName] ~= nil then
                    Custom_Log("Character is in pool");
                    -- If the character is tracked in the pool
                    local poolData = lordsInPool[factionName][keyName];
                    -- Add their trait
                    cm:force_add_trait("character_cqi:"..char:cqi(), poolData.InnateTrait, true);
                    -- Then remove from the pool
                    lordsInPool[factionName][keyName] = nil;

                    -- Note: Removal is necessary since we now track the character from the faction's character_list
                end
            end
        end,
        true
    );
end

