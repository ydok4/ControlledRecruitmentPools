local cm = nil;
local context = nil;

local MAX_NUM_SAVE_TABLE_KEYS = 200;

function InitialiseLoadHelper(cmObject, contextObject)
    cm = cmObject;
    context = contextObject;
end

function LoadPreBattleData(crp)
    crp.PreBattleData = {};
    out("CRP: Loading crp_pre_battle_attackers");
    local preBattleDataAttackersSaveData = cm:load_named_value("crp_pre_battle_attackers", {}, context);
    out("CRP: Loaded pre battle data");
    local preBattleDataAttackers = {};
    for attacker_force_cqi, preBattleData in pairs(preBattleDataAttackersSaveData) do
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
    out("CRP: Before set pre battle attackers");
    crp.PreBattleData["attackers"] = preBattleDataAttackers;
    out("CRP: Loading crp_pre_battle_defenders");
    local preBattleDataDefendersSaveData = cm:load_named_value("crp_pre_battle_defenders", {}, context);
    local preBattleDataDefenders = {};
    for defender_force_cqi, preBattleData in pairs(preBattleDataDefendersSaveData) do
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
end

function LoadCharacterData(crp)
    out("CRP: LoadCharacterData");
    local crp_lord_pools_header = cm:load_named_value("crp_lord_pools_header", {}, context);
    if crp_lord_pools_header["TotalCharacters"] == nil then
        out("CRP: No characters to load");
        return;
    else
        out("CRP: Loading "..crp_lord_pools_header["TotalCharacters"].." other characters");
    end

    local serialised_save_table_characters = {};

    crp.CRPLordsInPools = {};
    local tableCount = math.ceil(crp_lord_pools_header["TotalCharacters"] / MAX_NUM_SAVE_TABLE_KEYS);

    for n = 1, tableCount do
        out("CRP: Loading table "..tostring(n));
        local nthTable = cm:load_named_value("crp_lord_pools_characters_"..tostring(n), {}, context);
        ConcatTableWithKeys(serialised_save_table_characters, nthTable);
    end

    --[[for characterKey, characterData in pairs(serialised_save_table_characters) do
        out("CRP: Saved character key is "..characterKey);
    end--]]

    for fullCharacterKey, characterData in pairs(serialised_save_table_characters) do
        --out("CRP: fullCharacterKey: "..fullCharacterKey);
        local factionKey = string.match(fullCharacterKey, "(.-)/");
        if factionKey == "wh_main_grn_skull-takerz" then
            factionKey = "wh_main_grn_skull_takerz";
        end
        --out("CRP: factionKey: "..factionKey);
        if crp.CRPLordsInPools[factionKey] == nil then
            crp.CRPLordsInPools[factionKey] = {};
        end
        local agentSubTypeKey = string.match(fullCharacterKey, factionKey.."/(.*)/");
        --out("CRP: agentSubTypeKey: "..agentSubTypeKey);
        local characterKey = string.match(fullCharacterKey, factionKey.."/"..agentSubTypeKey.."/(.*)");
        --out("CRP: characterKey: "..characterKey);
        local mappedCharacter = {
            InnateTrait = characterData[1],
            SubType = characterData[2],
            ArtSetId = characterData[3],
            HomeRegion = characterData[4],
            Name = characterData[5],
            Mounts = characterData[6],
            RemoveImmortality = characterData[7],
            IsRecruited = characterData[8],
            ExtraCost = characterData[9],
            CQI = characterData[10]
        };
        --out("CRP: Mapped character: "..characterKey);
        if crp.CRPLordsInPools[factionKey][mappedCharacter.SubType] == nil then
            crp.CRPLordsInPools[factionKey][mappedCharacter.SubType] = {};
        end
        crp.CRPLordsInPools[factionKey][mappedCharacter.SubType][characterKey] = mappedCharacter;
    end
    out("CRP: Finished loading character data");
end

function ConcatTableWithKeys(destinationTable, sourceTable)
    for key, value in pairs(sourceTable) do
        destinationTable[key] = value;
    end
end

