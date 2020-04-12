function GetAlbionRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_nor_albion = {
            HeroPools = {
                WyrdDruid = {
                    AgentSubTypes = {
                        albion_wyrd_druid = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                Chief = {
                    AgentSubTypes = {
                        albion_chief = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                WarLeaders = {
                    AgentSubTypes = {
                        albion_warleader = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                TruthSayers = {
                    AgentSubTypes = {
                        albion_truthsayer_beast = {
                            MaximumPercentage = 25,
                        },
                        albion_truthsayer_life = {
                            MaximumPercentage = 25,
                        },
                        albion_truthsayer_light = {
                            MaximumPercentage = 25,
                        },
                        albion_truthsayer_truth = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end