function GetTombKingsSubcultureResources()
    return {
        DefaultLords = {"wh2_dlc09_tmb_tomb_king"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "TombKings",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_dlc09_tmb_estate_1 = {
                Pools = {
                    "TombPrinces",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh2_dlc09_tmb_ushabti_1 = {
                Pools = {
                    "Necrotect",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
        },
        Heroes = {
            "wh2_dlc09_tmb_liche_priest_death",
            "wh2_dlc09_tmb_liche_priest_light",
            "wh2_dlc09_tmb_liche_priest_nehekhara",
            --"wh2_dlc09_tmb_liche_priest_shadow",
            "wh2_dlc09_tmb_necrotect",
            "wh2_dlc09_tmb_tomb_prince",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            SkeletalSteed = {
                BonusCost = 75,
                Weighting = 12,
            },
            SkeletalChariot = {
                BonusCost = 300,
                Weighting = 8,
            },
            KhemrianWarsphinx = {
                BonusCost = 1050,
                Weighting = 2,
            },
        },
        AgentSubTypes = {
            wh2_dlc09_tmb_tomb_king = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc09_anc_mount_tmb_tomb_king_skeletal_steed = {
                        MountData = "SkeletalSteed",
                    },
                    wh2_dlc09_anc_mount_tmb_tomb_king_skeleton_chariot = {
                        MountData = "SkeletalChariot",
                    },
                    wh2_dlc09_anc_mount_tmb_tomb_king_khemrian_warsphinx = {
                        MountData = "KhemrianWarsphinx",
                    },
                },
            },
            wh2_dlc09_tmb_liche_priest_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc09_anc_mount_tmb_liche_priest_death_skeletal_steed = {
                        MountData = "SkeletalSteed",
                    },
                },
            },
            wh2_dlc09_tmb_liche_priest_light = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc09_anc_mount_tmb_liche_priest_light_skeletal_steed = {
                        MountData = "SkeletalSteed",
                    },
                },
            },
            wh2_dlc09_tmb_liche_priest_nehekhara = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc09_anc_mount_tmb_liche_priest_nehekhara_skeletal_steed = {
                        MountData = "SkeletalSteed",
                    },
                },
            },
            wh2_dlc09_tmb_liche_priest_shadow = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc09_anc_mount_tmb_liche_priest_shadow_skeletal_steed = {
                        MountData = "SkeletalSteed",
                    },
                },
            },
            wh2_dlc09_tmb_necrotect = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc09_anc_mount_tmb_necrotect_skeleton_chariot = {
                        MountData = "SkeletalSteed",
                    },
                },
            },
            wh2_dlc09_tmb_tomb_prince = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc09_anc_mount_tmb_tomb_prince_skeletal_steed = {
                        MountData = "SkeletalSteed",
                    },
                    wh2_dlc09_anc_mount_tmb_tomb_prince_skeleton_chariot = {
                        MountData = "SkeletalChariot",
                    },
                },
            },
        },
    };
end