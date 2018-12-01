crp = {};
_G.crp = crp;

require 'script/export_helpers__crp__datahelpers';

local MAX_NUM_SAVE_TABLE_KEYS = 400;

function controlled_recruitment_pools()
    Custom_Log_Start();
    out("CRP: Main mod function");
    crp = ControlledRecruitmentPools:new({
        HumanFaction = {},
        DefaultXCoordinate = 0,
        DefaultYCoordinate = 0,
        -- If this is a new game crp.CRPLordsInPools will be nil
        -- Otherwise it should be populated from the loading callback
        CRPLordsInPools = crp.CRPLordsInPools,
        PreBattleData = crp.PreBattleData,
    });
    crp:Initialise();
    if cm:is_new_game()  then
        Custom_Log("New Game");
        -- This callback is required so that startup happens after
        -- the game spawns any startup armies. This allows them to be replaced if required.
        cm:callback(function() crp:NewGameStartUp(); end, 1);
    else
        Custom_Log("Existing game");
        if #crp.CRPLordsInPools > 0 then
            Custom_Log("Loaded lord data");
        end
    end

    cm:callback(function() SetupListeners(crp.CRPLordsInPools); end, 1);
    Custom_Log_Finished();
    Custom_Log("CRP: Finished");
    out("CRP: Finished startup");
end

