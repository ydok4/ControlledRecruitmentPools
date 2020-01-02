function GetVampireCoastRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh2_dlc11_sc_cst_vampire_coast = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                Admirals = {
                    AgentSubTypes = {
                        wh2_dlc11_cst_admiral_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_deep = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem_deep = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 5,
        },
        -- Major Faction specific distributions
        -- Luthor Harkon
        wh2_dlc11_cst_vampire_coast = {
            FactionPools = {
                Admirals = {
                    AgentSubTypes = {
                        wh2_dlc11_cst_admiral_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_deep = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem_deep = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 3,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 5,
        },

        --Aranessa
        wh2_dlc11_cst_pirates_of_sartosa = {
            FactionPools = {
                Admirals = {
                    AgentSubTypes = {
                        wh2_dlc11_cst_admiral_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_deep = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem_deep = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 5,
        },

        --Noctilus
        wh2_dlc11_cst_noctilus = {
            FactionPools = {
                Admirals = {
                    AgentSubTypes = {
                        wh2_dlc11_cst_admiral_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_deep = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem_deep = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 5,
        },

        --Cylostra
        wh2_dlc11_cst_the_drowned = {
            FactionPools = {
                Admirals = {
                    AgentSubTypes = {
                        wh2_dlc11_cst_admiral_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_deep = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem_deep = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc11_cst_admiral_fem = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 5,
        },
        -- Minor faction specific distributions
    };
end