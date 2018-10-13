WoodElfRecruitmentPoolData = {
    -- Default pool distribution
    wh_dlc05_sc_wef_wood_elves = {
        FactionPools = {
            GladeLords = {
                AgentSubTypes = {
                    dlc05_wef_glade_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                    dlc05_wef_glade_lord_fem = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            AncientTreeman = {
                AgentSubTypes = {
                    dlc05_wef_ancient_treeman = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 2,
            },
            SpellWeavers = {
                AgentSubTypes = {
                    wef_spellweaver = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    wef_highweaver = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wef_darkweaver = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 4,
            },
        },
        PoolMaxSize = 6,
    },
}