EmpireRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_emp_empire = {
        DefaultLords = {"emp_lord"},
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
        PoolMaxSize = 5,
        Traits = {
            h2_main_skill_innate_emp_imperious = {

            },
            wh2_main_skill_innate_emp_monster_hunter = {

            },
            wh2_main_skill_innate_emp_monster_tracker = {

            },
            wh2_main_skill_innate_emp_noble = {

            },
            wh2_main_skill_innate_emp_regal = {

            },
        },
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
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 4,
            },
            HuntsmarshalGenerals = {
                AgentSubTypes = {
                    wh2_dlc13_emp_cha_huntsmarshal_0 = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 2,
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
        PoolMaxSize = 6,
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
        PoolMaxSize = 6,
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
        PoolMaxSize = 5,
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
        PoolMaxSize = 6,
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
        PoolMaxSize = 6,
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
        PoolMaxSize = 6,
    },
}