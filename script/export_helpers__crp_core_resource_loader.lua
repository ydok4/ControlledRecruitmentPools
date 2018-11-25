require 'script/_lib/pooldata/BeastmenRecruitmentPools'
require 'script/_lib/pooldata/BretonniaRecruitmentPools'
require 'script/_lib/pooldata/ChaosRecruitmentPools'
require 'script/_lib/pooldata/DarkElfRecruitmentPools'
require 'script/_lib/pooldata/DwarfRecruitmentPools'
require 'script/_lib/pooldata/EmpireRecruitmentPools'
require 'script/_lib/pooldata/GreenskinRecruitmentPools'
require 'script/_lib/pooldata/SavageOrcRecruitmentPools'
require 'script/_lib/pooldata/HighElfRecruitmentPools'
require 'script/_lib/pooldata/LizardmenRecruitmentPools'
require 'script/_lib/pooldata/NorscaRecruitmentPools'
require 'script/_lib/pooldata/SkavenRecruitmentPools'
require 'script/_lib/pooldata/VampireCoastRecruitmentPools'
require 'script/_lib/pooldata/VampireCountsRecruitmentPools'
require 'script/_lib/pooldata/WoodElfRecruitmentPools'

require 'script/_lib/pooldata/RogueArmyRecruitmentPools'

require 'script/_lib/pooldata/SharedRecruitmentPools'

require 'script/_lib/dbexports/AgentDataResources'
require 'script/_lib/dbexports/CustomAgentDataResources'
require 'script/_lib/dbexports/RebelLeadersDataResource'
require 'script/_lib/dbexports/NameGroupResources'
require 'script/_lib/dbexports/NameResources'

Custom_Log("Loading Core Data");

_G.CRPResources = {
    DBResources = {
        campaign_character_data = AgentDataResources,
        faction_to_name_groups = NameGroupResources,
        name_groups_to_names = NameResources,
    },
    CulturePoolResources = {
        -- Beastmen 
        wh_dlc03_sc_bst_beastmen = BeastmentRecruitmentPoolData,
        -- Bretonnia
        wh_main_sc_brt_bretonnia = BretonniaRecruitmentPoolData,
        -- Chaos
        wh_main_sc_chs_chaos = ChaosRecruitmentPoolData,
        -- Dark Elves
        wh2_main_sc_def_dark_elves = DarkElfRecruitmentPoolData,
        -- Dwarfs
        wh_main_sc_dwf_dwarfs = DwarfRecruitmentPoolData,
        -- Empire
        wh_main_sc_emp_empire = EmpireRecruitmentPoolData,
        -- Greenskins
        wh_main_sc_grn_greenskins = GreenskinRecruitmentPoolData,
        wh_main_sc_grn_savage_orcs = SavageOrcRecruitmentPoolData,
        -- High Elf
        wh2_main_sc_hef_high_elves = HighElfRecruitmentPoolData,
        -- Lizardmen
        wh2_main_sc_lzd_lizardmen = LizardmenRecruitmentPoolData,
        -- Norsca
        wh_main_sc_nor_norsca = NorscaRecruitmentPoolData,
        -- Skaven
        wh2_main_sc_skv_skaven = SkavenRecruitmentPoolData,
        -- Vampire Coast
        wh2_dlc11_sc_cst_vampire_coast = VampireCoastRecruitmentPoolData,
        -- Vampire Counts
        wh_main_sc_vmp_vampire_counts = VampireCountsRecruitmentPoolData,
        -- Wood Elf
        wh_dlc05_sc_wef_wood_elves = WoodElfRecruitmentPoolData,

        -- Shared Data (Traits mainly)
        shared = SharedRecruitmentPoolData,

        -- Rogue Armies
        wh_rogue_armies = RogueArmyRecruitmentPoolData,
    },
    --[[CultureSubTypeResources = {
        -- Empire
        wh_main_sc_emp_empire = EmpireSubTypeData,
    },--]]
    -- Additional loader function
    -- This is intended to be used by other mods to load custom data.
    -- This can be used to change agent sub type distribution or add
    -- new agent sub types into the system.
    AddAdditionalResources = function (subculture, resources)
        local coreResources = _G.CRPResources.CulturePoolResources[subculture];

        for key1, additionalFactionData in pairs(resources) do
            for key2, additionalSubPoolData in pairs(additionalFactionData.FactionPools) do
                if type(additionalSubPoolData) == "table" then
                    local existingData = coreResources[key1].FactionPools[key2];
                    if existingData == nil then
                        coreResources[key1].FactionPools[key2] = additionalSubPoolData;
                    else
                        local additionalAgenySubTypes = {};
                        for key3, subPool in pairs(additionalSubPoolData.AgentSubTypes) do
                            -- If an agent has been marked for deletion from a pool
                            if subPool == false then
                                existingData.AgentSubTypes[key3] = nil;
                            else
                                additionalAgenySubTypes[key3] = subPool;
                            end
                        end
                        -- Add all the new agent sub types
                        ConcatTableWithKeys(existingData.AgentSubTypes, additionalAgenySubTypes);
                        if additionalSubPoolData.SubPoolInitialMinSize ~= nil then
                            existingData.SubPoolInitialMinSize = additionalSubPoolData.SubPoolInitialMinSize;
                        end

                        if additionalSubPoolData.SubPoolMaxSize ~= nil then
                            existingData.SubPoolMaxSize = additionalSubPoolData.SubPoolMaxSize;
                        end
                    end
                -- If a pool has been marked for deletion or there are no longer any agent
                -- subTypes in it, remove the data
                elseif additionalSubPoolData == false or TableHasAnyValue(coreResources[key1].FactionPools[key2]) == false then
                    coreResources[key1].FactionPools[key2] = nil;
                end
            end
            -- Merge replacement data
            if additionalFactionData.LordsToReplace ~= nil then
                if coreResources[key1].LordsToReplace == nil then
                    coreResources[key1].LordsToReplace = {};
                end
                ConcatTableWithKeys(coreResources[key1].LordsToReplace, additionalFactionData.LordsToReplace);
            end

            -- Merge Trait data
            if additionalFactionData.Traits ~= nil then
                if coreResources[key1].Traits == nil then
                    coreResources[key1].Traits = {};
                end
                ConcatTableWithKeys(coreResources[key1].Traits, additionalFactionData.Traits);
            end

            -- Merge Excluded Trait data
            if additionalFactionData.ExcludedTraits ~= nil then
                if coreResources[key1].ExcludedTraits == nil then
                    coreResources[key1].ExcludedTraits = {};
                end
                ConcatTableWithKeys(coreResources[key1].ExcludedTraits, additionalFactionData.ExcludedTraits);
            end
        end
    end,
    AddAdditionalDBResources = function(dbResourceKey, resourceData)
        ConcatTableWithKeys(_G.CRPResources.DBResources[dbResourceKey], resourceData);
    end,
}

_G.CRPResources.AddAdditionalDBResources("campaign_character_data", CustomAgentDataResources);
_G.CRPResources.AddAdditionalDBResources("campaign_character_data", RebelLeadersDataResource);