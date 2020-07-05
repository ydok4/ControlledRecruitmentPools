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
                            MaximumPercentage = 11,
                        },
                        wh2_dlc10_hef_mage_shadows = {
                            MaximumPercentage = 11,
                        },
                        wh2_main_hef_mage_high = {
                            MaximumPercentage = 11,
                        },
                        wh2_main_hef_mage_life = {
                            MaximumPercentage = 11,
                        },
                        wh2_main_hef_mage_light = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_mage_beasts = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_mage_death = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_mage_fire = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_mage_metal = {
                            MaximumPercentage = 11,
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
                Princes = {
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
                ArchMages = {
                    AgentSubTypes = {
                        wh2_dlc15_hef_archmage_beasts = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_archmage_death  = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_archmage_fire  = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_archmage_heavens  = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_archmage_shadows  = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_archmage_high  = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_archmage_life  = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_archmage_light  = {
                            MaximumPercentage = 11,
                        },
                        wh2_dlc15_hef_archmage_metal  = {
                            MaximumPercentage = 11,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                --[[Princes = {
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
                },--]]
            },
            LordPoolMaxSize = 4,
        },

        -- Major High Elf Factions

        -- Lothern
        wh2_main_hef_eataine = {
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                ArchMages = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
            AutoUnlockHeroes = {
                "wh2_main_hef_noble",
            },
        },

        -- Order of Loremasters
        wh2_main_hef_order_of_loremasters = {
            HeroPools = {
                MagesPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                LoremasterOfHoethPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                ArchMages = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Averlorn
        wh2_main_hef_avelorn = {
            HeroPools = {
                MagesPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                HandMaidens = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                ArchMages = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Nagarythe
        wh2_main_hef_nagarythe = {
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Imrik
        wh2_dlc15_hef_imrik = {
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                ArchMages = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },

        wh2_main_hef_yvresse = {
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                ArchMages = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Minor High Elf Factions
        -- Caledor (Ulthuan)
        wh2_main_hef_caledor = {
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                ArchMages = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Saphery
        wh2_main_hef_saphery = {
            HeroPools = {
                MagesPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                LoremasterOfHoethPool = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                ArchMages = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end