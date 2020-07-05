function GetVampireCountsRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_vmp_vampire_counts = {
            HeroPools = {
                Necromancers = {
                    AgentSubTypes = {
                        vmp_necromancer = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
                Vampires = {
                    AgentSubTypes = {
                        vmp_vampire = {
                            MaximumPercentage = 50,
                        },
                        wh_dlc05_vmp_vampire_shadow = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
                Banshees = {
                    AgentSubTypes = {
                        vmp_banshee = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                WightKings = {
                    AgentSubTypes = {
                        vmp_wight_king = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                MasterNecromancers = {
                    AgentSubTypes = {
                        vmp_master_necromancer = {
                            MaximumPercentage = 100,
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
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
                VampireLords = {
                    AgentSubTypes = {
                        vmp_lord = {
                            MaximumPercentage = 50,
                        },
                        dlc04_vmp_strigoi_ghoul_king = {
                            MaximumPercentage = 25,
                        },
                        wh2_dlc11_vmp_bloodline_von_carstein = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 3,
                },
            },
        },

        -- Von Carstein (Vlad/Isabella)
        wh_main_vmp_schwartzhafen = {
            HeroPools = {
                Vampires = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                MasterNecromancers = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                VampireLords = {
                    AgentSubTypes = {
                        vmp_lord = {
                            MaximumPercentage = 60,
                        },
                        dlc04_vmp_strigoi_ghoul_king = {
                            MaximumPercentage = 20,
                        },
                        wh2_dlc11_vmp_bloodline_von_carstein = {
                            MaximumPercentage = 20,
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
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
                VampireLords = {
                    AgentSubTypes = {
                        vmp_lord = {
                            MaximumPercentage = 60,
                        },
                        wh2_dlc11_vmp_bloodline_blood_dragon = {
                            MaximumPercentage = 40,
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
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                VampireLords = {
                    AgentSubTypes = {
                        wh2_dlc11_vmp_bloodline_lahmian = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordsToReplace = {
                FactionLeader = "wh2_dlc11_vmp_bloodline_lahmian",
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
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                VampireLords = {
                    AgentSubTypes = {
                        dlc04_vmp_strigoi_ghoul_king = {
                            MaximumPercentage = 75,
                        },
                        wh2_dlc11_vmp_bloodline_strigoi = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
            },
            --[[LordsToReplace = {
                FactionLeader = "wh2_dlc11_vmp_bloodline_strigoi",
                vmp_lord = {
                    replacementKey = "dlc04_vmp_strigoi_ghoul_king",
                },
            },--]]
        },

        -- The Necrarch Brotherhood
        wh2_main_vmp_necrarch_brotherhood = {
            FactionPools = {
                MasterNecromancers = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                VampireLords = {
                    AgentSubTypes = {
                        wh2_dlc11_vmp_bloodline_necrarch = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordsToReplace = {
                FactionLeader = "wh2_dlc11_vmp_bloodline_necrarch",
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