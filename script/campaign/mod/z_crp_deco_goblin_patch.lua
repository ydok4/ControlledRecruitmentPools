require 'script/_lib/pooldata/DecoGreenskinRecruitmentPools'
require 'script/_lib/pooldata/DecoSavageOrcRecruitmentPools'

require 'script/_lib/dbexports/DecoDataResources'

out("CRP: Loading Deco Goblin Patch");
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_greenskins", GreenskinRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_savage_orcs", SavageOrcRecruitmentPoolData);

-- Load the name resources
-- This is separate so I can use this in other mods
if _G.CG_NameResources then
    ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, DecoDataResources);
end

out("CRP: Finished loading Deco Goblin Patch");