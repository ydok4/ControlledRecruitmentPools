TEBRecruitmentPools = {
    -- Major TEB factions
    wh_main_teb_border_princes = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    teb_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                    bor_ranger_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        Rewards = {
            alliance = {
                Pools = {
                    TEBLords = {
                        AgentSubTypes = {
                            bor_ranger_lord = {
                                MinimumAmount = 0,
                                MaximumAmount = 1,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                Type = "increase",
            },
        },
        PoolMaxSize = 8,
    },

    wh_main_teb_estalia = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    teb_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                    est_inquisitor = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        Rewards = {
            alliance = {
                Pools = {
                    TEBLords = {
                        AgentSubTypes = {
                            est_inquisitor = {
                                MinimumAmount = 0,
                                MaximumAmount = 1,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                Type = "increase",
            },
        },
        PoolMaxSize = 8,
    },

    wh_main_teb_tilea = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    teb_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                    til_merchant = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        Rewards = {
            alliance = {
                Pools = {
                    TEBLords = {
                        AgentSubTypes = {
                            til_merchant = {
                                MinimumAmount = 0,
                                MaximumAmount = 1,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                Type = "increase",
            },
        },
        PoolMaxSize = 8,
    },
    -- Minor TEB factions - Unlocker only

    -- Border Princes minor factions
    wh_main_teb_lichtenburg_confederacy = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    teb_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                    bor_ranger_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
    },
    -- Tilean Minor Factions
    wh_main_teb_bilbali = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    teb_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                    til_merchant = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
    },
    wh_main_teb_luccini = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    til_merchant = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        LordsToReplace = {
            teb_lord = {
                replacementKey = "til_merchant",
                traitKeyPool = {
                    "wh2_main_skill_innate_emp_imperious",
                    "wh2_main_skill_innate_emp_monster_hunter",
                    "wh2_main_skill_innate_emp_monster_tracker",
                    "wh2_main_skill_innate_emp_noble",
                    "wh2_main_skill_innate_emp_regal",
                },
            },
        },
        PoolMaxSize = 5,
    },
    wh_main_teb_tobaro = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    til_merchant = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        LordsToReplace = {
            teb_lord = {
                replacementKey = "til_merchant",
                traitKeyPool = {
                    "wh2_main_skill_innate_emp_imperious",
                    "wh2_main_skill_innate_emp_monster_hunter",
                    "wh2_main_skill_innate_emp_monster_tracker",
                    "wh2_main_skill_innate_emp_noble",
                    "wh2_main_skill_innate_emp_regal",
                },
            },
        },
        PoolMaxSize = 5,
    },

    -- New world colonies
    wh2_main_emp_new_world_colonies = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    teb_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                    til_merchant = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
    },
}