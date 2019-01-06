BeastmentRecruitmentPoolData = {
    -- Default pool distribution
    wh_dlc03_sc_bst_beastmen = {
        FactionPools = {
        },
        Traits = {
            wh2_main_skill_innate_bst_booze_cravings = {

            },
            wh2_main_skill_innate_bst_khornes_fury = {

            },
            wh2_main_skill_innate_bst_nurgles_foul_stink = {

            },
            wh2_main_skill_innate_bst_torment_utterances = {

            },
            wh2_main_skill_innate_bst_unsated_bloodthirst = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_charismatic",
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_handsome",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
        },
        PoolMaxSize = 8,
    },

    wh_dlc03_bst_beastmen = {
        FactionPools = {
            BeastLords = {
                AgentSubTypes = {
                    dlc03_bst_beastlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 5,
            },
        },
        LegendaryLordNameKeys = {
            dlc03_bst_malagor = {
                clan_name = "names_name_2147357619",
                forename = "",
            },
            dlc05_bst_morghur = {
                clan_name = "names_name_2147352897",
                forename = "",
            },
        },
        PoolMaxSize = 8,
    },

}