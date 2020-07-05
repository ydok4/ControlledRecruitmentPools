function GetTEBRecruitmentPools()
    return {
        -- Default
        wh_main_sc_teb_teb = {
            HeroPools = {
                Myrmidia = {
                    AgentSubTypes = {
                        teb_myrmidia_hero = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 3,
                },
                BorderRangers = {
                    AgentSubTypes = {
                        bor_ranger_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                Inquisitors = {
                    AgentSubTypes = {
                        est_inquisitor = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
                MerchantPrinces = {
                    AgentSubTypes = {
                        til_merchant = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 0,
                    SubPoolMaxSize = 0,
                },
            },
        },

        -- Major TEB factions
        wh_main_teb_border_princes = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                BorderRangers = {
                    AgentSubTypes = {
                        bor_ranger_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },

        wh_main_teb_estalia = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                Inquisitors = {
                    AgentSubTypes = {
                        est_inquisitor = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },

        wh_main_teb_tilea = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                MerchantPrinces = {
                    AgentSubTypes = {
                        til_merchant = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Minor TEB factions - Unlocker only

        -- Border Princes minor factions
        wh_main_teb_lichtenburg_confederacy = {
            FactionPools = {
                BorderRangers = {
                    AgentSubTypes = {
                        bor_ranger_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
        -- Tilean Minor Factions
        wh_main_teb_bilbali = {
            FactionPools = {
                MerchantPrinces = {
                    AgentSubTypes = {
                        til_merchant = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
        wh_main_teb_luccini = {
            FactionPools = {
                MerchantPrinces = {
                    AgentSubTypes = {
                        til_merchant = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordsToReplace = {
                teb_lord = {
                    replacementKey = "til_merchant",
                    traitKeyPool = {
                        "wh2_main_skill_innate_emp_imperious",
                        "wh2_main_skill_innate_emp_monster_hunter",
                        "wh2_main_skill_innate_emp_monster_tracker",
                        "wh2_main_skill_innate_emp_noble",
                        "wh2_main_skill_innate_emp_regal",
                    },
                },
            },
            LordPoolMaxSize = 4,
        },
        wh_main_teb_tobaro = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                MerchantPrinces = {
                    AgentSubTypes = {
                        til_merchant = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordsToReplace = {
                teb_lord = {
                    replacementKey = "til_merchant",
                    traitKeyPool = {
                        "wh2_main_skill_innate_emp_imperious",
                        "wh2_main_skill_innate_emp_monster_hunter",
                        "wh2_main_skill_innate_emp_monster_tracker",
                        "wh2_main_skill_innate_emp_noble",
                        "wh2_main_skill_innate_emp_regal",
                    },
                },
            },
            LordPoolMaxSize = 4,
        },

        -- New world colonies
        wh2_main_emp_new_world_colonies = {
            FactionPools = {
                TEBLords = {
                    AgentSubTypes = {
                        teb_lord = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 2,
                    SubPoolMaxSize = 4,
                },
                MerchantPrinces = {
                    AgentSubTypes = {
                        til_merchant = {
                            MaximumPercentage = 100,
                        },
                    },
                    SubPoolInitialMinSize = 1,
                    SubPoolMaxSize = 2,
                },
            },
            LordPoolMaxSize = 4,
        },
    };
end