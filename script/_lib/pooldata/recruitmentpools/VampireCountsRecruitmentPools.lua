function GetVampireCountsRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_vmp_vampire_counts = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                MasterNecromancers = {
                    AgentSubTypes = {
                        vmp_master_necromancer = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Major Faction specific distributions

        -- Vampire Counts (Manfred)
        wh_main_vmp_vampire_counts = {
            FactionPools = {
                MasterNecromancers = {
                    AgentSubTypes = {
                        vmp_master_necromancer = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
                VampireLords = {
                    AgentSubTypes = {
                        vmp_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        dlc04_vmp_strigoi_ghoul_king = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc11_vmp_bloodline_von_carstein = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 3,
                },
            },
        },

        -- Von Carstein (Vlad/Isabella)
        wh_main_vmp_schwartzhafen = {
            FactionPools = {
                VampireLords = {
                    MasterNecromancers = {
                        AgentSubTypes = {
                            vmp_master_necromancer = {
                                MinimumAmount = 0,
                                MaximumAmount = 3,
                            },
                        },
                        SubPoolInitialMinSize = 1,
                        SubPoolMaxSize = 3,
                    },
                    AgentSubTypes = {
                        vmp_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        dlc04_vmp_strigoi_ghoul_king = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        wh2_dlc11_vmp_bloodline_von_carstein = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
        },

        -- The Barrow Legion (Kemmler)
        wh2_dlc11_vmp_the_barrow_legion = {
            FactionPools = {
                MasterNecromancers = {
                    AgentSubTypes = {
                        vmp_master_necromancer = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
        },

        -- Minor Faction specific distributions

        -- Mousillon
        wh_main_vmp_mousillon = {
            FactionPools = {
                MasterNecromancers = {
                    AgentSubTypes = {
                        vmp_master_necromancer = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                          },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
                VampireLords = {
                    AgentSubTypes = {
                        vmp_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        wh2_dlc11_vmp_bloodline_blood_dragon = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
        },

        -- The Silver Host
        wh2_main_vmp_the_silver_host = {
            FactionPools = {
                MasterNecromancers = {
                    AgentSubTypes = {
                        vmp_master_necromancer = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                VampireLords = {
                    AgentSubTypes = {
                        wh2_dlc11_vmp_bloodline_lahmian = {
                            MinimumAmount = 0,
                            MaximumAmount = 5,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordsToReplace = {
                vmp_lord = {
                    replacementKey = "wh2_dlc11_vmp_bloodline_lahmian",
                    traitKeyPool = {
                        "wh2_main_skill_innate_vmp_devious",
                        "wh2_main_skill_innate_vmp_dark_majesty",
                    },
                },
            },
        },

        -- The Strygos Empire
        wh2_main_vmp_strygos_empire = {
            FactionPools = {
                MasterNecromancers = {
                    AgentSubTypes = {
                        vmp_master_necromancer = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                VampireLords = {
                    AgentSubTypes = {
                        dlc04_vmp_strigoi_ghoul_king = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        wh2_dlc11_vmp_bloodline_strigoi = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
            },
        },

        -- The Necrarch Brotherhood
        wh2_main_vmp_necrarch_brotherhood = {
            FactionPools = {
                MasterNecromancers = {
                    AgentSubTypes = {
                        vmp_master_necromancer = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                             },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                VampireLords = {
                    AgentSubTypes = {
                        wh2_dlc11_vmp_bloodline_necrarch = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordsToReplace = {
                vmp_lord = {
                    replacementKey = "wh2_dlc11_vmp_bloodline_necrarch",
                    traitKeyPool = {
                        "wh_main_skill_innate_vmp_ghoul_whisperer",
                        "wh2_main_skill_innate_vmp_dread_incarnate",
                        "wh2_main_skill_innate_vmp_devious",
                        "wh2_main_skill_innate_vmp_dark_majesty",
                    },
                },
            },
        },
    };
end