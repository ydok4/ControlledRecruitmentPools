WoodElfRecruitmentPoolData = {
    -- Default pool distribution
    wh_dlc05_sc_wef_wood_elves = {
        DefaultLords = {"dlc05_wef_glade_lord", "dlc05_wef_glade_lord_fem"},
        FactionPools = {
            GladeLords = {
                AgentSubTypes = {
                    dlc05_wef_glade_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                    dlc05_wef_glade_lord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            AncientTreeman = {
                AgentSubTypes = {
                    dlc05_wef_ancient_treeman = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
        },
        PoolMaxSize = 7,
    },

    -- Major Factions
    wh_dlc05_wef_wood_elves = {
        FactionPools = {
            GladeLords = {
                AgentSubTypes = {
                    dlc05_wef_glade_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                    dlc05_wef_glade_lord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 6,
            },
            AncientTreeman = {
                AgentSubTypes = {
                    dlc05_wef_ancient_treeman = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 1,
            },
        },
        PoolMaxSize = 7,
    },
    wh_dlc05_wef_argwylon = {
        FactionPools = {
            GladeLords = {
                AgentSubTypes = {
                    dlc05_wef_glade_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                    dlc05_wef_glade_lord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
            AncientTreeman = {
                AgentSubTypes = {
                    dlc05_wef_ancient_treeman = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 7,
    },

    -- Minor Factions
    wh2_main_wef_bowmen_of_oreon = {
        FactionPools = {
            GladeLords = {
                AgentSubTypes = {
                    dlc05_wef_glade_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                    dlc05_wef_glade_lord_fem  = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 4,
            },
        },
        PoolMaxSize = 6,
    },
}