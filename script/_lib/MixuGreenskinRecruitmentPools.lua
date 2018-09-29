GreenskinRecruitmentPoolData =  {
    -- Major Faction specific distributions
    -- Default pool distribution
    wh_main_sc_grn_greenskins = {
        FactionPools = {
            OrcWarbossPool = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                    grn_savage_orc_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 5,
            },
            OrcGreatShamanPool = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 1,
                        MaximumAmount = 3,
                    },
                },
                SubPoolMaxSize = 3,
            },
            GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 5,
    },
    -- Major Faction specific distributions

    -- Grimgor / Ahzag (Vanilla at least)
    wh_main_grn_greenskins = {
        FactionPools = {
            OrcWarbossPool = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 4,
                        MaximumAmount = 9,
                    },
                    grn_savage_orc_warboss = {
                        MinimumAmount = 1,
                        MaximumAmount = 4,
                    },
                },
                SubPoolMaxSize = 9,
            },
            OrcGreatShamanPool = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 2,
                        MaximumAmount = 4,
                    },
                },
                SubPoolMaxSize = 4,
            },
            GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 1,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 10,
    },
    -- Wurrzag
    wh_main_grn_orcs_of_the_bloody_hand = {
        FactionPools = {
            OrcWarbossPool = false,
            SavageOrcWarboss = {
                AgentSubTypes = {
                    grn_savage_orc_warboss = {
                        MinimumAmount = 2,
                        MaximumAmount = 4,
                    },
                },
                SubPoolMaxSize = 5,
            },
            SavageOrcGreatShaman = {
                AgentSubTypes = {
                    grn_savage_orc_shaman = {
                        MinimumAmount = 2,
                        MaximumAmount = 3,
                    },
                },
                SubPoolMaxSize = 4,
            },
            GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 9,
    },
}