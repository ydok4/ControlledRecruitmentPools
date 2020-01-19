function GetMixuNorscaRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_nor_norsca = {
            FactionPools = {
                Shamans = {
                    AgentSubTypes = {
                        nor_shaman_sorcerer_lord_death = {
                            MaximumPercentage = 33,
                        },
                        nor_shaman_sorcerer_lord_fire = {
                            MaximumPercentage = 33,
                        },
                        nor_shaman_sorcerer_lord_metal = {
                            MaximumPercentage = 33,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                FimirLords = {
                    AgentSubTypes = {
                        nor_fimir_warlord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end