function GetBretonniaSubcultureResources()
    return {
        DefaultLords = {"brt_lord"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "BretLordPool",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh_main_BRETONNIA_worship = {
                Pools = {
                    "DamselPool",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_brt_worship_3 = {
                Pools = {
                    "ProphetessPool",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh_main_BRETONNIA_stables = {
                Pools = {
                    "PaladinPool",
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
            "brt_damsel",
            "brt_damsel_beasts",
            "brt_damsel_life",
            "brt_paladin",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 3,
            },
            WarHorse = {
                BonusCost = 0,
                Weighting = 15,
            },
            BardedWarHorse = {
                BonusCost = 0,
                Weighting = 15,
            },
            RoyalPegasus ={
                BonusCost = 250,
                Weighting = 6,
            },
            Unicorn = {
                BonusCost = 300,
                Weighting = 5,
            },
            Hippogryph = {
                BonusCost = 1000,
                Weighting = 2,
            },
        },
        AgentSubTypes = {
            brt_damsel = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_brt_damsel_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_brt_damsel_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_dlc07_anc_mount_brt_damsel_heavens_unicorn = {
                        MountData = "Unicorn",
                    },
                },
            },
            brt_damsel_beasts = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_brt_damsel_beasts_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_brt_damsel_beasts_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_dlc07_anc_mount_brt_damsel_beasts_unicorn = {
                        MountData = "Unicorn",
                    },
                },
            },
            brt_damsel_life = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_brt_damsel_life_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_brt_damsel_life_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_dlc07_anc_mount_brt_damsel_life_unicorn = {
                        MountData = "Unicorn",
                    },
                },
            },
            brt_paladin = {
                Mounts = {
                    wh_main_anc_mount_brt_paladin_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_main_anc_mount_brt_paladin_pegasus = {
                        MountData = "RoyalPegasus",
                    },
                },
            },
            brt_lord = {
                HumanPlayerOnly = true,
                Mounts = {
                    wh_main_anc_mount_brt_general_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_main_anc_mount_brt_general_royal_pegasus = {
                        MountData = "RoyalPegasus",
                    },
                    wh_main_anc_mount_brt_general_hippogryph = {
                        MountData = "Hippogryph",
                    },
                },
            },
            dlc07_brt_prophetess_beasts = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc07_anc_mount_brt_prophetess_beasts_brettonian_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_dlc07_anc_mount_brt_prophetess_beasts_brettonian_warhorse_barded = {
                        MountData = "BardedWarHorse",
                    },
                    wh_dlc07_anc_mount_brt_prophetess_beasts_royal_pegasus = {
                        MountData = "RoyalPegasus",
                    },
                },
            },
            dlc07_brt_prophetess_heavens = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc07_anc_mount_brt_prophetess_brettonian_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_dlc07_anc_mount_brt_prophetess_brettonian_warhorse_barded = {
                        MountData = "BardedWarHorse",
                    },
                    wh_dlc07_anc_mount_brt_prophetess_royal_pegasus = {
                        MountData = "RoyalPegasus",
                    },
                },
            },
            dlc07_brt_prophetess_life = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc07_anc_mount_brt_prophetess_life_brettonian_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_dlc07_anc_mount_brt_prophetess_life_brettonian_warhorse_barded = {
                        MountData = "BardedWarHorse",
                    },
                    wh_dlc07_anc_mount_brt_prophetess_life_royal_pegasus = {
                        MountData = "Unicorn",
                    },
                },
            },
        },
        Traits = {
            wh_dlc07_brt_skill_innate_all_honourable = {

            },
            wh_dlc07_brt_skill_innate_all_intelligent = {

            },
            wh_dlc07_brt_skill_innate_all_magnanimous = {

            },
            wh_dlc07_brt_skill_innate_all_melancholic = {

            },
            wh_dlc07_brt_skill_innate_all_phlegmatic = {

            },
            wh_dlc07_brt_skill_innate_all_sanguine = {

            },
            wh_dlc07_brt_skill_innate_all_uncompromising = {

            },
            wh_main_skill_innate_brt_virtue_audacity = {

            },
            wh_main_skill_innate_brt_virtue_confidence = {

            },
            wh_main_skill_innate_brt_virtue_discipline = {

            },
            wh_main_skill_innate_brt_virtue_duty = {

            },
            wh_main_skill_innate_brt_virtue_heroism = {

            },
            wh_main_skill_innate_brt_virtue_ideal = {

            },
            wh_main_skill_innate_brt_virtue_impetuous_knight = {

            },
            wh_main_skill_innate_brt_virtue_joust = {

            },
            wh_main_skill_innate_brt_virtue_knightly_temper = {

            },
            wh_main_skill_innate_brt_virtue_noble_disdain = {

            },
            wh_main_skill_innate_brt_virtue_penitent = {

            },
            wh_main_skill_innate_brt_virtue_stoicism = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_honourable",
            "wh_main_skill_innate_all_intelligent",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
            "wh_main_skill_innate_all_phlegmatic",
            "wh_main_skill_innate_all_sanguine",
            "wh_main_skill_innate_all_uncompromising",
        },
    };
end