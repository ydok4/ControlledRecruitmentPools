function GetMixuVampireCoastSubcultureResources()
    return {
        Rewards = {
            wh2_dlc11_vampirecoast_support_monsters = {
                Pools = {
                    "AncientSyreen",
                },
                MinimumRequireBuildingLevel = 1,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
        },
        Heroes = {
            "cst_ancient_syreen",
        },
        AgentSubTypes = {
            cst_ancient_syreen = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
    };
end