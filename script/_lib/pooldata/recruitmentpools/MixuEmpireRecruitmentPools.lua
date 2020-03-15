function GetMixuEmpireRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_emp_empire = {
            HeroPools = {
                Wizards = {
                    AgentSubTypes = {
                        emp_wizard_metal = {
                            MaximumPercentage = 15,
                            BonusCost = 0,
                        },
                    },
                },
            },
            FactionPools = {
                WizardLords = {
                    AgentSubTypes = {
                        emp_wizard_lord_beasts = {
                            MaximumPercentage = 15,
                            BonusCost = 0,
                        },
                        emp_wizard_lord_light = {
                            MaximumPercentage = 15,
                            BonusCost = 0,
                        },
                        emp_wizard_lord_fire = {
                            MaximumPercentage = 15,
                            BonusCost = 0,
                        },
                        emp_wizard_lord_shadow = {
                            MaximumPercentage = 15,
                            BonusCost = 0,
                        },
                        emp_wizard_lord_heavens = {
                            MaximumPercentage = 15,
                            BonusCost = 0,
                        },
                        emp_wizard_lord_metal = {
                            MaximumPercentage = 15,
                            BonusCost = 0,
                        },
                        emp_wizard_lord_death = {
                            MaximumPercentage = 15,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
        },

        -- Golden Order (Gelt)
        wh2_dlc13_emp_golden_order = {
            FactionPools = {
                GoldWizardLords = {
                    AgentSubTypes = {
                        emp_wizard_lord_metal = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },

            },
        },
        -- Wissenland
        wh_main_emp_wissenland = {
            FactionPools = {
                DeathWizardLords = {
                    AgentSubTypes = {
                        emp_wizard_lord_death = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
        },
    };
end