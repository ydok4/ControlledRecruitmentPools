if core:is_mod_loaded("mixu_ttl") then
    require 'script/_lib/pooldata/subcultureresources/MixuDwarfsSubcultureResources'
    require 'script/_lib/pooldata/subcultureresources/MixuEmpireSubcultureResources'
    require 'script/_lib/pooldata/subcultureresources/MixuGreenskinSubcultureResources'
    require 'script/_lib/pooldata/subcultureresources/MixuNorscanSubcultureResources'
    require 'script/_lib/pooldata/subcultureresources/MixuTombKingsSubcultureResources'
    require 'script/_lib/pooldata/subcultureresources/MixuWoodElfSubcultureResources'

    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_dwf_dwarfs", GetMixuDwarfsSubcultureResources());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_emp_empire", GetMixuEmpireSubcultureResources());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_grn_greenskins", GetMixuGreenskinSubcultureResources());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_grn_savage_orcs", GetMixuGreenskinSubcultureResources());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_nor_norsca", GetMixuNorscanSubcultureResources());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh2_dlc09_sc_tmb_tomb_kings", GetMixuTombKingsSubcultureResources());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_dlc05_sc_wef_wood_elves", GetMixuWoodElfSubcultureResources());

    require 'script/_lib/pooldata/recruitmentpools/MixuDwarfsRecruitmentPools'
    require 'script/_lib/pooldata/recruitmentpools/MixuEmpireRecruitmentPools'
    require 'script/_lib/pooldata/recruitmentpools/MixuChaosRecruitmentPools'
    require 'script/_lib/pooldata/recruitmentpools/MixuGreenskinRecruitmentPools'
    require 'script/_lib/pooldata/recruitmentpools/MixuNorscaRecruitmentPools'
    require 'script/_lib/pooldata/recruitmentpools/MixuSavageOrcRecruitmentPools'
    require 'script/_lib/pooldata/recruitmentpools/MixuTombKingsRecruitmentPools'
    require 'script/_lib/pooldata/recruitmentpools/MixuWoodElfRecruitmentPools'

    require 'script/_lib/dbexports/MixuDataResources'
    require 'script/_lib/dbexports/MixuMousillonNameGroupResources'

    out("CRP: Loading Mixu Patch");
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_chs_chaos", GetMixuChaosRecruitmentPoolData());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_dwf_dwarfs", GetMixuDwarfsRecruitmentPoolData());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_emp_empire", GetMixuEmpireRecruitmentPoolData());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_grn_greenskins", GetMixuGreenskinRecruitmentPoolData());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_nor_norsca", GetMixuNorscaRecruitmentPoolData());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_grn_savage_orcs", GetMixuSavageOrcRecruitmentPoolData());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh2_dlc09_sc_tmb_tomb_kings", GetMixuTombKingsRecruitmentPools());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_dlc05_sc_wef_wood_elves", GetMixuWoodElfRecruitmentPoolData());

    -- Load the name resources
    -- This is separate so I can use this in other mods
    if _G.CG_NameResources then
        _G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, GetMixuDataResources());
        _G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.faction_to_name_groups, MixuMousillonNameGroupResources);
    end
    out("CRP: Finished loading Mixu Patch");
end