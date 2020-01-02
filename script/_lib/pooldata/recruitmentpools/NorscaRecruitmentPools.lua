function GetNorscaRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_nor_norsca = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                NorscaChieftains = {
                    AgentSubTypes = {
                        nor_marauder_chieftain = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
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