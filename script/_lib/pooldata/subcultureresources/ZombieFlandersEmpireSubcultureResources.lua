function GetZombieFlandersEmpireSubcultureResources()
    return {
        Heroes = {
            "wh_main_emp_master_engineer",
        },
        MountData = {
            EngineerRepeater = {
                BonusCost = 50,
                Weighting = 8,
            },
            EngineerGrenade = {
                BonusCost = 100,
                Weighting = 6,
            },
            EngineerRifle = {
                BonusCost = 150,
                Weighting = 5,
            },
            MechanicalSteedRepeater = {
                BonusCost = 250,
                Weighting = 4,
            },
            MechanicalSteedGrenade = {
                BonusCost = 300,
                Weighting = 3,
            },
            MechanicalSteedRifle = {
                BonusCost = 350,
                Weighting = 2,
            },
        },
        AgentSubTypes = {
            wh_main_emp_master_engineer = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    --[[wh_main_anc_master_engineer_repeater = {
                        MountData = "EngineerRepeater",
                    },
                    wh_main_anc_master_engineer_grenade = {
                        MountData = "EngineerGrenade",
                    },
                    wh_main_anc_master_engineer_rifle = {
                        MountData = "EngineerRifle",
                    },
                    wh_main_anc_mount_mechsteed_repeater = {
                        MountData = "MechanicalSteedRepeater",
                    },
                    wh_main_anc_mount_mechsteed_grenade = {
                        MountData = "MechanicalSteedGrenade",
                    },
                    wh_main_anc_mount_mechsteed_rifle = {
                        MountData = "MechanicalSteedRifle",
                    },--]]
                },
            },
        },
    };
end