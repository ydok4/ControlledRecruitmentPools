require 'script/_lib/pooldata/CataphDwarfRecruitmentPools'
require 'script/_lib/pooldata/CataphHighElfRecruitmentPools'
require 'script/_lib/pooldata/CataphTEBRecruitmentPools'

require 'script/_lib/dbexports/CataphDataResources'

out("CRP: Loading Cataph Patch");
_G.CRPResources.AddAdditionalResources("wh_main_sc_dwf_dwarfs", DwarfRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh2_main_sc_hef_high_elves", HighElfRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_teb_teb", TEBRecruitmentPools);

_G.CRPResources.AddAdditionalDBResources("campaign_character_data", CataphDataResources);
out("CRP: Finished loading Cataph Patch");