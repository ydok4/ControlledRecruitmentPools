function GetBeastmenSubcultureResources()
    return {
        DefaultLords = {"dlc03_bst_beastlord"},
        Rewards = {
            wh_dlc03_horde_beastmen_herd_4 = {
                Pools = {
                    "BeastLords",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh_dlc03_horde_beastmen_herd_5 = {
                Pools = {
                    "BeastLords",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh_dlc03_horde_beastmen_minotaurs_2 = {
                Pools = {
                    "GoreBulls",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh_dlc03_horde_beastmen_minotaurs_3 = {
                Pools = {
                    "GoreBulls",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh_dlc03_horde_beastmen_arcane_1 = {
                Pools = {
                    "BrayShamans",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh_dlc03_horde_beastmen_arcane_2 = {
                Pools = {
                    "BrayShamans",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
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
                Weighting = 12,
            },
            RazorgorChariot = {
                BonusCost = 700,
                Weighting = 4,
            },
        },
        AgentSubTypes = {
            dlc03_bst_beastlord = {
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc03_bst_cha_beastlord_1 = {
                        MountData = "RazorgorChariot",
                    },
                },
            },
            dlc03_bst_bray_shaman_beasts = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc03_bst_cha_bray_shaman_beasts_1 = {
                        MountData = "RazorgorChariot",
                    },
                },
            },
            dlc03_bst_bray_shaman_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc03_bst_cha_bray_shaman_death_1 = {
                        MountData = "RazorgorChariot",
                    },
                },
            },
            dlc03_bst_bray_shaman_shadows = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc03_bst_cha_bray_shaman_shadows_1 = {
                        MountData = "RazorgorChariot",
                    },
                },
            },
            dlc03_bst_bray_shaman_wild = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc03_bst_cha_bray_shaman_wild_1 = {
                        MountData = "RazorgorChariot",
                    },
                },
            },
            dlc03_bst_gorebull = {
                BonusCost = 1100,
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