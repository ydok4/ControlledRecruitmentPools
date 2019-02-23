require 'script/_lib/pooldata/WezSpeshulGreenskinRecruitmentPools'
require 'script/_lib/pooldata/WezSpeshulSavageOrcRecruitmentPools'

require 'script/_lib/dbexports/WezSpeshulDataResources'

out("CRP: Loading Wez Speshul Patch");
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_greenskins", GreenskinRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_savage_orcs", SavageOrcRecruitmentPoolData);

_G.CRPResources.AddAdditionalDBResources("campaign_character_data", WezSpeshulDataResources);
out("CRP: Finished loading Wez Speshul Patch");