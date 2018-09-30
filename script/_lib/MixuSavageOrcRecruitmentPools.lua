SavageOrcRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_grn_savage_orcs = {
        FactionPools = {
            SavageOrcWarbosses = {
                AgentSubTypes = {
                    grn_savage_orc_warboss = {
                        MinimumAmount = 1,
                        MaximumAmount = 4,
                    },
                    grn_orc_warboss = false,
                },
                SubPoolMaxSize = 4,
            },
            SavageOrcShamans = {
                AgentSubTypes = {
                    grn_savage_orc_shaman = {
                        MinimumAmount = 1,
                        MaximumAmount = 3,
                    },
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
    },
}