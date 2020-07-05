
function GetWezSpeshulGreenskinRecruitmentPoolData()
    -- This is designed to be paired with Mixu's TTL
    return {
        -- Default pool distribution
        wh_main_sc_grn_greenskins = {
            FactionPools = {
                GreenskinShamans = {
                    AgentSubTypes = {
                        grn_savage_orc_shaman = false,
                        grn_goblin_great_shaman = {
                            MaximumPercentage = 25,
                        },
                        grn_orc_great_shaman = {
                            MaximumPercentage = 50,
                        },
                        ws_grn_savage_orc_great_shaman = {
                            MaximumPercentage = 25,
                        },
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
                GreenskinShamans = {
                    AgentSubTypes = {
                        grn_savage_orc_shaman = false,
                        grn_goblin_great_shaman = {
                            MaximumPercentage = 25,
                        },
                        grn_orc_great_shaman = {
                            MaximumPercentage = 50,
                        },
                        ws_grn_savage_orc_great_shaman = {
                            MaximumPercentage = 25,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 1,
                },
            },
        },
        -- Wurrzag
        wh_main_grn_orcs_of_the_bloody_hand = {
            FactionPools = {
                GreenskinShamans = {
                    AgentSubTypes = {
                        grn_savage_orc_shaman = false,
                        grn_goblin_great_shaman = {
                            MaximumPercentage = 25,
                        },
                        grn_orc_great_shaman = {
                            MaximumPercentage = 25,
                        },
                        ws_grn_savage_orc_great_shaman = {
                            MaximumPercentage = 50,
                        },
                    },
                },
            },
        },
    };
end