function GetMixuChaosRecruitmentPoolData()
    return {
        -- The Cabal Faction, this is only present with an unlocker (Mixus's or Crynsos)
        wh2_main_chs_the_cabal = {
            FactionPools = {
                ChaosLord = {
                    AgentSubTypes = {
                        chs_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
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
                    SubPoolInitialMinSize = 3,
                    SubPoolMaxSize = 4,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end