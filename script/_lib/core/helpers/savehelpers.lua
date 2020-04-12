local cm = nil;
local context = nil;

local MAX_NUM_SAVE_TABLE_KEYS = 200;

function InitialiseSaveHelper(cmObject, contextObject)
    cm = cmObject;
    context = contextObject;
end

function SavePreBattleData(crp)
    crp.Logger:Log("Saving pre battle data");
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
    crp.Logger:Log("Finished saving pre battle data");
    out("CRP: Finished saving pre-battle data");
end

function SaveCharacterData(crp)
    crp.Logger:Log("Saving character data");
    out("CRP: Starting to save character data");
    local crp_lord_pools_header = {};
    local serialised_save_table_factions = {};

    local characterCount = 0;
    local tableCount = 1;
    local nthTable = {};

    for factionKey, factionLords in pairs(crp.CRPLordsInPools) do
        local characterKeysForFaction = {};
        if factionKey == "wh_main_grn_skull-takerz" then
            factionKey = "wh_main_grn_skull_takerz";
        end
        --out("CRP: Adding faction key: "..factionKey);
        for agentSubTypeKey, characters in pairs(factionLords) do
            for characterKey, characterData in pairs(characters) do
                characterCount = characterCount + 1;
                local innateTrait = characterData.InnateTrait;
                if innateTrait == nil then
                    innateTrait = "";
                end
                --out("CRP: Adding character key and character: "..characterKey.." subtype: "..characterData.SubType.." faction: "..factionKey);
                nthTable[factionKey.."/"..characterData.SubType.."/"..characterKey] = {
                    innateTrait,
                    characterData.SubType,
                    characterData.ArtSetId,
                    characterData.HomeRegion,
                    characterData.Name,
                    characterData.Mounts,
                    characterData.RemoveImmortality,
                    characterData.IsRecruited,
                    characterData.ExtraCost,
                    characterData.CQI,
                };
                if characterCount % MAX_NUM_SAVE_TABLE_KEYS == 0 then
                    crp.Logger:Log("Saving table "..tostring(tableCount));
                    out("CRP: Saving table "..tostring(tableCount));
                    cm:save_named_value("crp_lord_pools_characters_"..tableCount, nthTable, context);
                    tableCount = tableCount + 1;
                    nthTable = {};
                end
            end
        end
        crp.Logger:Log("Finished adding characters for faction: "..factionKey);
        serialised_save_table_factions[factionKey] = characterKeysForFaction;
    end

    crp.Logger:Log("Saving "..tostring(characterCount).." total characters");
    out("CRP: Saving "..tostring(characterCount).." total characters");
    crp_lord_pools_header["TotalCharacters"] = characterCount;
    cm:save_named_value("crp_lord_pools_header", crp_lord_pools_header, context);
    out("CRP: Saving table"..tostring(tableCount));
    cm:save_named_value("crp_lord_pools_characters_"..tableCount, nthTable, context);

    crp.Logger:Log("Finished saving character data");
end

