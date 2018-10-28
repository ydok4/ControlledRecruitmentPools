VampireCountsRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_vmp_vampire_counts = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 0,
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
        Traits = {
            wh2_innate_vampire_hunter_in_the_dark = {

            },
            wh2_innate_vampire_night_creature = {

            },
            wh2_innate_vampire_swiftness = {

            },
            wh2_innate_vampire_defy_the_dawn = {

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
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
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
                },
                SubPoolInitialMinSize = 3,
                SubPoolMaxSize = 7,
            },
            VampireCountesses = {
                AgentSubTypes = {
                    vmp_vampire_countess = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    vmp_vampire_countess_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
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
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    dlc04_vmp_strigoi_ghoul_king = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 3,
                SubPoolMaxSize = 7,
            },
            VampireCountesses = {
                AgentSubTypes = {
                    vmp_vampire_countess = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    vmp_vampire_countess_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
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
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    dlc04_vmp_strigoi_ghoul_king = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                    vmp_blood_knight_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    }
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            VampireCountesses = {
                AgentSubTypes = {
                    vmp_vampire_countess = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    vmp_vampire_countess_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
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
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    vmp_vampire_countess_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 3,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 7,
        Traits = {
            wh2_innate_vampire_countess_spectral_form = {

            },
        },
        LordsToReplace = {
            vmp_lord = {
                replacementKey = "vmp_vampire_countess",
                traitKeyPool = {
                    "wh2_innate_vampire_defy_the_dawn",
                    "wh2_innate_vampire_night_creature",
                    "wh2_main_skill_innate_vmp_devious",
                    "wh2_main_skill_innate_vmp_dark_majesty",
                    "wh2_innate_vampire_swiftness",
                    "wh2_innate_vampire_countess_spectral_form",
                },
            },
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
        Traits = {
            wh2_innate_necrarch_ghoul_lover = {

            },
        },
        LordsToReplace = {
            vmp_lord = {
                replacementKey = "dlc04_vmp_strigoi_ghoul_king",
                traitKeyPool = {
                    "wh_main_skill_innate_vmp_ghoul_whisperer",
                    "wh2_main_skill_innate_vmp_dread_incarnate",
                    "wh2_main_skill_innate_vmp_devious",
                    "wh2_main_skill_innate_vmp_dark_majesty",
                    "wh2_innate_necrarch_ghoul_lover",
                },
            },
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
        Traits = {
            wh2_innate_necrarch_arcane_knowledge = {

            },
            wh2_innate_necrarch_seeker_of_the_prophecy = {

            },
            wh2_innate_necrarch_scavenger = {

            },
            wh2_innate_necrarch_thinker = {

            },
            wh2_innate_necrarch_engulfed_by_flames = {

            },
            wh2_innate_necrarch_infamous = {

            },
            wh2_innate_necrarch_ghoul_lover = {

            },
            wh2_innate_necrarch_corrupted_by_warpstone = {

            },
            wh2_innate_necrarch_spectral_form = {

            },
        },
        LordsToReplace = {
            vmp_lord = {
                replacementKey = "vmp_necrarch",
                traitKeyPool = {
                    "wh2_innate_necrarch_arcane_knowledge",
                    "wh2_innate_necrarch_scavenger",
                    "wh2_innate_necrarch_thinker",
                    "wh2_innate_necrarch_engulfed_by_flames",
                    "wh2_innate_necrarch_infamous",
                    "wh2_innate_necrarch_ghoul_lover",
                    "wh2_innate_necrarch_corrupted_by_warpstone",
                    "wh2_innate_necrarch_spectral_form",
                },
            },
        },
    },
}