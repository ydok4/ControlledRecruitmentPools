function GetBretonniaRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_brt_bretonnia = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                BretLordPool = {
                    AgentSubTypes = {
                        brt_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
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
            LordPoolMaxSize = 4,
        },
        -- Major Faction specific distributions

        -- Louen Leoncour
        wh_main_brt_bretonnia = {
            FactionPools = {
                BretLordPool = {
                    AgentSubTypes = {
                        brt_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 6,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 6,
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
            LordPoolMaxSize = 4,
        },
        -- Alberic
        wh_main_brt_bordeleaux = {
            FactionPools = {
                BretLordPool = {
                    AgentSubTypes = {
                        brt_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
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
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
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
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                ProphetessPool = {
                    AgentSubTypes = {
                        dlc07_brt_prophetess_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        dlc07_brt_prophetess_heavens = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        dlc07_brt_prophetess_life = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Minor Faction specific distributions
        -- TBD
    };
end