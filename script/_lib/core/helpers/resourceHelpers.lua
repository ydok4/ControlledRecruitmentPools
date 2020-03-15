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
            for poolKey, poolData in pairs(subcultureFactionData.HeroPools) do
                poolData.SubPoolBonusSize = 0;
                for agentSubTypeKey, agentSubTypeData in pairs(poolData.AgentSubTypes) do
                    if agentSubTypeData == false then
                        poolData.AgentSubTypes[agentSubTypeKey] = nil;
                    end
                end
            end
            for poolKey, poolData in pairs(subcultureFactionData.FactionPools) do
                poolData.SubPoolBonusSize = 0;
                for agentSubTypeKey, agentSubTypeData in pairs(poolData.AgentSubTypes) do
                    if agentSubTypeData == false then
                        poolData.AgentSubTypes[agentSubTypeKey] = nil;
                    end
                end
            end
            for factionKey, factionData in pairs(subcultureData) do
                if factionKey ~= subcultureKey then
                    -- If they aren't explicitly disabled (or changed) copy data from the subculture resources
                    for poolKey, poolData in pairs(subcultureFactionData.FactionPools) do
                        local factionResources = factionData.FactionPools[poolKey];
                        if factionResources == false then
                            factionData.FactionPools[poolKey] = nil;
                        else
                            if factionResources == nil then
                                factionData.FactionPools[poolKey] = {};
                                factionResources = factionData.FactionPools[poolKey];
                            end
                            local subcultureResources = subcultureFactionData.FactionPools[poolKey];
                            if factionResources.AgentSubTypes == nil then
                                factionResources.AgentSubTypes = subcultureResources.AgentSubTypes;
                            end
                            if factionResources.SubPoolInitialMinSize == nil then
                                factionResources.SubPoolInitialMinSize = subcultureResources.SubPoolInitialMinSize;
                            end
                            if factionResources.SubPoolMaxSize == nil then
                                factionResources.SubPoolMaxSize = subcultureResources.SubPoolMaxSize;
                            end
                        end
                    end
                    for poolKey, poolData in pairs(subcultureFactionData.HeroPools) do
                        if factionData.HeroPools == nil then
                            factionData.HeroPools = subcultureFactionData.HeroPools;
                        else
                            local factionResources = factionData.HeroPools[poolKey];
                            if factionResources == false then
                                factionData.HeroPools[poolKey] = nil;
                            else
                                if factionResources == nil then
                                    factionData.HeroPools[poolKey] = {};
                                    factionResources = factionData.HeroPools[poolKey];
                                end
                                local subcultureResources = subcultureFactionData.HeroPools[poolKey];
                                if factionResources.AgentSubTypes == nil then
                                    factionResources.AgentSubTypes = subcultureResources.AgentSubTypes;
                                end
                                if factionResources.SubPoolInitialMinSize == nil then
                                    factionResources.SubPoolInitialMinSize = subcultureResources.SubPoolInitialMinSize;
                                end
                                if factionResources.SubPoolMaxSize == nil then
                                    factionResources.SubPoolMaxSize = subcultureResources.SubPoolMaxSize;
                                end
                            end
                        end
                    end
                    -- Set data for defined pools to default values if they are missing
                    for factionPoolKey, factionPoolData in pairs(factionData.FactionPools) do
                        factionPoolData.SubPoolBonusSize = 0;
                        for agentSubtypeKey, agentSubTypeData in pairs(factionPoolData.AgentSubTypes) do
                            if agentSubTypeData == false then
                                factionPoolData.AgentSubTypes[agentSubtypeKey] = nil;
                            elseif agentSubTypeData.BonusCost == nil
                            and subcultureFactionData.FactionPools[factionPoolKey] ~= nil
                            and subcultureFactionData.FactionPools[factionPoolKey].AgentSubTypes[agentSubtypeKey] ~= nil
                            and subcultureFactionData.FactionPools[factionPoolKey].AgentSubTypes[agentSubtypeKey].BonusCost ~= nil then
                                agentSubTypeData.BonusCost = subcultureFactionData.FactionPools[factionPoolKey].AgentSubTypes[agentSubtypeKey].BonusCost;
                            end
                        end
                    end
                    if factionData.LordPoolMaxSize == nil then
                        factionData.LordPoolMaxSize = subcultureFactionData.LordPoolMaxSize;
                    end
                    -- Hero pools work a bit differently than the lord pools
                    -- Unlike the lord pools, the assumptioni is that a faction
                    -- has access to all heroes by default and we should specify if this isn't the case
                    if factionData.HeroPools == nil then
                        factionData.HeroPools = {};
                    end
                    for poolKey, poolData in pairs(subcultureFactionData.HeroPools) do
                        if factionData.HeroPools[poolKey] == nil then
                            factionData.HeroPools[poolKey] = poolData;
                        elseif factionData.HeroPools[poolKey] ~= false then
                            factionData.HeroPools[poolKey].SubPoolBonusSize = 0;
                        elseif factionData.HeroPools[poolKey] == false then
                            factionData.HeroPools[poolKey] = nil;
                        end
                    end
                    if factionData.HeroPoolMaxSize == nil then
                        factionData.HeroPoolMaxSize = subcultureFactionData.HeroPoolMaxSize;
                    elseif factionData.HeroPoolMaxSize == false then
                        factionData.HeroPoolMaxSize = 0;
                    end
                end
            end
        end
    end
    CRPRecruitmentPoolResourcesCache = _G.CRPResources.RecruitmentPoolResources;
