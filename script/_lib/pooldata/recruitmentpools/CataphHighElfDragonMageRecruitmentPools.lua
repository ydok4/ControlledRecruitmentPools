function GetCataphHighElfDragonMageRecruitmentPoolData()
    return {
        -- Add to default pool
        wh2_main_sc_hef_high_elves = {
            HeroPools = {
                DragonMages = {
                    AgentSubTypes = {
                        AK_hef_dragonmage = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
        },

        -- Minor High Elf Factions
        wh2_main_hef_caledor = {
            HeroPools = {
                DragonMages = {
                    AgentSubTypes = {
                        AK_hef_dragonmage = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
                NoblePool = {
                    AgentSubTypes = {
                        wh2_main_hef_noble = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },
    };
end