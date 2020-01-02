function GetGreenskinSubcultureResources()
    return {
        DefaultLords = {"grn_orc_warboss"},
        Rewards = {

        },
        Heroes = {
            "grn_goblin_big_boss",
            "grn_night_goblin_shaman",
            "grn_orc_shaman",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            grn_orc_warboss = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            grn_goblin_great_shaman = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc06_grn_night_goblin_warboss = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            grn_goblin_big_boss = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            grn_night_goblin_shaman = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            grn_orc_shaman = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
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
    };
end