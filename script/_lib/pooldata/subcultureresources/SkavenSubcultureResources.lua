function GetSkavenSubcultureResources()
    return {
        DefaultLords = {"wh2_main_skv_warlord"},
        Rewards = {

        },
        Heroes = {
            "wh2_main_skv_assassin",
            "wh2_main_skv_plague_priest",
            "wh2_main_skv_warlock_engineer",
            "wh2_dlc14_skv_eshin_sorcerer",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            wh2_main_skv_warlord = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_skv_grey_seer_plague = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_skv_grey_seer_ruin = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc12_skv_warlock_master = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc14_skv_master_assassin = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_skv_assassin = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_skv_plague_priest = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc14_skv_eshin_sorcerer = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
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
    };
end