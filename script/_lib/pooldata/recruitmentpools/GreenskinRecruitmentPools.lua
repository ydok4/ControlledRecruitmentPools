function GetGreenskinRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_grn_greenskins = {
            HeroPools = {
                NightGoblinShamanPools = {
                    AgentSubTypes = {
                        grn_night_goblin_shaman = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                OrcShamanPools = {
                    AgentSubTypes = {
                        grn_orc_shaman = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                GoblinBigBossPools = {
                    AgentSubTypes = {
                        grn_goblin_big_boss = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                TrollHags = {
                    AgentSubTypes = {
                        wh2_dlc15_grn_river_troll_hag = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                BlackOrcBigBoss = {
                    AgentSubTypes = {
                        wh2_pro09_grn_black_orc_big_boss = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        grn_orc_warboss = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
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
        },
        -- Major Faction specific distributions

        -- Grimgor
        wh_main_grn_greenskins = {
            FactionPools = {
                GreenskinWarbosses = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                GreenskinShamans = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Wurrzag
        wh_main_grn_orcs_of_the_bloody_hand = {
            FactionPools = {
                GreenskinWarbosses = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                GreenskinShamans = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Skarsnik
        wh_main_grn_crooked_moon = {
            HeroPools = {
                NightGoblinShamanPools = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                GoblinBigBossPools = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        dlc06_grn_night_goblin_warboss = {
                            MaximumPercentage = 100,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 2,
                },
                GreenskinShamans = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordsToReplace = {
                grn_orc_warboss = {
                    replacementKey = "dlc06_grn_night_goblin_warboss",
                    traitKeyPool = {
                        "wh2_main_skill_innate_grn_big_bully",
                        "wh2_main_skill_innate_grn_bragga",
                        "wh2_main_skill_innate_grn_serial_danca",
                        "wh2_main_skill_innate_grn_tortura"
                    },
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Ahzag
        wh2_dlc15_grn_bonerattlaz = {
            FactionPools = {
                GreenskinWarbosses = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                GreenskinShamans = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Grom
        wh2_dlc15_grn_broken_axe = {
            HeroPools = {
                TrollHags = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
            FactionPools = {
                GreenskinWarbosses = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Minor Faction specific distributions

        -- Goblins/Forest Goblins
    --[[    wh2_main_grn_arachnos = {
            DreadlordPool = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord_fem = {
                        MaximumPercentage = 100,
                    },
                    wh2_main_def_dreadlord = {
                        MaximumPercentage = 100,
                    },
                },
                SubPoolMaxSize = 3,
            },
            LordPoolMaxSize = 4,
        },
        wh_main_grn_black_venom = {
            DreadlordPool = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord_fem = {
                        MaximumPercentage = 2,
                    },
                    wh2_main_def_dreadlord = {
                        MaximumPercentage = 2,
                    },
                },
                SubPoolMaxSize = 3,
            },
            LordPoolMaxSize = 4,
        },--]]
        -- Goblin Tribes
        --[[wh_main_grn_broken_nose = {
            FactionPools = {
                GreenskinShamans = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
            LordsToReplace = {
                grn_orc_warboss = {
                    replacementKey = "grn_goblin_great_shaman",
                    traitKeyPool = {
                        "wh2_main_skill_innate_grn_big_bully",
                        "wh2_main_skill_innate_grn_bragga",
                        "wh2_main_skill_innate_grn_serial_danca",
                        "wh2_main_skill_innate_grn_tortura"
                    },
                },
            },
        },
        wh_main_grn_scabby_eye = {
            FactionPools = {
                GreenskinShamans = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
            LordsToReplace = {
                grn_orc_warboss = {
                    replacementKey = "grn_goblin_great_shaman",
                    traitKeyPool = {
                        "wh2_main_skill_innate_grn_big_bully",
                        "wh2_main_skill_innate_grn_bragga",
                        "wh2_main_skill_innate_grn_serial_danca",
                        "wh2_main_skill_innate_grn_tortura"
                    },
                },
            },
        },
        wh_main_grn_teef_snatchaz = {
            FactionPools = {
                GreenskinShamans = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
            LordsToReplace = {
                grn_orc_warboss = {
                    replacementKey = "grn_goblin_great_shaman",
                    traitKeyPool = {
                        "wh2_main_skill_innate_grn_big_bully",
                        "wh2_main_skill_innate_grn_bragga",
                        "wh2_main_skill_innate_grn_serial_danca",
                        "wh2_main_skill_innate_grn_tortura"
                    },
                },
            },
        },--]]

        -- Night Goblin Tribes
        wh_main_grn_bloody_spearz = {
            FactionPools = {
                GreenskinWarbosses = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                GreenskinShamans = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
            LordsToReplace = {
                grn_orc_warboss = {
                    replacementKey = "dlc06_grn_night_goblin_warboss",
                    traitKeyPool = {
                        "wh2_main_skill_innate_grn_big_bully",
                        "wh2_main_skill_innate_grn_bragga",
                        "wh2_main_skill_innate_grn_serial_danca",
                        "wh2_main_skill_innate_grn_tortura"
                    },
                },
            },
        },
        wh_main_grn_red_eye = {
            HeroPools = {
                NightGoblinShamanPools = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                OrcShamanPools = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                GoblinBigBossPools = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            FactionPools = {
                GreenskinWarbosses = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                GreenskinShamans = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
            LordsToReplace = {
                grn_orc_warboss = {
                    replacementKey = "dlc06_grn_night_goblin_warboss",
                    traitKeyPool = {
                        "wh2_main_skill_innate_grn_big_bully",
                        "wh2_main_skill_innate_grn_bragga",
                        "wh2_main_skill_innate_grn_serial_danca",
                        "wh2_main_skill_innate_grn_tortura"
                    },
                },
            },
        },
        --[[wh_main_grn_necksnappers = {
            HeroPools = {
                NightGoblinShamanPools = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                OrcShamanPools = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                GoblinBigBossPools = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            FactionPools = {
                GreenskinWarbosses = {
                    AgentSubTypes = {
                        dlc06_grn_night_goblin_warboss = {
                            MaximumPercentage = 25,
                        },
                        grn_orc_warboss = {
                            MaximumPercentage = 75,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                GreenskinShamans = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },--]]
        -- Orc Tribes
        --[[wh_main_grn_skullsmasherz = {
            DreadlordPool = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord_fem = {
                        MaximumPercentage = 3,
                    },
                    wh2_main_def_dreadlord = {
                        MaximumPercentage = 3,
                    },
                },
                SubPoolMaxSize = 5,
            },
            LordPoolMaxSize = 4,
        },
        wh_main_grn_red_fangs = ?

        -- Savage Orc Tribes
        -- Note: These are separate from the Orcs in SavageOrcRecruitmentPools.lua
        -- because CA gave them different sub cultures.
        wh_main_grn_broken_nose = {
            DreadlordPool = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord_fem = {
                        MaximumPercentage = 3,
                    },
                    wh2_main_def_dreadlord = {
                        MaximumPercentage = 3,
                    },
                },
                SubPoolMaxSize = 5,
            },
            LordPoolMaxSize = 4,
        }, --]]
    };
end