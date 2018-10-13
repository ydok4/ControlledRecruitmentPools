ChaosRecruitmentPoolData = {
    -- Default pool distribution
    wh_main_sc_chs_chaos = {
        FactionPools = {
            ChaosLords = {
                AgentSubTypes = {
                    chs_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            SorcerorLords = {
                AgentSubTypes = {
                    chs_sorcerer_lord_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    chs_sorcerer_lord_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    chs_sorcerer_lord_metal = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_chs_sorcerer_lord_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 6,
    },
}