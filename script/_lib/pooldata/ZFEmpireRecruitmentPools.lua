--[[EmpireRecruitmentPoolData =  {
    -- Reikland
    wh_main_emp_empire = {
        FactionPools = {
            ImperialEngineers = {
                AgentSubTypes = {
                    wh_main_emp_master_engineer = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
        },
    },
    -- Minor Faction specific distributions
    -- Wissenland
    wh_main_emp_wissenland = {
        FactionPools = {
            ImperialEngineers = {
                AgentSubTypes = {
                    wh_main_emp_master_engineer = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
        },
        Rewards = {
            alliance = {
                Pools = {
                    ImperialEngineers = {
                        AgentSubTypes = {
                            wh_main_emp_master_engineer = {
                                MinimumAmount = 0,
                                MaximumAmount = 1,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
        },
    },
}--]]