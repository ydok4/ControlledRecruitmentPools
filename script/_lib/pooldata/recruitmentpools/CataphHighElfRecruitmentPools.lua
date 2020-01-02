HighElfRecruitmentPoolData = {
    -- Major High Elf Factions
    wh2_main_hef_eataine = {
        FactionPools = {
            SeaHelms = {
                AgentSubTypes = {
                    AK_hef_seahelm = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
        },
        Rewards = {
            alliance = {
                Pools = {
                    SeaHelms = {
                        AgentSubTypes = {
                            AK_hef_seahelm = {
                                MinimumAmount = 0,
                                MaximumAmount = 1,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                Events = {
                    Incident = "wh_main_crp_hef_seahelm",
                    Dilemma = nil,
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
        },
        LordPoolMaxSize = 6,
    },
    wh2_main_hef_order_of_loremasters = {
        FactionPools = {
            SeaHelms = {
                AgentSubTypes = {
                    AK_hef_seahelm = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
        },

        LordPoolMaxSize = 7,
    },
    -- Minor High Elf Factions
    wh2_main_hef_cothique = {
        FactionPools = {
            LowPrinces = {
                AgentSubTypes = {
                    wh2_main_hef_prince = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                    wh2_main_hef_princess = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
            Princes = {
                AgentSubTypes = {
                    wh2_main_hef_prince_mid = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_main_hef_princess_mid  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_main_hef_prince_high = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_main_hef_princess_high  = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            SeaHelms = {
                AgentSubTypes = {
                    AK_hef_seahelm = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
        },

        LordPoolMaxSize = 6,
    },

    wh2_main_hef_citadel_of_dusk = {
        FactionPools = {
            LowPrinces = {
                AgentSubTypes = {
                    wh2_main_hef_prince = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                    wh2_main_hef_princess  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
            Princes = {
                AgentSubTypes = {
                    wh2_main_hef_prince_mid = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_main_hef_princess_mid  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_main_hef_prince_high = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_main_hef_princess_high  = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            SeaHelms = {
                AgentSubTypes = {
                    AK_hef_seahelm = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 1,
            },
        },

        LordPoolMaxSize = 4,
    },
    wh2_main_hef_fortress_of_dawn = {
        FactionPools = {
            LowPrinces = {
                AgentSubTypes = {
                    wh2_main_hef_prince = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                    wh2_main_hef_princess  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
            Princes = {
                AgentSubTypes = {
                    wh2_main_hef_prince_mid = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_main_hef_princess_mid  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_main_hef_prince_high = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_main_hef_princess_high  = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            SeaHelms = {
                AgentSubTypes = {
                    AK_hef_seahelm = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 1,
            },
        },

        LordPoolMaxSize = 6,
    },
}