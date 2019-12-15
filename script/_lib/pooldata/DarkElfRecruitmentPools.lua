DarkElfRecruitmentPoolData =  {
    -- Default pool distribution
    wh2_main_sc_def_dark_elves = {
        DefaultLords = {"wh2_main_def_dreadlord", "wh2_main_def_dreadlord_fem"},
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
                SubPoolMaxSize = 4,
            },
            BeastMasterPool = {
                AgentSubTypes = {
                    wh2_dlc14_def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
            SorceressSupremePool = {
                AgentSubTypes = {
                    wh2_dlc10_def_supreme_sorceress_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_dark = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        Traits = {
            wh2_main_skill_innate_def_cruel = {

            },
            wh2_main_skill_innate_def_malevolent = {

            },
            wh2_main_skill_innate_def_spiteful = {

            },
            wh2_main_skill_innate_def_malicious = {

            },
            wh2_main_skill_innate_def_vicious = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_magnanimous",
        },
        PoolMaxSize = 7,
    },
    -- Major Faction specific distributions

    -- Malekith
    wh2_main_def_naggarond = {
        FactionPools = {
            DreadLords = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                    wh2_main_def_dreadlord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            BeastMasterPool = {
                AgentSubTypes = {
                    wh2_dlc14_def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
            SorceressSupremePool = {
                AgentSubTypes = {
                    wh2_dlc10_def_supreme_sorceress_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_dark = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 8,
    },
    -- Morathi
    wh2_main_def_cult_of_pleasure = {
        FactionPools = {
            DreadLords = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                    wh2_main_def_dreadlord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
            BeastMasterPool = {
                AgentSubTypes = {
                    wh2_dlc14_def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
            SorceressSupremePool = {
                AgentSubTypes = {
                    wh2_dlc10_def_supreme_sorceress_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_dark = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 0,
                    },
                    wh2_dlc10_def_supreme_sorceress_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 3,
                SubPoolMaxSize = 6,
            },
        },
        PoolMaxSize = 7,
    },

    -- Hellebron
    wh2_main_def_har_ganeth = {
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
                SubPoolMaxSize = 4,
            },
            BeastMasterPool = {
                AgentSubTypes = {
                    wh2_dlc14_def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
            SorceressSupremePool = {
                AgentSubTypes = {
                    wh2_dlc10_def_supreme_sorceress_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_dark = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 8,
    },

    -- Lokhir
    wh2_dlc11_def_the_blessed_dread = {
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
                SubPoolMaxSize = 4,
            },
            BeastMasterPool = {
                AgentSubTypes = {
                    wh2_dlc14_def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
            SorceressSupremePool = {
                AgentSubTypes = {
                    wh2_dlc10_def_supreme_sorceress_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_dark = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
    },

    -- Malus
    wh2_main_def_hag_graef = {
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
            BeastMasterPool = {
                AgentSubTypes = {
                    wh2_dlc14_def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
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
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
    },

    -- Minor Faction specific distributions
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
                    wh2_dlc14_def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 7,
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
                    wh2_dlc14_def_high_beastmaster = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 7,
    },

    wh2_main_def_ghrond = {
        FactionPools = {
            DreadLords = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                    wh2_main_def_dreadlord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
            SorceressSupremePool = {
                AgentSubTypes = {
                    wh2_dlc10_def_supreme_sorceress_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_dark = {
                        MinimumAmount = 0,
                        MaximumAmount = 0,
                    },
                    wh2_dlc10_def_supreme_sorceress_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 5,
                SubPoolMaxSize = 8,
            },
        },
        PoolMaxSize = 7,
    },

    wh2_main_def_drackla_coven = {
        FactionPools = {
            DreadLords = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                    wh2_main_def_dreadlord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
            SorceressSupremePool = {
                AgentSubTypes = {
                    wh2_dlc10_def_supreme_sorceress_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_dark = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 0,
                    },
                    wh2_dlc10_def_supreme_sorceress_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 4,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 7,
    },

    wh2_main_def_blood_hall_coven = {
        FactionPools = {
            DreadLords = {
                AgentSubTypes = {
                    wh2_main_def_dreadlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                    wh2_main_def_dreadlord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
            SorceressSupremePool = {
                AgentSubTypes = {
                    wh2_dlc10_def_supreme_sorceress_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_dark = {
                        MinimumAmount = 0,
                        MaximumAmount = 0,
                    },
                    wh2_dlc10_def_supreme_sorceress_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wh2_dlc10_def_supreme_sorceress_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 4,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 7,
    },
}