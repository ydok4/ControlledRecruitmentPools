function GetHighElfRecruitmentPoolData()
        return {
        -- Default pool distribution
        wh2_main_sc_hef_high_elves = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                Princes = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess_mid  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_prince_high = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_main_hef_princess_high  = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },

            LordPoolMaxSize = 7,
        },

        -- Major High Elf Factions

        -- Lothern
        wh2_main_hef_eataine = {
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_main_hef_princess  = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess_mid  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess_high  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },

            LordPoolMaxSize = 8,
        },

        -- Order of Loremasters
        wh2_main_hef_order_of_loremasters = {
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        wh2_main_hef_princess  = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 3,
                },
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_main_hef_princess_mid  = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess_high  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },

            LordPoolMaxSize = 7,
        },

        -- Averlorn
        wh2_main_hef_avelorn = {
            FactionPools = {
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess_mid  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess_high  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },

            LordPoolMaxSize = 7,
        },

        -- Nagarythe
        wh2_main_hef_nagarythe = {
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                         },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess_mid  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_main_hef_princess_high  = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },

            LordPoolMaxSize = 7,
        },

        -- Minor High Elf Factions
        -- Caledor
        wh2_main_hef_caledor = {
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince= {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_main_hef_princess  = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess_mid  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_hef_princess_high  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },

            LordPoolMaxSize = 7,
        },
    };
end