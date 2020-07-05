function GetSkavenRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh2_main_sc_skv_skaven = {
            HeroPools = {
                Assassins = {
                    AgentSubTypes = {
                        wh2_main_skv_assassin = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                PlaguePriest = {
                    AgentSubTypes = {
                        wh2_main_skv_plague_priest = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                WarlockEngineer = {
                    AgentSubTypes = {
                        wh2_main_skv_warlock_engineer = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                EshinSorcerer = {
                    AgentSubTypes = {
                        wh2_dlc14_skv_eshin_sorcerer = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                SkavenWarlord = {
                    AgentSubTypes = {
                        wh2_main_skv_warlord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 3,
                    SubPoolMaxSize = 6,
                },
                GreySeer = {
                    AgentSubTypes = {
                        wh2_main_skv_grey_seer_plague = {
                            MaximumPercentage = 50,
                        },
                        wh2_main_skv_grey_seer_ruin = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
                WarlockMasters = {
                    AgentSubTypes = {
                        wh2_dlc12_skv_warlock_master = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                MasterAssassin = {
                    AgentSubTypes = {
                        wh2_dlc14_skv_master_assassin = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Major Clans
        -- Clan Pestilens
        wh2_main_skv_clan_pestilens = {
            HeroPools = {
                PlaguePriest = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                SkavenWarlord = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                GreySeer = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Clan Skyre
        wh2_main_skv_clan_skyre = {
            HeroPools = {
                WarlockEngineer = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                SkavenWarlord = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                GreySeer = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                WarlockMasters = {
                    AgentSubTypes = {
                        wh2_dlc12_skv_warlock_master = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },

        -- Clan Eshin
        wh2_main_skv_clan_eshin = {
            HeroPools = {
                Assassins = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
                EshinSorcerer = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            FactionPools = {
                SkavenWarlord = {
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 3,
                },
                GreySeer = {
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                MasterAssassin = {
                    AgentSubTypes = {
                        wh2_dlc14_skv_master_assassin = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end