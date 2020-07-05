function GetCataphHighElfDragonMageSubcultureResources()
    return {
        Rewards = {
            alliance_wh2_main_hef_caledor = {
                Pools = {
                    "DragonMages",
                },
                Events = {
                    Incident = "wh_main_crp_hef_seahelm",
                    Dilemma = nil,
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
            alliance_wh2_dlc15_hef_imrik = {
                Pools = {
                    "DragonMages",
                },
                Events = {
                    Incident = "wh_main_crp_hef_seahelm",
                    Dilemma = nil,
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
        },
        Heroes = {
            "AK_hef_dragonmage",
        },
        MountData = {
            SunArmour = {
                BonusCost = 0,
                Weighting = 15,
            },
            SunDragonSunMage = {
                BonusCost = 1150,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            AK_hef_dragonmage = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    AK_hef_dragonmage_armour = {
                        MountData = "SunArmour",
                    },
                    AK_hef_dragonmage_bhorse = {
                        MountData = "IthilmarSteed",
                    },
                    AK_hef_dragonmage_sun = {
                        MountData = "SunDragonSunMage",
                    },
                },
            },
        },
    };
end