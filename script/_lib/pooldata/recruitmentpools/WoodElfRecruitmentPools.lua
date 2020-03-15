function GetWoodElfRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_dlc05_sc_wef_wood_elves = {
            HeroPools = {
                Spellsingers = {
                    AgentSubTypes = {
                        dlc05_wef_spellsinger_beasts = {
                            MaximumPercentage = 33,
                        },
                        dlc05_wef_spellsinger_life  = {
                            MaximumPercentage = 33,
                        },
                        dlc05_wef_spellsinger_shadow  = {
                            MaximumPercentage = 33,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                Waystalkers = {
                    AgentSubTypes = {
                        dlc05_wef_waystalker = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                BranchWraiths = {
                    AgentSubTypes = {
                        wh_dlc05_wef_branchwraith = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                GladeLords = {
                    AgentSubTypes = {
                        dlc05_wef_glade_lord = {
                            MaximumPercentage = 50,
                        },
                        dlc05_wef_glade_lord_fem = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
                AncientTreeman = {
                    AgentSubTypes = {
                        dlc05_wef_ancient_treeman = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Major Factions
        wh_dlc05_wef_wood_elves = {
            FactionPools = {
                GladeLords = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 6,
                },
                AncientTreeman = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },
        wh_dlc05_wef_argwylon = {
            FactionPools = {
                GladeLords = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                AncientTreeman = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Minor Factions
        wh2_main_wef_bowmen_of_oreon = {
            FactionPools = {
                GladeLords = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
            AncientTreeman = false,
            LordPoolMaxSize = 4,
        },
    };
end