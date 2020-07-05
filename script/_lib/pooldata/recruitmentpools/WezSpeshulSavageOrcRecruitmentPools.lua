function GetWezSpeshulSavageOrcRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_grn_savage_orcs = {
            FactionPools = {
                SavageOrcShamans = {
                    AgentSubTypes = {
                        grn_savage_orc_shaman = false,
                        ws_grn_savage_orc_great_shaman = {
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