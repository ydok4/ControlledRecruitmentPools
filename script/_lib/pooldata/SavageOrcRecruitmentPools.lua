SavageOrcRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_grn_savage_orcs = {
        FactionPools = {
            SavageOrcWarbosses = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            SavageOrcShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
            --[[GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 1,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },--]]
        },
        Traits = {
            wh2_main_skill_innate_grn_big_bully = {

            },
            wh2_main_skill_innate_grn_bragga = {

            },
            wh2_main_skill_innate_grn_mushroom_addicted = {

            },
            wh2_main_skill_innate_grn_serial_danca = {

            },
            wh2_main_skill_innate_grn_tortura = {

            },
            wh_main_skill_innate_grn_choppa_envy = {

            },
            wh_main_skill_innate_grn_stabba_envy = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_charismatic",
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_handsome",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
            "wh_main_skill_innate_all_sanguine",
        },
        PoolMaxSize = 5,
    },
    -- Major Faction specific distributions

    -- Savage Orc Tribes
    -- Note: These are separate from the Savage Orcs in GreenskinRecruitmentPools.lua
    -- because CA gave them a different sub culture.
    --[[wh2_main_grn_blue_vipers = {
        OrcWarbossPool = {
            AgentSubTypes = {
                grn_orc_warboss = {
                    MinimumAmount = 2,
                    MaximumAmount = 5,
                },
            },
            SubPoolMaxSize = 5,
        },
        GoblinGreatShaman = {
            AgentSubTypes = {
                grn_goblin_great_shaman = {
                    MinimumAmount = 1,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 2,
        },
        PoolMaxSize = 5,
    },
    wh_main_grn_skull-takerz = {
        OrcWarbossPool = {
            AgentSubTypes = {
                grn_orc_warboss = {
                    MinimumAmount = 2,
                    MaximumAmount = 5,
                },
            },
            SubPoolMaxSize = 5,
        },
        GoblinGreatShaman = {
            AgentSubTypes = {
                grn_goblin_great_shaman = {
                    MinimumAmount = 1,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 2,
        },
        PoolMaxSize = 5,
    },
    wh_main_grn_top_knotz = {
        OrcWarbossPool = {
            AgentSubTypes = {
                grn_orc_warboss = {
                    MinimumAmount = 2,
                    MaximumAmount = 5,
                },
            },
            SubPoolMaxSize = 5,
        },
        GoblinGreatShaman = {
            AgentSubTypes = {
                grn_goblin_great_shaman = {
                    MinimumAmount = 1,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 2,
        },
        PoolMaxSize = 5,
    }, --]]
}