SkavenRecruitmentPoolData = {
    -- Default pool distribution
    wh2_main_sc_skv_skaven = {
        FactionPools = {
            GreySeer = {
                AgentSubTypes = {
                    wh2_main_skv_grey_seer_plague = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_main_skv_grey_seer_ruin = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        Traits = {
            wh2_main_skill_innate_skv_sharp_claws = {

            },
            wh2_main_skill_innate_skv_sharp_teeth = {

            },
            wh2_main_skill_innate_skv_sneaky = {

            },
            wh2_main_skill_innate_skv_warpstone_hoarder = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_charismatic",
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_handsome",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
        },
        PoolMaxSize = 8,
    },
}