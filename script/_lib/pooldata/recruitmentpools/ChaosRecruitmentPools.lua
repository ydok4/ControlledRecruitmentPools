function GetChaosRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_chs_chaos = {
            HeroPools = {
                Sorcerers = {
                    AgentSubTypes = {
                        dlc07_chs_chaos_sorcerer_shadow = {
                            MaximumPercentage = 25,
                        },
                        chs_chaos_sorcerer_death = {
                            MaximumPercentage = 25,
                        },
                        chs_chaos_sorcerer_fire = {
                            MaximumPercentage = 25,
                        },
                        chs_chaos_sorcerer_metal = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                ExaltedHeroes = {
                    AgentSubTypes = {
                        chs_exalted_hero = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                ChaosLords = {
                    AgentSubTypes = {
                        chs_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                SorcerorLords = {
                    AgentSubTypes = {
                        chs_sorcerer_lord_death = {
                            MaximumPercentage = 25,
                        },
                        chs_sorcerer_lord_fire = {
                            MaximumPercentage = 25,
                        },
                        chs_sorcerer_lord_metal = {
                            MaximumPercentage = 25,
                        },
                        dlc07_chs_sorcerer_lord_shadow = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Main Chaos Faction
        wh_main_chs_chaos = {
            FactionPools = {
                ChaosLords = {
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 8,
                },
                SorcerorLords = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end