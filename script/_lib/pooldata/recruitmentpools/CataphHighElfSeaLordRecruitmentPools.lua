function GetCataphHighElfSeaLordRecruitmentPoolData()
    return {
        -- Major High Elf Factions
        wh2_main_hef_eataine = {
            FactionPools = {
                SeaHelms = {
                    AgentSubTypes = {
                        AK_hef_seahelm = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 6,
        },
        wh2_main_hef_order_of_loremasters = {
            FactionPools = {
                SeaHelms = {
                    AgentSubTypes = {
                        AK_hef_seahelm = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },

            LordPoolMaxSize = 7,
        },
        -- Minor High Elf Factions
        wh2_main_hef_cothique = {
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MaximumPercentage = 50,
                            HumanPlayerOnly = true,
                        },
                        wh2_main_hef_princess = {
                            MaximumPercentage = 50,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                Princes = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MaximumPercentage = 33,
                        },
                        wh2_main_hef_princess_mid  = {
                            MaximumPercentage = 33,
                        },
                        wh2_main_hef_prince_high = {
                            MaximumPercentage = 17,
                        },
                        wh2_main_hef_princess_high  = {
                            MaximumPercentage = 17,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
                SeaHelms = {
                    AgentSubTypes = {
                        AK_hef_seahelm = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },

            LordPoolMaxSize = 6,
        },

        wh2_main_hef_citadel_of_dusk = {
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MaximumPercentage = 50,
                            HumanPlayerOnly = true,
                        },
                        wh2_main_hef_princess  = {
                            MaximumPercentage = 50,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                Princes = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MaximumPercentage = 33,
                        },
                        wh2_main_hef_princess_mid  = {
                            MaximumPercentage = 33,
                        },
                        wh2_main_hef_prince_high = {
                            MaximumPercentage = 17,
                        },
                        wh2_main_hef_princess_high  = {
                            MaximumPercentage = 17,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
                SeaHelms = {
                    AgentSubTypes = {
                        AK_hef_seahelm = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },

            LordPoolMaxSize = 4,
        },
        wh2_main_hef_fortress_of_dawn = {
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MaximumPercentage = 50,
                            HumanPlayerOnly = true,
                        },
                        wh2_main_hef_princess  = {
                            MaximumPercentage = 50,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                Princes = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MaximumPercentage = 33,
                        },
                        wh2_main_hef_princess_mid  = {
                            MaximumPercentage = 33,
                        },
                        wh2_main_hef_prince_high = {
                            MaximumPercentage = 17,
                        },
                        wh2_main_hef_princess_high  = {
                            MaximumPercentage = 17,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
                SeaHelms = {
                    AgentSubTypes = {
                        AK_hef_seahelm = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 6,
        },
    };
end