PoolModifier = {

}

function PoolModifier:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function PoolModifier:GiveReward(faction, factionPools, rewardData)
    Custom_Log("Giving rewards");
    if rewardData.Type == "increase" then
        self:ChangePoolViaValue(factionPools, rewardData, true);
    elseif rewardData.Type == "set" then
        self:SetPoolToValue(factionPools, rewardData);
    elseif rewardData.Type == "decrease" then
        self:ChangePoolViaValue(factionPools, rewardData, false);
    end
    if rewardData.IncreasePoolSize ~= nil then
        Custom_Log("Changing pool size");
        local oldSize = factionPools.PoolMaxSize;
        factionPools.PoolMaxSize = factionPools.PoolMaxSize + rewardData.IncreasePoolSize;
        self:UpdateArmyLimits(faction, factionPools, oldSize);
    end
    if rewardData.Events ~= nil and rewardData.Events.Incident ~= nil then
        cm:trigger_incident_with_targets(faction:command_queue_index(), rewardData.Events.Incident, faction:command_queue_index(), 0, 0, 0, 0, 0);
    end
end

function PoolModifier:ChangePoolViaValue(factionPools, rewardData, isPositive)
    local rewardList = rewardData.Pools;
    Custom_Log("Changing pool");
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

function PoolModifier:SetPoolToValue(factionPools, rewardData)
    local rewardList = rewardData.Pools;
    for poolKey, agentPoolData in pairs(rewardList) do
        factionPools.FactionPools[poolKey] = agentPoolData;
    end
end

function PoolModifier:CreateUniquePool(faction)
    SetSubCultureResourcesForFaction(faction);
end

function PoolModifier:UpdateArmyLimits(faction, factionPoolResources, oldSize)
    Custom_Log("Updating army limits");
    local factionName = faction:name();
    if factionPoolResources ~= nil then
        for i = oldSize + 1, factionPoolResources.PoolMaxSize do
            cm:apply_effect_bundle("wh2_dlc09_ritual_crafting_tmb_army_capacity_"..i, factionName, 0);
        end
    end
end