function GetNorscaRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_nor_norsca = {
            HeroPools = {
                Balefiends = {
                    AgentSubTypes = {
                        wh_dlc08_nor_fimir_balefiend_fire = {
                            MaximumPercentage = 50,
                        },
                        wh_dlc08_nor_fimir_balefiend_shadow = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                ShamanSorcerers = {
                    AgentSubTypes = {
                        wh_dlc08_nor_shaman_sorcerer_death = {
                            MaximumPercentage = 33,
                        },
                        wh_dlc08_nor_shaman_sorcerer_fire = {
                            MaximumPercentage = 33,
                        },
                        wh_dlc08_nor_shaman_sorcerer_metal = {
                            MaximumPercentage = 33,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                Werekin = {
                    AgentSubTypes = {
                        wh_dlc08_nor_skin_wolf_werekin = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                NorscaChieftains = {
                    AgentSubTypes = {
                        nor_marauder_chieftain = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end