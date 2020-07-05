function GetDarkElfRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh2_main_sc_def_dark_elves = {
            HeroPools = {
                Masters = {
                    AgentSubTypes = {
                        wh2_dlc14_def_master = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                KhainiteAssassins = {
                    AgentSubTypes = {
                        wh2_main_def_khainite_assassin = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                DeathHags = {
                    AgentSubTypes = {
                        wh2_main_def_death_hag = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                Sorceresses = {
                    AgentSubTypes = {
                        wh2_dlc10_def_sorceress_beasts = {
                            MaximumPercentage = 20,
                        },
                        wh2_dlc10_def_sorceress_death = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_def_sorceress_dark = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_def_sorceress_fire = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_def_sorceress_shadow = {
                            MaximumPercentage = 20,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                -- Lords
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                BeastMasterPool = {
                    AgentSubTypes = {
                        wh2_dlc14_def_high_beastmaster = {
                            MaximumPercentage = 100,
                         },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                SupremeSorceressPool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MaximumPercentage = 20,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MaximumPercentage = 20,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MaximumPercentage = 20,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MaximumPercentage = 20,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MaximumPercentage = 20,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Major Faction specific distributions

        -- Malekith
        wh2_main_def_naggarond = {
            HeroPools = {
                DeathHags = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                KhainiteAssassins = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                Sorceresses = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
            FactionPools = {
                -- Lords
                DreadLords = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
                BeastMasterPool = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                SupremeSorceressPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            AutoUnlockHeroes = {
                "wh2_main_def_sorceress_shadow",
            },
        },
        -- Morathi
        wh2_main_def_cult_of_pleasure = {
            HeroPools = {
                DeathHags = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                Masters = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                KhainiteAssassins = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                Sorceresses = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            FactionPools = {
                -- Lords
                DreadLords = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                BeastMasterPool = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                SupremeSorceressPool = {
                    SubPoolInitialMinSize = 3,
                    SubPoolMaxSize = 6,
                },
            },
        },

        -- Hellebron
        wh2_main_def_har_ganeth = {
            HeroPools = {
                DeathHags = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                KhainiteAssassins = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                -- Lords
                DreadLords = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                BeastMasterPool = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                SupremeSorceressPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
        },

        -- Lokhir
        wh2_dlc11_def_the_blessed_dread = {
            FactionPools = {
                -- Lords
                DreadLords = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                BeastMasterPool = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                SupremeSorceressPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },

        -- Malus
        wh2_main_def_hag_graef = {
            FactionPools = {
                -- Lords
                DreadLords = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                BeastMasterPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SupremeSorceressPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },

        -- Minor Faction specific distributions
        wh2_main_def_clar_karond = {
            FactionPools = {
                DreadLords = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                SupremeSorceressPool = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                BeastMasterPool = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
        },

        wh2_main_def_karond_kar = {
            FactionPools = {
                DreadLords = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
                SupremeSorceressPool = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                BeastMasterPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
        },

        wh2_main_def_ghrond = {
            FactionPools = {
                DreadLords = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SupremeSorceressPool = {
                    SubPoolInitialMinSize = 3,
                    SubPoolMaxSize = 4,
                },
            },
            AutoUnlockHeroes = {
                "wh2_main_def_sorceress_shadow",
            },
        },

        wh2_main_def_drackla_coven = {
            FactionPools = {
                DreadLords = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                SupremeSorceressPool = {
                    SubPoolInitialMinSize = 3,
                    SubPoolMaxSize = 4,
                },
            },
            AutoUnlockHeroes = {
                "wh2_main_def_sorceress_shadow",
            },
        },
        wh2_main_def_blood_hall_coven = {
            FactionPools = {
                DreadLords = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                SupremeSorceressPool = {
                    SubPoolInitialMinSize = 3,
                    SubPoolMaxSize = 4,
                },
            },
            AutoUnlockHeroes = {
                "wh2_main_def_sorceress_shadow",
            },
        },
    };
end