GreenskinRecruitmentPoolData =  {
    -- Major Faction specific distributions
    -- Default pool distribution
    wh_main_sc_grn_greenskins = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    grn_savage_orc_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = false,
                    grn_savage_orc_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    grn_orc_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    }
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
        },
    },
    -- Major Faction specific distributions

    -- Grimgor / Ahzag (Vanilla at least)
    wh_main_grn_greenskins = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    grn_savage_orc_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_savage_orc_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    grn_orc_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    }
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
    },
    -- Wurrzag
    wh_main_grn_orcs_of_the_bloody_hand = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    grn_orc_warboss = false,
                    grn_savage_orc_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_savage_orc_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    grn_orc_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
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