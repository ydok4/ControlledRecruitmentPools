function GetSavageOrcRecruitmentPoolData()
    return {
        -- Default pool distribution
        wh_main_sc_grn_savage_orcs = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                SavageOrcWarbosses = {
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
            },
            LordPoolMaxSize = 7,
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
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },
            LordPoolMaxSize = 5,
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
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },
            LordPoolMaxSize = 5,
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
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolMaxSize = 2,
            },
            LordPoolMaxSize = 5,
        }, --]]
    };
end