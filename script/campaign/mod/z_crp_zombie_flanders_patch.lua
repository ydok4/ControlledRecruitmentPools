--[[if core:is_mod_loaded("@emp_master_engineer_setup_vandy") then
    require 'script/_lib/pooldata/subcultureresources/ZombieFlandersEmpireSubcultureResources'
    _G.CRPResources.AddAdditionalSubcultureResources("wh_main_sc_emp_empire", GetZombieFlandersEmpireSubcultureResources());

    require 'script/_lib/pooldata/recruitmentpools/ZombieFlandersEmpireRecruitmentPools'
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_emp_empire", GetZombieFlandersEmpireRecruitmentPoolData());

    require 'script/_lib/dbexports/ZombieFlandersDataResources'
    if _G.CG_NameResources then
        _G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, GetZombieFlandersDataResources());
    end
end--]]