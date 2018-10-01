VampireCountsRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_vmp_vampire_counts = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
            VampireLords = {
                AgentSubTypes = {
                    vmp_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    vmp_vampire_countess = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    vmp_vampire_countess_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 5,
    },
    -- Major Faction specific distributions

    -- Vampire Counts (Manfred)
    wh_main_vmp_vampire_counts = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 2,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            VampireLords = {
                AgentSubTypes = {
                    vmp_lord = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                    dlc04_vmp_strigoi_ghoul_king = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                    vmp_vampire_countess = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                    vmp_vampire_countess_shadow = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 3,
                SubPoolMaxSize = 7,
            },
        },
        PoolMaxSize = 10,
    },

    -- Von Carstein (Vlad/Isabella)
    wh_main_vmp_schwartzhafen = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 5,
            },
            VampireLords = {
                AgentSubTypes = {
                    vmp_lord = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                    dlc04_vmp_strigoi_ghoul_king = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                    vmp_vampire_countess = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                    vmp_vampire_countess_shadow = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 4,
                SubPoolMaxSize = 7,
            },
        },
        PoolMaxSize = 10,
    },

    -- Minor Faction specific distributions

    -- Mousillon
    wh_main_vmp_mousillon = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 3,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 3,
                SubPoolMaxSize = 5,
            },
            VampireLords = {
                AgentSubTypes = {
                    vmp_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    dlc04_vmp_strigoi_ghoul_king = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                    vmp_vampire_countess = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    vmp_vampire_countess_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    vmp_blood_knight_lord = {
                        MinimumAmount = 1,
                        MaximumAmount = 3,
                    }
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 7,
    },

    -- The Silver Host
    wh2_main_vmp_the_silver_host = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 5,
            },
            VampireLords = {
                AgentSubTypes = {
                    vmp_lord = false,
                    vmp_vampire_countess = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                    vmp_vampire_countess_shadow = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 7,
        LordsToReplace = {
            vmp_lord = "vmp_vampire_countess",
        },
    },

    -- The Strygos Empire
    wh2_main_vmp_strygos_empire = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 1,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
            VampireLords = {
                AgentSubTypes = {
                    dlc04_vmp_strigoi_ghoul_king = {
                        MinimumAmount = 2,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
        LordsToReplace = {
            vmp_lord = "dlc04_vmp_strigoi_ghoul_king",
        },
    },

    -- The Necrarch Brotherhood
    wh2_main_vmp_necrarch_brotherhood = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 1,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
            VampireLords = {
                AgentSubTypes = {
                    vmp_lord = false,
                    vmp_necrarch = {
                        MinimumAmount = 2,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
        LordsToReplace = {
            vmp_lord = "vmp_necrarch",
        },
    },
}