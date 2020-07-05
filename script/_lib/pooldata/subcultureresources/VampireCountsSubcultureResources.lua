function GetVampireCountsSubcultureResources()
    return {
        DefaultLords = {"vmp_master_necromancer"},
        Rewards = {
            wh_main_VAMPIRES_bindingcircle = {
                Pools = {
                    "WightKings",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_main_special_mousillon_merovech = {
                Pools = {
                    "WightKings",
                },
                Events = {
                },
                IncreasePoolSize = 2,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_VAMPIRES_ossuary = {
                Pools = {
                    "Necromancers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_vmp_necromancers_2 = {
                Pools = {
                    "MasterNecromancers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh_main_VAMPIRES_vampires = {
                Pools = {
                    "Vampires",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_vmp_vampires_2 = {
                Pools = {
                    "VampireLords",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh2_main_vmp_wraiths_2 = {
                Pools = {
                    "Banshees",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh2_main_special_castle_drachenfels_1 = {
                Pools = {
                    "Necromancers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh2_main_special_castle_drachenfels_2 = {
                Pools = {
                    "Necromancers",
                },
                Events = {
                },
                IncreasePoolSize = 3,
                Type = "set",
            },
            wh_main_vmp_ossuary_2 = {
                Pools = {
                    "Necromancers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh_main_special_college_of_magic_vampires = {
                Pools = {
                    "Necromancers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh_main_special_conclave_of_magic_vampires = {
                Pools = {
                    "Necromancers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh2_main_special_ghrond_convent_of_sorcery_1_vmp = {
                Pools = {
                    "Necromancers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh2_main_special_ghrond_convent_of_sorcery_2_vmp = {
                Pools = {
                    "Necromancers",
                },
                Events = {
                },
                IncreasePoolSize = 3,
                Type = "set",
            },
        },
        Heroes = {
            "vmp_banshee",
            "vmp_necromancer",
            "vmp_vampire",
            "vmp_wight_king",
            "wh_dlc05_vmp_vampire_shadow",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            Nightmare = {
                BonusCost = 75,
                Weighting = 12,
            },
            BardedNightmare = {
                BonusCost = 100,
                Weighting = 12,
            },
            HellSteed = {
                BonusCost = 250,
                Weighting = 6,
            },
            CorpseCart = {
                BonusCost = 200,
                Weighting = 10,
            },
            CorpseCartBalefire = {
                BonusCost = 300,
                Weighting = 7,
            },
            CorpseCartUnholyLodestone = {
                BonusCost = 400,
                Weighting = 4,
            },
            Terrorgheist = {
                BonusCost = 1150,
                Weighting = 2,
            },
            ZombieDragon = {
                BonusCost = 1250,
                Weighting = 1,
            },
        },
        AgentSubTypes = {
            vmp_master_necromancer = {
                BonusCost = 65,
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_vmp_master_necromancer_barded_nightmare = {
                        MountData = "BardedNightmare",
                    },
                    wh_main_anc_mount_vmp_master_necromancer_hellsteed = {
                        MountData = "HellSteed",
                    },
                    wh_dlc04_anc_mount_vmp_master_necromancer_corpse_cart = {
                        MountData = "CorpseCart",
                    },
                    wh_dlc04_anc_mount_vmp_master_necromancer_corpse_cart_balefire = {
                        MountData = "CorpseCartBalefire",
                    },
                    wh_dlc04_anc_mount_vmp_master_necromancer_corpse_cart_unholy_lodestone = {
                        MountData = "CorpseCartUnholyLodestone",
                    },
                },
            },
            vmp_lord = {
                BonusCost = 350,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_vmp_vampire_lord_barded_nightmare = {
                        MountData = "BardedNightmare",
                    },
                    wh_main_anc_mount_vmp_vampire_lord_hellsteed = {
                        MountData = "HellSteed",
                    },
                    wh_main_anc_mount_vmp_vampire_lord_zombie_dragon = {
                        MountData = "ZombieDragon",
                    },
                },
            },
            dlc04_vmp_strigoi_ghoul_king = {
                BonusCost = 500,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc04_anc_mount_vmp_strigoi_ghoul_king_terrorgheist = {
                        MountData = "Terrorgheist",
                    },
                },
            },
            wh2_dlc11_vmp_bloodline_von_carstein = {
                BonusCost = 650,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_von_carstein_barded_nightmare = {
                        MountData = "BardedNightmare",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_von_carstein_hellsteed = {
                        MountData = "HellSteed",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_von_carstein_zombie_dragon = {
                        MountData = "ZombieDragon",
                    },
                },
            },
            wh2_dlc11_vmp_bloodline_blood_dragon = {
                BonusCost = 650,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_blood_dragon_barded_nightmare = {
                        MountData = "BardedNightmare",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_blood_dragon_hellsteed = {
                        MountData = "HellSteed",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_blood_dragon_zombie_dragon = {
                        MountData = "ZombieDragon",
                    },
                },
            },
            wh2_dlc11_vmp_bloodline_lahmian = {
                BonusCost = 650,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_lahmian_barded_nightmare = {
                        MountData = "BardedNightmare",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_lahmian_hellsteed = {
                        MountData = "HellSteed",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_lahmian_zombie_dragon = {
                        MountData = "ZombieDragon",
                    },
                },
            },
            wh2_dlc11_vmp_bloodline_strigoi = {
                BonusCost = 650,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_strigoi_terrorgheist = {
                        MountData = "Terrorgheist",
                    },
                },
            },
            wh2_dlc11_vmp_bloodline_necrarch = {
                BonusCost = 650,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_necrarch_barded_nightmare = {
                        MountData = "BardedNightmare",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_necrarch_hellsteed = {
                        MountData = "HellSteed",
                    },
                    wh2_dlc11_anc_mount_vmp_bloodline_necrarch_zombie_dragon = {
                        MountData = "ZombieDragon",
                    },
                },
            },
            vmp_banshee = {
                BonusCost = 480,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            vmp_necromancer = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_vmp_necromancer_nightmare = {
                        MountData = "Nightmare",
                    },
                    wh_dlc04_anc_mount_vmp_necromancer_corpse_cart = {
                        MountData = "CorpseCart",
                    },
                    wh_dlc04_anc_mount_vmp_necromancer_corpse_cart_balefire = {
                        MountData = "CorpseCartBalefire",
                    },
                    wh_dlc04_anc_mount_vmp_necromancer_corpse_cart_unholy_lodestone = {
                        MountData = "CorpseCartUnholyLodestone",
                    },
                },
            },
            vmp_vampire = {
                BonusCost = 500,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_vmp_vampire_barded_nightmare = {
                        MountData = "BardedNightmare",
                    },
                    wh_main_anc_mount_vmp_vampire_hellsteed = {
                        MountData = "HellSteed",
                    },
                },
            },
            vmp_wight_king = {
                BonusCost = 400,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_vmp_wight_king_skeletal_steed = {
                        MountData = "Nightmare",
                    },
                    wh_main_anc_mount_vmp_wight_king_barded_skeletal_steed = {
                        MountData = "BardedNightmare",
                    },
                },
            },
            wh_dlc05_vmp_vampire_shadow = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc05_anc_mount_vmp_vampire_shadow_barded_nightmare = {
                        MountData = "BardedNightmare",
                    },
                    wh_dlc05_anc_mount_vmp_vampire_shadow_hellsteed = {
                        MountData = "HellSteed",
                    },
                },
            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_magnanimous",
        },
    };
end