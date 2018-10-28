crp = {};
_G.crp = crp;

function controlled_recruitment_pools()
    out("CRP: Init");
    Custom_Log("Mod Init function");
    crp = ControlledRecruitmentPools:new({
        HumanFaction = {},
        DefaultXCoordinate = 0,
        DefaultYCoordinate = 0,
        -- If this is a new game crp.CRPLordsInPools will be nil
        -- Otherwise it should be populated from the loading callback
        CRPLordsInPools = crp.CRPLordsInPools,
    });
    crp:Initialise();

    if cm:is_new_game()  then
        Custom_Log("New Game");
        -- Clear existing generals
        crp:FactionStartup();
    else
        Custom_Log("Existing game");
        if #crp.CRPLordsInPools > 0 then
            Custom_Log("Loaded lord data");
        end
    end

    SetupListeners(crp.CRPLordsInPools);
    Custom_Log_Finished();
    out("CRP: Finished");
end

cm:add_saving_game_callback(
    function(context)
        Custom_Log_Finished();
        Custom_Log("Saving Callback");
        local serialised_save_table_factions = {};
        local serialised_save_table_characters = {};
        for factionKey, factionLords in pairs(crp.CRPLordsInPools) do
            local characterKeysForFaction = {};
            --Custom_Log("Adding faction key: "..factionKey);
            for characterKey, characterData in pairs(factionLords) do
                --Custom_Log("Adding character key and character: "..characterKey.. " Innate Trait: "..characterData.InnateTrait);
                serialised_save_table_characters[characterKey] = {characterData.InnateTrait, characterData.SubType, characterData.ArtSetId};
                characterKeysForFaction[#characterKeysForFaction + 1] = characterKey;
            end
            --Custom_Log("Finished adding characters for faction: "..factionKey);
            serialised_save_table_factions[factionKey] = characterKeysForFaction;
        end
        cm:save_named_value("crp_lord_pools_faction", serialised_save_table_factions, context);
        cm:save_named_value("crp_lord_pools_characters", serialised_save_table_characters, context);
        Custom_Log("Finished saving");
        Custom_Log_Finished();
    end
);

cm:add_loading_game_callback(
    function(context)
        out("CRP: Loading callback");
        local serialised_save_table_factions = cm:load_named_value("crp_lord_pools_faction", {}, context);
        local serialised_save_table_characters = cm:load_named_value("crp_lord_pools_characters", {}, context);

        crp.CRPLordsInPools = {};
        for factionKey, factionData in pairs(serialised_save_table_factions) do
            crp.CRPLordsInPools[factionKey] = {};
            out("CRP: Loading faction "..factionKey);
            for index, characterKey in pairs(factionData) do
                local characterData = serialised_save_table_characters[characterKey];
                if characterData ~= nil and characterData ~= {} then
                    local mappedCharacter = {
                        InnateTrait = characterData[1],
                        SubType = characterData[2],
                        ArtSetId = characterData[3],
                    };
                    crp.CRPLordsInPools[factionKey][characterKey] = mappedCharacter;
                else
                    out("CRP: Character data not found for "..characterKey);
                end
            end
        end
        out("CRP: Finished loading");
	end
);