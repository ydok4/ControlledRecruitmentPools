SkavenRecruitmentPoolData = {
    -- Default pool distribution
    wh2_main_sc_skv_skaven = {
        DefaultLords = {"wh2_main_skv_warlord"},
        FactionPools = {
            SkavenWarlord = {
                AgentSubTypes = {
                    wh2_main_skv_warlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 6,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 3,
                SubPoolMaxSize = 6,
            },
            GreySeer = {
                AgentSubTypes = {
                    wh2_main_skv_grey_seer_plague = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_main_skv_grey_seer_ruin = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        Traits = {
            wh2_main_skill_innate_skv_sharp_claws = {

            },
            wh2_main_skill_innate_skv_sharp_teeth = {

            },
            wh2_main_skill_innate_skv_sneaky = {

            },
            wh2_main_skill_innate_skv_warpstone_hoarder = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_charismatic",
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_handsome",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
        },
        PoolMaxSize = 10,
    },

    -- Major Clans
    -- Clan Skyre
    wh2_main_skv_clan_skyre = {
        FactionPools = {
            SkavenWarlord = {
                AgentSubTypes = {
                    wh2_main_skv_warlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
            GreySeer = {
                AgentSubTypes = {
                    wh2_main_skv_grey_seer_plague = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_main_skv_grey_seer_ruin = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
            WarlockMaster = {
                AgentSubTypes = {
                    wh2_dlc12_skv_warlock_master = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                    },
                },
                SubPoolInitialMinSize = 2,
                SubPoolMaxSize = 3,
            },
        },
        Rewards = {
            alliance = {
                Pools = {
                    WarlockMaster = {
                        AgentSubTypes = {
                            wh2_dlc12_skv_warlock_master = {
                                MinimumAmount = 0,
                                MaximumAmount = 1,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                Events = {
                    Incident = "wh_main_skv_warlock_master",
                    Dilemma = nil,
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
        },
        PoolMaxSize = 8,
    },

    -- Clan Eshin
    wh2_main_skv_clan_eshin = {
        FactionPools = {
            SkavenWarlord = {
                AgentSubTypes = {
                    wh2_main_skv_warlord = {
                        MinimumAmount = 0,
                        MaximumAmount = 3,
                        HumanPlayerOnly = true,
                    },
                },
                SubPoolInitialMinSize = 1,
                SubPoolMaxSize = 3,
            },
            GreySeer = {
                AgentSubTypes = {
                    wh2_main_skv_grey_seer_plague = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                    wh2_main_skv_grey_seer_ruin = {
                        MinimumAmount = 0,
                        MaximumAmount = 1,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 1,
            },
            MasterAssassin = {
                AgentSubTypes = {
                    wh2_dlc14_skv_master_assassin = {
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
}