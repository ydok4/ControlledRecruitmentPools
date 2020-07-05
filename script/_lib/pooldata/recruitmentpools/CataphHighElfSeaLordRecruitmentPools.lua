function GetCataphHighElfSeaLordRecruitmentPoolData()
    return {
        -- Add blank record to default
        wh2_main_sc_hef_high_elves = {
            FactionPools = {
                SeaHelms = {
                    AgentSubTypes = {
                        AK_hef_seahelm = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
        },

        -- Major High Elf Factions
        wh2_main_hef_eataine = {
            FactionPools = {
                SeaHelms = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
            },
        },
        wh2_main_hef_order_of_loremasters = {
            FactionPools = {
                SeaHelms = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },
        -- Minor High Elf Factions
        wh2_main_hef_cothique = {
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SeaHelms = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
        },

        wh2_main_hef_citadel_of_dusk = {
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SeaHelms = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },

            LordPoolMaxSize = 4,
        },
        wh2_main_hef_fortress_of_dawn = {
            FactionPools = {
                Princes = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                SeaHelms = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
        },
    };
end