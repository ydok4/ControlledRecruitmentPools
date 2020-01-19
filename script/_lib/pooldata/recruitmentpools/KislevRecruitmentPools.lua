function GetKislevRecruitmentPools()
    return {
        -- Default kislev, only the kislev rebels use this in vanilla
        -- but Eregrad uses it in the unlocker.
        wh_main_sc_ksl_kislev = {
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
                        emp_bright_wizard = {
                            MaximumPercentage = 15,
                        },
                        ksl_celestial_wizard = {
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
                        ksl_captain = {
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
                KislevLord = {
                    AgentSubTypes = {
                        ksl_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Major Kislev faction
        wh_main_ksl_kislev = {
            FactionPools = {
                EmpireGenerals = {
                    AgentSubTypes = {
                        ksl_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end