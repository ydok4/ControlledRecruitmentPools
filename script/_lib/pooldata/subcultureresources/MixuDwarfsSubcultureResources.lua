function GetMixuDwarfsSubcultureResources()
    return {
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