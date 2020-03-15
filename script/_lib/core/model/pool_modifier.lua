PoolModifier = {

}

function PoolModifier:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function PoolModifier:GiveReward(crp, faction, rewardData, cacheData)
    if rewardData.Type == nil then
        if rewardData.RewardsForChoice ~= nil then
            rewardData = rewardData.RewardsForChoice[cacheData.ChoiceKey];
        end
    end
    crp.Logger:Log("Giving reward: "..rewardData.Type);
    if rewardData.Type == "increase" then
        self:ChangePoolViaValue(faction, rewardData, true);
    elseif rewardData.Type == "injectagent" then
        self:InjectAgentIntoPool(faction, rewardData, cacheData);
    elseif rewardData.Type == "set" then
        self:SetPoolToValue(faction, rewardData, cacheData);
    elseif rewardData.Type == "decrease" then
        self:ChangePoolViaValue(faction, rewardData, false);
    end
    if rewardData.CreateNewAgent == true then
        local agentSubTypeKey = "";
        if rewardData.CreateNewAgentSubTypeOverride ~= nil then
            agentSubTypeKey = rewardData.CreateNewAgentSubTypeOverride;
        else
            local isHumanFaction = faction:name() == crp.HumanFaction:name();
            local currentFactionPools = crp:GetCurrentPoolForFaction(faction);
            local poolKey = GetRandomObjectFromList(rewardData.Pools);
            local factionPoolResources = GetFactionPoolResources(faction);
            local poolResources = {};
            if factionPoolResources.HeroPools[poolKey] ~= nil then
                poolResources = factionPoolResources.HeroPools[poolKey];
            else
                poolResources = factionPoolResources.FactionPools[poolKey];
            end
            agentSubTypeKey = crp:SelectCharacterToGenerateFromSpecifiedPool(poolResources, currentFactionPools, isHumanFaction);
        end
        local artSetId = crp.CharacterGenerator:GetArtSetForSubType(agentSubTypeKey);
        -- If this is the players faction this should happen straight away - Not right now.
        -- so the recruitment event message can be supressed
        cm:callback(function()
            crp:GenerateCharacter(agentSubTypeKey, faction, artSetId);
            crp.Logger:Log_Finished();
        end, 1);
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
                    SubPoolBonusSize = 0,
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
            factionPools.FactionPools[poolKey].SubPoolBonusSize = factionPools.FactionPools[poolKey].SubPoolBonusSize + (rewardData.IncreasePoolSize * multiplier); 
            factionPools.FactionPools[poolKey].SubPoolMaxSize = factionPools.FactionPools[poolKey].SubPoolMaxSize + factionPools.FactionPools[poolKey].SubPoolBonusSize;
        end
        local subcultureResourcesForHeroPool = defaultSubcultureResources.HeroPools[poolKey];
        if subcultureResourcesForHeroPool ~= nil then
            if factionPools.HeroPools[poolKey] == nil then
                factionPools.HeroPools[poolKey] = {
                    AgentSubTypes = {};
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                    SubPoolBonusSize = 0,
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
            factionPools.HeroPools[poolKey].SubPoolBonusSize = factionPools.HeroPools[poolKey].SubPoolBonusSize + (rewardData.IncreasePoolSize * multiplier); 
            factionPools.HeroPools[poolKey].SubPoolMaxSize = factionPools.HeroPools[poolKey].SubPoolMaxSize + factionPools.HeroPools[poolKey].SubPoolBonusSize;
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
            factionPools.HeroPools[poolKey].SubPoolMaxSize = rewardData.IncreasePoolSize * amount + factionPools.HeroPools[poolKey].SubPoolBonusSize;
            for agentSubtypeKey, agentSubtypeData in pairs(factionPools.HeroPools[poolKey].AgentSubTypes) do
                agentSubtypeData.MaximumPercentage = subcultureResources.HeroPools[poolKey].AgentSubTypes[agentSubtypeKey].MaximumPercentage;
            end
        end

        if factionPools.FactionPools[poolKey] == nil
        and subcultureResources.FactionPools[poolKey] ~= nil then
            factionPools.FactionPools[poolKey] = subcultureResources.FactionPools[poolKey];
        end
        if factionPools.FactionPools[poolKey] ~= nil then
            factionPools.FactionPools[poolKey].SubPoolMaxSize = rewardData.IncreasePoolSize * amount + factionPools.FactionPools[poolKey].SubPoolBonusSize;
            for agentSubtypeKey, agentSubtypeData in pairs(factionPools.FactionPools[poolKey].AgentSubTypes) do
                if factionPools.FactionPools[poolKey] ~= nil
                and factionPools.FactionPools[poolKey].AgentSubTypes[agentSubtypeKey] ~= nil then
                    agentSubtypeData.MaximumPercentage = factionPools.FactionPools[poolKey].AgentSubTypes[agentSubtypeKey].MaximumPercentage;
                else
                    agentSubtypeData.MaximumPercentage = subcultureResources.FactionPools[poolKey].AgentSubTypes[agentSubtypeKey].MaximumPercentage;
                end
            end
        end
    end
end

function PoolModifier:InjectAgentIntoPool(faction, rewardData, cacheData)
    local factionPools = GetFactionPoolResources(faction);
    local subcultureKey = faction:subculture();
    local subcultureResources = GetSubCulturePoolResources(subcultureKey);
    local numberOfSubtypes = 0;
    if rewardData.CreateNewAgentSubTypeOverride ~= nil then
        numberOfSubtypes = numberOfSubtypes + 1;
    end
    for index, poolKey in pairs(rewardData.Pools) do
        -- Check if we are injecting a hero pool
        if factionPools.HeroPools[poolKey] == nil
        and subcultureResources.HeroPools[poolKey] ~= nil then
            factionPools.HeroPools[poolKey] = subcultureResources.HeroPools[poolKey];
        end
        if factionPools.HeroPools[poolKey] ~= nil then
            -- Increase the pool size
            factionPools.HeroPools[poolKey].SubPoolMaxSize = factionPools.HeroPools[poolKey].SubPoolMaxSize + 1;
            -- Count the number of agents already in the pool
            for agentSubtypeKey, agentSubtypeData in pairs(factionPools.HeroPools[poolKey].AgentSubTypes) do
                numberOfSubtypes = numberOfSubtypes + 1;
            end
            -- Change the existing agents percentage
            for agentSubtypeKey, agentSubtypeData in pairs(factionPools.HeroPools[poolKey].AgentSubTypes) do
                agentSubtypeData.MaximumPercentage = 100 / numberOfSubtypes;
            end
            -- Change the new agents percentage
            if rewardData.CreateNewAgentSubTypeOverride ~= nil then
                factionPools.HeroPools[poolKey].AgentSubTypes[rewardData.CreateNewAgentSubTypeOverride] = {
                    MaximumPercentage = 100 / numberOfSubtypes;
                };
            end
        end
        -- Check if we are injecting a faction pool
        if factionPools.FactionPools[poolKey] == nil
        and subcultureResources.FactionPools[poolKey] ~= nil then
            factionPools.FactionPools[poolKey] = subcultureResources.FactionPools[poolKey];
        end
        if factionPools.FactionPools[poolKey] ~= nil then
            -- Increase the pool size
            factionPools.FactionPools[poolKey].SubPoolMaxSize = factionPools.FactionPools[poolKey].SubPoolMaxSize + 1;
            -- Count the number of agents already in the pool
            for agentSubtypeKey, agentSubtypeData in pairs(factionPools.FactionPools[poolKey].AgentSubTypes) do
                numberOfSubtypes = numberOfSubtypes + 1;
            end
            -- Change the existing agents percentage
            for agentSubtypeKey, agentSubtypeData in pairs(factionPools.FactionPools[poolKey].AgentSubTypes) do
                agentSubtypeData.MaximumPercentage = 100 / numberOfSubtypes;
            end
            -- Change the new agents percentage
            if rewardData.CreateNewAgentSubTypeOverride ~= nil then
                factionPools.FactionPools[poolKey].AgentSubTypes[rewardData.CreateNewAgentSubTypeOverride] = {
                    MaximumPercentage = 100 / numberOfSubtypes;
                };
            end
        end
    end
end

function PoolModifier:CreateUniquePool(faction)
    SetSubCultureRecruitmentPoolsForFaction(faction);
end