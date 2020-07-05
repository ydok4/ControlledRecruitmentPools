function GetEmpireSubcultureResources()
    return {
        DefaultLords = {"emp_lord"},
        Rewards = {
            wh_main_sch_settlement_major = {
                Pools = {
                    "EmpireGenerals",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh_main_emp_worship_3 = {
                Pools = {
                    "ArchLectors",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh_main_EMPIRE_worship = {
                Pools = {
                    "WarriorPriests",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_emp_barracks_3 = {
                Pools = {
                    "Captains",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh_main_EMPIRE_wizards = {
                Pools = {
                    "Wizards",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_special_college_of_magic = {
                Pools = {
                    "Wizards",
                },
                Events = {
                },
                IncreasePoolSize = 3,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh_main_emp_tavern_3 = {
                Pools = {
                    "WitchHunters",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
        },
        Heroes = {
            "dlc03_emp_amber_wizard",
            "dlc05_emp_grey_wizard",
            "dlc05_emp_jade_wizard",
            "emp_bright_wizard",
            "emp_captain",
            "emp_celestial_wizard",
            "emp_light_wizard",
            "emp_warrior_priest",
            "emp_witch_hunter",
            "wh2_pro07_emp_amethyst_wizard",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            WarHorse = {
                BonusCost = 75,
                Weighting = 15,
            },
            BardedWarHorse = {
                BonusCost = 100,
                Weighting = 12,
            },
            ImperialPegasus = {
                BonusCost = 250,
                Weighting = 6,
            },
            ImperialGriffon = {
                BonusCost = 850,
                Weighting = 2,
            },
        },
        AgentSubTypes = {
            emp_lord = {
                BonusCost = 50,
                IsDefaultLord = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_emp_general_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_emp_general_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_main_anc_mount_emp_general_imperial_pegasus = {
                        MountData = "ImperialPegasus",
                    },
                    wh_main_anc_mount_emp_general_imperial_griffon = {
                        MountData = "ImperialGriffon",
                    },
                },
            },
            wh2_dlc13_emp_cha_huntsmarshal_0 = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc04_emp_arch_lector = {
                BonusCost = 250,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc04_anc_mount_emp_arch_lector_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_dlc04_anc_mount_emp_arch_lector_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                },
            },
            dlc03_emp_amber_wizard = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc03_anc_mount_emp_amber_wizard_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_dlc03_anc_mount_emp_amber_wizard_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_dlc03_anc_mount_emp_amber_wizard_imperial_pegasus = {
                        MountData = "ImperialPegasus",
                    },
                    wh_dlc03_anc_mount_emp_amber_wizard_imperial_griffon = {
                        MountData = "ImperialGriffon",
                    },
                },
            },
            dlc05_emp_grey_wizard = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc05_anc_mount_emp_grey_wizard_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_dlc05_anc_mount_emp_grey_wizard_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_dlc05_anc_mount_emp_grey_wizard_imperial_pegasus = {
                        MountData = "ImperialPegasus",
                    },
                },
            },
            dlc05_emp_jade_wizard = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc05_anc_mount_emp_jade_wizard_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_dlc05_anc_mount_emp_jade_wizard_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_dlc05_anc_mount_emp_jade_wizard_imperial_pegasus = {
                        MountData = "ImperialPegasus",
                    },
                },
            },
            emp_bright_wizard = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_emp_bright_wizard_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_emp_bright_wizard_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_main_anc_mount_emp_bright_wizard_imperial_pegasus = {
                        MountData = "ImperialPegasus",
                    },
                },
            },
            emp_captain = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_emp_captain_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_emp_captain_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_main_anc_mount_emp_captain_imperial_pegasus = {
                        MountData = "ImperialPegasus",
                    },
                },
            },
            emp_celestial_wizard = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_emp_celestial_wizard_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_emp_celestial_wizard_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_main_anc_mount_emp_celestial_wizard_imperial_pegasus = {
                        MountData = "ImperialPegasus",
                    },
                },
            },
            emp_light_wizard = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_emp_light_wizard_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_emp_light_wizard_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_main_anc_mount_emp_light_wizard_imperial_pegasus = {
                        MountData = "ImperialPegasus",
                    },
                },
            },
            emp_warrior_priest = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_main_anc_mount_emp_warrior_priest_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh_main_anc_mount_emp_warrior_priest_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                },
            },
            emp_witch_hunter = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh2_pro07_emp_amethyst_wizard = {
                BonusCost = 75,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh2_pro07_anc_mount_emp_amethyst_wizard_warhorse = {
                        MountData = "WarHorse",
                    },
                    wh2_pro07_anc_mount_emp_amethyst_wizard_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh2_pro07_anc_mount_emp_amethyst_wizard_imperial_pegasus = {
                        MountData = "ImperialPegasus",
                    },
                },
            },
        },
        Traits = {
            wh2_main_skill_innate_emp_imperious = {

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
    };
end