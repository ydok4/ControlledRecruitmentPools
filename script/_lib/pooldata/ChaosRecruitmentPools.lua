ChaosRecruitmentPoolData = {
    -- Default pool distribution
    wh_main_sc_chs_chaos = {
        DefaultLords = {"chs_lord"},
        FactionPools = {
            ChaosLord = {
                AgentSubTypes = {
                    chs_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                        HumanPlayerOnly = true,
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
        PoolMaxSize = 6,
    },

    -- Main Chaos Faction
    wh_main_chs_chaos = {
        FactionPools = {
            ChaosLords = {
                AgentSubTypes = {
                    chs_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 8,
                        HumanPlayerOnly = true,
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
        PoolMaxSize = 15,
    },
}