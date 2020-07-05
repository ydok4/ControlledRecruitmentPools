function GetBretonniaRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_brt_bretonnia = {
            HeroPools = {
                DamselPool = {
                    AgentSubTypes = {
                        brt_damsel = {
                            MaximumPercentage = 33,
                        },
                        brt_damsel_beasts = {
                            MaximumPercentage = 33,
                        },
                        brt_damsel_life = {
                            MaximumPercentage = 33,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                PaladinPool = {
                    AgentSubTypes = {
                        brt_paladin = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                BretLordPool = {
                    AgentSubTypes = {
                        brt_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 2,
                },
                ProphetessPool = {
                    AgentSubTypes = {
                        dlc07_brt_prophetess_beasts = {
                            MaximumPercentage = 33,
                        },
                        dlc07_brt_prophetess_heavens = {
                            MaximumPercentage = 33,
                        },
                        dlc07_brt_prophetess_life = {
                            MaximumPercentage = 33,
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
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                ProphetessPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Alberic
        wh_main_brt_bordeleaux = {
            FactionPools = {
                BretLordPool = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 2,
                },
                ProphetessPool = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Morgiana (Fay Enchantress)
        wh_main_brt_carcassonne = {
            FactionPools = {
                BretLordPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                ProphetessPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Minor Faction specific distributions
        -- TBD
    };
end