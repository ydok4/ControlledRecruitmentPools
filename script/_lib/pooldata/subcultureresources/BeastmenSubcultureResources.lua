function GetBeastmenSubcultureResources()
    return {
        DefaultLords = {"dlc03_bst_beastlord"},
        Rewards = {

        },
        Heroes = {
            "dlc03_bst_bray_shaman_beasts",
            "dlc03_bst_bray_shaman_death",
            "dlc03_bst_bray_shaman_shadows",
            "dlc03_bst_bray_shaman_wild",
            "dlc03_bst_gorebull",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            dlc03_bst_beastlord = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc03_bst_bray_shaman_beasts = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc03_bst_bray_shaman_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc03_bst_bray_shaman_shadows = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc03_bst_bray_shaman_wild = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc03_bst_gorebull = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
        Traits = {
            wh2_main_skill_innate_bst_booze_cravings = {

            },
            wh2_main_skill_innate_bst_khornes_fury = {

            },
            wh2_main_skill_innate_bst_nurgles_foul_stink = {

            },
            wh2_main_skill_innate_bst_torment_utterances = {

            },
            wh2_main_skill_innate_bst_unsated_bloodthirst = {

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