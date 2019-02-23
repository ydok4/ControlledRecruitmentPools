TEBRecruitmentPools = {
    -- Culture default
    -- This is used by the unlocker factions
    wh_main_sc_teb_teb = {
        DefaultLords = {"teb_lord"},
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    teb_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 3,
    },

    -- Major TEB factions
    wh_main_teb_border_princes = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    teb_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
    },

    wh_main_teb_estalia = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    teb_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
    },

    wh_main_teb_tilea = {
        FactionPools = {
            TEBLords = {
                AgentSubTypes = {
                    teb_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
    },
    -- Minor TEB factions - Unlocker only
}