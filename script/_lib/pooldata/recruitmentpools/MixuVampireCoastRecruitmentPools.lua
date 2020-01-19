function GetMixuVampireCoastRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh2_dlc11_sc_cst_vampire_coast = {
            HeroPools = {
                AncientSyreen = {
                    AgentSubTypes = {
                        cst_ancient_syreen = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
        },
        -- Major Faction specific distributions
        --Cylostra
        wh2_dlc11_cst_the_drowned = {
            HeroPools = {
                AncientSyreen = {
                    AgentSubTypes = {
                        cst_ancient_syreen = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                VampireCaptains = {
                    AgentSubTypes = {
                        wh2_dlc11_cst_fleet_captain = {
                            MaximumPercentage = 33,
                        },
                        wh2_dlc11_cst_fleet_captain_death = {
                            MaximumPercentage = 33,
                        },
                        wh2_dlc11_cst_fleet_captain_deep = {
                            MaximumPercentage = 33,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                GunneryWight = {
                    AgentSubTypes = {
                        wh2_dlc11_cst_gunnery_wight = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                Mourghul = {
                    AgentSubTypes = {
                        wh2_dlc11_cst_mourngul = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
        },
        -- Minor faction specific distributions
    };
end