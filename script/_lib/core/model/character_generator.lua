CharacterGenerator = {
    CrpLordsInPools = {};
}

function CharacterGenerator:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function CharacterGenerator:Initialise(crpLords)
    RecalculatePoolLimits();
    -- If crplords is nil it wipes the key
    self.CrpLordsInPools = crpLords;
end

function CharacterGenerator:GetArtSetForSubType(subType)
    if not _G.CRPResources then
        return;
    end
    Custom_Log("Getting art set for sub type: "..subType);
    local subTypeData = _G.CRPResources.DBResources.campaign_character_data[subType];
    if subTypeData == nil then
        Custom_Log("ERROR: Missing SubTypeData");
        return nil;
    end
    if subTypeData.ArtSetIds == nil then
        Custom_Log("ERROR: Missing subtype ArtSetIds");
        return nil;
    end
    local artSetId = GetRandomObjectFromList(subTypeData.ArtSetIds);
    return artSetId;
end

function CharacterGenerator:GetValidAgentArtSetForFaction(faction)
    local currentFactionPools = self:GetCurrentPoolForFaction(faction);
    currentFactionPools["total"] = nil;
    local agentSubType = GetRandomObjectKeyFromList(currentFactionPools);
    Custom_Log("Selected random agent sub type "..agentSubType);

    if agentSubType == "vmp_lord_replacement" then
        Custom_Log("Current faction pools is null, try and get an art set from the faction pool resources");
        local factionPoolResources = GetFactionPoolResources(faction);
        --Custom_Log("Got faction pools resources for faction");
        local poolData = GetRandomObjectFromList(factionPoolResources.FactionPools);
        --Custom_Log("Got poolkey");
        local agentSubTypeKey = GetRandomObjectKeyFromList(poolData.AgentSubTypes);
        --Custom_Log("Selected "..agentSubTypeKey);
        local artSetId = self:GetArtSetForSubType(agentSubTypeKey);
        --Custom_Log("Got artset "..artSetId);
        return artSetId;
    end

    local artSetId = self:GetArtSetForSubType(agentSubType);
    --Custom_Log("Selected random art set for sub type: "..artSetId);
    return artSetId;
end

function CharacterGenerator:GetRegionForFaction(faction)
    if faction:home_region() and faction:home_region():is_null_interface() == false then
        return faction:home_region():name();
    else
        return "";
    end
end

function CharacterGenerator:GetCharacterNameForSubculture(faction, agentSubType)
    local factionName = faction:name();
    if factionName == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end
    local factionSubculture = faction:subculture();

    local nameGroup = -1;
    local dbFactionNameGroup = _G.CG_NameResources.faction_to_name_groups[factionName];
    if dbFactionNameGroup ~= nil then
        nameGroup = dbFactionNameGroup.NameGroup;
    else
        local factionSubCulture = faction:subculture();
        local dbSubcultureNameGroup = _G.CG_NameResources.subculture_to_name_groups[factionSubCulture];
        if dbSubcultureNameGroup ~= nil then
            nameGroup = dbSubcultureNameGroup.NameGroup;
        end
    end

    nameGroup = "name_group_"..nameGroup;
    local namePool = _G.CG_NameResources.name_groups_to_names[nameGroup];
    local canUseFemaleNames = self:GetGenderForAgentSubType(agentSubType);

    local doOnce = false;
    local nameKey = "";
    local clan_name_object = "";
    local forename_object = "";
    local forename_chance = self:GetForeNameChance(factionSubculture);

    local factionLords = {};
    if self.CrpLordsInPools ~= nil then
        factionLords = self.CrpLordsInPools[factionName];
    end

    local failSafe = 0;
    while doOnce == false or factionLords == nil or factionLords[nameKey] ~= nil or nameKey == "" do
        clan_name_object = self:GetValidNameForType(namePool, canUseFemaleNames, "clan_name");
        if Roll100(forename_chance) then
            forename_object = self:GetValidNameForType(namePool, canUseFemaleNames, "forename");
        else
            forename_object = {};
            forename_object.Text = "";
            forename_object.Id = "";
        end

        nameKey = clan_name_object.Text..forename_object.Text;
        nameKey = CreateValidLuaTableKey(nameKey);
        Custom_Log("Generated name key is "..nameKey);
        doOnce = true;
        if factionLords == nil and nameKey ~= "" then
            Custom_Log("No tracked lords. Using first generated name.");
            break;
        elseif failSafe == 5 then
            Custom_Log("ERROR: Not able to generate name");
            return nil;
        else
            failSafe = failSafe + 1;
        end
    end

    local generatedName = {
        clan_name = clan_name_object.Id,
        forename = forename_object.Id,
    };
    --Custom_Log("Got generated name");
    return generatedName;
end

function CharacterGenerator:GetForeNameChance(factionSubculture)
    if factionSubculture == "wh_main_sc_chs_chaos" then
        return 100 - 60;
    elseif factionSubculture == "wh2_main_sc_skv_skaven" then
        return 100 - 75;
    elseif factionSubculture == "wh_main_sc_nor_norsca" then
        return 100 - 30;
    elseif factionSubculture == "wh_dlc03_sc_bst_beastmen" then
        return 100 - 75;
    elseif factionSubculture == "wh_main_sc_grn_greenskins" or factionSubculture == "wh_main_sc_grn_savage_orcs" then
        return 100 - 40;
    end
    return 100;
