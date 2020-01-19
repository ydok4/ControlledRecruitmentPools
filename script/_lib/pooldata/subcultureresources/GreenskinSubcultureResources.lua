function GetGreenskinSubcultureResources()
    return {
        DefaultLords = {"grn_orc_warboss"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "GreenskinWarbosses",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh_main_grn_shaman_2 = {
                Pools = {
                    "GreenskinShamans",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh_main_GREENSKIN_shaman = {
                Pools = {
                    "NightGoblinShamanPools",
                    "OrcShamanPools",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_GREENSKIN_boss = {
                Pools = {
                    "GoblinBigBossPools",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
        },
        Heroes = {
            "grn_goblin_big_boss",
            "grn_night_goblin_shaman",
            "grn_orc_shaman",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 10,
            },
            WarBoar = {
                BonusCost = 120,
                Weighting = 12,
            },
            Wyvern = {
                BonusCost = 800,
                Weighting = 3,
            },
            GiantWolf = {
                BonusCost = 60,
                Weighting = 15,
            },
            GiantSpider = {
                BonusCost = 75,
                Weighting = 12,
            },
            GreatCaveSquig = {
                BonusCost = 250,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            grn_orc_warboss = {
                HumanPlayerOnly = true,
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_grn_orc_warboss_war_boar = {
                        MountData = "WarBoar",
                    },
                    wh_main_anc_mount_grn_orc_warboss_wyvern = {
                        MountData = "Wyvern",
                    },
                },
            },
            grn_goblin_great_shaman = {
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_grn_goblin_great_shaman_giant_wolf = {
                        MountData = "GiantWolf",
                    },
                },
            },
            dlc06_grn_night_goblin_warboss = {
                BonusCost = 150,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc06_anc_mount_grn_night_goblin_warboss_great_cave_squig = {
                        MountData = "GreatCaveSquig",
                    },
                },
            },
            grn_goblin_big_boss = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_grn_goblin_big_boss_giant_wolf = {
                        MountData = "GiantWolf",
                    },
                    wh_main_anc_mount_grn_goblin_big_boss_giant_spider = {
                        MountData = "GiantSpider",
                    },
                },
            },
            grn_night_goblin_shaman = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            grn_orc_shaman = {
                BonusCost = 50,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_grn_wizard_orc_shaman_war_boar = {
                        MountData = "WarBoar",
                    },
                },
            },
        },
        Traits = {
            wh2_main_skill_innate_grn_big_bully = {

            },
            wh2_main_skill_innate_grn_bragga = {

            },
            wh2_main_skill_innate_grn_mushroom_addicted = {

            },
            wh2_main_skill_innate_grn_serial_danca = {

            },
            wh2_main_skill_innate_grn_tortura = {

            },
            wh_main_skill_innate_grn_choppa_envy = {

            },
            wh_main_skill_innate_grn_stabba_envy = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_charismatic",
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_handsome",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
            "wh_main_skill_innate_all_sanguine",
        },
    };
end