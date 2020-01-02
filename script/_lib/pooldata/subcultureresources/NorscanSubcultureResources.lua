function GetNorscanSubcultureResources()
    return {
        DefaultLords = {"nor_marauder_chieftain"},
        Rewards = {

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
        },
        AgentSubTypes = {
            nor_marauder_chieftain = {
                HumanPlayerOnly = true,
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            nor_chaos_sorcerer_metal = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
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
                },
            },
            wh_dlc08_nor_shaman_sorcerer_fire = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
                    },
                },
            },
            wh_dlc08_nor_shaman_sorcerer_metal = {
                Mounts = {
                    unmounted = {
                        MountData = "Unmounted",
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