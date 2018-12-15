DwarfRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_dwf_dwarfs = {
        FactionPools = {
            DwarfLords = {
                AgentSubTypes = {
                    dwf_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                },
                SubPoolInitialMinSize = 1,
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
        Traits = {
            wh2_main_skill_innate_dwf_ancestral_blood_grimnir = {

            },
            wh2_main_skill_innate_dwf_ancestral_blood_grungni = {

            },
            wh2_main_skill_innate_dwf_ancestral_blood_valaya = {

            },
            wh_main_skill_innate_dwf_axe_envy = {

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
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 5,
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
        PoolMaxSize = 5,
    },

    -- Karak Kadrin
    wh_main_dwf_karak_kadrin = {
        FactionPools = {
            DwarfLords = {
                AgentSubTypes = {
                    dwf_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 1,
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
        PoolMaxSize = 5,
    },

    -- Clan Angrund
    wh_main_dwf_karak_izor = {
        FactionPools = {
            DwarfLords = {
                AgentSubTypes = {
                    dwf_lord = {
                        MinimumAmount = 0,
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