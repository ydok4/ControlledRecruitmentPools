function GetVampireCountsSubcultureResources()
    return {
        DefaultLords = {"vmp_master_necromancer"},
        Rewards = {

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
        },
        AgentSubTypes = {
            vmp_master_necromancer = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            vmp_lord = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc04_vmp_strigoi_ghoul_king = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc11_vmp_bloodline_von_carstein = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc11_vmp_bloodline_blood_dragon = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc11_vmp_bloodline_lahmian = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc11_vmp_bloodline_strigoi = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc11_vmp_bloodline_necrarch = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            vmp_banshee = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            vmp_necromancer = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            vmp_vampire = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            vmp_wight_king = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh_dlc05_vmp_vampire_shadow = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
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