end

function IsSupportedSubCulture(subculture)
    if CRPRecruitmentPoolResourcesCache[subculture] then
        return true;
    else
        return false;
    end
end

function IsRogueArmy(factionName)
    if CRPRecruitmentPoolResourcesCache["wh_rogue_armies"] ~= nil
    and CRPRecruitmentPoolResourcesCache["wh_rogue_armies"][factionName] ~= nil then
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

function GetDefaultLordsForFaction(faction, subcultureKey)
    local subculture = '';
    if subcultureKey ~= nil then
        subculture = subcultureKey;
    else
        subculture = faction:subculture();
    end
    local subcultureResources = CRPSubcultureResourcesCache[subculture];
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

function GetRewardByKey(faction, rewardKey)
    local rewardsForFaction = GetRewardsForFaction(faction);
    if rewardsForFaction ~= nil then
        local reward = rewardsForFaction[rewardKey];
        if reward ~= nil then
            return reward;
        end
    end
    return nil;
end

function GetRewardForDilemma(faction, dilemmaKey, choiceKey)
    local rewardsForFaction = GetRewardsForFaction(faction);
    if rewardsForFaction ~= nil then
        local rewardsForDilemma = rewardsForFaction[dilemmaKey];
        if rewardsForDilemma ~= nil
        and rewardsForDilemma.RewardsForChoice ~= nil
        and rewardsForDilemma.RewardsForChoice[choiceKey] ~= nil then
            return rewardsForDilemma.RewardsForChoice[choiceKey];
        end
    end
    return nil;
end

function GetHeroesForFaction(faction)
    local subcultureResources = CRPSubcultureResourcesCache[faction:subculture()];
    if subcultureResources == nil then
        return nil;
    end
    return subcultureResources.Heroes;
end

function GetAgentSubTypeResourcesForCharacter(character)
    local factionAgentSubTypeResources = GetAgentSubTypeResourcesForFaction(character:faction());
    return factionAgentSubTypeResources[character:character_subtype_key()];
end

function IsSupportedSubtype(character)
    local subcultureResources = CRPSubcultureResourcesCache[character:faction():subculture()];
    if subcultureResources.AgentSubTypes[character:character_subtype_key()] ~= nil then
        return true;
    else
        return false;
    end
end

function GetAgentSubTypeResourcesForFaction(faction)
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
    local defaultResources = subCulturePoolResources[faction:subculture()];
    CRPRecruitmentPoolResourcesCache[faction:subculture()][factionName] = {
        HeroPools = {},
        HeroPoolMaxSize = defaultResources.HeroPoolMaxSize,
        FactionPools = {},
        LordPoolMaxSize = defaultResources.LordPoolMaxSize,
    };
    local factionReference = CRPRecruitmentPoolResourcesCache[faction:subculture()][factionName];
    for poolKey, poolData in pairs(defaultResources.HeroPools) do
        factionReference.HeroPools[poolKey] = {
            AgentSubTypes = {},
            SubPoolInitialMinSize = poolData.SubPoolInitialMinSize,
            SubPoolMaxSize = poolData.SubPoolMaxSize + 1,
            SubPoolBonusSize = 0,
        };
        for agentSubtypeKey, agentSubTypeData in pairs(poolData.AgentSubTypes) do
            factionReference.HeroPools[poolKey].AgentSubTypes[agentSubtypeKey] = {
                MaximumPercentage = agentSubTypeData.MaximumPercentage,
            };
        end
    end
    for poolKey, poolData in pairs(defaultResources.FactionPools) do
        factionReference.FactionPools[poolKey] = {
            AgentSubTypes = {},
            SubPoolInitialMinSize = poolData.SubPoolInitialMinSize,
            SubPoolMaxSize = poolData.SubPoolMaxSize + 1,
            SubPoolBonusSize = 0,
        };
        for agentSubtypeKey, agentSubTypeData in pairs(poolData.AgentSubTypes) do
            factionReference.FactionPools[poolKey].AgentSubTypes[agentSubtypeKey] = {
                MaximumPercentage = agentSubTypeData.MaximumPercentage,
            };
        end
    end
