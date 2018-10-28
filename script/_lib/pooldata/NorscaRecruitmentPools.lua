NorscaRecruitmentPoolData = {
    -- Default pool distribution
    wh_main_sc_nor_norsca = {
        FactionPools = {
            ChieftainPools = {
                AgentSubTypes = {
                    nor_marauder_chieftain = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        Traits = {
            wh2_main_skill_innate_chs_diabolic_spendour = {

            },
            wh2_main_skill_innate_chs_dominance = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_charismatic",
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_handsome",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
        },
        PoolMaxSize = 5,
    },
}