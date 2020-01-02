function GetMixuEmpireRecruitmentPoolData() 
    return {
        -- Default pool distribution
        wh_main_sc_emp_empire = {
            HeroPools = {
                Wizards = {
                    AgentSubTypes = {
                        emp_wizard_metal = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                },
            },
        },
    };
end