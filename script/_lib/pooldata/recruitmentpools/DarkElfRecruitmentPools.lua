function GetDarkElfRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh2_main_sc_def_dark_elves = {
            HeroPools = {
                Masters = {
                    AgentSubTypes = {
                        wh2_dlc14_def_master = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                DeathHags = {
                    AgentSubTypes = {
                        wh2_main_def_death_hag = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                Sorceresses = {
                    AgentSubTypes = {
                        wh2_dlc10_def_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_shadow = {
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
                -- Lords
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                            BonusCost = 0,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                BeastMasterPool = {
                    AgentSubTypes = {
                        wh2_dlc14_def_high_beastmaster = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 150,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 150,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 150,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 150,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 150,
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
                    AgentSubTypes = {
                        wh2_main_def_death_hag = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                Masters = {
                    AgentSubTypes = {
                        wh2_dlc14_def_master = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                KhainiteAssassins = {
                    AgentSubTypes = {
                        wh2_main_def_khainite_assassin = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                Sorceresses = {
                    AgentSubTypes = {
                        wh2_dlc10_def_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
            FactionPools = {
                -- Lords
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
                BeastMasterPool = {
                    AgentSubTypes = {
                        wh2_dlc14_def_high_beastmaster = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
        },
        -- Morathi
        wh2_main_def_cult_of_pleasure = {
            HeroPools = {
                DeathHags = {
                    AgentSubTypes = {
                        wh2_main_def_death_hag = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                Masters = {
                    AgentSubTypes = {
                        wh2_dlc14_def_master = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                KhainiteAssassin = {
                    AgentSubTypes = {
                        wh2_main_def_khainite_assassin = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                Sorceresses = {
                    AgentSubTypes = {
                        wh2_dlc10_def_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                -- Lords
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                BeastMasterPool = {
                    AgentSubTypes = {
                        wh2_dlc14_def_high_beastmaster = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 0,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 3,
                    SubPoolMaxSize = 6,
                },
            },
        },

        -- Hellebron
        wh2_main_def_har_ganeth = {
            HeroPools = {
                DeathHags = {
                    AgentSubTypes = {
                        wh2_main_def_death_hag = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                Masters = {
                    AgentSubTypes = {
                        wh2_dlc14_def_master = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                KhainiteAssassin = {
                    AgentSubTypes = {
                        wh2_main_def_khainite_assassin = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                Sorceresses = {
                    AgentSubTypes = {
                        wh2_dlc10_def_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
            FactionPools = {
                -- Lords
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                BeastMasterPool = {
                    AgentSubTypes = {
                        wh2_dlc14_def_high_beastmaster = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
        },

        -- Lokhir
        wh2_dlc11_def_the_blessed_dread = {
            HeroPools = {
                DeathHags = {
                    AgentSubTypes = {
                        wh2_main_def_death_hag = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                Masters = {
                    AgentSubTypes = {
                        wh2_dlc14_def_master = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                KhainiteAssassin = {
                    AgentSubTypes = {
                        wh2_main_def_khainite_assassin = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                Sorceresses = {
                    AgentSubTypes = {
                        wh2_dlc10_def_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
            FactionPools = {
                -- Lords
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                BeastMasterPool = {
                    AgentSubTypes = {
                        wh2_dlc14_def_high_beastmaster = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },

        -- Malus
        wh2_main_def_hag_graef = {
            HeroPools = {
                DeathHags = {
                    AgentSubTypes = {
                        wh2_main_def_death_hag = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                Masters = {
                    AgentSubTypes = {
                        wh2_dlc14_def_master = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                KhainiteAssassin = {
                    AgentSubTypes = {
                        wh2_main_def_khainite_assassin = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                Sorceresses = {
                    AgentSubTypes = {
                        wh2_dlc10_def_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_main_def_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                -- Lords
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                BeastMasterPool = {
                    AgentSubTypes = {
                        wh2_dlc14_def_high_beastmaster = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },

        -- Minor Faction specific distributions
        wh2_main_def_clar_karond = {
            FactionPools = {
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                BeastMasterPool = {
                    AgentSubTypes = {
                        wh2_dlc14_def_high_beastmaster = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
        },

        wh2_main_def_karond_kar = {
            FactionPools = {
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                BeastMasterPool = {
                    AgentSubTypes = {
                        wh2_dlc14_def_high_beastmaster = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
        },

        wh2_main_def_ghrond = {
            FactionPools = {
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 0,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 5,
                    SubPoolMaxSize = 8,
                },
            },
        },

        wh2_main_def_drackla_coven = {
            FactionPools = {
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 0,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 4,
                    SubPoolMaxSize = 5,
                },
            },
        },
        wh2_main_def_blood_hall_coven = {
            FactionPools = {
                DreadLords = {
                    AgentSubTypes = {
                        wh2_main_def_dreadlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_def_dreadlord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                SorceressSupremePool = {
                    AgentSubTypes = {
                        wh2_dlc10_def_supreme_sorceress_beasts = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_dark = {
                            MinimumAmount = 0,
                            MaximumAmount = 0,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                        wh2_dlc10_def_supreme_sorceress_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 4,
                    SubPoolMaxSize = 5,
                },
            },
        },
    };
end