require 'script/_lib/pooldata/CataphDwarfRecruitmentPools'
require 'script/_lib/pooldata/CataphHighElfRecruitmentPools'
require 'script/_lib/pooldata/CataphTEBRecruitmentPools'
require 'script/_lib/pooldata/CataphVampireCountsRecruitmentPools'

require 'script/_lib/dbexports/CataphDataResources'

out("CRP: Loading Cataph Patch");
_G.CRPResources.AddAdditionalResources("wh_main_sc_dwf_dwarfs", DwarfRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh2_main_sc_hef_high_elves", HighElfRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_teb_teb", TEBRecruitmentPools);
_G.CRPResources.AddAdditionalResources("wh_main_sc_vmp_vampire_counts", VampireCountsRecruitmentPoolData);

-- Load the name resources
-- This is separate so I can use this in other mods
if _G.CG_NameResources then
    ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, CataphDataResources);
end
out("CRP: Finished loading Cataph Patch");