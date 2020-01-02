function GetTEBRecruitmentPools()
    return {
        -- Culture default
        -- This is used by the unlocker factions
        wh_main_sc_teb_teb = {
            HeroPools = {
            },
            HeroPoolMaxSize = 4,
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 3,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
            },
            LordPoolMaxSize = 6,
        },

        -- Major TEB factions
        wh_main_teb_border_princes = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 7,
        },

        wh_main_teb_estalia = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 7,
        },

        wh_main_teb_tilea = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MinimumAmount = 0,
                            MaximumAmount = 4,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
            },
            LordPoolMaxSize = 7,
        },
        -- Minor TEB factions - Unlocker only
    };
end