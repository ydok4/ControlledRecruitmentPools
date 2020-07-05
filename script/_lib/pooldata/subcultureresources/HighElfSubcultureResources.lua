function GetHighElfSubcultureResources()
    return {
        DefaultLords = {"wh2_main_hef_prince", "wh2_main_hef_princess"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "Princes",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_main_hef_court = {
                Pools = {
                    "NoblePool",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_main_hef_mages = {
                Pools = {
                    "MagesPool",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh2_main_hef_mages_2 = {
                Pools = {
                    "LoremasterOfHoethPool",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_main_hef_mages_3 = {
                Pools = {
                    "ArchMages",
                    "LoremasterOfHoethPool",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_main_special_tower_of_hoeth_1 = {
                Pools = {
                    "MagesPool",
                    "LoremasterOfHoethPool",
                    "ArchMages",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_main_special_tower_of_hoeth_2 = {
                Pools = {
                    "MagesPool",
                    "LoremasterOfHoethPool",
                    "ArchMages",
                },
                Events = {
                },
                IncreasePoolSize = 2,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_dlc10_hef_handmaidens = {
                Pools = {
                    "HandMaidens",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh2_dlc10_hef_handmaidens_alarielle = {
                Pools = {
                    "HandMaidens",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
        },
        Heroes = {
            "wh2_dlc10_hef_handmaiden",
            "wh2_dlc10_hef_mage_heavens",
            "wh2_dlc10_hef_mage_shadows",
            "wh2_main_hef_loremaster_of_hoeth",
            "wh2_main_hef_mage_high",
            "wh2_main_hef_mage_life",
            "wh2_main_hef_mage_light",
            "wh2_main_hef_noble",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            ElvenSteed = {
                BonusCost = 75,
                Weighting = 15,
            },
            IthilmarSteed = {
                BonusCost = 100,
                Weighting = 12,
            },
            IthilmarChariot = {
                BonusCost = 300,
                Weighting = 6,
            },
            GreatEagle = {
                BonusCost = 300,
                Weighting = 5,
            },
            Griffon = {
                BonusCost = 600,
                Weighting = 4,
            },
            SunDragon = {
                BonusCost = 1150,
                Weighting = 3,
            },
            MoonDragon = {
                BonusCost = 1500,
                Weighting = 2,
            },
            StarDragon = {
                BonusCost = 1900,
                Weighting = 1,
            },
        },
        AgentSubTypes = {
            wh2_dlc10_hef_handmaiden = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc10_anc_mount_hef_handmaiden_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_dlc10_anc_mount_hef_handmaiden_barded_ithilmar_steed = {
                        MountData = "IthilmarSteed",
                    },
                },
            },
            wh2_dlc10_hef_mage_heavens = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc10_anc_mount_hef_mage_heavens_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_dlc10_anc_mount_hef_mage_heavens_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                },
            },
            wh2_dlc10_hef_mage_shadows = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc10_anc_mount_hef_mage_shadows_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_dlc10_anc_mount_hef_mage_shadows_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                },
            },
            wh2_dlc15_hef_mage_beasts = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_mage_beasts_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_dlc15_anc_mount_hef_mage_beasts_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                },
            },
            wh2_dlc15_hef_mage_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_mage_death_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_dlc15_anc_mount_hef_mage_death_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                },
            },
            wh2_dlc15_hef_mage_fire = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_mage_fire_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_dlc15_anc_mount_hef_mage_fire_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    --[[wh2_dlc15_anc_mount_hef_mage_fire_sun_dragon = {
                        MountData = "SunDragon",
                    },--]]
                },
            },
            wh2_dlc15_hef_mage_metal = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_mage_metal_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_dlc15_anc_mount_hef_mage_metal_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                },
            },
            wh2_main_hef_loremaster_of_hoeth = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_main_hef_mage_high = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_hef_mage_high_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_main_anc_mount_hef_mage_high_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                },
            },
            wh2_main_hef_mage_light = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_hef_mage_light_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_main_anc_mount_hef_mage_light_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                },
            },
            wh2_main_hef_noble = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_hef_noble_barded_ithilmar_steed = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_main_anc_mount_hef_noble_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    wh2_main_anc_mount_hef_noble_eagle = {
                        MountData = "GreatEagle",
                    },
                },
            },
            wh2_main_hef_mage_life = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_hef_mage_life_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_main_anc_mount_hef_mage_life_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                },
            },
            wh2_main_hef_prince = {
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_hef_prince_barded_ithilmar_steed = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_main_anc_mount_hef_prince_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_prince_griffon = {
                        MountData = "Griffon",
                    },
                    wh2_main_anc_mount_hef_prince_sun_dragon = {
                        MountData = "SunDragon",
                    },
                    wh2_main_anc_mount_hef_prince_star_dragon = {
                        MountData = "StarDragon",
                    },
                },
            },
            wh2_main_hef_princess = {
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_hef_princess_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_main_anc_mount_hef_princess_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_princess_griffon = {
                        MountData = "Griffon",
                    },
                    wh2_main_anc_mount_hef_princess_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                    wh2_main_anc_mount_hef_princess_star_dragon = {
                        MountData = "StarDragon",
                    },
                },
            },
           --[[wh2_main_hef_prince_mid = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_hef_prince_barded_ithilmar_steed = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_main_anc_mount_hef_prince_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_main_anc_mount_hef_prince_sun_dragon = {
                        MountData = "SunDragon",
                    },
                    wh2_main_anc_mount_hef_prince_star_dragon = {
                        MountData = "StarDragon",
                    },
                },
            },
            wh2_main_hef_princess_mid = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_hef_princess_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_main_anc_mount_hef_princess_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_main_anc_mount_hef_princess_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                    wh2_main_anc_mount_hef_princess_star_dragon = {
                        MountData = "StarDragon",
                    },
                },
            },
            wh2_main_hef_prince_high = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_hef_prince_barded_ithilmar_steed = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_main_anc_mount_hef_prince_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_main_anc_mount_hef_prince_sun_dragon = {
                        MountData = "SunDragon",
                    },
                    wh2_main_anc_mount_hef_prince_star_dragon = {
                        MountData = "StarDragon",
                    },
                },
            },
            wh2_main_hef_princess_high = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_main_anc_mount_hef_princess_elven_steed = {
                        MountData = "ElvenSteed",
                    },
                    wh2_main_anc_mount_hef_princess_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_main_anc_mount_hef_princess_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                    wh2_main_anc_mount_hef_princess_star_dragon = {
                        MountData = "StarDragon",
                    },
                },
            },--]]
            wh2_dlc15_hef_archmage_beasts = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_beasts_barded_warhorse = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_beasts_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_beasts_ilthilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_beasts_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                },
            },
            wh2_dlc15_hef_archmage_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_death_barded_warhorse = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_death_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_death_ilthilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_death_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                },
            },
            wh2_dlc15_hef_archmage_fire = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_fire_barded_warhorse = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_fire_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_fire_ilthilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_fire_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                },
            },
            wh2_dlc15_hef_archmage_heavens = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_heavens_barded_warhorse = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_heavens_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_heavens_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_heavens_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                },
            },
            wh2_dlc15_hef_archmage_shadows = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_shadows_barded_warhorse = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_shadows_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_shadows_ilthilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_shadows_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                },
            },
            wh2_dlc15_hef_archmage_high = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_high_barded_warhorse = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_high_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_high_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_high_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                },
            },
            wh2_dlc15_hef_archmage_life = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_life_barded_warhorse = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_life_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_life_ilthilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_life_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                },
            },
            wh2_dlc15_hef_archmage_light = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_light_barded_warhorse = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_light_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_light_ithilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_light_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                },
            },
            wh2_dlc15_hef_archmage_metal = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_metal_barded_warhorse = {
                        MountData = "IthilmarSteed",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_metal_great_eagle = {
                        MountData = "GreatEagle",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_metal_ilthilmar_chariot = {
                        MountData = "IthilmarChariot",
                    },
                    wh2_dlc15_anc_mount_hef_archmage_metal_moon_dragon = {
                        MountData = "MoonDragon",
                    },
                },
            },
        },
    };
end