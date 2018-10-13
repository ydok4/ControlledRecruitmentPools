NorscaRecruitmentPoolData = {
    -- Default pool distribution
    wh_main_sc_nor_norsca = {
        FactionPools = {
            ChieftainPools = {
                AgentSubTypes = {
                    nor_marauder_chieftain = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 6,
            },
            Shamans = {
                AgentSubTypes = {
                    nor_shaman_sorcerer_lord_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    nor_shaman_sorcerer_lord_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    nor_shaman_sorcerer_lord_metal = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
            FimirLords = {
                AgentSubTypes = {
                    nor_fimir_warlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
        },
        PoolMaxSize = 6,
    },
}