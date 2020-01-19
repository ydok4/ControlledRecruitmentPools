function GetChaosSubcultureResources()
    return {
        DefaultLords = {"chs_lord"},
        Rewards = {
            wh_main_horde_chaos_settlement_4 = {
                Pools = {
                    "ChaosLord",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh_main_horde_chaos_settlement_5 = {
                Pools = {
                    "ChaosLord",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh_main_horde_chaos_warriors_2 = {
                Pools = {
                    "ExaltedHeroes",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh_main_horde_chaos_warriors_3 = {
                Pools = {
                    "ExaltedHeroes",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh_main_horde_chaos_magic_1 = {
                Pools = {
                    "Sorcerers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh_main_horde_chaos_magic_2 = {
                Pools = {
                    "Sorcerers",
                    "SorcerorLords",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
        },
        Heroes = {
            "chs_chaos_sorcerer_death",
            "chs_chaos_sorcerer_fire",
            "chs_chaos_sorcerer_metal",
            "chs_exalted_hero",
            "dlc07_chs_chaos_sorcerer_shadow",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            ChaosSteed = {
                BonusCost = 100,
                Weighting = 12,
            },
            BardedChaosSteed = {
                BonusCost = 120,
                Weighting = 12,
            },
            Manticore = {
                BonusCost = 750,
                Weighting = 3,
            },
            ChaosDragon = {
                BonusCost = 1650,
                Weighting = 1,
            },
        },
        AgentSubTypes = {
            chs_lord = {
                BonusCost = 350,
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_chs_chaos_lord_chaos_steed = {
                        MountData = "ChaosSteed",
                    },
                    wh_main_anc_mount_chs_chaos_lord_barded_chaos_steed = {
                        MountData = "BardedChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_lord_manticore = {
                        MountData = "Manticore",
                    },
                    wh_dlc01_anc_mount_chs_chaos_lord_chaos_dragon = {
                        MountData = "ChaosDragon",
                    },
                },
            },
            chs_sorcerer_lord_death = {
                BonusCost = 400,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_death_chaos_steed = {
                        MountData = "ChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_death_barded_chaos_steed = {
                        MountData = "BardedChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_death_manticore = {
                        MountData = "Manticore",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_death_dragon = {
                        MountData = "ChaosDragon",
                    },
                },
            },
            chs_sorcerer_lord_fire = {
                BonusCost = 400,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_fire_chaos_steed = {
                        MountData = "ChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_fire_barded_chaos_steed = {
                        MountData = "BardedChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_fire_manticore = {
                        MountData = "Manticore",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_fire_dragon = {
                        MountData = "ChaosDragon",
                    },
                },
            },
            chs_sorcerer_lord_metal = {
                BonusCost = 400,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_metal_chaos_steed = {
                        MountData = "ChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_metal_barded_chaos_steed = {
                        MountData = "BardedChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_metal_manticore = {
                        MountData = "Manticore",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_metal_dragon = {
                        MountData = "ChaosDragon",
                    },
                },
            },
            dlc07_chs_sorcerer_lord_shadow = {
                BonusCost = 400,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_shadow_chaos_steed = {
                        MountData = "ChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_shadow_barded_chaos_steed = {
                        MountData = "BardedChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_shadow_manticore = {
                        MountData = "Manticore",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_lord_shadow_dragon = {
                        MountData = "ChaosDragon",
                    },
                },
            },
            chs_chaos_sorcerer_death = {
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_chs_chaos_sorcerer_death_chaos_steed = {
                        MountData = "ChaosSteed",
                    },
                    wh_main_anc_mount_chs_chaos_sorcerer_death_barded_chaos_steed = {
                        MountData = "BardedChaosSteed",
                    },
                    wh_main_anc_mount_chs_chaos_sorcerer_death_manticore = {
                        MountData = "Manticore",
                    },
                },
            },
            chs_chaos_sorcerer_fire = {
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_chs_chaos_sorcerer_fire_chaos_steed = {
                        MountData = "ChaosSteed",
                    },
                    wh_main_anc_mount_chs_chaos_sorcerer_fire_barded_chaos_steed = {
                        MountData = "BardedChaosSteed",
                    },
                    wh_main_anc_mount_chs_chaos_sorcerer_fire_manticore = {
                        MountData = "Manticore",
                    },
                },
            },
            chs_chaos_sorcerer_metal = {
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_chs_chaos_sorcerer_metal_chaos_steed = {
                        MountData = "ChaosSteed",
                    },
                    wh_main_anc_mount_chs_chaos_sorcerer_metal_barded_chaos_steed = {
                        MountData = "BardedChaosSteed",
                    },
                    wh_main_anc_mount_chs_chaos_sorcerer_metal_manticore = {
                        MountData = "Manticore",
                    },
                },
            },
            chs_exalted_hero = {
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_chs_exalted_hero_chaos_steed = {
                        MountData = "ChaosSteed",
                    },
                    wh_main_anc_mount_chs_exalted_hero_barded_chaos_steed = {
                        MountData = "BardedChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_exalted_hero_manticore = {
                        MountData = "Manticore",
                    },
                },
            },
            dlc07_chs_chaos_sorcerer_shadow = {
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_shadow_chaos_steed = {
                        MountData = "ChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_shadow_barded_chaos_steed = {
                        MountData = "BardedChaosSteed",
                    },
                    wh_dlc01_anc_mount_chs_chaos_sorcerer_shadow_manticore = {
                        MountData = "Manticore",
                    },
                },
            },
        },
        Traits = {
            wh2_main_skill_innate_chs_diabolic_spendour = {

            },
            wh2_main_skill_innate_chs_dominance = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
        },
    };
end