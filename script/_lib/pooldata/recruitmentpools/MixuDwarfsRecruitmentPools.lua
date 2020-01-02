function GetMixuDwarfsRecruitmentPoolData() 
    return {
        -- Default pool distribution
        wh_main_sc_dwf_dwarfs = {
            HeroPools = {
                DragonSlayers = {
                    AgentSubTypes = {
                        dwf_giant_slayer = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                            BonusCost = 0,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },
    };
end