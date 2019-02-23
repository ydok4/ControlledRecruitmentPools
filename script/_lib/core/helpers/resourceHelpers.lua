function IsSupportedSubCulture(subculture)
    if subculture == "rebels" or _G.CRPResources.CulturePoolResources[subculture] then
        return true;
    else
        return false;
    end
end

function IsRogueArmy(factionName)
    --Custom_Log("In rogue army check: "..factionName);
    if _G.CRPResources.CulturePoolResources["wh_rogue_armies"][factionName] then
        return true;
    else
        return false;
    end
end

function GetSubCulturePoolResources(cultureKey)
    Custom_Log("GetSubCulturePoolResources");
    Custom_Log("Getting culture pool resources "..cultureKey);
    local subCulturePoolResources = _G.CRPResources.CulturePoolResources[cultureKey][cultureKey];
    if subCulturePoolResources ~= nil then
        return subCulturePoolResources;
    end
    return {};
end

function IsUniquePoolResourcesForFaction(faction)
    --Custom_Log("IsUniquePoolResourcesForFaction");
    local subCulturePoolResources = _G.CRPResources.CulturePoolResources[faction:subculture()];
    --Custom_Log("Got faction subculture resources ");
    local factionName = faction:name();
    --Custom_Log("Got faction name");
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
    Custom_Log("No unique resources found");
    return false;
end

function GetFactionPoolResources(faction)
    local subCulturePoolResources = _G.CRPResources.CulturePoolResources[faction:subculture()];
    local factionName = faction:name();
    -- I couldn't store skull-takerz as a key in the lua table because of the -
    -- So this takes care of that edge case
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end

    if subCulturePoolResources == nil then
        return _G.CRPResources.CulturePoolResources["wh_rogue_armies"][factionName];
    elseif subCulturePoolResources[factionName] then
        --Custom_Log("Found resources for faction");
        return subCulturePoolResources[factionName];
    else
        return subCulturePoolResources[faction:subculture()];
    end
end
function GetReplacementLordsForFaction(faction)
    local factionResources = GetFactionPoolResources(faction);
    return factionResources.LordsToReplace;
end

function GetDefaultLordForFaction(faction)
    Custom_Log("Getting default lord for faction "..faction:name());
    local factionPoolResources = GetSubCulturePoolResources(faction:subculture());
    return factionPoolResources.DefaultLords;
end

function GetRewardsForFaction(faction)
    local factionResources = GetFactionPoolResources(faction);
    return factionResources.Rewards;
end

function SetSubCultureResourcesForFaction(faction)
    local subCulturePoolResources = _G.CRPResources.CulturePoolResources[faction:subculture()];
    local factionName = faction:name();
    -- I couldn't store skull-takerz as a key in the lua table because of the -
    -- So this takes care of that edge case
    if faction:name() == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end

    _G.CRPResources.CulturePoolResources[faction:subculture()][factionName] = subCulturePoolResources[faction:subculture()];
end

-- The pool limit should be greater than or equal to the highest Agent Sub Type
-- maximum limit in that pool
function RecalculatePoolLimits()
    Custom_Log("Recalculating pool limits");
    for subcultureKey, subcultureLimits in pairs(_G.CRPResources.CulturePoolResources) do
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