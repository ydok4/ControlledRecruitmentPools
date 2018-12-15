require 'script/_lib/pooldata/DecoGreenskinRecruitmentPools'
require 'script/_lib/pooldata/DecoSavageOrcRecruitmentPools'

require 'script/_lib/dbexports/DecoDataResources'

out("CRP: Loading Deco Goblin Patch");
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_greenskins", GreenskinRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_savage_orcs", SavageOrcRecruitmentPoolData);

_G.CRPResources.AddAdditionalDBResources("campaign_character_data", DecoDataResources);
out("CRP: Finished loading Deco Goblin Patch");