-- Saving/Loading Callbacks
-- These need to be outside of the Constructor function
-- because that is called by the game too late
cm:add_saving_game_callback(
    function(context)
        Custom_Log_Finished();
        Custom_Log("Saving callback");
        out("CRP: Saving callback");

        out("CRP: Saving pre-battle data");
        local preBattleAttackers = {};
        if crp.PreBattleData and crp.PreBattleData["attackers"] then
            for force_key, characterData in pairs(crp.PreBattleData["attackers"]) do
                if characterData then
                    preBattleAttackers[force_key] = { characterData.character_cqi, characterData.character_faction_name, characterData.character_sub_type };
                end
                out("CRP: Finished saving attacker "..force_key);
            end
        end
        cm:save_named_value("crp_pre_battle_attackers", preBattleAttackers, context);

        local preBattleDefenders = {};
        if crp.PreBattleData and crp.PreBattleData["defenders"] then
            for force_key, characterData in pairs(crp.PreBattleData["defenders"]) do
                if characterData then
                    preBattleDefenders[force_key] = { characterData.character_cqi, characterData.character_faction_name, characterData.character_sub_type };
                end
                out("CRP: Finished saving defender "..force_key);
            end
        end
        cm:save_named_value("crp_pre_battle_defenders", preBattleDefenders, context);

        out("CRP: Starting to save character data");
        local crp_lord_pools_header = {};
        local serialised_save_table_factions = {};

        local characterCount = 0;
        local tableCount = 1;
        local nthTable = {};
        nthTable[tableCount] = {};

        for factionKey, factionLords in pairs(crp.CRPLordsInPools) do
            local characterKeysForFaction = {};
            --Custom_Log("Adding faction key: "..factionKey);
            for characterKey, characterData in pairs(factionLords) do
                characterCount = characterCount + 1;
                local innateTrait = characterData.InnateTrait;
                if innateTrait == nil then
                    innateTrait = "";
                end
                --Custom_Log("Adding character key and character: "..characterKey.. " Innate Trait: "..innateTrait);
                if characterKey == "initialised" then
                    nthTable[factionKey..characterKey] = "initialised";
                else
                    nthTable[factionKey..characterKey] = {innateTrait, characterData.SubType, characterData.ArtSetId};
                end

                if characterCount % MAX_NUM_SAVE_TABLE_KEYS == 0 then
                    Custom_Log("Saving table "..tostring(tableCount));
                    out("CRP: Saving table "..tostring(tableCount));
                    cm:save_named_value("crp_lord_pools_characters_"..tableCount, nthTable, context);
                    tableCount = tableCount + 1;
                    nthTable = {};
                end
                characterKeysForFaction[#characterKeysForFaction + 1] = characterKey;
            end
            --Custom_Log("Finished adding characters for faction: "..factionKey);
            serialised_save_table_factions[factionKey] = characterKeysForFaction;
        end

        Custom_Log("Saving "..tostring(characterCount).." total characters");
        --Custom_Log("Saving table"..tostring(tableCount));

        out("CRP: Saving "..tostring(characterCount).." total characters");
        crp_lord_pools_header["TotalCharacters"] = characterCount;
        cm:save_named_value("crp_lord_pools_header", crp_lord_pools_header, context);
        cm:save_named_value("crp_lord_pools_faction", serialised_save_table_factions, context);
        out("CRP: Saving table"..tostring(tableCount));
        cm:save_named_value("crp_lord_pools_characters_"..tableCount, nthTable, context);
        out("CRP: Finished saving");
        Custom_Log("CRP: Finished saving");
        Custom_Log_Finished();
    end
);

-- Loading helper function
-- This is also defined in the datahelpers export_helper
-- This is here because it is defined too late in the other
function ConcatTableWithKeys(destinationTable, sourceTable)
    for key, value in pairs(sourceTable) do
        destinationTable[key] = value;
    end
end


cm:add_loading_game_callback(
    function(context)
        out("CRP: Loading callback");

        crp.PreBattleData = {};
        out("CRP: Loading crp_pre_battle_attackers");
        local preBattleDataAttackers = cm:load_named_value("crp_pre_battle_attackers", {}, context);
        for attacker_force_cqi, preBattleData in pairs(preBattleDataAttackers) do
            out("CRP: Loading force "..attacker_force_cqi);
            --out("CRP: character_cqi "..preBattleData[1]);
            --out("CRP: character_faction_name "..preBattleData[2]);
            preBattleDataAttackers[tostring(attacker_force_cqi)] = {
                character_cqi = preBattleData[1],
                character_faction_name = preBattleData[2],
            };
            if preBattleData[3] then
                --out("CRP: Setting character sub type as "..preBattleData[3]);
                preBattleDataAttackers[tostring(attacker_force_cqi)].character_sub_type = preBattleData[3];
            end
            out("CRP: Finished Loading force "..attacker_force_cqi);
        end
        crp.PreBattleData["attackers"] = preBattleDataAttackers;
        out("CRP: Loading crp_pre_battle_defenders");
        local preBattleDataDefenders = cm:load_named_value("crp_pre_battle_defenders", {}, context);
        for defender_force_cqi, preBattleData in pairs(preBattleDataDefenders) do
            out("CRP: Loading force "..defender_force_cqi);
            preBattleDataDefenders[tostring(defender_force_cqi)] = {
                character_cqi = preBattleData[1],
                character_faction_name = preBattleData[2],
            };
            if preBattleData[3] then
                --out("CRP: Setting character sub type as "..preBattleData[3]);
                preBattleDataDefenders[tostring(defender_force_cqi)].character_sub_type = preBattleData[3];
            end
            out("CRP: Finished Loading force "..defender_force_cqi);
        end
        crp.PreBattleData["defenders"] = preBattleDataDefenders;
        out("CRP: Finished preBattleData loading");

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
            --out("CRP: Loading faction "..factionKey);
            for index, characterKey in pairs(factionData) do
                local characterData = serialised_save_table_characters[factionKey..characterKey];
                if characterData ~= nil and characterData ~= {} then
                    if characterKey == "initialised" then
                        crp.CRPLordsInPools[factionKey][characterKey] = "initialised";
                    else
                        local mappedCharacter = {
                            InnateTrait = characterData[1],
                            SubType = characterData[2],
                            ArtSetId = characterData[3],
                        };
                        crp.CRPLordsInPools[factionKey][characterKey] = mappedCharacter;
                    end
                else
                    out("CRP: Character data not found for "..characterKey.." in faction "..factionKey);
                end
            end
        end
        out("CRP: Finished loading");
	end
);

-- These event listeners can be triggered before the Constructor
-- is called by the game. The actual function which does things
-- is wrapped in a callback which delays execution until the Constructor
-- is called.
--[[cm.first_tick_callbacks[#cm.first_tick_callbacks + 1] = function(context)
    if cm:model():pending_battle():has_been_fought() then
        out("CRP: Pending battle has been fought");
        PendingBattleResult(crp.HumanFaction:name(), true);
        --cm:callback(function() PendingBattleResult(crp.HumanFaction:name(), true) end, 0);
    end
end--]]

core:add_listener(
    "PopUpBattleResults",
    "PanelOpenedCampaign",
    function(context)
        return context.string == "popup_battle_results" and cm:model():pending_battle():has_been_fought();
    end,
    function(context)
        out("CRP: PopUpBattleResults");
        cm:callback(function() PendingBattleResult(crp.HumanFaction:name(), true) end, 1);
    end,
    true
);

core:add_listener(
    "PreBattlePopUp",
    "PanelOpenedCampaign",
    function(context)
        return context.string == "popup_pre_battle";
    end,
    function(context)
        out("CRP: PreBattlePopUp");
        cm:callback(function() PendingBattleResult(crp.HumanFaction:name(), true, true) end, 0);
    end,
    true
);

core:add_listener(
    "AppointGeneralOpened",
    "PanelOpenedCampaign",
    function(context)
        return context.string == "appoint_new_general";
    end,
    function(context)
        out("CRP: AppointGeneralOpened");
        cm:callback(function()
            Custom_Log("In appoint new general callback");
            local generalsList = find_uicomponent(core:get_ui_root(), "panel_manager", "appoint_new_general", "event_appoint_new_general", "general_selection_panel", "character_list", "listview", "list_clip", "list_box");
            --crp.UIController:GetGeneralCandidates(crp.HumanFaction:name(), crp.HumanFaction:subculture(), generalsList, crp.CRPLordsInPools);
        end,
        0);
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
            cm:callback(function() ProcessNewCharacter(context) end, 0);
        end,
        true
    );