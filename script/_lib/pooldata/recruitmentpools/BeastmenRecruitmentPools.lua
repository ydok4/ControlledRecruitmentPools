function GetBeastmenRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_dlc03_sc_bst_beastmen = {
            HeroPools = {

            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                BeastLords = {
                    AgentSubTypes = {
                        dlc03_bst_beastlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 5,
        },
        -- Main Beastmen faction
        wh_dlc03_bst_beastmen = {
            FactionPools = {
                BeastLords = {
                    AgentSubTypes = {
                        dlc03_bst_beastlord = {
                            MinimumAmount = 0,
                            MaximumAmount = 5,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 6,
                },
            },
            LordPoolMaxSize = 6,
        },
    };
end