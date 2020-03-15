function GetEmpireRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_emp_empire = {
            HeroPools = {
                Wizards = {
                    AgentSubTypes = {
                        dlc05_emp_grey_wizard = {
                            MaximumPercentage = 15,
                        },
                        dlc03_emp_amber_wizard = {
                            MaximumPercentage = 15,
                        },
                        dlc05_emp_jade_wizard = {
                            MaximumPercentage = 15,
                        },
                        emp_bright_wizard = {
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
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 2,
                },
                Captains = {
                    AgentSubTypes = {
                        emp_captain = {
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
                WarriorPriests = {
                    AgentSubTypes = {
                        emp_warrior_priest = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                EmpireGenerals = {
                    AgentSubTypes = {
                        emp_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Major Faction specific distributions
        -- Reikland
        wh_main_emp_empire = {
            FactionPools = {
                EmpireGenerals = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                HuntsmarshalGenerals = {
                    AgentSubTypes = {
                        wh2_dlc13_emp_cha_huntsmarshal_0 = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                ArchLectors = {
                    AgentSubTypes = {
                        dlc04_emp_arch_lector = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Golden Order (Gelt)
        wh2_dlc13_emp_golden_order = {
            FactionPools = {

            },
            LordPoolMaxSize = 4,
        },
        -- Huntsmarshals expedition
        wh2_dlc13_emp_the_huntmarshals_expedition = {
            FactionPools = {
                EmpireGenerals = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                HuntsmarshalGenerals = {
                    AgentSubTypes = {
                        wh2_dlc13_emp_cha_huntsmarshal_0 = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Minor Faction specific distributions
        -- Middenland
        wh_main_emp_middenland = {
            FactionPools = {
                EmpireGenerals = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                HuntsmarshalGenerals = {
                    AgentSubTypes = {
                        wh2_dlc13_emp_cha_huntsmarshal_0 = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Talabecland
        wh_main_emp_talabecland = {
            FactionPools = {
                EmpireGenerals = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                HuntsmarshalGenerals = {
                    AgentSubTypes = {
                        wh2_dlc13_emp_cha_huntsmarshal_0 = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end