function LoadFactionCharacterPoolData(crp)
    out("CRP: Loading Pool data");
    local faction_resources = cm:load_named_value("crp_faction_resources", {}, context);

    local crp_faction_pools_header = cm:load_named_value("crp_faction_pools_header", {}, context);
    if crp_faction_pools_header["TotalFactionPoolAgentKeys"] == nil
    or crp_faction_pools_header["TotalFactionPoolAgentResources"] == nil then
        out("CRP: No faction pools or agent subtypes to load");
        return;
    else
        out("CRP: Loading "..crp_faction_pools_header["TotalFactionPoolAgentKeys"].." faction pools.");
        out("CRP: Loading "..crp_faction_pools_header["TotalFactionPoolAgentResources"].." agent subtypes pools.");
    end

    local faction_pool_keys = cm:load_named_value("crp_faction_pool_keys", {}, context);
    local faction_pool_resources = cm:load_named_value("crp_faction_pool_resources", {}, context);

    local faction_pool_agent_keys = {};
    local factionPoolAgentKeysTableCount = math.ceil(crp_faction_pools_header["TotalFactionPoolAgentKeys"] / MAX_NUM_SAVE_TABLE_KEYS);
    for n = 1, factionPoolAgentKeysTableCount do
        out("CRP: Loading faction pool agent keys table "..tostring(n));
        local nthTable = cm:load_named_value("crp_faction_pools_agent_keys_"..tostring(n), {}, context);
        ConcatTableWithKeys(faction_pool_agent_keys, nthTable);
    end

    local faction_pool_agent_resources = {};
    local factionPoolAgentResourcesTableCount = math.ceil(crp_faction_pools_header["TotalFactionPoolAgentResources"] / MAX_NUM_SAVE_TABLE_KEYS);
    for n = 1, factionPoolAgentResourcesTableCount do
        out("CRP: Loading faction pool agent resources table "..tostring(n));
        local nthTable = cm:load_named_value("crp_faction_pools_agent_resources_"..tostring(n), {}, context);
        ConcatTableWithKeys(faction_pool_agent_resources, nthTable);
    end

    -- Now we'll map the saved data and overwrite the default data with the saved data
    for factionResourceKey, factionResourceData in pairs(faction_resources) do
        local factionCulture = factionResourceData[1];
        local mappedLordFactionPools = {};
        local mappedHeroFactionPools = {};
        --out("CRP: Loading resources for faction "..factionResourceKey);
        for factionPoolIndex, factionPoolKey in pairs(faction_pool_keys[factionResourceKey]) do
            --out("CRP: Loading faction pool "..factionPoolKey);
            local factionPoolResources = faction_pool_resources[factionResourceKey..factionPoolKey];
            local factionAgentSubTypes = {};
            local agentType = nil;
            for agentSubTypeIndex, agentSubTypeKey in pairs(faction_pool_agent_keys[factionResourceKey..factionPoolKey]) do
                --out("CRP: agent subtype data "..agentSubTypeKey);
                local agentResourcesKey = factionResourceKey..factionPoolKey..agentSubTypeKey;
                --out("CRP: agent resources key is "..agentResourcesKey);
                local agentResources = faction_pool_agent_resources[agentResourcesKey];
                local mappedAgentSubType = {};
                if agentResources == nil then
                    out("CRP: ERROR agent data resources are missing "..agentResourcesKey);
                else
                    -- 5 is where I store if the character is disabled.
                    if agentResources[3] == false then
                        --out("CRP: Agent sub type is disabled");
                        mappedAgentSubType = false;
                    else
                        mappedAgentSubType["MaximumPercentage"] = agentResources[2];
                    end
                    factionAgentSubTypes[agentSubTypeKey] = mappedAgentSubType;
                    if agentType == nil then
                        local subTypeData = _G.CG_NameResources.campaign_character_data[agentSubTypeKey];
                        if subTypeData == nil then
                            out("CRP: ERROR missing subtype data: "..agentSubTypeKey);
                        end
                        agentType =  subTypeData.AgentType;
                    end
                end
            end
            if agentType == "general" then
                mappedLordFactionPools[factionPoolKey] = {
                    AgentSubTypes = factionAgentSubTypes,
                    SubPoolInitialMinSize = factionPoolResources[2],
                    SubPoolMaxSize = factionPoolResources[3],
                    SubPoolBonusSize = factionPoolResources[4],
                };
            else
                mappedHeroFactionPools[factionPoolKey] = {
                    AgentSubTypes = factionAgentSubTypes,
                    SubPoolInitialMinSize = factionPoolResources[2],
                    SubPoolMaxSize = factionPoolResources[3],
                    SubPoolBonusSize = factionPoolResources[4],
                };
            end
        end
        local mappedFactionData = {
            HeroPools = mappedHeroFactionPools,
            HeroPoolMaxSize = factionResourceData[2],
            FactionPools = mappedLordFactionPools,
            LordPoolMaxSize = factionResourceData[3],
        };
        if factionCulture == nil or _G.CRPResources.RecruitmentPoolResources[factionCulture] == nil then
            if _G.CRPResources.RecruitmentPoolResources["wh_rogue_armies"][factionResourceKey] == nil then
                --out("CRP: Rogue army faction data "..factionResourceKey.." is missing");
            else
                _G.CRPResources.RecruitmentPoolResources["wh_rogue_armies"][factionResourceKey].HeroPools = mappedFactionData.HeroPools;
                _G.CRPResources.RecruitmentPoolResources["wh_rogue_armies"][factionResourceKey].HeroPoolMaxSize = mappedFactionData.HeroPoolMaxSize;
                _G.CRPResources.RecruitmentPoolResources["wh_rogue_armies"][factionResourceKey].FactionPools = mappedFactionData.FactionPools;
                _G.CRPResources.RecruitmentPoolResources["wh_rogue_armies"][factionResourceKey].LordPoolMaxSize = mappedFactionData.LordPoolMaxSize;
            end
        else
            --out("CRP: Mapping faction data: "..factionResourceKey);
            if _G.CRPResources.RecruitmentPoolResources[factionCulture][factionResourceKey] == nil then
                --out("CRP: Faction resources are nil...initialising");
                _G.CRPResources.RecruitmentPoolResources[factionCulture][factionResourceKey] = {};
            end
            _G.CRPResources.RecruitmentPoolResources[factionCulture][factionResourceKey].HeroPools = mappedFactionData.HeroPools;
            _G.CRPResources.RecruitmentPoolResources[factionCulture][factionResourceKey].HeroPoolMaxSize = mappedFactionData.HeroPoolMaxSize;
            _G.CRPResources.RecruitmentPoolResources[factionCulture][factionResourceKey].FactionPools = mappedFactionData.FactionPools;
            _G.CRPResources.RecruitmentPoolResources[factionCulture][factionResourceKey].LordPoolMaxSize = mappedFactionData.LordPoolMaxSize;
        end
    end
    out("CRP: Finished loading pool data")
end