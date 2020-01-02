function GetMixuSavageOrcRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_grn_savage_orcs = {
            FactionPools = {
                SavageOrcWarbosses = {
                    AgentSubTypes = {
                        grn_savage_orc_warboss = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                            HumanPlayerOnly = true,
                        },
                        grn_orc_warboss = false,
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 2,
                },
                SavageOrcShamans = {
                    AgentSubTypes = {
                        grn_savage_orc_shaman = {
                            MinimumAmount = 0,
                            MaximumAmount = 2,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
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
    };
end