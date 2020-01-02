function GetEmpireRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_emp_empire = {
            HeroPools = {
                Wizards = {
                    AgentSubTypes = {
                        dlc03_emp_amber_wizard = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        dlc05_emp_grey_wizard = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        dlc05_emp_jade_wizard = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        emp_bright_wizard = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        emp_celestial_wizard = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        emp_light_wizard = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                        wh2_pro07_emp_amethyst_wizard = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 2,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                EmpireGenerals = {
                    AgentSubTypes = {
                        emp_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 5,
        },
        -- Major Faction specific distributions
        -- Reikland
        wh_main_emp_empire = {
            FactionPools = {
                EmpireGenerals = {
                    AgentSubTypes = {
                        emp_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 5,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                HuntsmarshalGenerals = {
                    AgentSubTypes = {
                        wh2_dlc13_emp_cha_huntsmarshal_0 = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                ArchLectors = {
                    AgentSubTypes = {
                        dlc04_emp_arch_lector = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
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
                EmpireGenerals = {
                    AgentSubTypes = {
                        emp_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 5,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 6,
        },
        -- Huntsmarshals expedition
        wh2_dlc13_emp_the_huntmarshals_expedition = {
            FactionPools = {
                EmpireGenerals = {
                    AgentSubTypes = {
                        emp_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                HuntsmarshalGenerals = {
                    AgentSubTypes = {
                        wh2_dlc13_emp_cha_huntsmarshal_0 = {
                            MinimumAmount = 0,
                            MaximumAmount = 5,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 5,
        },

        -- Minor Faction specific distributions
        -- Middenland
        wh_main_emp_middenland = {
            FactionPools = {
                EmpireGenerals = {
                    AgentSubTypes = {
                        emp_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                HuntsmarshalGenerals = {
                    AgentSubTypes = {
                        wh2_dlc13_emp_cha_huntsmarshal_0 = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 6,
        },
        -- Talabecland
        wh_main_emp_talabecland = {
            FactionPools = {
                EmpireGenerals = {
                    AgentSubTypes = {
                        emp_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                HuntsmarshalGenerals = {
                    AgentSubTypes = {
                        wh2_dlc13_emp_cha_huntsmarshal_0 = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 6,
        },
        -- Wissenland
        wh_main_emp_wissenland = {
            FactionPools = {
                EmpireGenerals = {
                    AgentSubTypes = {
                        emp_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                            HumanPlayerOnly = true,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 6,
        },
    };
end