-- This needs to be separate because the lichemaster scripts run only in ME
if core:is_mod_loaded("liche_init") then
    out("CRP: Loading lichemaster resources");
    require 'script/_lib/pooldata/recruitmentpools/CataphVampireCountsRecruitmentPools'
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_vmp_vampire_counts", GetCataphVampireCountsRecruitmentPoolData());
    require 'script/_lib/pooldata/subcultureresources/CataphVampireCountsSubcultureResources'
    _G.CRPResources.AddAdditionalSubcultureResources("wh_main_sc_vmp_vampire_counts", GetCataphVampireCountsSubcultureResources());
end