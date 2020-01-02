function GetWoodElfRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_dlc05_sc_wef_wood_elves = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                GladeLords = {
                    AgentSubTypes = {
                        dlc05_wef_glade_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        dlc05_wef_glade_lord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
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
            LordPoolMaxSize = 7,
        },

        -- Major Factions
        wh_dlc05_wef_wood_elves = {
            FactionPools = {
                GladeLords = {
                    AgentSubTypes = {
                        dlc05_wef_glade_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                        dlc05_wef_glade_lord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
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
            LordPoolMaxSize = 7,
        },
        wh_dlc05_wef_argwylon = {
            FactionPools = {
                GladeLords = {
                    AgentSubTypes = {
                        dlc05_wef_glade_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        dlc05_wef_glade_lord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
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
            LordPoolMaxSize = 7,
        },

        -- Minor Factions
        wh2_main_wef_bowmen_of_oreon = {
            FactionPools = {
                GladeLords = {
                    AgentSubTypes = {
                        dlc05_wef_glade_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                        dlc05_wef_glade_lord_fem  = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 6,
        },
    };
end