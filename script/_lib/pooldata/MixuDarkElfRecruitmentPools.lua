DarkElfRecruitmentPoolData =  {
    -- Default pool distribution
    wh2_main_sc_def_dark_elves = {
        FactionPools = {
            BeastMasterPool = {
                AgentSubTypes = {
                    def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
    },
    -- Major Faction specific distributions

    -- Malekith
    wh2_main_def_naggarond = {
        FactionPools = {
            BeastMasterPool = {
                AgentSubTypes = {
                    def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
        },
    },

    -- Hellebron
    wh2_main_def_har_ganeth = {
        FactionPools = {
            BeastMasterPool = {
                AgentSubTypes = {
                    def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
        },
    },

    -- Lokhir
    wh2_dlc11_def_the_blessed_dread = {
        FactionPools = {
            BeastMasterPool = {
                AgentSubTypes = {
                    def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
        },
    },

    -- Minor Faction specific distributions
    wh2_main_def_hag_graef = {
        FactionPools = {
            BeastMasterPool = {
                AgentSubTypes = {
                    def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
    },

    wh2_main_def_clar_karond = {
        FactionPools = {
            DreadLords = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                    wh2_main_def_dreadlord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
            SorceressSupremePool = {
                AgentSubTypes = {
                    wh2_dlc10_def_supreme_sorceress_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_dlc10_def_supreme_sorceress_dark = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_dlc10_def_supreme_sorceress_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_dlc10_def_supreme_sorceress_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_dlc10_def_supreme_sorceress_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
            BeastMasterPool = {
                AgentSubTypes = {
                    def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 6,
    },

    wh2_main_def_karond_kar = {
        FactionPools = {
            DreadLords = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                    wh2_main_def_dreadlord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
            SorceressSupremePool = {
                AgentSubTypes = {
                    wh2_dlc10_def_supreme_sorceress_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_dlc10_def_supreme_sorceress_dark = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_dlc10_def_supreme_sorceress_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_dlc10_def_supreme_sorceress_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_dlc10_def_supreme_sorceress_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
            BeastMasterPool = {
                AgentSubTypes = {
                    def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 6,
    },
}