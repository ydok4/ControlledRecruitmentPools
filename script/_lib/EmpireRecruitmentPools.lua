EmpireRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_emp_empire = {
        FactionPools = {
            EmpireGenerals = {
                AgentSubTypes = {
                    emp_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
    },
    -- Major Faction specific distributions

    -- Reikland
    wh_main_emp_empire = {
        FactionPools = {
            EmpireGenerals = {
                AgentSubTypes = {
                    emp_lord = {
                        MinimumAmount = 1,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 8,
            },
            ArchLectors = {
                AgentSubTypes = {
                    dlc04_emp_arch_lector = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 10,
    },
    -- Minor Faction specific distributions
    -- TBD
}