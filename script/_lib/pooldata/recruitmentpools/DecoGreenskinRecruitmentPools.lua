GreenskinRecruitmentPoolData =  {
    -- Major Faction specific distributions
    -- Grimgor / Ahzag
    wh_main_grn_greenskins = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    wh_grn_forest_goblin_warboss = {
                        MaximumPercentage = 33,
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
                        MaximumPercentage = 33,
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
                        MaximumPercentage = 33,
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
                        MaximumPercentage = 100,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 4,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MaximumPercentage = 100,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
        },
        LordPoolMaxSize = 4,
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
                        MaximumPercentage = 100,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 4,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MaximumPercentage = 100,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
        },
        LordPoolMaxSize = 4,
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