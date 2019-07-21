NorscaRecruitmentPoolData = {
    -- Default pool distribution
    wh_main_sc_nor_norsca = {
        DefaultLords = {"nor_marauder_chieftain"},
        FactionPools = {
            NorscaChieftains = {
                AgentSubTypes = {
                    nor_marauder_chieftain = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 4,
            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_charismatic",
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_handsome",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
        },
        PoolMaxSize = 5,
        --[[LordsToReplace = {
            wh_dlc08_nor_wulfrik = {
                replacementKey = "wh_dlc08_nor_wulfrik",
            },
        },--]]
    },
}