SkavenRecruitmentPoolData = {
    -- Default pool distribution
    wh2_main_sc_skv_skaven = {
        FactionPools = {
            Warlord = {
                AgentSubTypes = {
                    wh2_main_skv_warlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 7,
            },
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
        PoolMaxSize = 8,
    },
}