if core:is_mod_loaded("ws_start") then
    require 'script/_lib/pooldata/subcultureresources/WezSpeshulGreenskinSubcultureResources'
    _G.CRPResources.AddAdditionalSubcultureResources("wh_main_sc_grn_greenskins", GetWezSpeshulGreenskinSubcultureResources());
    _G.CRPResources.AddAdditionalSubcultureResources("wh_main_sc_grn_savage_orcs", GetWezSpeshulGreenskinSubcultureResources());

    require 'script/_lib/pooldata/recruitmentpools/WezSpeshulGreenskinRecruitmentPools'
    require 'script/_lib/pooldata/recruitmentpools/WezSpeshulSavageOrcRecruitmentPools'
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_grn_greenskins", GetWezSpeshulGreenskinRecruitmentPoolData());
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_grn_savage_orcs", GetWezSpeshulSavageOrcRecruitmentPoolData());

    require 'script/_lib/dbexports/WezSpeshulDataResources'
    -- Load the name resources
    -- This is separate so I can use this in other mods
    if _G.CG_NameResources then
        _G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, GetWezSpeshulDataResources());
    end
    out("CRP: Finished loading Wez Speshul Patch");
end