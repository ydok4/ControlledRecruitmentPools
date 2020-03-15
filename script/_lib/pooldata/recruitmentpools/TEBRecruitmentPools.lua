function GetTEBRecruitmentPools()
    return {
        -- Culture default
        -- This is used by the unlocker factions
        wh_main_sc_teb_teb = {
            HeroPools = {
                Wizards = {
                    AgentSubTypes = {
                        dlc03_emp_amber_wizard = {
                            MaximumPercentage = 15,
                        },
                        dlc05_emp_grey_wizard = {
                            MaximumPercentage = 15,
                        },
                        dlc05_emp_jade_wizard = {
                            MaximumPercentage = 15,
                        },
                        teb_bright_wizard = {
                            MaximumPercentage = 15,
                        },
                        emp_celestial_wizard = {
                            MaximumPercentage = 15,
                        },
                        emp_light_wizard = {
                            MaximumPercentage = 15,
                        },
                        wh2_pro07_emp_amethyst_wizard = {
                            MaximumPercentage = 15,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                Captains = {
                    AgentSubTypes = {
                        teb_captain = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                WitchHunters = {
                    AgentSubTypes = {
                        emp_witch_hunter = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Major TEB factions
        wh_main_teb_border_princes = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },

        wh_main_teb_estalia = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
        },

        wh_main_teb_tilea = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 100,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Minor TEB factions - Unlocker only
    };
end