function GetMixuWoodElfRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_dlc05_sc_wef_wood_elves = {
            HeroPools = {
                Shadowdancer = {
                    AgentSubTypes = {
                        wef_shadowdancer = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                SpellWeavers = {
                    AgentSubTypes = {
                        wef_spellweaver = {
                            MaximumPercentage = 50,
                        },
                        wef_highweaver = {
                            MaximumPercentage = 25,
                        },
                        wef_darkweaver = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },

        -- Major Factions
        wh_dlc05_wef_argwylon = {
            FactionPools = {
                SpellWeavers = {
                    AgentSubTypes = {
                        wef_spellweaver = {
                            MaximumPercentage = 50,
                        },
                        wef_highweaver = {
                            MaximumPercentage = 25,
                        },
                        wef_darkweaver = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },

        wh_dlc05_wef_wood_elves = {
            FactionPools = {
                SpellWeavers = {
                    AgentSubTypes = {
                        wef_spellweaver = {
                            MaximumPercentage = 50,
                        },
                        wef_highweaver = {
                            MaximumPercentage = 25,
                        },
                        wef_darkweaver = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },

        -- Minor Factions
        wh2_main_wef_bowmen_of_oreon = {
            FactionPools = {
                SpellWeavers = {
                    AgentSubTypes = {
                        wef_spellweaver = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
        },
    };
end