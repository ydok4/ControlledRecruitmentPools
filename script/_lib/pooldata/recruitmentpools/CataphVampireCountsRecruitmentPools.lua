function GetCataphVampireCountsRecruitmentPoolData()
    return {
        -- Major Faction specific distributions
        -- The Barrow Legion (Kemmler)
        wh2_dlc11_vmp_the_barrow_legion = {
            HeroPools = {
                Necromancers = {
                    AgentSubTypes = {
                        vmp_necromancer = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                Vampires = {
                    AgentSubTypes = {
                        vmp_vampire = {
                            MaximumPercentage = 50,
                        },
                        wh_dlc05_vmp_vampire_shadow = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                Banshees = {
                    AgentSubTypes = {
                        vmp_banshee = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                WightKings = {
                    AgentSubTypes = {
                        vmp_wight_king = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                ShadowDruids = {
                    AgentSubTypes = {
                        AK_hobo_druid_shadow = {
                            MaximumPercentage = 33,
                        },
                        AK_hobo_druid_death = {
                            MaximumPercentage = 33,
                        },
                        AK_hobo_druid_heavens = {
                            MaximumPercentage = 33,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                BarrowKings = {
                    AgentSubTypes = {
                        AK_hobo_barrow_king = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 0,
            FactionPools = {
                MasterNecromancers = false,
            },
            LordPoolMaxSize = 0,
        },
    };
end