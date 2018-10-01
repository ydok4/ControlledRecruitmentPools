require 'script/_lib/MixuGreenskinRecruitmentPools'
require 'script/_lib/MixuSavageOrcRecruitmentPools'

--Custom_Log("Loading mixus data");

_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_greenskins", GreenskinRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_savage_orcs", SavageOrcRecruitmentPoolData);