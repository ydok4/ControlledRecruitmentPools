function GetCataphHighElfDragonMageSubcultureResources()
    return {
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