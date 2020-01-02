function GetLizardmenRecruitmentPoolData()
        return {
        -- Default pool distribution
        wh2_main_sc_lzd_lizardmen = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_old_blood = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 7,
        },

        -- Major Lizardmen Factions
        -- Hexoatl (Mazdamundi)
        wh2_main_lzd_hexoatl = {
            FactionPools = {
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_old_blood = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                --[[Slann = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_slann_mage_priest_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc13_lzd_slann_mage_priest_high = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc13_lzd_slann_mage_priest_life = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_lzd_slann_mage_priest = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },--]]
                KroxigorAncients = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_kroxigor_ancient = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                RedCrestedSkinkChiefs = {
                    AgentSubTypes = {
                        wh2_dlc12_lzd_red_crested_skink_chief = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 7,
        },
        -- Itza (Gor-Rok)
        wh2_main_lzd_itza = {
            DefaultLords = {"wh2_main_lzd_saurus_old_blood"},
            FactionPools = {
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_old_blood = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                --[[Slann = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_slann_mage_priest_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc13_lzd_slann_mage_priest_high = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_dlc13_lzd_slann_mage_priest_life = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        wh2_main_lzd_slann_mage_priest = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },--]]
            },
            LordPoolMaxSize = 7,
        },

        -- Cult of Sotek
        wh2_dlc12_lzd_cult_of_sotek = {
            FactionPools = {
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_main_lzd_saurus_old_blood = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                RedCrestedSkinkChiefs = {
                    AgentSubTypes = {
                        wh2_dlc12_lzd_red_crested_skink_chief = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            Rewards = {
                alliance = {
                    Pools = {
                        RedCrestedSkinkChiefs = {
                            AgentSubTypes = {
                                wh2_dlc12_lzd_red_crested_skink_chief = {
                                    MinimumAmount = 0,
                                    MaximumAmount = 1,
                                },
                            },
                            SubPoolInitialMinSize = 0,
                            SubPoolMaxSize = 1,
                        },
                    },
                    Events = {
                        Incident = "wh_main_lzd_red_crested_skink",
                        Dilemma = nil,
                    },
                    IncreasePoolSize = 1,
                    Type = "increase",
                },
            },
            LordPoolMaxSize = 7,
        },

        -- Spirit of the Jungle (Nakai)
        wh2_dlc13_lzd_spirits_of_the_jungle = {
            FactionPools = {
                KroxigorAncients = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_kroxigor_ancient_horde = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SaurusOldBloods = {
                    AgentSubTypes = {
                        wh2_dlc13_lzd_saurus_old_blood_horde = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
            RemapAgentKeys = {
                wh2_dlc12_lzd_red_crested_skink_chief = "wh2_dlc13_lzd_red_crested_skink_chief_horde",
            },
            Rewards = {
                alliance = {
                    Pools = {
                        KroxigorAncients = {
                            AgentSubTypes = {
                                wh2_dlc13_lzd_kroxigor_ancient = {
                                    MinimumAmount = 0,
                                    MaximumAmount = 1,
                                },
                            },
                            SubPoolInitialMinSize = 0,
                            SubPoolMaxSize = 1,
                        },
                    },
                    Events = {
                        Incident = "wh_main_lzd_kroxigor_ancient",
                        Dilemma = nil,
                    },
                    IncreasePoolSize = 1,
                    Type = "increase",
                },
            },
            LordPoolMaxSize = 6,
        },
    };
end