function GetMixuTombKingsRecruitmentPools()
    return {
        -- Default pool distribution
        wh2_dlc09_sc_tmb_tomb_kings = {
            DefaultLords = { "wh2_dlc09_tmb_tomb_king", },
            FactionPools = {
                HighLichePriests = {
                    AgentSubTypes = {
                        tmb_liche_high_priest_death = {
                            MaximumPercentage = 25,
                        },
                        tmb_liche_high_priest_light = {
                            MaximumPercentage = 25,
                        },
                        tmb_liche_high_priest_nehekhara = {
                            MaximumPercentage = 25,
                        },
                        tmb_liche_high_priest_shadow = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },

        --  Khatep
        wh2_dlc09_tmb_exiles_of_nehek = {
            FactionPools = {
                TombKings = {
                    AgentSubTypes = {
                        wh2_dlc09_tmb_tomb_king = {
                            MaximumPercentage = 100,

                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                HighLichePriests = {
                    AgentSubTypes = {
                        tmb_liche_high_priest_death = {
                            MaximumPercentage = 25,
                        },
                        tmb_liche_high_priest_light = {
                            MaximumPercentage = 25,
                        },
                        tmb_liche_high_priest_nehekhara = {
                            MaximumPercentage = 25,
                        },
                        tmb_liche_high_priest_shadow = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },
    };
end