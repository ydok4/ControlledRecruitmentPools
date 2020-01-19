function GetCataphHighElfSeaLordSubcultureResources()
    return {
        Rewards = {
            alliance_wh2_main_hef_eataine = {
                Pools = {
                    SeaHelms = {
                        AgentSubTypes = {
                            AK_hef_seahelm = {
                                MaximumPercentage = 100,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                Events = {
                    Incident = "wh_main_crp_hef_seahelm",
                    Dilemma = nil,
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
        },
        MountData = {
            Roc = {
                BonusCost = 200,
                Weighting = 8,
            },
        },
        AgentSubTypes = {
            AK_hef_seahelm = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    AK_hef_seahelm_roc = {
                        MountData = "Roc",
                    },
                },
            },
        },
    };
end