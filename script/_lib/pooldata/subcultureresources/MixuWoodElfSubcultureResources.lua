function GetMixuWoodElfSubcultureResources()
    return {
        Rewards = {
            wh_dlc05_wef_spellsingers_3 = {
                Pools = {
                    "SpellWeavers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh_dlc05_wef_melee_3 = {
                Pools = {
                    "Shadowdancer",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
        },
        Heroes = {
            "wef_shadowdancer",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            wef_darkweaver = {
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_wef_darkweaver_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh_main_anc_mount_wef_darkweaver_unicorn = {
                        MountData = "Unicorn",
                    },
                    wh_main_anc_mount_wef_darkweaver_great_eagle = {
                        MountData = "GreatEagle",
                    },
                },
            },
            wef_highweaver = {
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_wef_highweaver_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh_main_anc_mount_wef_highweaver_unicorn = {
                        MountData = "Unicorn",
                    },
                    wh_main_anc_mount_wef_highweaver_great_eagle = {
                        MountData = "GreatEagle",
                    },
                },
            },
            wef_spellweaver = {
                BonusCost = 200,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_wef_spellweaver_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh_main_anc_mount_wef_spellweaver_unicorn = {
                        MountData = "Unicorn",
                    },
                    wh_main_anc_mount_wef_spellweaver_great_eagle = {
                        MountData = "GreatEagle",
                    },
                },
            },
            wef_shadowdancer = {
                BonusCost = 250,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
    };
end