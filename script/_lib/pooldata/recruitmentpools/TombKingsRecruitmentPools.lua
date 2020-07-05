function GetTombKingsRecruitmentPools()
    return {
        -- Default pool distribution
        wh2_dlc09_sc_tmb_tomb_kings = {
            HeroPools = {
                LichePriests = {
                    AgentSubTypes = {
                        wh2_dlc09_tmb_liche_priest_death = {
                            MaximumPercentage = 33,
                        },
                        wh2_dlc09_tmb_liche_priest_light = {
                            MaximumPercentage = 33,
                        },
                        wh2_dlc09_tmb_liche_priest_nehekhara = {
                            MaximumPercentage = 33,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                TombPrinces = {
                    AgentSubTypes = {
                        wh2_dlc09_tmb_tomb_prince = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                Necrotect = {
                    AgentSubTypes = {
                        wh2_dlc09_tmb_necrotect = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 2,
            FactionPools = {
                TombKings = {
                    AgentSubTypes = {
                        wh2_dlc09_tmb_tomb_king = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 3,
        },
    };
end