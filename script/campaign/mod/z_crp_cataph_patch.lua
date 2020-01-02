out("CRP: Loading Cataph Patch");
local anyLoaded = false;
if core:is_mod_loaded("cataph_kraka") then
    out("CRP: Loading kraka drak resources");
    require 'script/_lib/pooldata/recruitmentpools/CataphDwarfRecruitmentPools'
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_dwf_dwarfs", DwarfRecruitmentPoolData);
    anyLoaded = true;
end

if core:is_mod_loaded("cataph_aislinn") then
    out("CRP: Loading sea helm resources resources");
    require 'script/_lib/pooldata/recruitmentpools/CataphHighElfRecruitmentPools'
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh2_main_sc_hef_high_elves", HighElfRecruitmentPoolData);
end

if core:is_mod_loaded("cataph_teb") then
    out("CRP: Loading teb resources");
    require 'script/_lib/pooldata/recruitmentpools/CataphTEBRecruitmentPools'
    require 'script/_lib/dbexports/CataphTEBNameGroupResources'
    require 'script/_lib/dbexports/CataphTEBNameResources'
    _G.CRPResources.AddAdditionalRecruitmentPoolResources("wh_main_sc_teb_teb", TEBRecruitmentPools);
    if _G.CG_NameResources then
        ConcatTableWithKeys(_G.CG_NameResources.faction_to_name_groups, CataphTEBNameGroupResources);
        ConcatTableWithKeys(_G.CG_NameResources.name_groups_to_names, CataphTEBNameResources);
    end
end

if anyLoaded == true then
    require 'script/_lib/dbexports/CataphDataResources'
    -- Load the name resources
    -- This is separate so I can use this in other mods
    if _G.CG_NameResources then
        ConcatTableWithKeys(_G.CG_NameResources.campaign_character_data, GetCataphDataResources());
    end
end
out("CRP: Finished loading Cataph Patch");