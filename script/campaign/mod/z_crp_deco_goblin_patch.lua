--[[require 'script/_lib/pooldata/recruitmentpools/DecoGreenskinRecruitmentPools'
require 'script/_lib/pooldata/recruitmentpools/DecoSavageOrcRecruitmentPools'

require 'script/_lib/dbexports/DecoDataResources'

out("CRP: Loading Deco Goblin Patch");
--_G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_grn_greenskins", GreenskinRecruitmentPoolData);
--_G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_grn_savage_orcs", SavageOrcRecruitmentPoolData);

-- Load the name resources
-- This is separate so I can use this in other mods
if _G.CG_NameResources then
    --ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, DecoDataResources);
end

out("CRP: Finished loading Deco Goblin Patch");--]]