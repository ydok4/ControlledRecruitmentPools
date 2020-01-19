function GetTEBSubcultureResources()
    return {
        DefaultLords = {"teb_lord"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "TEBLords",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
        },
        Heroes = {
            "teb_bright_wizard",
            "teb_captain",
            "emp_witch_hunter",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            WarHorse = {
                BonusCost = 75,
                Weighting = 15,
            },
            BardedWarHorse = {
                BonusCost = 100,
                Weighting = 12,
            },
        },
        AgentSubTypes = {
            teb_lord = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_teb_general_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_teb_general_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                },
            },
            teb_bright_wizard = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_teb_bright_wizard_warhorse = {
                        MountData = "WarHorse",
                    },
                },
            },
            teb_captain = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_teb_captain_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_teb_captain_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                },
            },
        },
    };
end