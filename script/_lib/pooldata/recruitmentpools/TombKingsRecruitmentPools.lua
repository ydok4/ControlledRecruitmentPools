function GetTombKingsRecruitmentPools()
    return {
        -- Default pool distribution
        wh2_dlc09_sc_tmb_tomb_kings = {
            HeroPools = {
                LichePriests = {
                    AgentSubTypes = {
                        wh2_dlc09_tmb_liche_priest_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_dlc09_tmb_liche_priest_light = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_dlc09_tmb_liche_priest_nehekhara = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
                TombPrinces = {
                    AgentSubTypes = {
                        wh2_dlc09_tmb_tomb_prince = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
                Necrotect = {
                    AgentSubTypes = {
                        wh2_dlc09_tmb_necrotect = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                TombKings = {
                    AgentSubTypes = {
                        wh2_dlc09_tmb_tomb_king = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 0,
        },
    };
end