function GetNorscanSubcultureResources()
    return {
        DefaultLords = {"nor_marauder_chieftain"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "NorscaChieftains",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh_main_NORSCA_beasts = {
                Pools = {
                    "Werekin",
                },
                MinimumRequireBuildingLevel = 1,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_NORSCA_creatures = {
                Pools = {
                    "Balefiends",
                },
                MinimumRequireBuildingLevel = 1,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_NORSCA_worship = {
                Pools = {
                    "ShamanSorcerers",
                },
                MinimumRequireBuildingLevel = 1,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
        },
        Heroes = {
            --"nor_chaos_sorcerer_metal",
            "wh_dlc08_nor_fimir_balefiend_fire",
            "wh_dlc08_nor_fimir_balefiend_shadow",
            "wh_dlc08_nor_shaman_sorcerer_death",
            "wh_dlc08_nor_shaman_sorcerer_fire",
            "wh_dlc08_nor_shaman_sorcerer_metal",
            "wh_dlc08_nor_skin_wolf_werekin",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            Warhorse = {
                BonusCost = 100,
                Weighting = 12,
            },
            Chariot = {
                BonusCost = 400,
                Weighting = 6,
            },
            WarMammoth = {
                BonusCost = 1200,
                Weighting = 1,
            },
        },
        AgentSubTypes = {
            nor_marauder_chieftain = {
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc08_anc_mount_nor_chieftain_norscan_warhorse = {
                        MountData = "Warhorse",
                    },
                    wh_dlc08_anc_mount_nor_chieftain_marauder_chariot = {
                        MountData = "Chariot",
                    },
                    wh_dlc08_anc_mount_nor_chieftain_war_mammoth = {
                        MountData = "WarMammoth",
                    },
                },
            },
            --[[nor_chaos_sorcerer_metal = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },--]]
            wh_dlc08_nor_fimir_balefiend_shadow = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh_dlc08_nor_shaman_sorcerer_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc08_anc_mount_nor_shaman_sorcerer_death_norscan_warhorse = {
                        MountData = "Warhorse",
                    },
                    wh_dlc08_anc_mount_nor_shaman_sorcerer_death_marauder_chariot = {
                        MountData = "Chariot",
                    },
                },
            },
            wh_dlc08_nor_shaman_sorcerer_fire = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc08_anc_mount_nor_shaman_sorcerer_fire_norscan_warhorse = {
                        MountData = "Warhorse",
                    },
                    wh_dlc08_anc_mount_nor_shaman_sorcerer_fire_marauder_chariot = {
                        MountData = "Chariot",
                    },
                },
            },
            wh_dlc08_nor_shaman_sorcerer_metal = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc08_anc_mount_nor_shaman_sorcerer_metal_norscan_warhorse = {
                        MountData = "Warhorse",
                    },
                    wh_dlc08_anc_mount_nor_shaman_sorcerer_metal_marauder_chariot = {
                        MountData = "Chariot",
                    },
                },
            },
            wh_dlc08_nor_skin_wolf_werekin = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
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