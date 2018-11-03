crp = {};
_G.crp = crp;

local MAX_NUM_SAVE_TABLE_KEYS = 400;

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
        local crp_lord_pools_header = {};
        local serialised_save_table_factions = {};
        local serialised_save_table_characters = {};

        local characterCount = 0;
        local tableCount = 1;
        local nthTable = {};
        nthTable[tableCount] = {};
        for factionKey, factionLords in pairs(crp.CRPLordsInPools) do
            local characterKeysForFaction = {};
            --Custom_Log("Adding faction key: "..factionKey);
            for characterKey, characterData in pairs(factionLords) do
                characterCount = characterCount + 1;
                --Custom_Log("Adding character key and character: "..characterKey.. " Innate Trait: "..characterData.InnateTrait);
                nthTable[tableCount][factionKey..characterKey] = {characterData.InnateTrait, characterData.SubType, characterData.ArtSetId};
                if characterCount % MAX_NUM_SAVE_TABLE_KEYS == 0 then
                    Custom_Log("Saving table "..tostring(tableCount));
                    cm:save_named_value("crp_lord_pools_characters_"..tableCount, nthTable, context);
                    tableCount = tableCount + 1;
                    nthTable[tableCount] = {};
                end
                characterKeysForFaction[#characterKeysForFaction + 1] = characterKey;
            end
            --Custom_Log("Finished adding characters for faction: "..factionKey);
            serialised_save_table_factions[factionKey] = characterKeysForFaction;
        end
        Custom_Log("Saving "..tostring(characterCount).." total characters");
        Custom_Log("Saving table"..tostring(tableCount));
        crp_lord_pools_header["TotalCharacters"] = characterCount;
        cm:save_named_value("crp_lord_pools_header", crp_lord_pools_header, context);
        cm:save_named_value("crp_lord_pools_faction", serialised_save_table_factions, context);
        cm:save_named_value("crp_lord_pools_characters_"..tableCount, nthTable, context);
        Custom_Log("Finished saving");
        Custom_Log_Finished();
    end
);

function ConcatTableWithKeys(destinationTable, sourceTable)
    for key, value in pairs(sourceTable) do
        destinationTable[key] = value;
    end
end

cm:add_loading_game_callback(
    function(context)
        out("CRP: Loading callback");
        local crp_lord_pools_header = cm:load_named_value("crp_lord_pools_header", {}, context);
        if crp_lord_pools_header["TotalCharacters"] == nil then
            out("CRP: No characters to load");
            return;
        end
        local serialised_save_table_factions = cm:load_named_value("crp_lord_pools_faction", {}, context);
        local serialised_save_table_characters = {};

        crp.CRPLordsInPools = {};
        local tableCount = math.ceil(crp_lord_pools_header["TotalCharacters"] / MAX_NUM_SAVE_TABLE_KEYS);
        out("CRP: Need to load "..tostring(tableCount).." tables");
        for n = 1, tableCount do
            out("CRP: Loading table "..tostring(n));
            local nthTable = cm:load_named_value("crp_lord_pools_characters_"..tostring(n), {}, context);
            ConcatTableWithKeys(serialised_save_table_characters, nthTable);
        end

        for factionKey, factionData in pairs(serialised_save_table_factions) do
            crp.CRPLordsInPools[factionKey] = {};
            out("CRP: Loading faction "..factionKey);
            for index, characterKey in pairs(factionData) do
                local characterData = serialised_save_table_characters[factionKey..characterKey];
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