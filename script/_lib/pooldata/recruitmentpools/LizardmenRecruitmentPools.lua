function GetLizardmenRecruitmentPoolData()
        return {
        -- Default pool distribution
        wh2_main_sc_lzd_lizardmen = {
            HeroPools = {
                ScarVeteran = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_scar_veteran = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SkinkChiefs = {
                    AgentSubTypes = {
                        wh2_main_lzd_skink_chief = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SkinkPriests = {
                    AgentSubTypes = {
                        wh2_main_lzd_skink_priest_beasts = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_lzd_skink_priest_heavens = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_old_blood = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                KroxigorAncients = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_kroxigor_ancient = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                RedCrestedSkinkChiefs = {
                    AgentSubTypes = {
                        wh2_dlc12_lzd_red_crested_skink_chief = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Major Lizardmen Factions
        -- Hexoatl (Mazdamundi)
        wh2_main_lzd_hexoatl = {
            FactionPools = {
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_old_blood = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                --[[Slann = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_slann_mage_priest_fire = {
                            MaximumPercentage = 2,
                        },
                        wh2_dlc13_lzd_slann_mage_priest_high = {
                            MaximumPercentage = 2,
                        },
                        wh2_dlc13_lzd_slann_mage_priest_life = {
                            MaximumPercentage = 2,
                        },
                        wh2_main_lzd_slann_mage_priest = {
                            MaximumPercentage = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },--]]
                KroxigorAncients = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_kroxigor_ancient = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                RedCrestedSkinkChiefs = {
                    AgentSubTypes = {
                        wh2_dlc12_lzd_red_crested_skink_chief = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Itza (Gor-Rok)
        wh2_main_lzd_itza = {
            DefaultLords = {"wh2_main_lzd_saurus_old_blood"},
            FactionPools = {
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_old_blood = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                --[[Slann = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_slann_mage_priest_fire = {
                            MaximumPercentage = 2,
                        },
                        wh2_dlc13_lzd_slann_mage_priest_high = {
                            MaximumPercentage = 2,
                        },
                        wh2_dlc13_lzd_slann_mage_priest_life = {
                            MaximumPercentage = 2,
                        },
                        wh2_main_lzd_slann_mage_priest = {
                            MaximumPercentage = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },--]]
            },
            LordPoolMaxSize = 4,
        },

        -- Cult of Sotek
        wh2_dlc12_lzd_cult_of_sotek = {
            FactionPools = {
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_old_blood = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                RedCrestedSkinkChiefs = {
                    AgentSubTypes = {
                        wh2_dlc12_lzd_red_crested_skink_chief = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Spirit of the Jungle (Nakai)
        wh2_dlc13_lzd_spirits_of_the_jungle = {
            FactionPools = {
                KroxigorAncients = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_kroxigor_ancient_horde = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_saurus_old_blood_horde = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
            RemapAgentKeys = {
                wh2_dlc12_lzd_red_crested_skink_chief = "wh2_dlc13_lzd_red_crested_skink_chief_horde",
            },
        },

        -- Tlaqua (Tiq-tac-to)
        wh2_main_lzd_tlaqua = {
            HeroPools = {
                ScarVeteran = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_scar_veteran = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SkinkChiefs = {
                    AgentSubTypes = {
                        wh2_dlc12_lzd_tlaqua_skink_chief = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SkinkPriests = {
                    AgentSubTypes = {
                        wh2_dlc12_lzd_tlaqua_skink_priest_beasts = {
                            MaximumPercentage = 50,
                        },
                        wh2_dlc12_lzd_tlaqua_skink_priest_heavens = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_old_blood = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end