require 'script/_lib/pooldata/WezSpeshulGreenskinRecruitmentPools'
require 'script/_lib/pooldata/WezSpeshulSavageOrcRecruitmentPools'

require 'script/_lib/dbexports/WezSpeshulDataResources'

out("CRP: Loading Wez Speshul Patch");
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_greenskins", GreenskinRecruitmentPoolData);
_G.CRPResources.AddAdditionalResources("wh_main_sc_grn_savage_orcs", SavageOrcRecruitmentPoolData);

-- Load the name resources
-- This is separate so I can use this in other mods
if _G.CG_NameResources then
    ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, WezSpeshulDataResources);
end

out("CRP: Finished loading Wez Speshul Patch");