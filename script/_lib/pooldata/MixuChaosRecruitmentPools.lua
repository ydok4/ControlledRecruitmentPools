ChaosRecruitmentPoolData = {
    -- The Cabal Faction, this is only present with the unlocker
    wh2_main_chs_the_cabal = {
        FactionPools = {
            SorcerorLords = {
                AgentSubTypes = {
                    chs_sorcerer_lord_death = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    chs_sorcerer_lord_fire = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    chs_sorcerer_lord_metal = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    dlc07_chs_sorcerer_lord_shadow = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 3,
                SubPoolMaxSize = 8,
            },
        },
        Traits = {
            wh2_main_skill_innate_chs_diabolic_spendour = {

            },
            wh2_main_skill_innate_chs_dominance = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
        },
        PoolMaxSize = 10,
    },
}