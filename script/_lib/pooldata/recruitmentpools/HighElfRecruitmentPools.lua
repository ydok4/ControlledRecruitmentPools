function GetHighElfRecruitmentPoolData()
        return {
        -- Default pool distribution
        wh2_main_sc_hef_high_elves = {
            HeroPools = {
                HandMaidens = {
                    AgentSubTypes = {
                        wh2_dlc10_hef_handmaiden = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                MagesPool = {
                    AgentSubTypes = {
                        wh2_dlc10_hef_mage_heavens = {
                            MaximumPercentage = 20,
                        },
                        wh2_dlc10_hef_mage_shadows = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_high = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_life = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_light = {
                            MaximumPercentage = 20,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                LoremasterOfHoethPool = {
                    AgentSubTypes = {
                        wh2_main_hef_loremaster_of_hoeth = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                NoblePool = {
                    AgentSubTypes = {
                        wh2_main_hef_noble = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess  = {
                            MaximumPercentage = 50,
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
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },

            LordPoolMaxSize = 4,
        },

        -- Major High Elf Factions

        -- Lothern
        wh2_main_hef_eataine = {
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_mid  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_high  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },

            LordPoolMaxSize = 4,
        },

        -- Order of Loremasters
        wh2_main_hef_order_of_loremasters = {
            HeroPools = {
                MagesPool = {
                    AgentSubTypes = {
                        wh2_dlc10_hef_mage_heavens = {
                            MaximumPercentage = 20,
                        },
                        wh2_dlc10_hef_mage_shadows = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_high = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_life = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_light = {
                            MaximumPercentage = 20,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                LoremasterOfHoethPool = {
                    AgentSubTypes = {
                        wh2_main_hef_loremaster_of_hoeth = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 3,
                },
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_mid  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_high  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },

            LordPoolMaxSize = 4,
        },

        -- Averlorn
        wh2_main_hef_avelorn = {
            HeroPools = {
                MagesPool = {
                    AgentSubTypes = {
                        wh2_dlc10_hef_mage_heavens = {
                            MaximumPercentage = 20,
                        },
                        wh2_dlc10_hef_mage_shadows = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_high = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_life = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_light = {
                            MaximumPercentage = 20,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                HandMaidens = {
                    AgentSubTypes = {
                        wh2_dlc10_hef_handmaiden = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
            FactionPools = {
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_mid  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_high  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },

            LordPoolMaxSize = 4,
        },

        -- Nagarythe
        wh2_main_hef_nagarythe = {
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess  = {
                            MaximumPercentage = 50,
                         },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_mid  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_high  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },

            LordPoolMaxSize = 4,
        },

        -- Minor High Elf Factions
        -- Caledor
        wh2_main_hef_caledor = {
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince= {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_mid  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_high  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Saphery
        wh2_main_hef_saphery = {
            HeroPools = {
                MagesPool = {
                    AgentSubTypes = {
                        wh2_dlc10_hef_mage_heavens = {
                            MaximumPercentage = 20,
                        },
                        wh2_dlc10_hef_mage_shadows = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_high = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_life = {
                            MaximumPercentage = 20,
                        },
                        wh2_main_hef_mage_light = {
                            MaximumPercentage = 20,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                LoremasterOfHoethPool = {
                    AgentSubTypes = {
                        wh2_main_hef_loremaster_of_hoeth = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                LowPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince= {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                MidPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_mid = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_mid  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                HighPrinces = {
                    AgentSubTypes = {
                        wh2_main_hef_prince_high = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_hef_princess_high  = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end