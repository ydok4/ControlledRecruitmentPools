function GetChaosRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_chs_chaos = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                ChaosLord = {
                    AgentSubTypes = {
                        chs_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 5,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
                SorcerorLords = {
                    AgentSubTypes = {
                        chs_sorcerer_lord_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        chs_sorcerer_lord_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        chs_sorcerer_lord_metal = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        dlc07_chs_sorcerer_lord_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 7,
        },

        -- Main Chaos Faction
        wh_main_chs_chaos = {
            FactionPools = {
                ChaosLords = {
                    AgentSubTypes = {
                        chs_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 8,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 8,
                },
                SorcerorLords = {
                    AgentSubTypes = {
                        chs_sorcerer_lord_death = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        chs_sorcerer_lord_fire = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        chs_sorcerer_lord_metal = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                        dlc07_chs_sorcerer_lord_shadow = {
                            MinimumAmount = 0,
                            MaximumAmount = 1,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 10,
        },
    };
end