end

function CharacterGenerator:GetValidNameForType(namePool, canUseFemaleNames, nameType)
    local nameTypes = nil;
    if canUseFemaleNames and nameType == "clan_name" then
        nameTypes = namePool.Gender["Female"][nameType];
    else
        if namePool.Gender["Male"] ~= nil and namePool.Gender["Special"]  ~= nil then
            if namePool.Gender["Male"][nameType] ~= nil then
                nameTypes = {};
                ConcatTableWithKeys(nameTypes, namePool.Gender["Male"][nameType]);
            end
            if namePool.Gender["Special"][nameType] ~= nil then
                if nameTypes == nil then
                    nameTypes = {};
                end
                ConcatTableWithKeys(nameTypes, namePool.Gender["Special"][nameType]);
            end
        elseif namePool.Gender["Male"] ~= nil then
            nameTypes = namePool.Gender["Male"][nameType];
        elseif namePool.Gender["Special"]  ~= nil then
            nameTypes = namePool.Gender["Special"][nameType];
        end
    end

    if nameTypes ~= nil then
        local randomName = GetRandomObjectKeyFromList(nameTypes);
        --Custom_Log("Generating name "..randomName);
        local nameId = nameTypes[randomName];
        --Custom_Log("Name id "..nameId);
        local nameObject = {
            Id = "names_name_"..tostring(nameId),
            Text = randomName,
        };
        return nameObject;
    end
    local nameObject = {
        Id = "",
        Text = "",
    };
    return nameObject;
end

function CharacterGenerator:GetGenderForAgentSubType(agentSubType)
    local agentResources = _G.CRPResources.DBResources.campaign_character_data[agentSubType];
    if agentResources ~= nil then
        return agentResources.IsFemale == "true";
    end
    Custom_Log("Error: Could not find agent resources");
end

function CharacterGenerator:GetRandomCharacterTrait(faction, generalSubType)
    local subculture = faction:subculture();
    local factionName = faction:name();
    if factionName == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end

    local cultureData = _G.CRPResources.CulturePoolResources[subculture];
    if cultureData == nil then
        cultureData = _G.CRPResources.CulturePoolResources["wh_rogue_armies"];
    end

    local defaultSubCultureData = cultureData[subculture];

    local cultureTraits = {};
    local foundCultureTraits = false;
    -- Get traits for the subculture
    if defaultSubCultureData ~= nil and defaultSubCultureData.Traits ~= nil then
        ConcatTableWithKeys(cultureTraits, defaultSubCultureData.Traits);
        foundCultureTraits = true;
    end

    local defaultFactionData = cultureData[factionName];
    -- Then get the traits for the factions
    if defaultFactionData ~= nil and defaultFactionData.Traits ~= nil then
        ConcatTableWithKeys(cultureTraits, defaultFactionData.Traits);
        foundCultureTraits = true;
    end

    if defaultFactionData ~= nil and defaultFactionData.ExcludedTraits ~= nil then
        -- Then remove any excluded traits
        for index, traitKey in pairs(defaultFactionData.ExcludedTraits) do
            if cultureTraits[traitKey] ~= nil then
                cultureTraits[traitKey] = nil;
            end
        end
    end

    -- There is a flat 50% chance to get a culture / faction trait
    if foundCultureTraits == true and Roll100(50) then
        return GetRandomObjectKeyFromList(cultureTraits);
    end

    -- Otherwise get a random trait from the shared traits
    local sharedTraits = _G.CRPResources.CulturePoolResources["shared"]["shared"].Traits;

    if defaultFactionData ~= nil and defaultFactionData.ExcludedTraits ~= nil then
        -- Then remove any excluded traits
        for index, traitKey in pairs(defaultFactionData.ExcludedTraits) do
            if sharedTraits[traitKey] ~= nil then
                sharedTraits[traitKey] = nil;
            end
        end
    end

    if defaultSubCultureData ~= nil and defaultSubCultureData.ExcludedTraits ~= nil then
        -- Then remove any excluded traits
        for index, traitKey in pairs(defaultSubCultureData.ExcludedTraits) do
            if sharedTraits[traitKey] ~= nil then
                sharedTraits[traitKey] = nil;
            end
        end
    end

    return GetRandomObjectKeyFromList(sharedTraits)
end

function CharacterGenerator:GetRandomTraitForLord(factionPoolResources, originalSubType)
    --Custom_Log("Getting random trait for originalSubType "..originalSubType);
    if factionPoolResources.LordsToReplace == nil then
        --Custom_Log("No lords to replace");
        return "";
    end
    local traitPool = factionPoolResources.LordsToReplace[originalSubType].traitKeyPool;
    if traitPool == nil then
        --Custom_Log("Trait pool is null");
        return "";
    end
    local selectedTrait = GetRandomObjectFromList(traitPool);
    --Custom_Log("Trait selected: "..selectedTrait)
    return selectedTrait;
end