function GetMixuDwarfsSubcultureResources()
    return {
        Rewards = {
            wh_main_DWARFS_slayers = {
                Pools = {
                    "DragonSlayers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_special_great_slayer_shrine_2wh_main_DWARFS_slayers = {
                Pools = {
                    "DragonSlayers",
                },
                Events = {
                },
                IncreasePoolSize = 2,
                Type = "set",
            },
        },
        Heroes = {
            "dwf_giant_slayer",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            dwf_giant_slayer = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
    };
end