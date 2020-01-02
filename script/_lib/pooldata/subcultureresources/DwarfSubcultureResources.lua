function GetDwarfSubcultureResources()
    return {
        DefaultLords = {"dwf_lord"},
        Rewards = {
            Rewards = {
                scripted = {
                    Pools = {
                        DwarfLords = {
                            AgentSubTypes = {
                                dwf_lord = {
                                    MinimumAmount = 0,
                                    MaximumAmount = 2,
                                    HumanPlayerOnly = true,
                                },
                            },
                            SubPoolInitialMinSize = 0,
                            SubPoolMaxSize = 2,
                        },
                        RuneLord = {
                            AgentSubTypes = {
                                dlc06_dwf_runelord = {
                                    MinimumAmount = 0,
                                    MaximumAmount = 1,
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