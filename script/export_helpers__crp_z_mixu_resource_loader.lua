require 'script/_lib/MixuGreenskinRecruitmentPools'
require 'script/_lib/MixuNorscaRecruitmentPools'
require 'script/_lib/MixuSavageOrcRecruitmentPools'
require 'script/_lib/MixuVampireCountsRecruitmentPools'
require 'script/_lib/MixuWoodElfRecruitmentPools'

Custom_Log("Loading mixus data");

_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_greenskins", GreenskinRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_nor_norsca", NorscaRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_savage_orcs", SavageOrcRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_vmp_vampire_counts", VampireCountsRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_dlc05_sc_wef_wood_elves", WoodElfRecruitmentPoolData);