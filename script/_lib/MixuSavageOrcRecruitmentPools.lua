SavageOrcRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_grn_savage_orcs = {
        FactionPools = {
            OrcWarbossPool = false,
            SavageOrcWarboss = {
                AgentSubTypes = {
                    grn_savage_orc_warboss = {
                        MinimumAmount = 1,
                        MaximumAmount = 4,
                    },
                },
                SubPoolMaxSize = 4,
            },
            SavageOrcShamans = {
                AgentSubTypes = {
                    grn_savage_orc_shaman = {
                        MinimumAmount = 1,
                        MaximumAmount = 3,
                    },
                    grn_goblin_great_shaman = false, 
                    --[[grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },--]]
                },
                SubPoolMaxSize = 5,
            },
            --[[GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },--]]
        },
        PoolMaxSize = 5,
    },
}