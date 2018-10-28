require 'script/_lib/pooldata/MixuGreenskinRecruitmentPools'
require 'script/_lib/pooldata/MixuNorscaRecruitmentPools'
require 'script/_lib/pooldata/MixuSavageOrcRecruitmentPools'
require 'script/_lib/pooldata/MixuVampireCountsRecruitmentPools'
require 'script/_lib/pooldata/MixuWoodElfRecruitmentPools'

require 'script/_lib/dbexports/MixuAgentArtSetResources'

Custom_Log("Loading mixus data");

_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_greenskins", GreenskinRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_nor_norsca", NorscaRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_savage_orcs", SavageOrcRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_vmp_vampire_counts", VampireCountsRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_dlc05_sc_wef_wood_elves", WoodElfRecruitmentPoolData);

_G.CRPResources.AddAdditionalDBResources("campaign_character_art_sets", MixuAgentArtSetResources);