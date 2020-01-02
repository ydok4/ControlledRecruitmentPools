function GetKislevRecruitmentPools()
    return {
        -- Default kislev, only the kislev rebels use this in vanilla
        -- but Eregrad uses it in the unlocker.
        wh_main_sc_ksl_kislev = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                KislevLord = {
                    AgentSubTypes = {
                        ksl_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 5,
        },

        -- Major Kislev faction
        wh_main_ksl_kislev = {
            FactionPools = {
                EmpireGenerals = {
                    AgentSubTypes = {
                        ksl_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 7,
        },
    };
end