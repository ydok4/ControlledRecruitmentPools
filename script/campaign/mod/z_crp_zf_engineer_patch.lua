--[[require 'script/_lib/pooldata/ZFEmpireRecruitmentPools'

require 'script/_lib/dbexports/ZFDataResources'

out("CRP: Loading ZF Engineers Patch");
_G.CRPResources.AddAdditionalResources("wh_main_sc_emp_empire", EmpireRecruitmentPoolData);

-- Load the name resources
-- This is separate so I can use this in other mods
if _G.CG_NameResources then
    ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, ZFDataResources);
end

out("CRP: Finished loading ZF Engineers Patch");--]]