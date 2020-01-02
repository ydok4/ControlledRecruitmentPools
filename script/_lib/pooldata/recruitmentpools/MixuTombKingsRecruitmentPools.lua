function GetMixuTombKingsRecruitmentPools()
    return {
        -- Default pool distribution
        wh2_dlc09_sc_tmb_tomb_kings = {
            DefaultLords = { "wh2_dlc09_tmb_tomb_king", },
            FactionPools = {
                HighLichePriests = {
                    AgentSubTypes = {
                        tmb_liche_high_priest_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        tmb_liche_high_priest_light = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        tmb_liche_high_priest_nehekhara = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        tmb_liche_high_priest_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },

        --  Khatep
        wh2_dlc09_tmb_exiles_of_nehek = {
            FactionPools = {
                TombKings = {
                    AgentSubTypes = {
                        wh2_dlc09_tmb_tomb_king = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                HighLichePriests = {
                    AgentSubTypes = {
                        tmb_liche_high_priest_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        tmb_liche_high_priest_light = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        tmb_liche_high_priest_nehekhara = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        tmb_liche_high_priest_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
        },
    };
end