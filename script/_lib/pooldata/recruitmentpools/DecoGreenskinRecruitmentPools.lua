function GetDecoForestGoblineResources()
    return {
        -- Major Faction specific distributions
        -- Skarsnik
        wh_main_grn_crooked_moon = {
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        dlc06_grn_night_goblin_warboss = {
                            MaximumPercentage = 75,
                            HumanPlayerOnly = true,
                        },
                        wh_grn_forest_goblin_warboss = {
                            MaximumPercentage = 25,
                        },
                    },
                },
            },
        },
        -- Grom
        wh2_dlc15_grn_broken_axe = {
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        grn_orc_warboss = {
                            MaximumPercentage = 75,
                        },
                        wh_grn_forest_goblin_warboss = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Minor Factions, Forest Goblins
        wh2_main_grn_arachnos = {
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        wh_grn_forest_goblin_warboss = {
                            MaximumPercentage = 100,
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
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
            LordsToReplace = {
                grn_orc_warboss = {
                    replacementKey = "wh_grn_forest_goblin_warboss",
                },
            },
        },
        wh2_dlc12_grn_leaf_cutterz_tribe = {
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        wh_grn_forest_goblin_warboss = {
                            MaximumPercentage = 100,
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
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
            LordsToReplace = {
                grn_orc_warboss = {
                    replacementKey = "wh_grn_forest_goblin_warboss",
                },
            },
        },
        wh_main_grn_black_venom = {
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        wh_grn_forest_goblin_warboss = {
                            MaximumPercentage = 100,
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
                },
            },
        },
    };
end