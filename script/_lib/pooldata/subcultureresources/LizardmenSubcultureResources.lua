function GetLizardmenSubcultureResources()
    return {
        DefaultLords = { "wh2_main_lzd_saurus_old_blood" },
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "SaurusOldBloods",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_main_lzd_saurus_3 = {
                Pools = {
                    "ScarVeteran",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_main_lzd_skinks = {
                Pools = {
                    "SkinkChiefs",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                MinimumRequireBuildingLevel = 1,
                Type = "set",
            },
            wh2_main_lzd_worship_oldones = {
                Pools = {
                    "SkinkPriests",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            -- Diplomacy rewards
            alliance_wh2_dlc13_lzd_spirits_of_the_jungle = {
                Pools = {
                    "KroxigorAncients",
                },
                Events = {
                    Incident = "wh_main_lzd_kroxigor_ancient",
                    Dilemma = nil,
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
            alliance_wh2_dlc12_lzd_cult_of_sotek = {
                Pools = {
                    "RedCrestedSkinkChiefs",
                },
                Events = {
                    Incident = "wh_main_lzd_red_crested_skink",
                    Dilemma = nil,
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
            -- Nakai specific horde functionality and rituals
            wh2_dlc13_horde_lizardmen_ziggurat_4 = {
                Pools = {
                    "SaurusOldBloods",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            --[[wh2_dlc13_horde_lizardmen_saurus_3 = {
                Pools = {
                    "ScarVeteran",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "increase",
            },
            wh2_dlc13_horde_lizardmen_skink_chief_1 = {
                Pools = {
                    "SkinkChiefs",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                MinimumRequireBuildingLevel = 1,
                Type = "increase",
            },
            wh2_dlc13_horde_lizardmen_skink_priest_1 = {
                Pools = {
                    "SkinkPriests",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "increase",
            },--]]
            wh2_dlc13_horde_lizardmen_support_faction_1 = {
                Pools = {
                    "SkinkChiefs", "SkinkPriests", "ScarVeteran",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "increase",
            },
            -- Nakai rituals
            wh2_dlc13_ritual_temple_quetzl_3_saurus_scar_veteran = {
                CreateNewAgent = true,
                Pools = {
                    "ScarVeteran",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
            wh2_dlc13_ritual_temple_itzl_1_skink_chief = {
                CreateNewAgent = true,
                Pools = {
                    "SkinkChiefs",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
            wh2_dlc13_ritual_temple_xholankha_1_skink_priest = {
                CreateNewAgent = true,
                Pools = {
                    "SkinkPriests",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "increase",
            },
        },
        Heroes = {
            "wh2_dlc12_lzd_tlaqua_skink_chief",
            "wh2_dlc12_lzd_tlaqua_skink_priest_beasts",
            "wh2_dlc12_lzd_tlaqua_skink_priest_heavens",
            "wh2_main_lzd_saurus_scar_veteran",
            "wh2_main_lzd_skink_chief",
            "wh2_main_lzd_skink_priest_beasts",
            "wh2_main_lzd_skink_priest_heavens",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            ColdOne = {
                BonusCost = 150,
                Weighting = 12,
            },
            Carnosaur = {
                BonusCost = 1100,
                Weighting = 2,
            },
            Terradon = {
                BonusCost = 175,
                Weighting = 6,
            },
            TerradonTlaqua = {
                BonusCost = 0,
                Weighting = 100,
            },
            Stegadon = {
                BonusCost = 1075,
                Weighting = 2,
            },
            AncientStegadon = {
                BonusCost = 1150,
                Weighting = 2,
            },
            HornedOne = {
                BonusCost = 200,
                Weighting = 12,
            },
            Ripperdactyl = {
                BonusCost = 200,
                Weighting = 5,
            },
            EngineOfTheGods = {
                BonusCost = 1400,
                Weighting = 1,
            },
        },
        AgentSubTypes = {
            wh2_main_lzd_saurus_old_blood = {
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_lzd_saurus_old_blood_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_main_anc_mount_lzd_saurus_old_blood_carnosaur = {
                        MountData = "Carnosaur",
                    },
                },
            },
            wh2_main_lzd_skink_priest_heavens = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_lzd_skink_priest_heavens_terradon = {
                        MountData = "Terradon",
                    },
                    wh2_main_anc_mount_lzd_skink_priest_heavens_stegadon = {
                        MountData = "Stegadon",
                    },
                    wh2_main_anc_mount_lzd_skink_priest_heavens_ancient_stegadon = {
                        MountData = "AncientStegadon",
                    },
                    wh2_dlc12_anc_mount_lzd_skink_priest_heavens_ancient_stegadon_engine_gods = {
                        MountData = "EngineOfTheGods",
                    },
                },
            },
            wh2_dlc12_lzd_tlaqua_skink_priest_heavens = {
                Mounts = {
                    wh2_main_anc_mount_lzd_skink_priest_heavens_terradon = {
                        MountData = "TerradonTlaqua",
                    },
                },
            },
            wh2_main_lzd_skink_priest_beasts = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_lzd_skink_priest_beasts_terradon = {
                        MountData = "Terradon",
                    },
                    wh2_main_anc_mount_lzd_skink_chief_stegadon = {
                        MountData = "Stegadon",
                    },
                    wh2_main_anc_mount_lzd_skink_priest_beasts_ancient_stegadon = {
                        MountData = "AncientStegadon",
                    },
                    wh2_dlc12_anc_mount_lzd_skink_priest_beasts_ancient_stegadon_engine_gods = {
                        MountData = "EngineOfTheGods",
                    },
                },
            },
            wh2_dlc12_lzd_tlaqua_skink_priest_beasts = {
                Mounts = {
                    wh2_main_anc_mount_lzd_skink_priest_beasts_terradon = {
                        MountData = "TerradonTlaqua",
                    },
                },
            },
            wh2_main_lzd_skink_chief = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_lzd_skink_chief_terradon = {
                        MountData = "Terradon",
                    },
                    wh2_main_anc_mount_lzd_skink_chief_stegadon = {
                        MountData = "Stegadon",
                    },
                    wh2_main_anc_mount_lzd_skink_chief_ancient_stegadon = {
                        MountData = "AncientStegadon",
                    },
                },
            },
            wh2_dlc12_lzd_tlaqua_skink_chief = {
                Mounts = {
                    wh2_main_anc_mount_lzd_skink_chief_terradon = {
                        MountData = "TerradonTlaqua",
                    },
                },
            },
            wh2_main_lzd_saurus_scar_veteran = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_lzd_saurus_scar_veteran_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_main_anc_mount_lzd_saurus_scar_veteran_carnosaur = {
                        MountData = "Carnosaur",
                    },
                },
            },
            wh2_dlc12_lzd_red_crested_skink_chief = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc12_anc_mount_lzd_red_crested_skink_chief_horned_one = {
                        MountData = "HornedOne",
                    },
                    wh2_dlc12_anc_mount_lzd_red_crested_skink_chief_ripperdactyl = {
                        MountData = "Ripperdactyl",
                    },
                    wh2_dlc12_anc_mount_lzd_red_crested_skink_chief_ancient_stegadon = {
                        MountData = "AncientStegadon",
                    },
                },
            },
            wh2_dlc13_lzd_kroxigor_ancient = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc13_lzd_slann_mage_priest_fire = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc13_lzd_slann_mage_priest_high = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc13_lzd_slann_mage_priest_life = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_lzd_slann_mage_priest = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc13_lzd_saurus_old_blood_horde = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_lzd_saurus_old_blood_cold_one = {
                        MountData = "ColdOne",
                    },
                    wh2_main_anc_mount_lzd_saurus_old_blood_carnosaur = {
                        MountData = "Carnosaur",
                    },
                },
            },
            wh2_dlc13_lzd_kroxigor_ancient_horde = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_dlc13_lzd_red_crested_skink_chief_horde = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc12_anc_mount_lzd_red_crested_skink_chief_horned_one = {
                        MountData = "HornedOne",
                    },
                    wh2_dlc12_anc_mount_lzd_red_crested_skink_chief_ripperdactyl = {
                        MountData = "Ripperdactyl",
                    },
                    wh2_dlc12_anc_mount_lzd_red_crested_skink_chief_ancient_stegadon = {
                        MountData = "AncientStegadon",
                    },
                },
            },
        },
        Traits = {
            wh2_main_skill_innate_lzd_arrogant = {

            },
            wh2_main_skill_innate_lzd_humble = {

            },
            wh2_main_skill_innate_lzd_pompous = {

            },
            wh2_main_skill_innate_lzd_uncompromising = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_charismatic",
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_handsome",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
            "wh_main_skill_innate_all_humble",
            "wh_main_skill_innate_all_uncompromising",
            "wh_main_skill_innate_all_arrogant",
        },
    };
end