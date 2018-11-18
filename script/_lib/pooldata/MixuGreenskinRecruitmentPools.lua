GreenskinRecruitmentPoolData =  {
    -- Major Faction specific distributions
    -- Default pool distribution
    wh_main_sc_grn_greenskins = {
        FactionPools = {
            GreenskinWarbosses = {
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
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_savage_orc_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    grn_orc_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    }
                },
                SubPoolMaxSize = 2,
            },
        },
        --[[Traits = {
            wh_main_skill_grn_innate_moar_paint = {

            },
            wh_main_skill_grn_innate_savage_danca = {

            },
        },--]]
        PoolMaxSize = 5,
    },
    -- Major Faction specific distributions

    -- Grimgor / Ahzag (Vanilla at least)
    wh_main_grn_greenskins = {
        FactionPools = {
            GreenskinWarbosses = {
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
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_savage_orc_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    grn_orc_great_shaman = {
                        MinimumAmount = 1,
                        MaximumAmount = 3,
                    }
                },
                SubPoolMaxSize = 4,
            },
        },
        PoolMaxSize = 10,
    },
    -- Wurrzag
    wh_main_grn_orcs_of_the_bloody_hand = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    grn_orc_warboss = false,
                    grn_savage_orc_warboss = {
                        MinimumAmount = 3,
                        MaximumAmount = 4,
                    },
                },
                SubPoolMaxSize = 5,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_savage_orc_shaman = {
                        MinimumAmount = 1,
                        MaximumAmount = 3,
                    },
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    grn_orc_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 4,
            },
        },
        PoolMaxSize = 9,
    },
}