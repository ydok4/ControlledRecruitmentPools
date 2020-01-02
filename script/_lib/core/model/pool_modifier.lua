PoolModifier = {

}

function PoolModifier:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function PoolModifier:GiveReward(faction, rewardData, cacheData)
    if rewardData.Type == "increase" then
        self:ChangePoolViaValue(faction, rewardData, true);
    elseif rewardData.Type == "set" then
        self:SetPoolToValue(faction, rewardData, cacheData);
    elseif rewardData.Type == "decrease" then
        self:ChangePoolViaValue(faction, rewardData, false);
    end
    if rewardData.IncreasePoolSize ~= nil then
        local factionPools = GetFactionPoolResources(faction);
        local oldSize = factionPools.LordPoolMaxSize;
        factionPools.LordPoolMaxSize = factionPools.LordPoolMaxSize + rewardData.IncreasePoolSize;
        self:UpdateArmyLimits(faction, factionPools, oldSize);
    end
    if rewardData.Events ~= nil and rewardData.Events.Incident ~= nil then
        cm:trigger_incident_with_targets(faction:command_queue_index(), rewardData.Events.Incident, faction:command_queue_index(), 0, 0, 0, 0, 0);
    end
end

function PoolModifier:ChangePoolViaValue(faction, rewardData, isPositive)
    local factionPools = GetFactionPoolResources(faction);
    local rewardList = rewardData.Pools;
    for poolKey, agentPoolData in pairs(rewardList) do
        if factionPools.FactionPools[poolKey] == nil then
            factionPools.FactionPools[poolKey] = {
                AgentSubTypes = {};
                SubPoolInitialMinSize = agentPoolData.SubPoolInitialMinSize,
                SubPoolMaxSize = agentPoolData.SubPoolMaxSize,
            };
            local factionPoolDataAgents = factionPools.FactionPools[poolKey].AgentSubTypes;
            for rewardedAgentKey, agentData in pairs(agentPoolData.AgentSubTypes) do
                local agentKey = rewardedAgentKey;
                if factionPools.RemapAgentKeys ~= nil
                and factionPools.RemapAgentKeys[agentKey] ~= nil then
                    agentKey = factionPools.RemapAgentKeys[agentKey];
                end
                factionPoolDataAgents[agentKey] = {
                    MinimumAmount = agentData.MinimumAmount,
                    MaximumAmount = agentData.MaximumAmount,
                };
            end
        else
            local existingRewardPool = factionPools.FactionPools[poolKey];
            local subTypesForPool =  existingRewardPool.AgentSubTypes;
            for rewardedAgentKey, agentData in pairs(agentPoolData.AgentSubTypes) do
                local agentKey = rewardedAgentKey;
                if factionPools.RemapAgentKeys ~= nil
                and factionPools.RemapAgentKeys[agentKey] ~= nil then
                    agentKey = factionPools.RemapAgentKeys[agentKey];
                end
                if subTypesForPool[agentKey] == nil then
                    subTypesForPool[agentKey] = {
                        MinimumAmount = 0,
                        MaximumAmount = 0,
                    };
                end
                if isPositive == true then
                    subTypesForPool[agentKey].MinimumAmount = subTypesForPool[agentKey].MinimumAmount + agentData.MinimumAmount;
                    subTypesForPool[agentKey].MaximumAmount = subTypesForPool[agentKey].MaximumAmount + agentData.MaximumAmount;
                else
                    subTypesForPool[agentKey].MinimumAmount = subTypesForPool[agentKey].MinimumAmount - agentData.MinimumAmount;
                    subTypesForPool[agentKey].MaximumAmount = subTypesForPool[agentKey].MaximumAmount - agentData.MaximumAmount;
                end
            end
            if isPositive then
                existingRewardPool.SubPoolInitialMinSize = existingRewardPool.SubPoolInitialMinSize + agentPoolData.SubPoolInitialMinSize;
                existingRewardPool.SubPoolMaxSize = existingRewardPool.SubPoolMaxSize + agentPoolData.SubPoolMaxSize;
            else
                existingRewardPool.SubPoolInitialMinSize = existingRewardPool.SubPoolInitialMinSize - agentPoolData.SubPoolInitialMinSize;
                existingRewardPool.SubPoolMaxSize = existingRewardPool.SubPoolMaxSize - agentPoolData.SubPoolMaxSize;
            end
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
        if factionPools.HeroPools[poolKey] == nil then
            factionPools.HeroPools[poolKey] = subcultureResources.HeroPools[poolKey];
        end
        if factionPools.HeroPools[poolKey] ~= nil then
            factionPools.HeroPools[poolKey].SubPoolMaxSize = rewardData.IncreasePoolSize * amount;
            for agentSubtypeKey, agentSubtypeData in pairs(factionPools.HeroPools[poolKey].AgentSubTypes) do
                agentSubtypeData.MaximumAmount = factionPools.HeroPools[poolKey].SubPoolMaxSize;
            end
        end

        if factionPools.FactionPools[poolKey] == nil
        and subcultureResources.FactionPools[poolKey] ~= nil then
            factionPools.FactionPools[poolKey] = subcultureResources.FactionPools[poolKey];
        end
        if factionPools.FactionPools[poolKey] ~= nil then
            factionPools.FactionPools[poolKey].SubPoolMaxSize = rewardData.IncreasePoolSize * amount;
            for agentSubtypeKey, agentSubtypeData in pairs(factionPools.FactionPools[poolKey].AgentSubTypes) do
                agentSubtypeData.MaximumAmount = factionPools.FactionPools[poolKey].SubPoolMaxSize;
            end
        end
    end
end

function PoolModifier:CreateUniquePool(faction)
    SetSubCultureResourcesForFaction(faction);
end

function PoolModifier:UpdateArmyLimits(faction, factionPoolResources, oldSize)
    local factionName = faction:name();
    if factionPoolResources ~= nil then
        for i = oldSize + 1, factionPoolResources.LordPoolMaxSize do
            cm:apply_effect_bundle("wh2_dlc09_ritual_crafting_tmb_army_capacity_"..i, factionName, 0);
        end
    end
end