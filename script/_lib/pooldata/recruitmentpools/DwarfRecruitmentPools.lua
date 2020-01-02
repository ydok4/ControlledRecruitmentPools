function GetDwarfRecruitmentPoolData() 
    return {
        -- Default pool distribution
        wh_main_sc_dwf_dwarfs = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                DwarfLords = {
                    AgentSubTypes = {
                        dwf_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                RuneLord = {
                    AgentSubTypes = {
                        dlc06_dwf_runelord = {
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
        -- Major Faction specific distributions

        -- Karak-a-Karak
        wh_main_dwf_dwarfs = {
            FactionPools = {
                DwarfLords = {
                    AgentSubTypes = {
                        dwf_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 6,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 6,
                },
                RuneLord = {
                    AgentSubTypes = {
                        dlc06_dwf_runelord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
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
                            MinimumAmount = 0,
                            MaximumAmount = 6,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 6,
                },
                RuneLord = {
                    AgentSubTypes = {
                        dlc06_dwf_runelord = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
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
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                RuneLord = {
                    AgentSubTypes = {
                        dlc06_dwf_runelord = {
                            MinimumAmount = 0,
                            MaximumAmount = 0,
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