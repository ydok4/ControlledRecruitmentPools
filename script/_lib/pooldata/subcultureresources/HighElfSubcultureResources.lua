function GetHighElfSubcultureResources()
    return {
        DefaultLords = {"wh2_main_hef_prince", "wh2_main_hef_princess"},
        Rewards = {

        },
        Heroes = {
            "wh2_dlc10_hef_handmaiden",
            "wh2_dlc10_hef_mage_heavens",
            "wh2_dlc10_hef_mage_shadows",
            "wh2_main_hef_loremaster_of_hoeth",
            "wh2_main_hef_mage_high",
            "wh2_main_hef_mage_life",
            "wh2_main_hef_mage_light",
            "wh2_main_hef_noble",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            wh2_main_hef_prince = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_hef_princess = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_hef_prince_mid = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_hef_princess_mid = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_hef_prince_high = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_hef_princess_high = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
    };
end