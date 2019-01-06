BretonniaRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_brt_bretonnia = {
        FactionPools = {
            ProphetessPool = {
                AgentSubTypes = {
                    dlc07_brt_prophetess_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_heavens = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_life = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
        },
        Traits = {
            wh_dlc07_brt_skill_innate_all_honourable = {

            },
            wh_dlc07_brt_skill_innate_all_intelligent = {

            },
            wh_dlc07_brt_skill_innate_all_magnanimous = {

            },
            wh_dlc07_brt_skill_innate_all_melancholic = {

            },
            wh_dlc07_brt_skill_innate_all_phlegmatic = {

            },
            wh_dlc07_brt_skill_innate_all_sanguine = {

            },
            wh_dlc07_brt_skill_innate_all_uncompromising = {

            },
            wh_main_skill_innate_brt_virtue_audacity = {

            },
            wh_main_skill_innate_brt_virtue_confidence = {

            },
            wh_main_skill_innate_brt_virtue_discipline = {

            },
            wh_main_skill_innate_brt_virtue_duty = {

            },
            wh_main_skill_innate_brt_virtue_heroism = {

            },
            wh_main_skill_innate_brt_virtue_ideal = {

            },
            wh_main_skill_innate_brt_virtue_impetuous_knight = {

            },
            wh_main_skill_innate_brt_virtue_joust = {

            },
            wh_main_skill_innate_brt_virtue_knightly_temper = {

            },
            wh_main_skill_innate_brt_virtue_noble_disdain = {

            },
            wh_main_skill_innate_brt_virtue_penitent = {

            },
            wh_main_skill_innate_brt_virtue_stoicism = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_honourable",
            "wh_main_skill_innate_all_intelligent",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
            "wh_main_skill_innate_all_phlegmatic",
            "wh_main_skill_innate_all_sanguine",
            "wh_main_skill_innate_all_uncompromising",
        },
        PoolMaxSize = 6,
    },
    -- Major Faction specific distributions

    -- Louen Leoncour
    wh_main_brt_bretonnia = {
        FactionPools = {
            BretLordPool = {
                AgentSubTypes = {
                    brt_lord = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 4,
            },
            ProphetessPool = {
                AgentSubTypes = {
                    dlc07_brt_prophetess_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_heavens = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_life = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 10,
    },
    -- Alberic
    wh_main_brt_bordeleaux = {
        FactionPools = {
            ProphetessPool = {
                AgentSubTypes = {
                    dlc07_brt_prophetess_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_heavens = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    dlc07_brt_prophetess_life = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 10,
    },

    -- Morgiana (Fay Enchantress)
    wh_main_brt_carcassonne = {
        FactionPools = {
            ProphetessPool = {
                AgentSubTypes = {
                    dlc07_brt_prophetess_beasts = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    dlc07_brt_prophetess_heavens = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    dlc07_brt_prophetess_life = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 3,
                SubPoolMaxSize = 6,
            },
        },
        PoolMaxSize = 10,
    },

    -- Minor Faction specific distributions
    -- TBD
}