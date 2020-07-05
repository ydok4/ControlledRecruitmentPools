function a_crp_deco_greenkins_patch()
    if effect.get_localised_string("agent_subtypes_onscreen_name_override_wh_grn_forest_goblin_warboss") ~= "" then
        require 'script/_lib/pooldata/recruitmentpools/DecoGreenskinRecruitmentPools'
        require 'script/_lib/pooldata/subcultureresources/DecoGreenskinsSubcultureResources'
        require 'script/_lib/dbexports/DecoDataResources'
        out("CRP: Loading Deco Goblin Patch");
        _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_grn_greenskins", GetDecoForestGoblineResources());
        _G.CRPResources.AddAdditionalSubcultureResources("wh_main_sc_grn_greenskins", GetDecoGreenskinsSubcultureResources());
        -- Load the name resources
        -- This is separate so I can use this in other mods
        if _G.CG_NameResources then
            ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, GetDecoAgentDataResources());
        end
        out("CRP: Finished loading Deco Goblin Patch");
    end
end