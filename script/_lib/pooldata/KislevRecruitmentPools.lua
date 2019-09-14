KislevRecruitmentPools = {
    -- Default kislev, only the kislev rebels use this in vanilla
    -- but Eregrad uses it in the unlocker.
    wh_main_sc_ksl_kislev = {
        DefaultLords = {"ksl_lord"},
        FactionPools = {
            KislevLord = {
                AgentSubTypes = {
                    ksl_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 4,
            },
        },
        PoolMaxSize = 5,
    },

    -- Major Kislev faction
    wh_main_ksl_kislev = {
        FactionPools = {
            EmpireGenerals = {
                AgentSubTypes = {
                    ksl_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 4,
            },
        },
        PoolMaxSize = 7,
    },
}