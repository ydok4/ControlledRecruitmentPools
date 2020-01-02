local CRPSubcultureResourcesCache = {

};

local CRPRecruitmentPoolResourcesCache = {

};

function InitialiseResourcesCache()
    -- Subculture resources
    CRPSubcultureResourcesCache = _G.CRPResources.SubcultureResources;
    -- Recruitment pool resources
    for subcultureKey, subcultureData in pairs(_G.CRPResources.RecruitmentPoolResources) do
        local subcultureFactionData = subcultureData[subcultureKey];
        if subcultureFactionData ~= nil then
            for factionKey, factionData in pairs(subcultureData) do
                for factionPoolKey, factionPoolData in pairs(factionData.FactionPools) do
                    for agentSubtypeKey, agentSubTypeData in pairs(factionPoolData.AgentSubTypes) do
                        if agentSubTypeData.BonusCost == nil
                        and subcultureFactionData.FactionPools[factionPoolKey] ~= nil
                        and subcultureFactionData.FactionPools[factionPoolKey].AgentSubTypes[agentSubtypeKey] ~= nil
                        and subcultureFactionData.FactionPools[factionPoolKey].AgentSubTypes[agentSubtypeKey].BonusCost ~= nil then
                            agentSubTypeData.BonusCost = subcultureFactionData.FactionPools[factionPoolKey].AgentSubTypes[agentSubtypeKey].BonusCost;
                        end
                    end
                end
                if factionData.HeroPools == nil then
                    factionData.HeroPools = subcultureFactionData.HeroPools;
                end
                if factionData.HeroPoolMaxSize == nil then
                    factionData.HeroPoolMaxSize = subcultureFactionData.HeroPoolMaxSize;
                end
                if factionData.LordPoolMaxSize == nil then
                    factionData.LordPoolMaxSize = subcultureFactionData.LordPoolMaxSize;
                end
            end
        end
    end
    CRPRecruitmentPoolResourcesCache = _G.CRPResources.RecruitmentPoolResources;
end

function IsSupportedSubCulture(subculture)
    if subculture == "rebels" or CRPRecruitmentPoolResourcesCache[subculture] then
        return true;
    else
        return false;
    end
end

function IsRogueArmy(factionName)
    if CRPRecruitmentPoolResourcesCache["wh_rogue_armies"][factionName] then
        return true;
    else
        return false;
    end
end

function GetSubCulturePoolResources(subcultureKey)
    local subCulturePoolResources = CRPRecruitmentPoolResourcesCache[subcultureKey][subcultureKey];
    if subCulturePoolResources ~= nil then
        return subCulturePoolResources;
    end
    return {};
end

function IsUniquePoolResourcesForFaction(faction)
    local subCulturePoolResources = CRPRecruitmentPoolResourcesCache[faction:subculture()];
    local factionName = faction:name();
    -- I couldn't store skull-takerz as a key in the lua table because of the -
    -- So this takes care of that edge case
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end

    if subCulturePoolResources == nil then
        return true;
    elseif subCulturePoolResources[factionName] then
        return true;
    end
    return false;
end

function GetFactionPoolResources(faction)
    local subCulturePoolResources = CRPRecruitmentPoolResourcesCache[faction:subculture()];
    local factionName = faction:name();
    -- I couldn't store skull-takerz as a key in the lua table because of the -
    -- So this takes care of that edge case
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end

    if subCulturePoolResources == nil then
        return CRPRecruitmentPoolResourcesCache["wh_rogue_armies"][factionName];
    elseif subCulturePoolResources[factionName] then
        return subCulturePoolResources[factionName];
    else
        return subCulturePoolResources[faction:subculture()];
    end
end
function GetReplacementLordsForFaction(faction)
    local factionResources = GetFactionPoolResources(faction);
    return factionResources.LordsToReplace;
end

function GetDefaultLordsForFaction(faction)
    local subcultureResources = CRPSubcultureResourcesCache[faction:subculture()];
    if subcultureResources == nil then
        return nil;
    end
    return subcultureResources.DefaultLords;
end

function GetRewardsForFaction(faction)
    local subcultureResources = CRPSubcultureResourcesCache[faction:subculture()];
    if subcultureResources == nil then
        return nil;
    end
    return subcultureResources.Rewards;
end

function GetHeroesForFaction(faction)
    local subcultureResources = CRPSubcultureResourcesCache[faction:subculture()];
    if subcultureResources == nil then
        return nil;
    end
    return subcultureResources.Heroes;
end

function GetAgentSubTypeResources(faction)
    local subcultureResources = CRPSubcultureResourcesCache[faction:subculture()];
    if subcultureResources == nil then
        return nil;
    end
    return subcultureResources.AgentSubTypes;
end

function GetMountResources(faction)
    local subcultureResources = CRPSubcultureResourcesCache[faction:subculture()];
    if subcultureResources == nil then
        return nil;
    end
    return subcultureResources.MountData;
end

function SetSubCultureRecruitmentPoolsForFaction(faction)
    local subCulturePoolResources = CRPRecruitmentPoolResourcesCache[faction:subculture()];
    local factionName = faction:name();
    -- I couldn't store skull-takerz as a key in the lua table because of the -
    -- So this takes care of that edge case
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end

    CRPRecruitmentPoolResourcesCache[faction:subculture()][factionName] = subCulturePoolResources[faction:subculture()];
end

-- The pool limit should be greater than or equal to the highest Agent Sub Type
-- maximum limit in that pool
function RecalculatePoolLimits()
    for subcultureKey, subcultureLimits in pairs(CRPRecruitmentPoolResourcesCache) do
        for factionKey, factionLimits in pairs(subcultureLimits) do
            for factionPoolKey, factionPool in pairs(factionLimits.FactionPools) do
                local subPoolMax = factionPool.SubPoolMaxSize;
                if subPoolMax == nil then
                    subPoolMax = 0;
                end
                local subPoolMin = factionPool.SubPoolInitialMinSize;
                if subPoolMin == nil then
                    subPoolMin = 0;
                end
                local highestMinimum = 0;
                local highestMaximum = 0;
                local calculatedMinimum = 0;

                for agentSubTypeKey, agentSubType in pairs(factionPool.AgentSubTypes) do
                    if agentSubType.MinimumAmount > highestMinimum then
                        highestMinimum = agentSubType.MinimumAmount;
                    end

                    if agentSubType.MaximumAmount > highestMaximum then
                        highestMaximum = agentSubType.MaximumAmount;
                    end

                    calculatedMinimum = calculatedMinimum + agentSubType.MinimumAmount;
                end
                if subPoolMin < calculatedMinimum then
                    factionPool.SubPoolInitialMinSize = calculatedMinimum;
                end
                if subPoolMax < calculatedMinimum + highestMaximum then
                    factionPool.SubPoolMaxSize = calculatedMinimum + highestMaximum;
                end
            end
        end
    end
end