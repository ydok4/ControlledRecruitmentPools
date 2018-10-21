SavageOrcRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_grn_savage_orcs = {
        FactionPools = {
            SavageOrcWarbosses = {
                AgentSubTypes = {
                    grn_savage_orc_warboss = {
                        MinimumAmount = 1,
                        MaximumAmount = 4,
                    },
                    grn_orc_warboss = false,
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 4,
            },
            SavageOrcShamans = {
                AgentSubTypes = {
                    grn_savage_orc_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 5,
            },
        },
        PoolMaxSize = 5,
        Traits = {
            "wh2_main_skill_innate_grn_big_bully",
            "wh2_main_skill_innate_grn_bragga",
            "wh2_main_skill_innate_grn_mushroom_addicted",
            "wh2_main_skill_innate_grn_serial_danca",
            "wh2_main_skill_innate_grn_tortura",
            "wh_main_skill_innate_grn_choppa_envy",
        },
        LordsToReplace = {
            grn_orc_warboss = {
                replacementKey = "grn_savage_orc_warboss",
                traitKeyPool = {
                    "wh2_main_skill_innate_grn_big_bully",
                    "wh2_main_skill_innate_grn_bragga",
                    "wh2_main_skill_innate_grn_serial_danca",
                    "wh2_main_skill_innate_grn_tortura"
                },
            },
        },
    },
}