GreenskinRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_grn_greenskins = {
        DefaultLords = {"grn_orc_warboss"},
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 5,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
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
    },
    -- Major Faction specific distributions

    -- Grimgor / Ahzag (Vanilla at least)
    wh_main_grn_greenskins = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 9,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 9,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 9,
    },
    -- Wurrzag
    wh_main_grn_orcs_of_the_bloody_hand = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 5,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 5,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
        },
        PoolMaxSize = 8,
    },

    -- Skarsnik
    wh_main_grn_crooked_moon = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    dlc06_grn_night_goblin_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 2,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
        },
        LordsToReplace = {
            grn_orc_warboss = {
                replacementKey = "dlc06_grn_night_goblin_warboss",
                traitKeyPool = {
                    "wh2_main_skill_innate_grn_big_bully",
                    "wh2_main_skill_innate_grn_bragga",
                    "wh2_main_skill_innate_grn_serial_danca",
                    "wh2_main_skill_innate_grn_tortura"
                },
            },
        },
        --[[Rewards = {
            scripted = {
                Pools = {
                    GreenskinWarbosses = {
                        AgentSubTypes = {
                            grn_orc_warboss = {
                                MinimumAmount = 0,
                                MaximumAmount = 3,
                                HumanPlayerOnly = true,
                            },
                        },
                        SubPoolMaxSize = 5,
                    },
                },
                Events = {
                    Incident = "wh_main_crp_grn_skarsnik_scripted",
                    Dilemma = nil,
                },
                IncreasePoolSize = 3,
                Type = "increase",
            },
        },--]]
        PoolMaxSize = 7,
    },

    -- Minor Faction specific distributions

    -- Goblins/Forest Goblins
--[[    wh2_main_grn_arachnos = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 3,
        },
        PoolMaxSize = 8,
    },
    wh_main_grn_black_venom = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 0,
                    MaximumAmount = 2,
                },
            },
            SubPoolMaxSize = 3,
        },
        PoolMaxSize = 8,
    },--]]
    -- Goblin Tribes
    wh_main_grn_broken_nose = {
        FactionPools = {
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
        LordsToReplace = {
            grn_orc_warboss = {
                replacementKey = "grn_goblin_great_shaman",
                traitKeyPool = {
                    "wh2_main_skill_innate_grn_big_bully",
                    "wh2_main_skill_innate_grn_bragga",
                    "wh2_main_skill_innate_grn_serial_danca",
                    "wh2_main_skill_innate_grn_tortura"
                },
            },
        },
    },
    wh_main_grn_scabby_eye = {
        FactionPools = {
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
        LordsToReplace = {
            grn_orc_warboss = {
                replacementKey = "grn_goblin_great_shaman",
                traitKeyPool = {
                    "wh2_main_skill_innate_grn_big_bully",
                    "wh2_main_skill_innate_grn_bragga",
                    "wh2_main_skill_innate_grn_serial_danca",
                    "wh2_main_skill_innate_grn_tortura"
                },
            },
        },
    },
    wh_main_grn_teef_snatchaz = {
        FactionPools = {
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
        LordsToReplace = {
            grn_orc_warboss = {
                replacementKey = "grn_goblin_great_shaman",
                traitKeyPool = {
                    "wh2_main_skill_innate_grn_big_bully",
                    "wh2_main_skill_innate_grn_bragga",
                    "wh2_main_skill_innate_grn_serial_danca",
                    "wh2_main_skill_innate_grn_tortura"
                },
            },
        },
    },

    -- Night Goblin Tribes
    wh_main_grn_bloody_spearz = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    dlc06_grn_night_goblin_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 1,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
    },
    wh_main_grn_red_eye = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    dlc06_grn_night_goblin_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 1,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
        LordsToReplace = {
            grn_orc_warboss = {
                replacementKey = "dlc06_grn_night_goblin_warboss",
                traitKeyPool = {
                    "wh2_main_skill_innate_grn_big_bully",
                    "wh2_main_skill_innate_grn_bragga",
                    "wh2_main_skill_innate_grn_serial_danca",
                    "wh2_main_skill_innate_grn_tortura"
                },
            },
        },
    },
    wh_main_grn_necksnappers = {
        FactionPools = {
            GreenskinWarbosses = {
                AgentSubTypes = {
                    dlc06_grn_night_goblin_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 4,
                    },
                    grn_orc_warboss = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 4,
            },
            GreenskinShamans = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        PoolMaxSize = 7,
    },
    -- Orc Tribes
    --[[wh_main_grn_skullsmasherz = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
            },
            SubPoolMaxSize = 5,
        },
        PoolMaxSize = 8,
    },
    wh_main_grn_red_fangs = ?

    -- Savage Orc Tribes
    -- Note: These are separate from the Orcs in SavageOrcRecruitmentPools.lua
    -- because CA gave them different sub cultures.
    wh_main_grn_broken_nose = {
        DreadlordPool = {
            AgentSubTypes = {
                wh2_main_def_dreadlord_fem = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
                wh2_main_def_dreadlord = {
                    MinimumAmount = 2,
                    MaximumAmount = 3,
                },
            },
            SubPoolMaxSize = 5,
        },
        PoolMaxSize = 8,
    }, --]]
}