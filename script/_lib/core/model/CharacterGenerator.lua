CharacterGenerator = {
    CrpLordsInPools = {},
    Logger = {},
}

function CharacterGenerator:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function CharacterGenerator:Initialise(crpLords, enableLogging)
    self.Logger = Logger:new({});
    self.Logger:Initialise("CharacterGenerator.txt", enableLogging);
    self.Logger:Log_Start();
    RecalculatePoolLimits();
    -- If crplords is nil it wipes the key
    self.CrpLordsInPools = crpLords;
    -- Load add ons
    -- Load Gunking's elf names
    local newElfNameKey = effect.get_localised_string("names_name_1550000001");
    if newElfNameKey ~= nil
    and newElfNameKey ~= "" then
        require 'script/_lib/dbexports/NameGenerator/GunkingElfNameGroupResources'
        require 'script/_lib/dbexports/NameGenerator/GunkingElfNameResources'
        --self.Logger:Log("NameGenerator: Loading Gunking Elf Names");
        _G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.name_groups_to_names, GetGunkingElfNameResources());
        _G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.faction_to_name_groups, GetGunkingElfNameGroupResources());
    end
    -- Load Gunking's skaven/lizardmen names
    local newSkavenLizardmenNameKey = effect.get_localised_string("names_name_1313000111");
    if newSkavenLizardmenNameKey ~= nil
    and newSkavenLizardmenNameKey ~= "" then
        require 'script/_lib/dbexports/NameGenerator/GunkingSkavenLizardmenNameGroupResources'
        require 'script/_lib/dbexports/NameGenerator/GunkingSkavenLizardmenNameResources'
        --self.Logger:Log("NameGenerator: Loading Gunking Skaven/Lizardmen Names");
        _G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.name_groups_to_names, GetGunkingSkavenLizardmenNameResources());
        _G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.faction_to_name_groups, GetGunkingSkavenLizardmenNameGroupResources());
    end
end

function CharacterGenerator:GetArtSetForSubType(subType)
    if not _G.CG_NameResources then
        self.Logger:Log("ERROR: Missing Name resources");
        return;
    end
    self.Logger:Log("Getting art set for sub type: "..subType);
    local subTypeData = _G.CG_NameResources.campaign_character_data[subType];
    if subTypeData == nil then
        self.Logger:Log("ERROR: Missing SubTypeData");
        return nil;
    end
    if subTypeData.ArtSetIds == nil then
        self.Logger:Log("ERROR: Missing subtype ArtSetIds");
        return nil;
    end
    local artSetId = GetRandomObjectFromList(subTypeData.ArtSetIds);
    return artSetId;
end

function CharacterGenerator:GetSubtypeData(subType)
    if not _G.CG_NameResources then
        self.Logger:Log("ERROR: Missing Name resources");
        return;
    end
    return _G.CG_NameResources.campaign_character_data[subType];
end

function CharacterGenerator:GetAgentTypeForSubtype(subType)
    if not _G.CG_NameResources then
        self.Logger:Log("ERROR: Missing Name resources");
        return;
    end
    self.Logger:Log("Getting agent type for sub type: "..subType);
    local subTypeData = _G.CG_NameResources.campaign_character_data[subType];
    if subTypeData == nil then
        self.Logger:Log("ERROR: Missing SubTypeData");
        return nil;
    end
    if subTypeData.AgentType == nil then
        self.Logger:Log("ERROR: Missing subtype AgentType");
        return nil;
    end
    return subTypeData.AgentType;
end

function CharacterGenerator:GetValidAgentArtSetForFaction(faction)
    local currentFactionPools = self:GetCurrentPoolForFaction(faction);
    currentFactionPools["total"] = nil;
    local agentSubType = GetRandomObjectKeyFromList(currentFactionPools);
    self.Logger:Log("Selected random agent sub type "..agentSubType);

    if agentSubType == "vmp_lord_replacement" then
        self.Logger:Log("Current faction pools is null, try and get an art set from the faction pool resources");
        local factionPoolResources = GetFactionPoolResources(faction);
        --self.Logger:Log("Got faction pools resources for faction");
        local poolData = GetRandomObjectFromList(factionPoolResources.FactionPools);
        --self.Logger:Log("Got poolkey");
        local agentSubTypeKey = GetRandomObjectKeyFromList(poolData.AgentSubTypes);
        --self.Logger:Log("Selected "..agentSubTypeKey);
        local artSetId = self:GetArtSetForSubType(agentSubTypeKey);
        --self.Logger:Log("Got artset "..artSetId);
        return artSetId;
    end

    local artSetId = self:GetArtSetForSubType(agentSubType);
    --self.Logger:Log("Selected random art set for sub type: "..artSetId);
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
    self.Logger:Log("Getting name for "..nameGroup);
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
    if namePool == nil then
        self.Logger:Log("ERROR: Missing name pool");
        return nil;
    end
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
        self.Logger:Log("Generated name key is "..nameKey);
        doOnce = true;
        if factionLords == nil and nameKey ~= "" then
            self.Logger:Log("No tracked lords. Using first generated name.");
            break;
        elseif failSafe == 5 then
            self.Logger:Log("ERROR: Not able to generate name");
            return nil;
        else
            failSafe = failSafe + 1;
        end
    end

    local generatedName = {
        clan_name = clan_name_object.Id,
        forename = forename_object.Id,
    };
    --self.Logger:Log("Got generated name");
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
        --self.Logger:Log("Generating name "..randomName);
        local nameId = nameTypes[randomName];
        --self.Logger:Log("Name id "..nameId);
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
    local agentResources = _G.CG_NameResources.campaign_character_data[agentSubType];
    if agentResources ~= nil then
        return agentResources.IsFemale == "true";
    end
    self.Logger:Log("Error: Could not find agent resources");
end

function CharacterGenerator:GetRandomCharacterTrait(faction, generalSubType)
    local subculture = faction:subculture();
    local factionName = faction:name();
    if factionName == "wh_main_grn_skull-takerz" then
        factionName = "wh_main_grn_skull_takerz";
    end

    local cultureData = _G.CRPResources.RecruitmentPoolResources[subculture];
    if cultureData == nil then
        cultureData = _G.CRPResources.RecruitmentPoolResources["wh_rogue_armies"];
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
    local sharedTraits = _G.CRPResources.RecruitmentPoolResources["shared"]["shared"].Traits;

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
    --self.Logger:Log("Getting random trait for originalSubType "..originalSubType);
    if factionPoolResources.LordsToReplace == nil then
        --self.Logger:Log("No lords to replace");
        return "";
    end
    local traitPool = factionPoolResources.LordsToReplace[originalSubType].traitKeyPool;
    if traitPool == nil then
        --self.Logger:Log("Trait pool is null");
        return "";
    end
    local selectedTrait = GetRandomObjectFromList(traitPool);
    --self.Logger:Log("Trait selected: "..selectedTrait)
    return selectedTrait;
end