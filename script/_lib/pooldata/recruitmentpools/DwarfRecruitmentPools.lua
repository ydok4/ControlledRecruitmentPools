function GetDwarfRecruitmentPoolData() 
    return {
        -- Default pool distribution
        wh_main_sc_dwf_dwarfs = {
            HeroPools = {
                MasterEngineers = {
                    AgentSubTypes = {
                        dwf_master_engineer = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                Runesmiths = {
                    AgentSubTypes = {
                        dwf_runesmith = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                Thanes = {
                    AgentSubTypes = {
                        dwf_thane = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                DwarfLords = {
                    AgentSubTypes = {
                        dwf_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                RuneLord = {
                    AgentSubTypes = {
                        dlc06_dwf_runelord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Major Faction specific distributions

        -- Karak-a-Karak
        wh_main_dwf_dwarfs = {
            FactionPools = {
                DwarfLords = {
                    AgentSubTypes = {
                        dwf_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 6,
                },
                RuneLord = {
                    AgentSubTypes = {
                        dlc06_dwf_runelord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Karak Kadrin
        wh_main_dwf_karak_kadrin = {
            FactionPools = {
                DwarfLords = {
                    AgentSubTypes = {
                        dwf_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 6,
                },
                RuneLord = {
                    AgentSubTypes = {
                        dlc06_dwf_runelord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Clan Angrund
        wh_main_dwf_karak_izor = {
            FactionPools = {
                DwarfLords = {
                    AgentSubTypes = {
                        dwf_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                RuneLord = {
                    AgentSubTypes = {
                        dlc06_dwf_runelord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Minor Faction specific distributions
        -- TBD
    };
end