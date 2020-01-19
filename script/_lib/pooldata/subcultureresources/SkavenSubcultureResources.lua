function GetSkavenSubcultureResources()
    return {
        DefaultLords = {"wh2_main_skv_warlord"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "SkavenWarlord",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_main_skv_temple_1 = {
                Pools = {
                    "GreySeer",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_dlc14_skv_eshin_assassins_3 = {
                Pools = {
                    "EshinSorcerer",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_main_skv_assassins_eshin = {
                Pools = {
                    "Assassins",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_main_skv_plagues = {
                Pools = {
                    "PlaguePriest",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_main_skv_engineers = {
                Pools = {
                    "WarlockEngineer",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_main_skv_engineers_3 = {
                Pools = {
                    "WarlockMaster",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            alliance_wh2_main_skv_clan_skyre = {
                Pools = {
                    WarlockMaster = {
                        AgentSubTypes = {
                            wh2_dlc12_skv_warlock_master = {
                                MaximumPercentage = 100,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                Events = {
                    Incident = "wh_main_skv_warlock_master",
                    Dilemma = nil,
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
        },
        Heroes = {
            "wh2_main_skv_assassin",
            "wh2_main_skv_plague_priest",
            "wh2_main_skv_warlock_engineer",
            "wh2_dlc14_skv_eshin_sorcerer",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 12,
            },
            BoneBreaker = {
                BonusCost = 300,
                Weighting = 5,
            },
            PlagueFurnace = {
                BonusCost = 750,
                Weighting = 3,
            },
            ScreamingBell = {
                BonusCost = 1000,
                Weighting = 2,
            },
            DoomFlayer = {
                BonusCost = 250,
                Weighting = 6,
            },
            DoomWheel = {
                BonusCost = 750,
                Weighting = 3,
            },
        },
        AgentSubTypes = {
            wh2_main_skv_warlord = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_skv_warlord_bonebreaker = {
                        MountData = "BoneBreaker",
                    },
                },
            },
            wh2_main_skv_grey_seer_plague = {
                BonusCost = 450,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_skv_grey_seer_plague_screaming_bell = {
                        MountData = "ScreamingBell",
                    },
                },
            },
            wh2_main_skv_grey_seer_ruin = {
                BonusCost = 450,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_skv_grey_seer_ruin_screaming_bell = {
                        MountData = "ScreamingBell",
                    },
                },
            },
            wh2_dlc12_skv_warlock_master = {
                BonusCost = 300,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc12_anc_mount_skv_warlock_master_doom_flayer = {
                        MountData = "DoomFlayer",
                    },
                    wh2_dlc12_anc_mount_skv_warlock_master_doomwheel = {
                        MountData = "DoomWheel",
                    },
                },
            },
            wh2_dlc14_skv_master_assassin = {
                BonusCost = 400,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_skv_assassin = {
                BonusCost = 300,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_skv_plague_priest = {
                BonusCost = 250,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_skv_plague_priest_plague_furnace = {
                        MountData = "PlagueFurnace",
                    },
                },
            },
            wh2_dlc14_skv_eshin_sorcerer = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
        Traits = {
            wh2_main_skill_innate_skv_sharp_claws = {

            },
            wh2_main_skill_innate_skv_sharp_teeth = {

            },
            wh2_main_skill_innate_skv_sneaky = {

            },
            wh2_main_skill_innate_skv_warpstone_hoarder = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_charismatic",
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_handsome",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
        },
    };
end