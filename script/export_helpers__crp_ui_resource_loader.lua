--[[require 'script/_lib/BeastmenRecruitmentPools'
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
require 'script/_lib/WoodElfRecruitmentPools'--]]

require 'script/_lib/ui/EmpireUIData'
require 'script/_lib/ui/GreenskinUIData'
require 'script/_lib/ui/VampireCountUIData'

require 'script/_lib/ui/SharedUIData'

require 'script/_lib/dbexports/EffectResources'
require 'script/_lib/dbexports/TraitsToEffects'

Custom_Log_Start();

Custom_Log("Loading Core Data");

_G.CRPUIResources = {
    DBResources = {
        effects = EffectResources,
        trait_level_effects = TraitsToEffects,
    },
    CulturePoolResources = {
        -- Empire
        wh_main_sc_emp_empire = EmpireUIData,
        -- Greenskins
        wh_main_sc_grn_greenskins = GreenskinUIData,
        wh_main_sc_grn_savage_orcs = GreenskinUIData,
        -- Vampire Counts
        wh_main_sc_vmp_vampire_counts = VampireCountUIData,

        -- Shred
        shared = SharedUIData,
    },
}