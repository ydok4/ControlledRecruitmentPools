function GetMixuDwarfsRecruitmentPoolData() 
    return {
        -- Default pool distribution
        wh_main_sc_dwf_dwarfs = {
            HeroPools = {
                DragonSlayers = {
                    AgentSubTypes = {
                        dwf_giant_slayer = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
        },
        -- Karak Kadrin
        wh_main_dwf_karak_kadrin = {
            HeroPools = {
                DragonSlayers = {
                    AgentSubTypes = {
                        dwf_giant_slayer = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                MasterEngineers = {
                    AgentSubTypes = {
                        dwf_master_engineer = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                Runesmiths = {
                    AgentSubTypes = {
                        dwf_runesmith = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                Thanes = {
                    AgentSubTypes = {
                        dwf_thane = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
        },
    };
end