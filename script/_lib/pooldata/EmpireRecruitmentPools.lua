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
                SubPoolMaxSize = 5,
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
        PoolMaxSize = 10,
    },
    -- Minor Faction specific distributions
    -- Wissenland
    wh_main_emp_wissenland = {
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
    },
}