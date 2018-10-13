require 'script/_lib/BeastmenRecruitmentPools'
require 'script/_lib/BretonniaRecruitmentPools'
require 'script/_lib/ChaosRecruitmentPools'
require 'script/_lib/DarkElfRecruitmentPools'
require 'script/_lib/DwarfRecruitmentPools'
require 'script/_lib/EmpireRecruitmentPools'
require 'script/_lib/GreenskinRecruitmentPools'
require 'script/_lib/SavageOrcRecruitmentPools'
require 'script/_lib/HighElfRecruitmentPools'
require 'script/_lib/LizardmenRecruitmentPools'
require 'script/_lib/NorscaRecruitmentPools'
require 'script/_lib/SkavenRecruitmentPools'
require 'script/_lib/VampireCountsRecruitmentPools'
require 'script/_lib/WoodElfRecruitmentPools'

require 'script/_lib/RogueArmyRecruitmentPools'

Custom_Log("Loading Core Data")

_G.CRPResources = {
    CultureResources = {
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
        -- Vampire Counts
        wh_main_sc_vmp_vampire_counts = VampireCountsRecruitmentPoolData,
        -- Wood Elf
        wh_dlc05_sc_wef_wood_elves = WoodElfRecruitmentPoolData,

        -- Rogue Armies
        wh_rogue_armies = RogueArmyRecruitmentPoolData,
    },
    -- Additional loader function
    -- This is intended to be used by other mods to load custom data.
    -- This can be used to change agent sub type distribution or add
    -- new agent sub types into the system.
    AddAdditionalResources = function (subculture, resources)
        local coreResources = _G.CRPResources.CultureResources[subculture];

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
        end
    end,
}