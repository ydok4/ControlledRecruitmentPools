function GetWoodElfSubcultureResources()
    return {
        DefaultLords = {"dlc05_wef_glade_lord", "dlc05_wef_glade_lord_fem"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "GladeLords",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh_dlc05_wef_ranged_3 = {
                Pools = {
                    "Waystalkers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh_dlc05_wef_spellsingers = {
                Pools = {
                    "Spellsingers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_dlc05_wef_tree_spirits = {
                Pools = {
                    "BranchWraiths",
                },
                MinimumRequireBuildingLevel = 1,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_dlc05_wef_tree_spirits_3 = {
                Pools = {
                    "AncientTreeman",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
        },
        Heroes = {
            "dlc05_wef_spellsinger_beasts",
            "dlc05_wef_spellsinger_life",
            "dlc05_wef_spellsinger_shadow",
            "dlc05_wef_waystalker",
            "wh_dlc05_wef_branchwraith",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 15,
            },
            ElvenSteed = {
                BonusCost = 0,
                Weighting = 8,
            },
            Unicorn = {
                BonusCost = 300,
                Weighting = 5,
            },
            GreatEagle = {
                BonusCost = 300,
                Weighting = 5,
            },
            ForestDragon = {
                BonusCost = 1500,
                Weighting = 2,
            },
        },
        AgentSubTypes = {
            dlc05_wef_glade_lord = {
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc05_anc_mount_wef_glade_lord_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh_dlc05_anc_mount_wef_glade_lord_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh_dlc05_anc_mount_wef_glade_lord_forest_dragon = {
                        MountData = "ForestDragon",
                    },
                },
            },
            dlc05_wef_glade_lord_fem = {
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc05_anc_mount_wef_glade_lord_elven_steed_fem = {
                        MountData = "ElvenSteed",
                    },
                    wh_dlc05_anc_mount_wef_glade_lord_great_eagle_fem = {
                        MountData = "GreatEagle",
                    },
                    wh_dlc05_anc_mount_wef_glade_lord_forest_dragon_fem = {
                        MountData = "ForestDragon",
                    },
                },
            },
            dlc05_wef_ancient_treeman = {
                BonusCost = 750,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc05_wef_spellsinger_beasts = {
                BonusCost = 150,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc05_anc_mount_wef_spellsinger_beast_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh_dlc05_anc_mount_wef_spellsinger_beast_unicorn = {
                        MountData = "Unicorn",
                    },
                    wh_dlc05_anc_mount_wef_spellsinger_beast_great_eagle = {
                        MountData = "GreatEagle",
                    },
                },
            },
            dlc05_wef_spellsinger_life = {
                BonusCost = 150,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc05_anc_mount_wef_spellsinger_life_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh_dlc05_anc_mount_wef_spellsinger_life_unicorn = {
                        MountData = "Unicorn",
                    },
                    wh_dlc05_anc_mount_wef_spellsinger_life_great_eagle = {
                        MountData = "GreatEagle",
                    },
                },
            },
            dlc05_wef_spellsinger_shadow = {
                BonusCost = 150,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc05_anc_mount_wef_spellsinger_shadow_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh_dlc05_anc_mount_wef_spellsinger_shadow_unicorn = {
                        MountData = "Unicorn",
                    },
                    wh_dlc05_anc_mount_wef_spellsinger_shadow_great_eagle = {
                        MountData = "GreatEagle",
                    },
                },
            },
            dlc05_wef_waystalker = {
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh_dlc05_wef_branchwraith = {
                BonusCost = 125,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
    };
end