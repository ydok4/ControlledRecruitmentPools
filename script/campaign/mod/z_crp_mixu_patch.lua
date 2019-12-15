if core:is_mod_loaded("mixu_ttl") then
    require 'script/_lib/pooldata/MixuChaosRecruitmentPools'
    require 'script/_lib/pooldata/MixuDarkElfRecruitmentPools'
    require 'script/_lib/pooldata/MixuGreenskinRecruitmentPools'
    require 'script/_lib/pooldata/MixuNorscaRecruitmentPools'
    require 'script/_lib/pooldata/MixuSavageOrcRecruitmentPools'
    require 'script/_lib/pooldata/MixuTombKingsRecruitmentPools'
    require 'script/_lib/pooldata/MixuWoodElfRecruitmentPools'

    require 'script/_lib/dbexports/MixuDataResources'
    require 'script/_lib/dbexports/MixuMousillonNameGroupResources'

    out("CRP: Loading Mixu Patch");
    _G.CRPResources.AddAdditionalResources("wh_main_sc_chs_chaos", ChaosRecruitmentPoolData);
    _G.CRPResources.AddAdditionalResources("wh2_main_sc_def_dark_elves", DarkElfRecruitmentPoolData);
    _G.CRPResources.AddAdditionalResources("wh_main_sc_grn_greenskins", GreenskinRecruitmentPoolData);
    _G.CRPResources.AddAdditionalResources("wh_main_sc_nor_norsca", NorscaRecruitmentPoolData);
    _G.CRPResources.AddAdditionalResources("wh_main_sc_grn_savage_orcs", SavageOrcRecruitmentPoolData);
    _G.CRPResources.AddAdditionalResources("wh2_dlc09_sc_tmb_tomb_kings", MixuTombKingsRecruitmentPools);
    _G.CRPResources.AddAdditionalResources("wh_dlc05_sc_wef_wood_elves", WoodElfRecruitmentPoolData);

    -- Load the name resources
    -- This is separate so I can use this in other mods
    if _G.CG_NameResources then
        _G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, GetMixuDataResources());
        _G.CG_NameResources:ConcatTableWithKeys(_G.CG_NameResources.faction_to_name_groups, MixuMousillonNameGroupResources);
    end

    --[[require 'script/_lib/dbexports/MixuEffectResources'
    require 'script/_lib/dbexports/MixuTraitsToEffects'

    _G.CRPUIResources.AddAdditionalUIDBResources("effects", MixuEffectResources);
    _G.CRPUIResources.AddAdditionalUIDBResources("trait_level_effects", MixuTraitsToEffects);--]]
    out("CRP: Finished loading Mixu Patch");
end