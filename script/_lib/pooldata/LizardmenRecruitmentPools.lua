LizardmenRecruitmentPoolData = {
    -- Default pool distribution
    wh2_main_sc_lzd_lizardmen = {
        DefaultLords = {"wh2_main_lzd_saurus_old_blood"},
        FactionPools = {
            SaurusOldBloods = {
                AgentSubTypes = {
                    wh2_main_lzd_saurus_old_blood = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 4,
            },
        },
        Traits = {
            wh2_main_skill_innate_lzd_arrogant = {

            },
            wh2_main_skill_innate_lzd_humble = {

            },
            wh2_main_skill_innate_lzd_pompous = {

            },
            wh2_main_skill_innate_lzd_uncompromising = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_charismatic",
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_handsome",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
            "wh_main_skill_innate_all_humble",
            "wh_main_skill_innate_all_uncompromising",
            "wh_main_skill_innate_all_arrogant",
        },
        PoolMaxSize = 5,
    },
}