end

-- The pool limit should be greater than or equal to the highest Agent Sub Type
-- maximum limit in that pool
function RecalculatePoolLimits(humanFaction, faction)
    local humanFactionKey = humanFaction:name();
    local subcultureKey = faction:subculture();
    local subcultureResources = GetDefaultLordsForFaction(faction);
    local defaultLords = {};
    for index, agentSubtypeKey in pairs(subcultureResources) do
        defaultLords[agentSubtypeKey] = true;
    end
    local factionKey = faction:name();
    if CRPRecruitmentPoolResourcesCache[subcultureKey] ~= nil
    and CRPRecruitmentPoolResourcesCache[subcultureKey][factionKey] ~= nil then
        local factionLimits = CRPRecruitmentPoolResourcesCache[subcultureKey][factionKey];
        -- Heroes
        local totalMaxSizeOfHeroPools = 0;
        local totalSizeOfDefaultHeroPools = 0;
        for heroPoolKey, heroPool in pairs(factionLimits.HeroPools) do
            totalMaxSizeOfHeroPools = totalMaxSizeOfHeroPools + heroPool.SubPoolMaxSize;
            if subcultureResources ~= nil
            and factionKey ~= humanFactionKey then
                for agentSubtypeKey, agentSubTypeData in pairs(heroPool.AgentSubTypes) do
                    if defaultLords[agentSubtypeKey] == true then
                        totalSizeOfDefaultHeroPools = totalSizeOfDefaultHeroPools + heroPool.SubPoolMaxSize;
                    end
                end
            end
        end
        if totalMaxSizeOfHeroPools - totalSizeOfDefaultHeroPools < factionLimits.HeroPoolMaxSize - totalSizeOfDefaultHeroPools then
            for i = 1, (factionLimits.HeroPoolMaxSize - totalMaxSizeOfHeroPools - totalSizeOfDefaultHeroPools) do
                if next(factionLimits.HeroPools) then
                    local selectedPoolKey = GetRandomObjectKeyFromList(factionLimits.HeroPools);
                    factionLimits.HeroPools[selectedPoolKey].SubPoolMaxSize = factionLimits.HeroPools[selectedPoolKey].SubPoolMaxSize + 1;
                end
            end
        end
        -- Lords
        local totalMaxSizeOfLordPools = 0;
        local totalSizeOfDefaultLordPools = 0;
        for factionPoolKey, factionPool in pairs(factionLimits.FactionPools) do
            totalMaxSizeOfLordPools = totalMaxSizeOfLordPools + factionPool.SubPoolMaxSize;
            if subcultureResources ~= nil
            and factionKey ~= humanFactionKey then
                for agentSubtypeKey, agentSubTypeData in pairs(factionPool.AgentSubTypes) do
                    if defaultLords[agentSubtypeKey] == true then
                        totalSizeOfDefaultLordPools = totalSizeOfDefaultLordPools + factionPool.SubPoolMaxSize;
                    end
                end
            end
        end
        if totalMaxSizeOfLordPools - totalSizeOfDefaultLordPools < factionLimits.LordPoolMaxSize - totalSizeOfDefaultLordPools then
            for i = 1, (factionLimits.LordPoolMaxSize - totalMaxSizeOfLordPools - totalSizeOfDefaultLordPools) do
                local selectedPoolKey = GetRandomObjectKeyFromList(factionLimits.FactionPools);
                factionLimits.FactionPools[selectedPoolKey].SubPoolMaxSize = factionLimits.FactionPools[selectedPoolKey].SubPoolMaxSize + 1;
            end
        end
    end
end