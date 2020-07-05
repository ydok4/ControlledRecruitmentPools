function GetKislevSubcultureResources()
    return {
        DefaultLords = {"ksl_lord"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "EmpireGenerals",
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
            "ksl_bright_wizard",
            "ksl_captain",
            "emp_witch_hunter",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            ksl_lord = {
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            emp_bright_wizard = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            emp_captain = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
    };
end