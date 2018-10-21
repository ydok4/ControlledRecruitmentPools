BretonniaRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_brt_bretonnia = {
        FactionPools = {
            BretLordPool = {
                AgentSubTypes = {
                    brt_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 5,
            },
            ProphetessPool = {
                AgentSubTypes = {
                    dlc07_brt_prophetess_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_heavens = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_life = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
        },
        PoolMaxSize = 6,
    },
    -- Major Faction specific distributions

    -- Louen Leoncour
    wh_main_brt_bretonnia = {
        FactionPools = {
            BretLordPool = {
                AgentSubTypes = {
                    brt_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 7,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 7,
            },
            ProphetessPool = {
                AgentSubTypes = {
                    dlc07_brt_prophetess_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_heavens = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_life = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 10,
    },
    -- Alberic
    wh_main_brt_bordeleaux = {
        FactionPools = {
            BretLordPool = {
                AgentSubTypes = {
                    brt_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 7,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 7,
            },
            ProphetessPool = {
                AgentSubTypes = {
                    dlc07_brt_prophetess_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_heavens = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_life = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 10,
    },

    -- Morgiana (Fay Enchantress)
    wh_main_brt_carcassonne = {
        FactionPools = {
            BretLordPool = {
                AgentSubTypes = {
                    brt_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 4,
            },
            ProphetessPool = {
                AgentSubTypes = {
                    dlc07_brt_prophetess_beasts = {
                        MinimumAmount = 1,
                        MaximumAmount = 2,
                    },
                    dlc07_brt_prophetess_heavens = {
                        MinimumAmount = 1,
                        MaximumAmount = 2,
                    },
                    dlc07_brt_prophetess_life = {
                        MinimumAmount = 1,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 3,
                SubPoolMaxSize = 6,
            },
        },
        PoolMaxSize = 10,
    },

    -- Minor Faction specific distributions
    -- TBD
}