function GetChaosSubcultureResources()
    return {
        DefaultLords = {"chs_lord"},
        Rewards = {

        },
        Heroes = {
            "chs_chaos_sorcerer_death",
            "chs_chaos_sorcerer_fire",
            "chs_chaos_sorcerer_metal",
            "chs_exalted_hero",
            "dlc07_chs_chaos_sorcerer_shadow",
        },
        MountData = {
            Unmounted = {
                BonusCost = 0,
                Weighting = 6,
            },
        },
        AgentSubTypes = {
            chs_lord = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            chs_sorcerer_lord_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            chs_sorcerer_lord_fire = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            chs_sorcerer_lord_metal = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc07_chs_sorcerer_lord_shadow = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            chs_chaos_sorcerer_death = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            chs_chaos_sorcerer_fire = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            chs_chaos_sorcerer_metal = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            chs_exalted_hero = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            dlc07_chs_chaos_sorcerer_shadow = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
        },
        Traits = {
            wh2_main_skill_innate_chs_diabolic_spendour = {

            },
            wh2_main_skill_innate_chs_dominance = {

            },
        },
        ExcludedTraits = {
            "wh_main_skill_innate_all_boring",
            "wh_main_skill_innate_all_magnanimous",
            "wh_main_skill_innate_all_melancholic",
        },
    };
end