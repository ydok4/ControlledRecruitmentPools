function GetBeastmenRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_dlc03_sc_bst_beastmen = {
            HeroPools = {
                BrayShamans = {
                    AgentSubTypes = {
                        dlc03_bst_bray_shaman_beasts = {
                            MaximumPercentage = 25,
                        },
                        dlc03_bst_bray_shaman_death = {
                            MaximumPercentage = 25,
                        },
                        dlc03_bst_bray_shaman_shadows = {
                            MaximumPercentage = 25,
                        },
                        dlc03_bst_bray_shaman_wild = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                GoreBulls = {
                    AgentSubTypes = {
                        dlc03_bst_gorebull = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                BeastLords = {
                    AgentSubTypes = {
                        dlc03_bst_beastlord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Main Beastmen faction
        wh_dlc03_bst_beastmen = {
            FactionPools = {
                BeastLords = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 6,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end