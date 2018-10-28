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
                SubPoolMaxSize = 5,
            },
            VampireLords = {
                AgentSubTypes = {
                    vmp_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        Traits = {
            wh2_main_skill_innate_vmp_dark_majesty = {

            },
            wh2_main_skill_innate_vmp_devious = {

            },
            wh2_main_skill_innate_vmp_dread_incarnate = {

            },
            wh2_main_skill_innate_vmp_lore_keeper = {

            },
            wh2_main_skill_innate_vmp_master_of_the_black_arts = {

            },
            wh_main_skill_innate_vmp_dark_acolyte = {

            },
            wh_main_skill_innate_vmp_ghoul_whisperer = {

            },
            wh_main_skill_innate_vmp_summon_creatures = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_magnanimous",
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
        },
        PoolMaxSize = 10,
    },

    -- Von Carstein (Vlad/Isabella)
    wh_main_vmp_schwartzhafen = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 0,
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
                        MinimumAmount = 0,
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
                    vmp_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 7,
    },

    -- The Strygos Empire
    wh2_main_vmp_strygos_empire = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
            VampireLords = {
                AgentSubTypes = {
                    dlc04_vmp_strigoi_ghoul_king = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
        LordsToReplace = {
            vmp_lord = {
                replacementKey = "dlc04_vmp_strigoi_ghoul_king",
                traitKeyPool = {"wh_main_skill_innate_vmp_ghoul_whisperer", "wh2_main_skill_innate_vmp_dread_incarnate", "wh2_main_skill_innate_vmp_devious", "wh2_main_skill_innate_vmp_dark_majesty"},
            },
        },
    },

    -- The Necrarch Brotherhood
    wh2_main_vmp_necrarch_brotherhood = {
        FactionPools = {
            Necromancers = {
                AgentSubTypes = {
                    vmp_master_necromancer = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
            VampireLords = {
                AgentSubTypes = {
                    vmp_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
    },
}