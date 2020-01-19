PoolModifier = {

}

function PoolModifier:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function PoolModifier:GiveReward(crp, faction, rewardData, cacheData)
    crp.Logger:Log("Giving reward: "..rewardData.Type);
    if rewardData.Type == "increase" then
        self:ChangePoolViaValue(faction, rewardData, true);
        local factionPools = GetFactionPoolResources(faction);
        for index, poolKey in pairs(rewardData.Pools) do
            crp.Logger:Log("Changing pool size: "..poolKey);
            if factionPools.HeroPools[poolKey] ~= nil then
                if rewardData.IncreasePoolSize ~= nil then
                    factionPools.HeroPoolMaxSize = cacheData.Amount * rewardData.IncreasePoolSize;
                end
            end
            if factionPools.FactionPools[poolKey] ~= nil then
                if rewardData.IncreasePoolSize ~= nil then
                    factionPools.LordPoolMaxSize = cacheData.Amount * rewardData.IncreasePoolSize;
                end
            end
        end
    elseif rewardData.Type == "set" then
        self:SetPoolToValue(faction, rewardData, cacheData);
    elseif rewardData.Type == "decrease" then
        self:ChangePoolViaValue(faction, rewardData, false);
    end
    crp.Logger:Log("Finished increasing pool size");
    if rewardData.Events ~= nil and rewardData.Events.Incident ~= nil then
        crp.Logger:Log("Triggering incident: "..rewardData.Events.Incident);
        cm:trigger_incident_with_targets(faction:command_queue_index(), rewardData.Events.Incident, faction:command_queue_index(), 0, 0, 0, 0, 0);
    end
end

function PoolModifier:ChangePoolViaValue(faction, rewardData, isPositive)
    local multiplier = -1;
    if isPositive == true then
        multiplier = 1;
    end

    local factionPools = GetFactionPoolResources(faction);
    local rewardList = rewardData.Pools;
    for index, poolKey in pairs(rewardList) do
        local defaultSubcultureResources = GetSubCulturePoolResources(faction:subculture());
        local subcultureResourcesForLordPool = defaultSubcultureResources.FactionPools[poolKey];
        if subcultureResourcesForLordPool ~= nil then
            if factionPools.FactionPools[poolKey] == nil then
                factionPools.FactionPools[poolKey] = {
                    AgentSubTypes = {};
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                };
                for agentSubTypeKey, agentSubTypeData in pairs(subcultureResourcesForLordPool) do
                    local correctAgentSubtypeKey = agentSubTypeKey;
                    if rewardData.RemapAgentKeys[agentSubTypeKey] then
                        correctAgentSubtypeKey = rewardData.RemapAgentKeys[agentSubTypeKey];
                    end
                    factionPools.FactionPools[poolKey].AgentSubTypes[correctAgentSubtypeKey] = {
                        MaximumPercentage = agentSubTypeData.MaximumPercentage,
                    };
                end
            end
            factionPools.FactionPools[poolKey].SubPoolMaxSize = factionPools.FactionPools[poolKey].SubPoolMaxSize + (rewardData.IncreasePoolSize * multiplier);
            --factionPools.LordPoolMaxSize = factionPools.LordPoolMaxSize + (1 * multiplier);
        end
        local subcultureResourcesForHeroPool = defaultSubcultureResources.HeroPools[poolKey];
        if subcultureResourcesForHeroPool ~= nil then
            if factionPools.HeroPools[poolKey] == nil then
                factionPools.HeroPools[poolKey] = {
                    AgentSubTypes = {};
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                };
                for agentSubTypeKey, agentSubTypeData in pairs(subcultureResourcesForHeroPool) do
                    local correctAgentSubtypeKey = agentSubTypeKey;
                    if rewardData.RemapAgentKeys[agentSubTypeKey] then
                        correctAgentSubtypeKey = rewardData.RemapAgentKeys[agentSubTypeKey];
                    end
                    factionPools.HeroPools[poolKey].AgentSubTypes[correctAgentSubtypeKey] = {
                        MaximumPercentage = agentSubTypeData.MaximumPercentage,
                    };
                end
            end
            factionPools.HeroPools[poolKey].SubPoolMaxSize = factionPools.HeroPools[poolKey].SubPoolMaxSize + (rewardData.IncreasePoolSize * multiplier);
            --factionPools.HeroPoolMaxSize = factionPools.HeroPoolMaxSize + (1 * multiplier);
        end
    end
end

function PoolModifier:SetPoolToValue(faction, rewardData, cacheData)
    local factionPools = GetFactionPoolResources(faction);
    local subcultureKey = faction:subculture();
    local subcultureResources = GetSubCulturePoolResources(subcultureKey);
    for index, poolKey in pairs(rewardData.Pools) do
        local amount = 0;
        if rewardData.UseLevelMultiplier == true then
            amount = cacheData.AmountWithLevels;
        else
            amount = cacheData.Amount;
        end
        if factionPools.HeroPools[poolKey] == nil
        and subcultureResources.HeroPools[poolKey] ~= nil then
            factionPools.HeroPools[poolKey] = subcultureResources.HeroPools[poolKey];
        end
        if factionPools.HeroPools[poolKey] ~= nil then
            factionPools.HeroPools[poolKey].SubPoolMaxSize = rewardData.IncreasePoolSize * amount;
            for agentSubtypeKey, agentSubtypeData in pairs(factionPools.HeroPools[poolKey].AgentSubTypes) do
                agentSubtypeData.MaximumPercentage = subcultureResources.HeroPools[poolKey].AgentSubTypes[agentSubtypeKey].MaximumPercentage;
            end
        end

        if factionPools.FactionPools[poolKey] == nil
        and subcultureResources.FactionPools[poolKey] ~= nil then
            factionPools.FactionPools[poolKey] = subcultureResources.FactionPools[poolKey];
        end
        if factionPools.FactionPools[poolKey] ~= nil then
            factionPools.FactionPools[poolKey].SubPoolMaxSize = rewardData.IncreasePoolSize * amount;
            for agentSubtypeKey, agentSubtypeData in pairs(factionPools.FactionPools[poolKey].AgentSubTypes) do
                agentSubtypeData.MaximumPercentage = subcultureResources.FactionPools[poolKey].AgentSubTypes[agentSubtypeKey].MaximumPercentage;
            end
        end
    end
end

function PoolModifier:CreateUniquePool(faction)
    SetSubCultureRecruitmentPoolsForFaction(faction);
end