DwarfRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_dwf_dwarfs = {
        FactionPools = {
            DwarfLords = {
                AgentSubTypes = {
                    dwf_lord = {
                        MinimumAmount = 2,
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
        PoolMaxSize = 5,
    },
    -- Major Faction specific distributions

    -- Karak-a-Karak
    wh_main_dwf_dwarfs = {
        FactionPools = {
            DwarfLords = {
                AgentSubTypes = {
                    dwf_lord = {
                        MinimumAmount = 2,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            RuneLord = {
                AgentSubTypes = {
                    dlc06_dwf_runelord = {
                        MinimumAmount = 1,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
    },

    -- Karak Kadrin
    wh_main_dwf_karak_kadrin = {
        FactionPools = {
            DwarfLords = {
                AgentSubTypes = {
                    dwf_lord = {
                        MinimumAmount = 2,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
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
        PoolMaxSize = 6,
    },

    -- Clan Angrund
    wh_main_dwf_karak_izor = {
        FactionPools = {
            DwarfLords = {
                AgentSubTypes = {
                    dwf_lord = {
                        MinimumAmount = 1,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 1,
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
        PoolMaxSize = 1,
    },

    -- Minor Faction specific distributions
    -- TBD
}