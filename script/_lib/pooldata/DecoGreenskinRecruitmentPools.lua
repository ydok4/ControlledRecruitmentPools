GreenskinRecruitmentPoolData =  {
    -- Major Faction specific distributions
    -- Grimgor / Ahzag
    wh_main_grn_greenskins = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    wh_grn_forest_goblin_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
            },
        },
    },

    -- Wurrzag
    wh_main_grn_orcs_of_the_bloody_hand = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    wh_grn_forest_goblin_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
            },
        },
    },

    -- Skarsnik
    wh_main_grn_crooked_moon = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    wh_grn_forest_goblin_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
            },
        },
    },

    -- Minor Factions, Forest Goblins
    wh2_main_grn_arachnos = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    wh_grn_forest_goblin_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 4,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 5,
        LordsToReplace = {
            grn_orc_warboss = {
                replacementKey = "wh_grn_forest_goblin_warboss",
                traitKeyPool = {
                    "wh2_main_skill_innate_grn_big_bully",
                    "wh2_main_skill_innate_grn_bragga",
                    "wh2_main_skill_innate_grn_serial_danca",
                    "wh2_main_skill_innate_grn_tortura"
                },
            },
        },
    },
    wh_main_grn_black_venom = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    wh_grn_forest_goblin_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 4,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 5,
        LordsToReplace = {
            grn_orc_warboss = {
                replacementKey = "wh_grn_forest_goblin_warboss",
                traitKeyPool = {
                    "wh2_main_skill_innate_grn_big_bully",
                    "wh2_main_skill_innate_grn_bragga",
                    "wh2_main_skill_innate_grn_serial_danca",
                    "wh2_main_skill_innate_grn_tortura"
                },
            },
        },
    },
}