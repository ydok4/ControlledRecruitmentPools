function GetVampireCoastSubcultureResources()
    return {
        DefaultLords = {"wh2_dlc11_cst_admiral", "wh2_dlc11_cst_admiral_fem"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "Admirals",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_dlc11_vampirecoast_port = {
                Pools = {
                    "VampireCaptains",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_dlc11_vampirecoast_ship_captains_cabin = {
                Pools = {
                    "VampireCaptains",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_dlc11_vampirecoast_support_monsters = {
                Pools = {
                    "Mourghul",
                },
                MinimumRequireBuildingLevel = 1,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_dlc11_vampirecoast_ship_hold = {
                Pools = {
                    "Mourghul",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_dlc11_vampirecoast_military_ranged = {
                Pools = {
                    "GunneryWight",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_dlc11_vampirecoast_ship_gunports = {
                Pools = {
                    "GunneryWight",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
        },
        Heroes = {
            "wh2_dlc11_cst_fleet_captain",
            "wh2_dlc11_cst_fleet_captain_death",
            "wh2_dlc11_cst_fleet_captain_deep",
            "wh2_dlc11_cst_gunnery_wight",
            "wh2_dlc11_cst_mourngul",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 10,
            },
            RottingPromethean = {
                BonusCost = 300,
                Weighting = 4,
            },
        },
        AgentSubTypes = {
            wh2_dlc11_cst_admiral = {
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_cst_fleet_admiral_vampires_rotting_promethean = {
                        MountData = "RottingPromethean",
                    },
                },
            },
            wh2_dlc11_cst_admiral_fem = {
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_cst_fleet_admiral_fem_vampires_rotting_promethean = {
                        MountData = "RottingPromethean",
                    },
                },
            },
            wh2_dlc11_cst_admiral_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_cst_fleet_admiral_death_rotting_promethean = {
                        MountData = "RottingPromethean",
                    },
                },
            },
            wh2_dlc11_cst_admiral_fem_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_cst_fleet_admiral_death_fem_rotting_promethean = {
                        MountData = "RottingPromethean",
                    },
                },
            },
            wh2_dlc11_cst_admiral_deep = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_cst_fleet_admiral_deep_rotting_promethean = {
                        MountData = "RottingPromethean",
                    },
                },
            },
            wh2_dlc11_cst_admiral_fem_deep = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_cst_fleet_admiral_deep_fem_rotting_promethean = {
                        MountData = "RottingPromethean",
                    },
                },
            },
            wh2_dlc11_cst_fleet_captain = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_cst_fleet_captain_vampires_rotting_promethean = {
                        MountData = "RottingPromethean",
                    },
                },
            },
            wh2_dlc11_cst_fleet_captain_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_cst_fleet_captain_death_rotting_promethean = {
                        MountData = "RottingPromethean",
                    },
                },
            },
            wh2_dlc11_cst_fleet_captain_deep = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_cst_fleet_captain_deep_rotting_promethean = {
                        MountData = "RottingPromethean",
                    },
                },
            },
            wh2_dlc11_cst_gunnery_wight = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc11_anc_mount_cst_gunnery_wight_rotting_promethean = {
                        MountData = "RottingPromethean",
                    },
                },
            },
            wh2_dlc11_cst_mourngul = {
                BonusCost = 300,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
        Traits = {
            wh2_dlc11_skill_innate_cst_looter = {

            },
            wh2_dlc11_skill_innate_cst_murderer = {

            },
            wh2_dlc11_skill_innate_cst_ringleader = {

            },
            wh2_dlc11_skill_innate_cst_schemer = {

            },
            wh2_dlc11_skill_innate_cst_smuggler = {

            },
        },
    };
end