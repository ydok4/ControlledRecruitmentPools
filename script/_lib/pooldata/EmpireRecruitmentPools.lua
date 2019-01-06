EmpireRecruitmentPoolData =  {
    -- Default pool distribution
    wh_main_sc_emp_empire = {
        FactionPools = {
        },
        PoolMaxSize = 5,
        Traits = {
            h2_main_skill_innate_emp_imperious = {

            },
            wh2_main_skill_innate_emp_monster_hunter = {

            },
            wh2_main_skill_innate_emp_monster_tracker = {

            },
            wh2_main_skill_innate_emp_noble = {

            },
            wh2_main_skill_innate_emp_regal = {

            },
        },
    },
    -- Major Faction specific distributions

    -- Reikland
    wh_main_emp_empire = {
        FactionPools = {
            ArchLectors = {
                AgentSubTypes = {
                    dlc04_emp_arch_lector = {
                        MinimumAmount = 0,
                        MaximumAmount = 2,
                    },
                },
                SubPoolInitialMinSize = 0,
                SubPoolMaxSize = 2,
            },
        },
        LegendaryLordNameKeys = {
            emp_balthasar_gelt = {
                clan_name = "names_name_2147343922",
                forename = "names_name_2147343928",
            },
            dlc04_emp_volkmar = {
                clan_name = "names_name_2147358013",
                forename = "names_name_2147350175",
            },
        },
        PoolMaxSize = 10,
    },
    -- Minor Faction specific distributions
    -- TBD
}