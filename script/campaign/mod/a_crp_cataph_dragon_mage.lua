function a_crp_cataph_dragon_mage()
    if effect.get_localised_string("agent_subtypes_onscreen_name_override_AK_hef_dragonmage") ~= "" then
        out("CRP: Loading dragon mage resources");
        require 'script/_lib/pooldata/subcultureresources/CataphHighElfDragonMageSubcultureResources'
        _G.CRPResources.AddAdditionalSubcultureResources("wh2_main_sc_hef_high_elves", GetCataphHighElfDragonMageSubcultureResources());

        require 'script/_lib/pooldata/recruitmentpools/CataphHighElfDragonMageRecruitmentPools'
        _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh2_main_sc_hef_high_elves", GetCataphHighElfDragonMageRecruitmentPoolData());
    end
end