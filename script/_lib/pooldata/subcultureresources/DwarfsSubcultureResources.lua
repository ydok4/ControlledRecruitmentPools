function GetDwarfsSubcultureResources()
    return {
        DefaultLords = {"dwf_lord"},
        Rewards = {
            Rewards = {
                scripted = {
                    Pools = {
                        DwarfLords = {
                            AgentSubTypes = {
                                dwf_lord = {
                                    MaximumPercentage = 100,
                                    HumanPlayerOnly = true,
                                },
                            },
                            SubPoolInitialMinSize = 0,
                            SubPoolMaxSize = 2,
                        },
                        RuneLord = {
                            AgentSubTypes = {
                                dlc06_dwf_runelord = {
                                    MaximumPercentage = 100,
                                },
                            },
                            SubPoolInitialMinSize = 0,
                            SubPoolMaxSize = 1,
                        },
                    },
                    Events = {
                        Incident = "wh_main_crp_dwf_belegar_scripted",
                        Dilemma = nil,
                    },
                    IncreasePoolSize = 3,
                    Type = "increase",
                },
            },
            wh_main_sch_settlement_major = {
                Pools = {
                    "DwarfLords",
                },
                MinimumRequireBuildingLevel = 3,
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = false,
                Type = "set",
            },
            wh_main_DWARFS_engineer = {
                Pools = {
                    "MasterEngineers",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                UseLevelMultiplier = true,
                Type = "set",
            },
            wh_main_dwf_barracks_3 = {
                Pools = {
                    "Thanes",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh_main_dwf_smith_3 = {
                Pools = {
                    "RuneLord",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
            wh_main_DWARFS_smiths = {
                Pools = {
                    "Runesmiths",
                },
                Events = {
                },
                IncreasePoolSize = 1,
                Type = "set",
            },
        },
        Heroes = {
            "dwf_master_engineer",
            "dwf_runesmith",
            "dwf_thane",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
            AnvilOfDoom = {
                BonusCost = 850,
                Weighting = 12,
            },
        },
        AgentSubTypes = {
            dwf_lord = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc06_dwf_runelord = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                    wh_dlc06_anc_mount_dwf_runelord_anvil_of_doom = {
                        MountData = "AnvilOfDoom",
                    },
                },
            },
            dwf_master_engineer = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dwf_runesmith = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dwf_thane = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
        Traits = {
            wh2_main_skill_innate_dwf_ancestral_blood_grimnir = {

            },
            wh2_main_skill_innate_dwf_ancestral_blood_grungni = {

            },
            wh2_main_skill_innate_dwf_ancestral_blood_valaya = {

            },
            wh_main_skill_innate_dwf_axe_envy = {

            },
        },
    };
end