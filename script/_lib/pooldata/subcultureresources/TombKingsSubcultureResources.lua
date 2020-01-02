function GetTombKingsSubcultureResources()
    return {
        DefaultLords = {"wh2_dlc09_tmb_tomb_king"},
        Rewards = {

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
        },
        AgentSubTypes = {
            wh2_dlc09_tmb_tomb_king = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc09_tmb_liche_priest_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc09_tmb_liche_priest_light = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc09_tmb_liche_priest_nehekhara = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc09_tmb_liche_priest_shadow = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc09_tmb_necrotect = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc09_tmb_tomb_prince = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
    };
end