function SaveFactionCharacterPoolData(crp)
    crp.Logger:Log("Saving character pool data");
    out("CRP: Building serialised Pool limits");
    local crp_faction_pools_header = {};
    -- This contains the max poolsize of the faction
    local serialised_faction_resources = {};

    -- Contains the the pool keys for specific factions
    local serialised_faction_pool_keys = {};
    -- Contains the pool data for each faction
    local serialised_faction_pool_resources = {};

    -- This tracks the number of different pool values per subtype we track
    local factionPoolAgentKeysCount = 0;
    local factionPoolAgentKeysTableCount = 1;
    local nthFactionPoolAgentKeysTable = {};

    local agentResourcesCount = 0;
    local agentResourcesTableCount = 1;
    local nthAgentResourcesTable = {};

    for cultureResourceKey, cultureResourceData in pairs(_G.CRPResources.RecruitmentPoolResources) do
        crp.Logger:Log("Saving culture factions for "..cultureResourceKey);
        for factionResourceKey, factionResourceData in pairs(cultureResourceData) do
            crp.Logger:Log("Saving faction resources for "..factionResourceKey);
            if cultureResourceKey ~= factionResourceKey then
                local factionPoolKeys = {};
                serialised_faction_resources[factionResourceKey] = { cultureResourceKey, factionResourceData.HeroPoolMaxSize, factionResourceData.LordPoolMaxSize};
                -- Heroes
                for factionPoolKey, factionPoolData in pairs(factionResourceData.HeroPools) do
                    serialised_faction_pool_resources[factionResourceKey..factionPoolKey] = { factionPoolKey, factionPoolData.SubPoolInitialMinSize, factionPoolData.SubPoolMaxSize, factionPoolData.SubPoolBonusSize};
                    local factionPoolAgentKeys = {};
                    if factionPoolData.AgentSubTypes ~= nil then
                        for agentSubTypeKey, agentSubTypeData in pairs(factionPoolData.AgentSubTypes) do
                            if agentSubTypeData == false then
                                nthAgentResourcesTable[factionResourceKey..factionPoolKey..agentSubTypeKey] = { agentSubTypeKey, 0, false};
                            else
                                nthAgentResourcesTable[factionResourceKey..factionPoolKey..agentSubTypeKey] = { agentSubTypeKey, agentSubTypeData.MaximumPercentage, true};
                            end
                            factionPoolAgentKeys[#factionPoolAgentKeys + 1] = agentSubTypeKey;
                            agentResourcesCount = agentResourcesCount + 1;
                            if agentResourcesCount % MAX_NUM_SAVE_TABLE_KEYS == 0 then
                                crp.Logger:Log("Saving agent subtype table "..tostring(agentResourcesTableCount));
                                out("CRP: Saving agent subtype table "..tostring(agentResourcesTableCount));
                                cm:save_named_value("crp_faction_pools_agent_resources_"..agentResourcesTableCount, nthAgentResourcesTable, context);
                                agentResourcesTableCount = agentResourcesTableCount + 1;
                                nthAgentResourcesTable = {};
                            end
                        end
                    end
                    nthFactionPoolAgentKeysTable[factionResourceKey..factionPoolKey] = factionPoolAgentKeys;
                    factionPoolAgentKeysCount = factionPoolAgentKeysCount + 1;
                    if factionPoolAgentKeysCount % MAX_NUM_SAVE_TABLE_KEYS == 0 then
                        crp.Logger:Log("Saving faction pool table "..tostring(factionPoolAgentKeysTableCount));
                        out("CRP: Saving agent subtype table "..tostring(factionPoolAgentKeysTableCount));
                        cm:save_named_value("crp_faction_pools_agent_keys_"..factionPoolAgentKeysTableCount, nthFactionPoolAgentKeysTable, context);
                        factionPoolAgentKeysTableCount = factionPoolAgentKeysTableCount + 1;
                        nthFactionPoolAgentKeysTable = {};
                    end
                    factionPoolKeys[#factionPoolKeys + 1] = factionPoolKey;
                end
                -- Lords
                for factionPoolKey, factionPoolData in pairs(factionResourceData.FactionPools) do
                    serialised_faction_pool_resources[factionResourceKey..factionPoolKey] = { factionPoolKey, factionPoolData.SubPoolInitialMinSize, factionPoolData.SubPoolMaxSize, factionPoolData.SubPoolBonusSize};
                    local factionPoolAgentKeys = {};
                    for agentSubTypeKey, agentSubTypeData in pairs(factionPoolData.AgentSubTypes) do
                        if agentSubTypeData == false then
                            nthAgentResourcesTable[factionResourceKey..factionPoolKey..agentSubTypeKey] = { agentSubTypeKey, 0, false};
                        else
                            nthAgentResourcesTable[factionResourceKey..factionPoolKey..agentSubTypeKey] = { agentSubTypeKey, agentSubTypeData.MaximumPercentage, true};
                        end
                        factionPoolAgentKeys[#factionPoolAgentKeys + 1] = agentSubTypeKey;
                        agentResourcesCount = agentResourcesCount + 1;
                        if agentResourcesCount % MAX_NUM_SAVE_TABLE_KEYS == 0 then
                            crp.Logger:Log("Saving agent subtype table "..tostring(agentResourcesTableCount));
                            out("CRP: Saving agent subtype table "..tostring(agentResourcesTableCount));
                            cm:save_named_value("crp_faction_pools_agent_resources_"..agentResourcesTableCount, nthAgentResourcesTable, context);
                            agentResourcesTableCount = agentResourcesTableCount + 1;
                            nthAgentResourcesTable = {};
                        end
                    end
                    nthFactionPoolAgentKeysTable[factionResourceKey..factionPoolKey] = factionPoolAgentKeys;
                    factionPoolAgentKeysCount = factionPoolAgentKeysCount + 1;
                    if factionPoolAgentKeysCount % MAX_NUM_SAVE_TABLE_KEYS == 0 then
                        crp.Logger:Log("Saving faction pool table "..tostring(factionPoolAgentKeysTableCount));
                        out("CRP: Saving agent subtype table "..tostring(factionPoolAgentKeysTableCount));
                        cm:save_named_value("crp_faction_pools_agent_keys_"..factionPoolAgentKeysTableCount, nthFactionPoolAgentKeysTable, context);
                        factionPoolAgentKeysTableCount = factionPoolAgentKeysTableCount + 1;
                        nthFactionPoolAgentKeysTable = {};
                    end
                    factionPoolKeys[#factionPoolKeys + 1] = factionPoolKey;
                end
                serialised_faction_pool_keys[factionResourceKey] = factionPoolKeys;
            end
        end
    end
    crp.Logger:Log("Finished serialising data");
    out("CRP: Saving Pool limits");
    out("CRP: Saving agent subtype table "..tostring(agentResourcesTableCount));
    cm:save_named_value("crp_faction_pools_agent_resources_"..agentResourcesTableCount, nthAgentResourcesTable, context);
    crp_faction_pools_header["TotalFactionPoolAgentResources"] = agentResourcesCount;

    crp.Logger:Log("Saving faction pool table "..tostring(factionPoolAgentKeysTableCount));
    cm:save_named_value("crp_faction_pools_agent_keys_"..factionPoolAgentKeysTableCount, nthFactionPoolAgentKeysTable, context);
    crp_faction_pools_header["TotalFactionPoolAgentKeys"] = factionPoolAgentKeysCount;

    cm:save_named_value("crp_faction_pools_header", crp_faction_pools_header, context);
    cm:save_named_value("crp_faction_resources", serialised_faction_resources, context);

    cm:save_named_value("crp_faction_pool_keys", serialised_faction_pool_keys, context);
    cm:save_named_value("crp_faction_pool_resources", serialised_faction_pool_resources, context);

    --cm:save_named_value("crp_faction_pool_agent_keys", serialised_faction_pool_agent_keys, context);
    --cm:save_named_value("crp_faction_pool_agent_resources", serialised_faction_pool_agent_resources, context);

    out("CRP: Finished saving");
    crp.Logger:Log("CRP: Finished saving character pool data");
end