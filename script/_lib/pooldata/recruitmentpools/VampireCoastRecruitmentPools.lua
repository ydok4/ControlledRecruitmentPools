function GetVampireCoastRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh2_dlc11_sc_cst_vampire_coast = {
            HeroPools = {
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
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
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
            HeroPoolMaxSize = 4,
            FactionPools = {
                Admirals = {
                    AgentSubTypes = {
                        wh2_dlc11_cst_admiral_death = {
                            MaximumPercentage = 16,
                        },
                        wh2_dlc11_cst_admiral_deep = {
                            MaximumPercentage = 16,
                        },
                        wh2_dlc11_cst_admiral_fem_death = {
                            MaximumPercentage = 16,
                        },
                        wh2_dlc11_cst_admiral_fem_deep = {
                            MaximumPercentage = 16,
                        },
                        wh2_dlc11_cst_admiral = {
                            MaximumPercentage = 16,
                        },
                        wh2_dlc11_cst_admiral_fem = {
                            MaximumPercentage = 16,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Major Faction specific distributions
        -- Luthor Harkon
        wh2_dlc11_cst_vampire_coast = {
            FactionPools = {
                Admirals = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },

        --Aranessa
        wh2_dlc11_cst_pirates_of_sartosa = {
            FactionPools = {
                Admirals = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },

        --Noctilus
        wh2_dlc11_cst_noctilus = {
            FactionPools = {
                Admirals = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },

        --Cylostra
        wh2_dlc11_cst_the_drowned = {
            FactionPools = {
                Admirals = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Minor faction specific distributions
    };
end