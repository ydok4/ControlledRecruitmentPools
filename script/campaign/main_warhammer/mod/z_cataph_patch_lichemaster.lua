-- This needs to be separate because the lichemaster scripts run only in ME
if core:is_mod_loaded("liche_init") then
    out("CRP: Loading lichemaster resources");
    require 'script/_lib/pooldata/CataphVampireCountsRecruitmentPools'
    _G.CRPResources.AddAdditionalResources("wh_main_sc_vmp_vampire_counts", VampireCountsRecruitmentPoolData);
end