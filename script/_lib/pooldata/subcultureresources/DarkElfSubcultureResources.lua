function GetDarkElfSubcultureResources()
    return {
        DefaultLords = {"wh2_main_def_dreadlord", "wh2_main_def_dreadlord_fem"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "DreadLords",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_main_def_barracks_2 = {
                Pools = {
                    "Masters",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_main_def_murder = {
                Pools = {
                    "KhainiteAssassins",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_main_def_worship = {
                Pools = {
                    "DeathHags",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_main_def_pleasure_cult = {
                Pools = {
                    "DeathHags",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                MinimumLevel = 3,
                Type = "set",
            },
            wh2_main_def_sorcery_2 = {
                Pools = {
                    "SupremeSorceressPool",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh2_main_def_sorcery = {
                Pools = {
                    "Sorceresses",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_main_def_beasts_2 = {
                Pools = {
                    "BeastMasterPool",
                },
                MinimumRequireBuildingLevel = 1,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_main_special_clar_karond_lairs = {
                Pools = {
                    "BeastMasterPool",
                },
                Events = {
                },
                IncreasePoolSize = 2,
                UseLevelMultiplier = false,
                Type = "set",
            },
        },
        Heroes = {
            "wh2_dlc14_def_master",
            "wh2_dlc10_def_sorceress_beasts",
            "wh2_dlc10_def_sorceress_death",
            "wh2_main_def_sorceress_dark",
            "wh2_main_def_sorceress_fire",
            "wh2_main_def_sorceress_shadow",
            "wh2_main_def_khainite_assassin",
            "wh2_main_def_death_hag",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            DarkSteed = {
                BonusCost = 75,
                Weighting = 15,
            },
            ColdOne = {
                BonusCost = 125,
                Weighting = 12,
            },
            DarkPegasus = {
                BonusCost = 250,
                Weighting = 6,
            },
            ColdOneChariot = {
                BonusCost = 600,
                Weighting = 2,
            },
            Manticore = {
                BonusCost = 750,
                Weighting = 3,
            },
            BlackDragon = {
                BonusCost = 1500,
                Weighting = 1,
            },
            ScourgeRunnerChariot = {
                BonusCost = 750,
                Weighting = 12,
            },
            BeastMasterManticore = {
                BonusCost = 750,
                Weighting = 6,
            },
            CauldronOfBlood = {
                BonusCost = 950,
                Weighting = 2,
            },
        },
        AgentSubTypes = {
            wh2_dlc14_def_master = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc14_anc_mount_def_master_dark_steed = {
                        MountData = "DarkSteed",
                        Skill = "wh2_dlc14_skill_def_master_mount_dark_steed",
                    },
                    wh2_dlc14_anc_mount_def_master_cold_one = {
                        MountData = "ColdOne",
                        Skill = "wh2_dlc14_skill_def_master_mount_cold_one",
                    },
                    wh2_dlc14_anc_mount_def_master_dark_pegasus = {
                        MountData = "DarkPegasus",
                        Skill = "wh2_dlc14_skill_def_master_mount_dark_pegasus",
                    },
                    wh2_dlc14_anc_mount_def_master_cold_one_chariot = {
                        MountData = "ColdOneChariot",
                        Skill = "wh2_dlc14_skill_def_master_mount_cold_one_chariot",
                    },
                },
            },
            wh2_main_def_death_hag = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_def_death_hag_cauldron_of_blood = {
                        MountData = "CauldronOfBlood",
                    },
                },
            },
            wh2_main_def_khainite_assassin = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc10_def_sorceress_beasts = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc10_anc_mount_def_sorceress_beasts_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_dlc10_anc_mount_def_sorceress_beasts_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_dlc10_anc_mount_def_sorceress_beasts_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                },
            },
            wh2_dlc10_def_sorceress_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc10_anc_mount_def_sorceress_death_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_dlc10_anc_mount_def_sorceress_death_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_dlc10_anc_mount_def_sorceress_death_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                },
            },
            wh2_main_def_sorceress_dark = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_def_sorceress_dark_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_main_anc_mount_def_sorceress_dark_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_main_anc_mount_def_sorceress_dark_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                },
            },
            wh2_main_def_sorceress_fire = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_def_sorceress_fire_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_main_anc_mount_def_sorceress_fire_dark_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_main_anc_mount_def_sorceress_fire_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                },
            },
            wh2_main_def_sorceress_shadow = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_def_sorceress_shadow_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_main_anc_mount_def_sorceress_shadow_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_main_anc_mount_def_sorceress_shadow_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                },
            },
            wh2_main_def_dreadlord = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_def_dreadlord_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_main_anc_mount_def_dreadlord_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_main_anc_mount_def_dreadlord_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                    wh2_main_anc_mount_def_dreadlord_black_dragon = {
                        MountData = "BlackDragon",
                    },
                },
            },
            wh2_main_def_dreadlord_fem  = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_def_dreadlord_fem_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_main_anc_mount_def_dreadlord_fem_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_main_anc_mount_def_dreadlord_fem_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                    wh2_main_anc_mount_def_dreadlord_fem_black_dragon = {
                        MountData = "BlackDragon",
                    },
                },
            },
            wh2_dlc14_def_high_beastmaster = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc14_anc_mount_def_high_beastmaster_scourgerunner_chariot = {
                        MountData = "ScourgeRunnerChariot",
                        Skill = "wh2_dlc14_skill_def_high_beastmaster_mount_scourgerunner_chariot",
                    },
                    wh2_dlc14_anc_mount_def_high_beastmaster_manticore = {
                        MountData = "BeastMasterManticore",
                        Skill = "wh2_dlc14_skill_def_high_beastmaster_mount_manticore",
                    },
                },
            },
            wh2_dlc10_def_supreme_sorceress_beasts = {
                BonusCost = 150,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_beasts_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_beasts_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_beasts_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_beasts_manticore = {
                        MountData = "Manticore",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_beasts_black_dragon = {
                        MountData = "BlackDragon",
                    },
                },
            },
            wh2_dlc10_def_supreme_sorceress_dark = {
                BonusCost = 150,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_dark_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_dark_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_dark_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_dark_manticore = {
                        MountData = "Manticore",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_dark_black_dragon = {
                        MountData = "BlackDragon",
                    },
                },
            },
            wh2_dlc10_def_supreme_sorceress_death = {
                BonusCost = 150,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_death_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_death_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_death_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_death_manticore = {
                        MountData = "Manticore",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_fire_black_dragon = {
                        MountData = "BlackDragon",
                    },
                },
            },
            wh2_dlc10_def_supreme_sorceress_fire = {
                BonusCost = 150,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_fire_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_shadow_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_shadow_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_shadow_manticore = {
                        MountData = "Manticore",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_shadow_black_dragon = {
                        MountData = "BlackDragon",
                    },
                },
            },
            wh2_dlc10_def_supreme_sorceress_shadow = {
                BonusCost = 150,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_shadow_dark_steed = {
                        MountData = "DarkSteed",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_shadow_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_shadow_dark_pegasus = {
                        MountData = "DarkPegasus",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_shadow_manticore = {
                        MountData = "Manticore",
                    },
                    wh2_dlc10_anc_mount_def_supreme_sorceress_shadow_black_dragon = {
                        MountData = "BlackDragon",
                    },
                },
            },
        },
        Traits = {
            wh2_main_skill_innate_def_cruel = {

            },
            wh2_main_skill_innate_def_malevolent = {

            },
            wh2_main_skill_innate_def_spiteful = {

            },
            wh2_main_skill_innate_def_malicious = {

            },
            wh2_main_skill_innate_def_vicious = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_magnanimous",
        },

    };
end