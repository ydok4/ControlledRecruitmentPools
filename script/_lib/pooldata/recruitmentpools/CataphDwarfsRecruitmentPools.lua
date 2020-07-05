function GetCataphDwarfsRecruitmentPools()
    return {
        -- Major Faction specific distributions

        -- Kraka-Drak
        wh_main_dwf_kraka_drak = {
            FactionPools = {
                DwarfLords = {
                    AgentSubTypes = {
                        dwf_lord = {
                            MaximumPercentage = 50,
                        },
                        kraka_wardlord = {
                            MaximumPercentage = 50,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 5,
                },
                RuneLord = {
                    AgentSubTypes = {
                        dlc06_dwf_runelord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end