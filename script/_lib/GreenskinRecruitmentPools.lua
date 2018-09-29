GreenskinRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_grn_greenskins = {
        FactionPools = {
            OrcWarbossPool = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                },
                SubPoolMaxSize = 5,
            },
            GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 1,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 1,
            },
        },
        PoolMaxSize = 5,
    },
    -- Major Faction specific distributions

    -- Grimgor / Ahzag (Vanilla at least)
    wh_main_grn_greenskins = {
        FactionPools = {
            OrcWarbossPool = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 7,
                        MaximumAmount = 9,
                    },
                },
                SubPoolMaxSize = 9,
            },
            GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 1,
                        MaximumAmount = 3,
                    },
                },
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 10,
    },
    -- Wurrzag
    wh_main_grn_orcs_of_the_bloody_hand = {
        FactionPools = {
            OrcWarbossPool = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 3,
                        MaximumAmount = 5,
                    },
                },
                SubPoolMaxSize = 5,
            },
            GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 2,
                        MaximumAmount = 3,
                    },
                },
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 8,
    },

    -- Skarsnik
    wh_main_grn_crooked_moon = {
        FactionPools = {
            WarbossPool = {
                AgentSubTypes = {
                    dlc06_grn_night_goblin_warboss = {
                        MinimumAmount = 2,
                        MaximumAmount = 5,
                    },
                },
                SubPoolMaxSize = 5,
            },
            GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 1,
                        MaximumAmount = 3,
                    },
                },
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 8,
    },

    -- Minor Faction specific distributions

    -- Goblins/Forest Goblins
--[[    wh2_main_grn_arachnos = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 3,
        },
        PoolMaxSize = 8,
    },
    wh_main_grn_black_venom = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 3,
        },
        PoolMaxSize = 8,
    },
    -- Goblin Tribes
    wh_main_grn_broken_nose = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
            },
            SubPoolMaxSize = 5,
        },
        PoolMaxSize = 8,
    },
    wh_main_grn_scabby_eye = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 3,
        },
        PoolMaxSize = 8,
    },
    wh_main_grn_teef_snatchaz = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 3,
        },
        PoolMaxSize = 8,
    },
    -- Night Goblin Tribes
    wh_main_grn_bloody_spearz = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 3,
        },
        PoolMaxSize = 8,
    },
    wh_main_grn_red_eye = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 3,
        },
        PoolMaxSize = 8,
    },
    -- Orc Tribes
    wh_main_grn_necksnappers = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
            },
            SubPoolMaxSize = 5,
        },
        PoolMaxSize = 8,
    },
    wh_main_grn_skullsmasherz = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
            },
            SubPoolMaxSize = 5,
        },
        PoolMaxSize = 8,
    },
    wh_main_grn_red_fangs = ?

    -- Savage Orc Tribes
    -- Note: These are separate from the Orcs in SavageOrcRecruitmentPools.lua
    -- because CA gave them different sub cultures.
    wh_main_grn_broken_nose = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
            },
            SubPoolMaxSize = 5,
        },
        PoolMaxSize = 8,
    }, --]]
}