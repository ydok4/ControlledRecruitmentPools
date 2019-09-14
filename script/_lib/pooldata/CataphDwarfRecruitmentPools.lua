DwarfRecruitmentPoolData =  {
    -- Major Faction specific distributions

    -- Kraka-Drak
    wh_main_dwf_kraka_drak = {
        FactionPools = {
            DwarfLords = {
                AgentSubTypes = {
                    dwf_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                    kraka_wardlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            RuneLord = {
                AgentSubTypes = {
                    dlc06_dwf_runelord = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
    },
}