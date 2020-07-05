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

        -- Major High Elf Factions
        wh2_dlc15_hef_imrik = {
            HeroPools = {
                DragonMages = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
        },

        -- Minor High Elf Factions
        wh2_main_hef_caledor = {
            HeroPools = {
                DragonMages = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
        },
    };
end