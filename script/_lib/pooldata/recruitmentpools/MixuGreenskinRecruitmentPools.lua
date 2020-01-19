function GetMixuGreenskinRecruitmentPoolData()
    return {
        -- Major Faction specific distributions
        -- Default pool distribution
        wh_main_sc_grn_greenskins = {
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        grn_orc_warboss = {
                            MaximumPercentage = 50,
                        },
                        grn_savage_orc_warboss = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                GreenskinShamans = {
                    AgentSubTypes = {
                        grn_goblin_great_shaman = false,
                        grn_savage_orc_shaman = {
                            MaximumPercentage = 50,
                        },
                        grn_orc_great_shaman = {
                            MaximumPercentage = 50,
                        }
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
        },
        -- Major Faction specific distributions

        -- Grimgor / Ahzag (Vanilla at least)
        wh_main_grn_greenskins = {
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        grn_orc_warboss = {
                            MaximumPercentage = 75,
                        },
                        grn_savage_orc_warboss = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                GreenskinShamans = {
                    AgentSubTypes = {
                        grn_goblin_great_shaman = {
                            MaximumPercentage = 25,
                        },
                        grn_savage_orc_shaman = {
                            MaximumPercentage = 25,
                        },
                        grn_orc_great_shaman = {
                            MaximumPercentage = 50,
                        }
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
        },
        -- Wurrzag
        wh_main_grn_orcs_of_the_bloody_hand = {
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        grn_orc_warboss = false,
                        grn_savage_orc_warboss = {
                            MaximumPercentage = 100,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                GreenskinShamans = {
                    AgentSubTypes = {
                        grn_savage_orc_shaman = {
                            MaximumPercentage = 50,
                        },
                        grn_goblin_great_shaman = {
                            MaximumPercentage = 25,
                        },
                        grn_orc_great_shaman = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
            LordsToReplace = {
                grn_orc_warboss = {
                    replacementKey = "grn_savage_orc_warboss",
                    traitKeyPool = {
                        "wh2_main_skill_innate_grn_big_bully",
                        "wh2_main_skill_innate_grn_bragga",
                        "wh2_main_skill_innate_grn_serial_danca",
                        "wh2_main_skill_innate_grn_tortura"
                    },
                },
            },
        },
    };
end