function GetCataphTEBSubcultureResources()
    return {
        DefaultLords = {"teb_lord"},
        Rewards = {
            alliance_wh_main_teb_border_princes = {
                Pools = {
                    TEBLords = {
                        AgentSubTypes = {
                            teb_lord = {
                                MaximumPercentage = 60,
                            },
                            bor_ranger_lord = {
                                MaximumPercentage = 40,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                Events = {
                    Incident = "wh_main_crp_bor_ranger",
                    Dilemma = nil,
                },
                Type = "increase",
            },
            alliance_wh_main_teb_tilea = {
                Pools = {
                    TEBLords = {
                        AgentSubTypes = {
                            teb_lord = {
                                MaximumPercentage = 60,
                            },
                            til_merchant = {
                                MaximumPercentage = 40,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                Events = {
                    Incident = "wh_main_crp_til_merchant",
                    Dilemma = nil,
                },
                Type = "increase",
            },
            alliance_wh_main_teb_estalia = {
                Pools = {
                    TEBLords = {
                        AgentSubTypes = {
                            teb_lord = {
                                MaximumPercentage = 60,
                            },
                            est_inquisitor = {
                                MaximumPercentage = 40,
                            },
                        },
                        SubPoolInitialMinSize = 0,
                        SubPoolMaxSize = 1,
                    },
                },
                Events = {
                    Incident = "wh_main_crp_est_inquisitor",
                    Dilemma = nil,
                },
                Type = "increase",
            },
        },
        Heroes = {
            "teb_myrmidia_hero",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            ImperialPegasus = {
                BonusCost = 250,
                Weighting = 6,
            },
            ImperialGriffon = {
                BonusCost = 850,
                Weighting = 1,
            },
            Hippogryph = {
                BonusCost = 1000,
                Weighting = 2,
            },
        },
        AgentSubTypes = {
            teb_lord = {
                HumanPlayerOnly = true,
                Mounts = {
                    wh_main_anc_mount_teb_general_imperial_griffon = {
                        MountData = "ImperialGriffon",
                    },
                },
            },
            teb_bright_wizard = {
                Mounts = {
                    wh_main_anc_mount_teb_bright_wizard_barded_warhorse = {
                        MountData = "BardedWarHorse",
                    },
                    wh_main_anc_mount_teb_bright_wizard_imperial_pegasus = {
                        MountData = "ImperialPegasus",
                    },
                },
            },
            bor_ranger_lord = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    mount_bor_ranger_lord_warhorse = {
                        MountData = "WarHorse",
                    },
                    --[[mount_bor_ranger_lord_warhorse2 = {
                        MountData = "BardedWarHorse",
                    },--]]
                },
            },
            til_merchant = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    mount_til_merchant_warhorse = {
                        MountData = "WarHorse",
                    },
                    --[[mount_til_merchant_bwarhorse = {
                        MountData = "BardedWarHorse",
                    },--]]
                },
            },
            est_inquisitor = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    mount_est_inquisitor_warhorse = {
                        MountData = "WarHorse",
                    },
                    --[[mount_est_inquisitor_bwarhorse = {
                        MountData = "BardedWarHorse",
                    },--]]
                    mount_est_inquisitor_beaky = {
                        MountData = "Hippogryph",
                    },
                },
            },
            teb_myrmidia_hero = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    mount_teb_myrmidia_hero_warhorse = {
                        MountData = "WarHorse",
                    },
                    mount_teb_myrmidia_hero_barded_warhorse = {
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
        },
    };
end