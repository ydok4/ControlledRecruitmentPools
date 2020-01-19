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
                    characterData.ExtraCost
                };
                if characterCount % MAX_NUM_SAVE_TABLE_KEYS == 0 then
                    crp.Logger:Log("Saving table "..tostring(tableCount));
                    out("CRP: Saving table "..tostring(tableCount));
                    cm:save_named_value("crp_lord_pools_characters_"..tableCount, nthTable, context);
                    tableCount = tableCount + 1;
                    nthTable = {};
                end
                characterKeysForFaction[#characterKeysForFaction + 1] = factionKey.."/".. characterData.SubType.."/"..characterKey;
            end
        end
        --crp.Logger:Log("Finished adding characters for faction: "..factionKey);
        serialised_save_table_factions[factionKey] = characterKeysForFaction;
    end

    crp.Logger:Log("Saving "..tostring(characterCount).." total characters");
    out("CRP: Saving "..tostring(characterCount).." total characters");
    crp_lord_pools_header["TotalCharacters"] = characterCount;
    cm:save_named_value("crp_lord_pools_header", crp_lord_pools_header, context);
    cm:save_named_value("crp_lord_pools_faction", serialised_save_table_factions, context);
    out("CRP: Saving table"..tostring(tableCount));
    cm:save_named_value("crp_lord_pools_characters_"..tableCount, nthTable, context);

    crp.Logger:Log("Finished saving character data");
end

function SaveFactionCharacterPoolData(crp)
    crp.Logger:Log("Saving character pool data");
    out("CRP: Building serialised Pool limits");

    -- This contains the max poolsize of the faction
    local serialised_faction_resources = {};

    -- Contains the the pool keys for specific factions
    local serialised_faction_pool_keys = {};
    -- Contains the pool data for each faction
    local serialised_faction_pool_resources = {};

    -- Contains the keys for the faction pool agent subtypes
    local serialised_faction_pool_agent_keys = {};
    -- Contiains the number of each agent subtype with a key that correspond to the subtype, pool and faction
    local serialised_faction_pool_agent_resources = {};

    for cultureResourceKey, cultureResourceData in pairs(_G.CRPResources.RecruitmentPoolResources) do
        --crp.Logger:Log("Saving culture factions for "..cultureResourceKey);
        for factionResourceKey, factionResourceData in pairs(cultureResourceData) do
            --crp.Logger:Log("Saving faction resources for "..factionResourceKey);
            if cultureResourceKey ~= factionResourceKey then
                local factionPoolKeys = {};
                serialised_faction_resources[factionResourceKey] = { cultureResourceKey, factionResourceData.HeroPoolMaxSize, factionResourceData.LordPoolMaxSize};
                -- Heroes
                for factionPoolKey, factionPoolData in pairs(factionResourceData.HeroPools) do
                    serialised_faction_pool_resources[factionResourceKey..factionPoolKey] = { factionPoolKey, factionPoolData.SubPoolInitialMinSize, factionPoolData.SubPoolMaxSize};
                    local factionPoolAgentKeys = {};
                    for agentSubTypeKey, agentSubTypeData in pairs(factionPoolData.AgentSubTypes) do
                        if agentSubTypeData == false then
                            serialised_faction_pool_agent_resources[factionResourceKey..factionPoolKey..agentSubTypeKey] = { agentSubTypeKey, nil, nil, nil, false};
                        else
                            serialised_faction_pool_agent_resources[factionResourceKey..factionPoolKey..agentSubTypeKey] = { agentSubTypeKey, agentSubTypeData.MaximumPercentage, agentSubTypeData.HumanPlayerOnly, true};
                        end
                        factionPoolAgentKeys[#factionPoolAgentKeys + 1] = agentSubTypeKey;
                    end
                    serialised_faction_pool_agent_keys[factionResourceKey..factionPoolKey] = factionPoolAgentKeys;
                    factionPoolKeys[#factionPoolKeys + 1] = factionPoolKey;
                end
                -- Lords
                for factionPoolKey, factionPoolData in pairs(factionResourceData.FactionPools) do
                    serialised_faction_pool_resources[factionResourceKey..factionPoolKey] = { factionPoolKey, factionPoolData.SubPoolInitialMinSize, factionPoolData.SubPoolMaxSize};
                    local factionPoolAgentKeys = {};
                    for agentSubTypeKey, agentSubTypeData in pairs(factionPoolData.AgentSubTypes) do
                        if agentSubTypeData == false then
                            serialised_faction_pool_agent_resources[factionResourceKey..factionPoolKey..agentSubTypeKey] = { agentSubTypeKey, nil, nil, nil, false};
                        else
                            serialised_faction_pool_agent_resources[factionResourceKey..factionPoolKey..agentSubTypeKey] = { agentSubTypeKey, agentSubTypeData.MaximumPercentage, agentSubTypeData.HumanPlayerOnly, true};
                        end
                        factionPoolAgentKeys[#factionPoolAgentKeys + 1] = agentSubTypeKey;
                    end
                    serialised_faction_pool_agent_keys[factionResourceKey..factionPoolKey] = factionPoolAgentKeys;
                    factionPoolKeys[#factionPoolKeys + 1] = factionPoolKey;
                end
                serialised_faction_pool_keys[factionResourceKey] = factionPoolKeys;
            end
        end
    end
    crp.Logger:Log("Finished serialising data");
    out("CRP: Saving Pool limits");
    cm:save_named_value("crp_faction_resources", serialised_faction_resources, context);

    cm:save_named_value("crp_faction_pool_keys", serialised_faction_pool_keys, context);
    cm:save_named_value("crp_faction_pool_resources", serialised_faction_pool_resources, context);

    cm:save_named_value("crp_faction_pool_agent_keys", serialised_faction_pool_agent_keys, context);
    cm:save_named_value("crp_faction_pool_agent_resources", serialised_faction_pool_agent_resources, context);

    out("CRP: Finished saving");
    crp.Logger:Log("CRP: Finished saving character pool data");
end