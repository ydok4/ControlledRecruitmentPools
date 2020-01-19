require 'script/_lib/pooldata/subcultureresources/BeastmenSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/BretonniaSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/ChaosSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/DarkElfSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/DwarfsSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/EmpireSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/GreenskinSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/SavageOrcSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/KislevSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/HighElfSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/LizardmenSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/NorscanSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/SkavenSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/TEBSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/TombKingsSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/VampireCoastSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/VampireCountsSubcultureResources'
require 'script/_lib/pooldata/subcultureresources/WoodElfSubcultureResources'

require 'script/_lib/pooldata/recruitmentpools/BeastmenRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/BretonniaRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/ChaosRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/DarkElfRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/DwarfRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/EmpireRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/GreenskinRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/KislevRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/SavageOrcRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/HighElfRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/LizardmenRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/NorscaRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/SkavenRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/TEBRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/TombKingsRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/VampireCoastRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/VampireCountsRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/WoodElfRecruitmentPools'

--require 'script/_lib/pooldata/recruitmentpools/RogueArmyRecruitmentPools'

--require 'script/_lib/pooldata/SharedRecruitmentPools'

out("CRP: Loading Core Data");

_G.CRPResources = {
    SubcultureResources = {
        -- Beastmen
        wh_dlc03_sc_bst_beastmen = GetBeastmenSubcultureResources(),
        -- Bretonnia
        wh_main_sc_brt_bretonnia = GetBretonniaSubcultureResources(),
        -- Chaos
        wh_main_sc_chs_chaos = GetChaosSubcultureResources(),
        -- Dark Elves
        wh2_main_sc_def_dark_elves = GetDarkElfSubcultureResources(),
        -- Dwarfs
        wh_main_sc_dwf_dwarfs = GetDwarfsSubcultureResources(),
        -- Empire
        wh_main_sc_emp_empire = GetEmpireSubcultureResources(),
        -- Greenskins
        wh_main_sc_grn_greenskins = GetGreenskinSubcultureResources(),
        wh_main_sc_grn_savage_orcs = GetSavageOrcSubcultureResources(),
        -- Kislev
        wh_main_sc_ksl_kislev = GetKislevSubcultureResources(),
        -- High Elf
        wh2_main_sc_hef_high_elves = GetHighElfSubcultureResources(),
        -- Lizardmen
        wh2_main_sc_lzd_lizardmen = GetLizardmenSubcultureResources(),
        -- Norsca
        wh_main_sc_nor_norsca = GetNorscanSubcultureResources(),
        -- Skaven
        wh2_main_sc_skv_skaven = GetSkavenSubcultureResources(),
        -- TEB
        wh_main_sc_teb_teb = GetTEBSubcultureResources(),
        -- Tomb Kings
        wh2_dlc09_sc_tmb_tomb_kings = GetTombKingsSubcultureResources(),
        -- Vampire Coast
        wh2_dlc11_sc_cst_vampire_coast = GetVampireCoastSubcultureResources(),
        -- Vampire Counts
        wh_main_sc_vmp_vampire_counts = GetVampireCountsSubcultureResources(),
        -- Wood Elf
        wh_dlc05_sc_wef_wood_elves = GetWoodElfSubcultureResources(),
    },
    RecruitmentPoolResources = {
        -- Beastmen
        wh_dlc03_sc_bst_beastmen = GetBeastmenRecruitmentPoolData(),
        -- Bretonnia
        wh_main_sc_brt_bretonnia = GetBretonniaRecruitmentPoolData(),
        -- Chaos
        wh_main_sc_chs_chaos = GetChaosRecruitmentPoolData(),
        -- Dark Elves
        wh2_main_sc_def_dark_elves = GetDarkElfRecruitmentPoolData(),
        -- Dwarfs
        wh_main_sc_dwf_dwarfs = GetDwarfRecruitmentPoolData(),
        -- Empire
        wh_main_sc_emp_empire = GetEmpireRecruitmentPoolData(),
        -- Greenskins
        wh_main_sc_grn_greenskins = GetGreenskinRecruitmentPoolData(),
        wh_main_sc_grn_savage_orcs = GetSavageOrcRecruitmentPoolData(),
        -- Kislev
        wh_main_sc_ksl_kislev = GetKislevRecruitmentPools(),
        -- High Elf
        wh2_main_sc_hef_high_elves = GetHighElfRecruitmentPoolData(),
        -- Lizardmen
        wh2_main_sc_lzd_lizardmen = GetLizardmenRecruitmentPoolData(),
        -- Norsca
        wh_main_sc_nor_norsca = GetNorscaRecruitmentPoolData(),
        -- Skaven
        wh2_main_sc_skv_skaven = GetSkavenRecruitmentPoolData(),
        -- TEB
        wh_main_sc_teb_teb = GetTEBRecruitmentPools(),
        -- Tomb Kings
        wh2_dlc09_sc_tmb_tomb_kings = GetTombKingsRecruitmentPools(),
        -- Vampire Coast
        wh2_dlc11_sc_cst_vampire_coast = GetVampireCoastRecruitmentPoolData(),
        -- Vampire Counts
        wh_main_sc_vmp_vampire_counts = GetVampireCountsRecruitmentPoolData(),
        -- Wood Elf
        wh_dlc05_sc_wef_wood_elves = GetWoodElfRecruitmentPoolData(),

        -- Shared Data (Traits mainly)
        --shared = SharedRecruitmentPoolData,

        -- Rogue Armies
        --wh_rogue_armies = RogueArmyRecruitmentPoolData,
    },

    -- Additional loader function
    -- This is intended to be used by other mods to load custom data.
    -- This can be used to change agent sub type distribution or add
    -- new agent sub types into the system.
    AddAdditionalRecruitmentPoolResources = function (subculture, resources)
        local coreResources = _G.CRPResources.RecruitmentPoolResources[subculture];

        for key1, additionalFactionData in pairs(resources) do
            if additionalFactionData.FactionPools ~= nil then
                for key2, additionalSubPoolData in pairs(additionalFactionData.FactionPools) do
                    if type(additionalSubPoolData) == "table" then
                        if coreResources[key1] == nil then
                            coreResources[key1] = additionalFactionData;
                        else
                            local existingData = coreResources[key1].FactionPools[key2];
                            if existingData == nil then
                                coreResources[key1].FactionPools[key2] = additionalSubPoolData;
                            else
                                local additionalAgentSubTypes = {};
                                for key3, subPool in pairs(additionalSubPoolData.AgentSubTypes) do
                                    -- If an agent has been marked for deletion from a pool
                                    if subPool == false then
                                        existingData.AgentSubTypes[key3] = nil;
                                    else
                                        additionalAgentSubTypes[key3] = subPool;
                                    end
                                end
                                -- Add all the new agent sub types
                                ConcatTableWithKeys(existingData.AgentSubTypes, additionalAgentSubTypes);
                                if additionalSubPoolData.SubPoolInitialMinSize ~= nil then
                                    existingData.SubPoolInitialMinSize = additionalSubPoolData.SubPoolInitialMinSize;
                                end

                                if additionalSubPoolData.SubPoolMaxSize ~= nil then
                                    existingData.SubPoolMaxSize = additionalSubPoolData.SubPoolMaxSize;
                                end
                            end
                        end
                    -- If a pool has been marked for deletion or there are no longer any agent
                    -- subTypes in it, remove the data
                    elseif additionalSubPoolData == false or TableHasAnyValue(coreResources[key1].FactionPools[key2]) == false then
                        coreResources[key1].FactionPools[key2] = nil;
                    end
                end
            end
            -- Now we do the heroes
            if additionalFactionData.HeroPools ~= nil then
                for key2, additionalSubPoolData in pairs(additionalFactionData.HeroPools) do
                    if type(additionalSubPoolData) == "table" then
                        if coreResources[key1] == nil then
                            coreResources[key1] = additionalFactionData;
                        else
                            if coreResources[key1].HeroPools == nil then
                                coreResources[key1].HeroPools = {};
                            end
                            local existingData = coreResources[key1].HeroPools[key2];
                            if existingData == nil then
                                coreResources[key1].HeroPools[key2] = additionalSubPoolData;
                            else
                                local additionalAgentSubTypes = {};
                                for key3, subPool in pairs(additionalSubPoolData.AgentSubTypes) do
                                    -- If an agent has been marked for deletion from a pool
                                    if subPool == false then
                                        existingData.AgentSubTypes[key3] = nil;
                                    else
                                        additionalAgentSubTypes[key3] = subPool;
                                    end
                                end
                                -- Add all the new agent sub types
                                ConcatTableWithKeys(existingData.AgentSubTypes, additionalAgentSubTypes);
                                if additionalSubPoolData.SubPoolInitialMinSize ~= nil then
                                    existingData.SubPoolInitialMinSize = additionalSubPoolData.SubPoolInitialMinSize;
                                end

                                if additionalSubPoolData.SubPoolMaxSize ~= nil then
                                    existingData.SubPoolMaxSize = additionalSubPoolData.SubPoolMaxSize;
                                end
                            end
                        end
                    -- If a pool has been marked for deletion or there are no longer any agent
                    -- subTypes in it, remove the data
                    elseif additionalSubPoolData == false or TableHasAnyValue(coreResources[key1].HeroPools[key2]) == false then
                        coreResources[key1].HeroPools[key2] = nil;
                    end
                end
            end
            -- Merge replacement data
            if additionalFactionData.LordsToReplace ~= nil then
                if coreResources[key1].LordsToReplace == nil then
                    coreResources[key1].LordsToReplace = {};
                end
                ConcatTableWithKeys(coreResources[key1].LordsToReplace, additionalFactionData.LordsToReplace);
            end
        end
    end,
    AddAdditionalSubcultureResources = function (subculture, resources)
        local coreResources = _G.CRPResources.SubcultureResources[subculture];
        if resources.DefaultLords ~= nil then
            coreResources.DefaultLords = resources.DefaultLords;
        end
        if resources.Heroes ~= nil then
            for index, heroKey in pairs(resources.Heroes) do
                coreResources.Heroes[#coreResources.Heroes + 1] = heroKey;
            end
        end
        if resources.MountData ~= nil then
            for mountKey, mountData in pairs(resources.MountData) do
                if coreResources.MountData[mountKey] == nil then
                    coreResources.MountData[mountKey] = mountData;
                else
                    if mountData.BonusCost ~= nil then
                        coreResources.MountData[mountKey].BonusCost = mountData.BonusCost;
                    end
                    if mountData.Weighting ~= nil then
                        coreResources.MountData[mountKey].Weighting = mountData.Weighting;
                    end
                end
            end
        end
        if resources.AgentSubTypes ~= nil then
            for agentSubtypeKey, agentSubTypeData in pairs(resources.AgentSubTypes) do
                if coreResources.AgentSubTypes[agentSubtypeKey] == nil then
                    coreResources.AgentSubTypes[agentSubtypeKey] = agentSubTypeData;
                else
                    if agentSubTypeData.HumanPlayerOnly ~= nil then
                        coreResources.AgentSubTypes[agentSubtypeKey].HumanPlayerOnly = agentSubTypeData.HumanPlayerOnly;
                    end
                    if agentSubTypeData.Mounts ~= nil then
                        for mountKey, mountData in pairs(agentSubTypeData.Mounts) do
                            coreResources.AgentSubTypes[agentSubtypeKey].Mounts[mountKey] = mountData;
                        end
                    end
                end
            end
        end
        -- Merge Reward Data
        if resources.Rewards ~= nil then
            if coreResources.Rewards == nil then
                coreResources.Rewards = {};
            end
            ConcatTableWithKeys(coreResources.Rewards, resources.Rewards);
        end
    end,
    AddAdditionalDBResources = function(dbResourceKey, resourceData)
        ConcatTableWithKeys(_G.CRPResources.DBResources[dbResourceKey], resourceData);
    end,
}

require 'script/_lib/dbexports/AgentDataResources'
require 'script/_lib/dbexports/CustomAgentDataResources'
require 'script/_lib/dbexports/NameGenerator/SubCultureNameGroupResources'
require 'script/_lib/dbexports/NameGenerator/NameGroupResources'
require 'script/_lib/dbexports/NameGenerator/NameResources'

-- Load the name resources
-- This is separate so I can use this in other mods
if not _G.CG_NameResources then
    _G.CG_NameResources = {
        ConcatTableWithKeys = function(self, destinationTable, sourceTable)
            for key, value in pairs(sourceTable) do
                destinationTable[key] = value;
            end
        end,
        subculture_to_name_groups = GetSubCultureNameGroupResources(),
        faction_to_name_groups = GetNameGroupResources(),
        name_groups_to_names = GetNameResources(),
        campaign_character_data = GetAgentDataResources(),
    };
end
_G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, CustomAgentDataResources);