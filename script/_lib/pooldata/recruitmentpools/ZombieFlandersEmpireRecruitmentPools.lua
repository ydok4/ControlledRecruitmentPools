function GetZombieFlandersEmpireRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_emp_empire = {
            HeroPools = {
                MasterEngineer = {
                    AgentSubTypes = {
                        wh_main_emp_master_engineer = {
                            MaximumPercentage = 100,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
        },

        -- Wissenland
        wh_main_emp_wissenland = {
            HeroPools = {
                MasterEngineer = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },
    };
end