function GetSavageOrcRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_grn_savage_orcs = {
            HeroPools = {
                NightGoblinShamanPools = {
                    AgentSubTypes = {
                        grn_night_goblin_shaman = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                OrcShamanPools = {
                    AgentSubTypes = {
                        grn_orc_shaman = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 1,
                },
                GoblinBigBossPools = {
                    AgentSubTypes = {
                        grn_goblin_big_boss = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                SavageOrcWarbosses = {
                    AgentSubTypes = {
                        grn_orc_warboss = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                SavageOrcShamans = {
                    AgentSubTypes = {
                        grn_goblin_great_shaman = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Major Faction specific distributions

        -- Savage Orc Tribes
        -- Note: These are separate from the Savage Orcs in GreenskinRecruitmentPools.lua
        -- because CA gave them a different sub culture.
        --[[wh2_main_grn_blue_vipers = {
            OrcWarbossPool = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MaximumPercentage = 5,
                    },
                },
                SubPoolMaxSize = 5,
            },
            GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MaximumPercentage = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },
            LordPoolMaxSize = 4,
        },
        wh_main_grn_skull-takerz = {
            OrcWarbossPool = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MaximumPercentage = 5,
                    },
                },
                SubPoolMaxSize = 5,
            },
            GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MaximumPercentage = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },
            LordPoolMaxSize = 4,
        },
        wh_main_grn_top_knotz = {
            OrcWarbossPool = {
                AgentSubTypes = {
                    grn_orc_warboss = {
                        MaximumPercentage = 5,
                    },
                },
                SubPoolMaxSize = 5,
            },
            GoblinGreatShaman = {
                AgentSubTypes = {
                    grn_goblin_great_shaman = {
                        MaximumPercentage = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },
            LordPoolMaxSize = 4,
        }, --]]
    };
end