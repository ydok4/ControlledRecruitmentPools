function GetCataphVampireCountsSubcultureResources()
    return {
        Rewards = {
            barrow_AK_hobo_barrow_king = {
                CreateNewAgent = true,
                CreateNewAgentSubTypeOverride = "AK_hobo_barrow_king",
                Type = "generate",
            },
            barrow_AK_hobo_druid_shadow = {
                CreateNewAgent = true,
                CreateNewAgentSubTypeOverride = "AK_hobo_druid_shadow",
                Type = "generate",
            },
            barrow_AK_hobo_druid_death = {
                CreateNewAgent = true,
                CreateNewAgentSubTypeOverride = "AK_hobo_druid_death",
                Type = "generate",
            },
            barrow_AK_hobo_druid_heavens = {
                CreateNewAgent = true,
                CreateNewAgentSubTypeOverride = "AK_hobo_druid_heavens",
                Type = "generate",
            },
        },
        Heroes = {
            "AK_hobo_barrow_king",
            "AK_hobo_druid_shadow",
            "AK_hobo_druid_death",
            "AK_hobo_druid_heavens",
        },
        MountData = {
            BarrowChariot = {
                BonusCost = 600,
                Weighting = 4,
            },
        },
        AgentSubTypes = {
            AK_hobo_barrow_king = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    AK_hobo_barrow_king_chariot = {
                        MountData = "BarrowChariot",
                    },
                },
            },
            AK_hobo_druid_shadow = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            AK_hobo_druid_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            AK_hobo_druid_heavens = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
    };
end