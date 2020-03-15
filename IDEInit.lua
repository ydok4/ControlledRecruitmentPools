_G.IsIDE = true;

-- Mock Data
testCharacter = {
    cqi = function() return 123 end,
    get_forename = function() return "Direfan"; end,
    get_surname = function() return "Cylostra"; end,
    character_subtype_key = function() return "wh_main_emp_master_engineer"; end,
    command_queue_index = function() end,
    has_military_force = function() return true end,
    military_force = function() return {
        is_armed_citizenry = function () return false; end,
        unit_list = function() return {
            num_items = function() return 2; end,
            item_at = function(self, index)
                return test_unit;
            end,
        }
        end,
    }
    end,
    faction = function() return humanFaction; end,
    region = function() return get_cm():get_region(); end,
    logical_position_x = function() return 100; end,
    logical_position_y = function() return 110; end,
    command_queue_index = function() return 10; end,
    character_type = function() return false; end,
    is_null_interface = function() return false; end,
    is_wounded = function() return false; end,
    has_region = function() return true; end,
}

humanFaction = {
    command_queue_index = function() return 10; end,
    name = function()
        return "wh_main_emp_wissenland";
    end,
    culture = function()
        return "wh_main_emp_empire";
    end,
    subculture = function()
        return "wh_main_sc_emp_empire";
    end,
    is_dead = function()
        return false;
    end,
    character_list = function()
        return {
            num_items = function()
                return 1;
            end,
            item_at = function(self, index)
                return testCharacter;
            end,
        };
    end,
    region_list = function()
        return {
            num_items = function()
                return 1;
            end,
            item_at = function(self, index)
                return cm:get_region(index);
            end,
        };
    end,
    home_region = function ()
        return {
            name = function()
                return "";
            end,
            is_null_interface = function()
                return false;
            end,
        }
    end,
    faction_leader = function() return testCharacter; end,
    is_quest_battle_faction = function() return false; end,
    is_null_interface = function() return false; end,
    is_human = function() return true; end,
    has_effect_bundle = function() return true; end,
    is_horde = function() return false; end,
    has_home_region = function() return false; end,
    can_be_horde = function() return false; end,
    factions_of_same_culture = function() return {
            num_items = function()
                return 1;
            end,
            item_at = function()
                return testFaction;
            end,
        };
    end,
    at_war_with = function() return false; end,
    factions_non_aggression_pact_with = function() return {
            num_items = function()
                return 1;
            end,
            item_at = function()
                return testFaction;
            end,
        };
    end,
    factions_trading_with = function() return {
            num_items = function()
                return 1;
            end,
            item_at = function()
                return testFaction;
            end,
        }
    end,
    diplomatic_standing_with = function() return 10; end,
    diplomatic_attitude_towards = function() return 15; end,
    military_allies_with = function() return true; end,
    defensive_allies_with = function() return true; end,
    get_climate_suitability = function() return "suitability_good"; end,
    is_allowed_to_capture_territory = function() return true; end,
    treasury = function() return 2000; end,
}

testFaction = {
    command_queue_index = function() return 123; end,
    name = function()
        return "wh_dlc05_wef_wood_elves";
    end,
    culture = function()
        return "wh_dlc05_wef_wood_elves";
    end,
    subculture = function()
        return "wh_dlc05_sc_wef_wood_elves";
    end,
    is_dead = function()
        return false;
    end,
    character_list = function()
        return {
            num_items = function()
                return 1;
            end,
            item_at = function()
                return testCharacter;
            end
        };
    end,
    region_list = function()
        return {
            num_items = function()
                return 0;
            end
        };
    end,
    home_region = function ()
        return {
            name = function()
                return "";
            end,
            is_null_interface = function()
                return false;
            end,
        }
    end,
    faction_leader = function() return testCharacter; end,
    is_quest_battle_faction = function() return false; end,
    is_null_interface = function() return false; end,
    is_human = function() return false; end,
    has_effect_bundle = function() return true; end,
    is_horde = function() return false; end,
    has_home_region = function() return false; end,
    can_be_horde = function() return false; end,
    factions_of_same_culture = function() return {
            num_items = function()
                return 1;
            end,
            item_at = function()
                return testFaction;
            end,
        };
    end,
    at_war_with = function() return false; end,
    factions_non_aggression_pact_with = function() return {
            num_items = function()
                return 1;
            end,
            item_at = function()
                return testFaction;
            end,
        };
    end,
    factions_trading_with = function() return {
            num_items = function()
                return 1;
            end,
            item_at = function()
                return testFaction;
            end,
        }
    end,
    diplomatic_standing_with = function() return 10; end,
    diplomatic_attitude_towards = function() return 15; end,
    military_allies_with = function() return true; end,
    defensive_allies_with = function() return true; end,
    get_climate_suitability = function() return "suitability_good"; end,
    is_allowed_to_capture_territory = function() return true; end,
    treasury = function() return 2000; end,
}

testFaction2 = {
    command_queue_index = function() return 123; end,
    name = function()
        return "wh2_dlc13_lzd_spirits_of_the_jungle";
    end,
    culture = function()
        return "wh2_main_lzd_lizardmen";
    end,
    subculture = function()
        return "wh2_main_sc_lzd_lizardmen";
    end,
    is_dead = function()
        return false;
    end,
    character_list = function()
        return {
            num_items = function()
                return 0;
            end
        };
    end,
    region_list = function()
        return {
            num_items = function()
                return 0;
            end
        };
    end,
    home_region = function ()
        return {
            name = function()
                return "";
            end,
            is_null_interface = function()
                return false;
            end,
        }
    end,
    faction_leader = function() return testCharacter; end,
    is_quest_battle_faction = function() return false; end,
    is_null_interface = function() return false; end,
    is_human = function() return false; end,
    has_effect_bundle = function() return true; end,
    is_horde = function() return false; end,
    has_home_region = function() return false; end,
    can_be_horde = function() return false; end,
    factions_of_same_culture = function() return {
            num_items = function()
                return 1;
            end,
            item_at = function()
                return testFaction;
            end,
        };
    end,
    at_war_with = function() return false; end,
    factions_non_aggression_pact_with = function() return {
            num_items = function()
                return 1;
            end,
            item_at = function()
                return testFaction;
            end,
        };
    end,
    factions_trading_with = function() return {
            num_items = function()
                return 1;
            end,
            item_at = function()
                return testFaction;
            end,
        }
    end,
    diplomatic_standing_with = function() return 10; end,
    diplomatic_attitude_towards = function() return 15; end,
    military_allies_with = function() return true; end,
    defensive_allies_with = function() return true; end,
    get_climate_suitability = function() return "suitability_good"; end,
    is_allowed_to_capture_territory = function() return true; end,
    treasury = function() return 2000; end,
}

test_unit = {
    unit_key = function() return "wh2_dlc09_tmb_inf_nehekhara_warriors_0"; end,
    force_commander = function() return testCharacter; end,
    faction = function() return testFaction; end,
    percentage_proportion_of_full_strength = function() return 80; end,
}

effect = {
    get_localised_string = function(keyName)
        return keyName;
    end,
}

-- This can be modified in the testing driver
-- so we can simulate turns changing easily
local turn_number = 2;

-- Mock functions
mock_listeners = {
    listeners = {},
    trigger_listener = function(self, mockListenerObject)
        local listener = self.listeners[mockListenerObject.Key];
        if listener and (listener.Condition == true or listener.Condition(mockListenerObject.Context)) then
            listener.Callback(mockListenerObject.Context);
        end
    end,
}

-- Mock save structures
mockSaveData = {

}

-- slot (building) data
slot_1 = {
    has_building = function() return true; end,
    building = function() return {
        is_null_interface = function() return false; end,
        name = function() return "wh2_main_def_sorcery_1"; end,
        chain = function() return "wh_dlc05_wef_tree_spirits"; end,
        superchain = function() return "wh_main_sch_settlement_major"; end,
        building_level = function() return 4; end,
    }
    end,
}

slot_2 = {
    has_building = function() return true; end,
    building = function() return {
        is_null_interface = function() return false; end,
        name = function() return "wh2_main_def_murder_1"; end,
        chain = function() return "wh_dlc05_wef_tree_spirits"; end,
        superchain = function() return "wh_main_sch_settlement_major"; end,
        building_level = function() return 4; end,
    }
    end,
}

function get_cm()
    return   {
        is_new_game = function() return true; end,
        create_agent = function()
            return;
        end,
        get_human_factions = function()
            return {humanFaction};
        end,
        disable_event_feed_events = function() end,
        turn_number = function() return turn_number; end,
        model = function ()
            return {
                military_force_for_command_queue_index = function() return testMilitaryForce; end,
                turn_number = function() return turn_number; end,
                world = function()
                    return {
                        faction_by_key = function ()
                            return humanFaction;
                        end,
                        whose_turn_is_it = function()
                            return testFaction;
                        end,
                        faction_list = function ()
                            return {
                                item_at = function(self, i)
                                    if i == 0 then
                                        return testFaction;
                                    elseif i == 1 then
                                        return humanFaction;
                                    elseif i == 2 then
                                        return testFaction2;
                                    elseif i == 3 then
                                        return testFaction2
                                    else
                                        return nil;
                                    end
                                end,
                                num_items = function()
                                    return 3;
                                end,
                            }
                        end
                    }
                end
            }
        end,
        first_tick_callbacks = {},
        add_saving_game_callback = function() end,
        add_loading_game_callback = function() end,
        spawn_character_to_pool = function() end,
        callback = function(self, callbackFunction, delay) callbackFunction() end,
        transfer_region_to_faction = function() end,
        get_faction = function() return humanFaction; end,
        lift_all_shroud = function() end,
        kill_all_armies_for_faction = function() end,
        get_region = function()
            return {
                cqi = function() return 123; end,
                province_name = function() return "wh2_main_vor_isthmus_of_lustria"; end,
                religion_proportion = function() return 0; end,
                public_order = function() return -100; end,
                owning_faction = function() return humanFaction; end,
                name = function() return "wh2_main_vor_isthmus_of_lustria_ziggurat_of_dawn"; end,
                is_province_capital = function() return false; end,
                is_abandoned = function() return false; end,
                command_queue_index = function() return 10; end,
                adjacent_region_list = function()
                    return {
                        item_at = function(self, i)
                            if i == 0 then
                                return get_cm():get_region();
                            elseif i == 1 then
                                return get_cm():get_region();
                            elseif i == 2 then
                                return get_cm():get_region();
                            elseif i == 3 then
                                return get_cm():get_region();
                            else
                                return nil;
                            end
                        end,
                        num_items = function()
                            return 3;
                        end,
                    }
                end,
                is_null_interface = function() return false; end,
                garrison_residence = function() return {
                    army = function() return {
                        strength = function() return 50; end,
                    } end ,
                } end,
                settlement = function() return {
                    is_null_interface = function() return false; end,
                    get_climate = function() return "suitability_good"; end,
                    primary_slot = function() return {
                        is_null_interface = function() return false; end,
                        has_building = function() return true; end,
                        building = function() return {
                            is_null_interface = function() return false; end,
                            name = function() return
                                "main_settlement";
                            end,
                            chain = function() return "wh2_main_def_murder"; end,
                            superchain = function()
                                return "wh2_main_sch_infrastructure1_farm";
                            end,
                            building_level = function()
                                return 2;
                            end,
                        };
                    end
                    };
                    end,
                    port_slot = function() return {
                        is_null_interface = function() return false; end,
                        has_building = function() return true; end,
                        building = function() return {
                            is_null_interface = function() return false; end,
                            name = function() return
                                "port";
                            end,
                            chain = function() return "wh2_main_def_sorcery"; end,
                            superchain = function()
                                return "wh2_main_sch_infrastructure1_farm";
                            end,
                            building_level = function()
                                return 2;
                            end,
                            };
                        end
                        };
                    end,
                    is_port = function()
                        return true;
                    end,
                    slot_list = function() return {
                        num_items = function () return 2; end,
                        item_at = function(index)
                            if index == 1 then
                                return slot_1;
                            else
                                return slot_2;
                            end
                        end
                    };
                    end,
                };
                end,
            }
        end,
        set_character_immortality = function() end,
        get_campaign_name = function() return "main_warhammer"; end,
        apply_effect_bundle_to_characters_force = function() end,
        kill_character = function() end,
        trigger_incident = function() end,
        trigger_dilemma = function() end,
        trigger_mission = function() end,
        create_force_with_general = function(self, factionKey, forceString, regionKey, spawnX, spawnY, generalType, agentSubTypeKey, clanNameKey, dummyName1, foreNameKey, dummayName2, umm, callbackFunction)
            callbackFunction(123);
        end,
        force_add_trait = function() end,
        force_remove_trait = function() end,
        get_character_by_cqi = function() return testCharacter; end,
        char_is_mobile_general_with_army = function() return true; end,
        restrict_units_for_faction = function() end,
        save_named_value = function(self, saveKey, data, context)
            mockSaveData[saveKey] = data;
        end,
        load_named_value = function(self, saveKey, datastructure, context)
            if mockSaveData[saveKey] == nil then
                return nil;
            end
            return mockSaveData[saveKey];
        end,
        remove_effect_bundle = function() end,
        apply_effect_bundle = function() end,
        char_is_agent = function() return false end,
        steal_user_input = function() end,
        disable_rebellions_worldwide = function() end,
        find_valid_spawn_location_for_character_from_settlement = function() return 1, 1; end,
        force_diplomacy = function() end,
        apply_effect_bundle_to_force = function() end,
        force_declare_war = function() end,
        cai_enable_movement_for_character = function() end,
        cai_disable_movement_for_character = function() end,
        add_unit_model_overrides = function() end,
        force_character_force_into_stance = function() end,
        attack_region = function() end,
        char_lookup_str = function() end,
        suppress_all_event_feed_messages = function() end,
        grant_unit_to_character = function() end,
        show_message_event = function() end,
        show_message_event_located = function() end,
        trigger_incident_with_targets = function() end,
        force_add_and_equip_ancillary = function() end,
        force_add_ancillary = function () end,
        add_agent_experience = function() end,
        apply_effect_bundle_to_region = function() end,
        remove_effect_bundle_from_region = function() end,
        get_saved_value = function() return nil; end,
        treasury_mod = function() return nil; end,
        create_new_custom_effect_bundle = function()
            return {
                set_duration = function() end,
                add_effect = function() end,
            };
        end,
        apply_custom_effect_bundle_to_region = function() end,
        get_difficulty = function() return "hard"; end,
        add_first_tick_callback = function() end,
        appoint_character_to_most_expensive_force = function() end,
        change_localised_faction_name = function() end,
        apply_custom_effect_bundle_to_faction = function() end,
        force_add_skill = function() end,
        find_valid_spawn_location_for_character_from_position = function() return -1, -1; end,
        teleport_to = function() end,
    };
end

cm = get_cm();
mock_max_unit_ui_component = {
    Id = function() return "wh2_dlc10_hef_inf_shadow_walkers_0_recruitable" end,
    ChildCount = function() return 1; end,
    Find = function() return mock_unit_ui_component; end,
    SetVisible = function() end,
    MoveTo = function() end,
    SetStateText = function() end,
    SetInteractive = function() end,
    Visible = function() return true; end,
    Position = function() return 0, 1 end,
    Bounds = function() return 0, 1 end,
    Width = function() return 1; end,
    Resize = function() return; end,
    SetCanResizeWidth = function() return; end,
    SimulateMouseOn = function() return; end,
    GetStateText = function() return "names_name_9999000117"; end,
    --GetStateText = function() return "Unlocks recruitment of:"; end,
    SetCanResizeHeight = function() end;
    SetCanResizeWidth = function() end;
    SimulateLClick = function() end;
    SetState = function() end;
    SetTooltipText = function() end,
}

mock_unit_ui_component = {
    Id = function() return "wh_main_vmp_inf_zombie_mercenary" end,
    --Id = function() return "building_info_recruitment_effects" end,
    ChildCount = function() return 1; end,
    Find = function() return mock_max_unit_ui_component; end,
    SetVisible = function() end,
    MoveTo = function() end,
    SetStateText = function() end,
    SetInteractive = function() end,
    Visible = function() return true; end,
    Position = function() return 0, 1 end,
    Bounds = function() return 0, 1 end,
    Width = function() return 1; end,
    Resize = function() return; end,
    SetCanResizeWidth = function() return; end,
    SimulateMouseOn = function() return; end,
    GetStateText = function() return "names_name_9999000117"; end,
    SetCanResizeHeight = function() end;
    SetCanResizeWidth = function() end;
    SimulateLClick = function() end;
    SetState = function() end;
    SetTooltipText = function() end,
}

mock_unit_ui_list_component = {
    Id = function() return "mock_list" end,
    ChildCount = function() return 1; end,
    Find = function() return mock_unit_ui_component; end,
    SetVisible = function() end,
    MoveTo = function() end,
    SetStateText = function() end,
    SetInteractive = function() end,
    Visible = function() return true; end,
    Position = function() return 0, 1 end,
    Bounds = function() return 0, 1 end,
    Width = function() return 1; end,
    Resize = function() return; end,
    SetCanResizeWidth = function() return; end,
    SimulateMouseOn = function() return; end,
    GetStateText = function() return "names_name_9999000117"; end,
    --GetStateText = function() return "Unlocks recruitment of:"; end,
    SetCanResizeHeight = function() end;
    SetCanResizeWidth = function() end;
    SimulateLClick = function() end;
    SetState = function() end;
    SetTooltipText = function() end,
}

find_uicomponent = function()
    return mock_unit_ui_list_component;
end

UIComponent = function(mock_ui_find) return mock_ui_find; end

core = {
    trigger_event = function() end,
    remove_listener = function() end,
    add_listener = function (self, key, eventKey, condition, callback)
        mock_listeners.listeners[key] = {
            Condition = condition,
            Callback = callback,
        }
    end,
    get_ui_root = function() end,
    get_screen_resolution = function() return 0, 1 end;
    is_mod_loaded = function() return true; end,
}

random_army_manager = {
    new_force = function() end,
    add_mandatory_unit = function() end,
    add_unit = function() end,
    generate_force = function() return ""; end,
}

invasion_manager = {
    new_invasion = function()
        return {
            set_target = function() end,
            apply_effect = function() end,
            add_character_experience = function() end,
            start_invasion = function() end,
            assign_general = function() end,
            create_general = function() end,
        }
    end,
    get_invasion = function() return {
        release = function() return end,
    }; end,
}
out = function(text)
  print(text);
end

require 'script/campaign/mod/a_crp_cataph_dragon_mage'
require 'script/campaign/mod/controlled_recruitment_pools'
require 'script/campaign/mod/z_crp_cataph_patch'
require 'script/campaign/main_warhammer/mod/z_crp_cataph_patch_lichemaster'
require 'script/campaign/mod/z_crp_deco_goblin_patch'
require 'script/campaign/mod/z_crp_mixu_patch'
require 'script/campaign/mod/z_crp_zombie_flanders_patch'

math.randomseed(os.time())

-- This is used in game by Warhammer but we have it here so it won't throw errors when running
-- in ZeroBrane IDE
a_crp_cataph_dragon_mage();
controlled_recruitment_pools();
crp = _G.crp;


local MockContext_UpdateRecruitmentPool = {
    Key = "UpdateRecruitmentPool",
    Context = {
        faction = function() return humanFaction; end,
    },
}
mock_listeners:trigger_listener(MockContext_UpdateRecruitmentPool);
mock_listeners:trigger_listener(MockContext_UpdateRecruitmentPool);
mock_listeners:trigger_listener(MockContext_UpdateRecruitmentPool);
mock_listeners:trigger_listener(MockContext_UpdateRecruitmentPool);
mock_listeners:trigger_listener(MockContext_UpdateRecruitmentPool);
mock_listeners:trigger_listener(MockContext_UpdateRecruitmentPool);
mock_listeners:trigger_listener(MockContext_UpdateRecruitmentPool);
mock_listeners:trigger_listener(MockContext_UpdateRecruitmentPool);
mock_listeners:trigger_listener(MockContext_UpdateRecruitmentPool);

--[[local MockContext_CRP_CharacterCreated_Removal = {
    Key = "CRP_CharacterCreated_Removal",
    Context = {
    },
}
mock_listeners:trigger_listener(MockContext_CRP_CharacterCreated_Removal);--]]

local MockContext_CRP_CharacterCreated = {
    Key = "CRP_CharacterCreated",
    Context = {
        character = function() return testCharacter; end,
    },
}
mock_listeners:trigger_listener(MockContext_CRP_CharacterCreated);


-- This is a mockContext to simulate a click on a unit
local MockContext_CRP_AppointGeneralOpened = {
    Key = "CRP_AppointGeneralOpened",
    Context = {
        string = "appoint_new_general"
    },
}
mock_listeners:trigger_listener(MockContext_CRP_AppointGeneralOpened);

--[[local MockContext_CRP_DiplomacyLordImpacts = {
    Key = "CRP_DiplomacyLordImpacts",
    Context = {
        proposer = function() return testFaction; end,
        recipient = function() return testFaction2; end,
        is_alliance = function() return true; end,
    },
}
mock_listeners:trigger_listener(MockContext_CRP_DiplomacyLordImpacts);--]]


local CRP_CheckHordeBuildingRewards = {
    Key = "CRP_CheckHordeBuildingRewards",
    Context = {
        character = function() return testCharacter; end,
        building = function() return "wh_dlc03_horde_beastmen_arcane_2"; end,
    },
};
mock_listeners:trigger_listener(CRP_CheckHordeBuildingRewards);

local CRP_UpdateBuildingFactionPoolLimits = {
    Key = "CRP_UpdateBuildingFactionPoolLimits",
    Context = {
        faction = function() return humanFaction; end,
    },
};
mock_listeners:trigger_listener(CRP_UpdateBuildingFactionPoolLimits);

local CRP_UpdateAgentLimits = {
    Key = "CRP_UpdateAgentLimits",
    Context = {
        faction = function() return humanFaction; end,
    },
};
mock_listeners:trigger_listener(CRP_UpdateAgentLimits);

local CRP_ConfederationListener = {
    Key = "CRP_ConfederationListener",
    Context = {
        faction = function() return testFaction; end,
        confederation = function() return humanFaction; end,
    },
};
mock_listeners:trigger_listener(CRP_ConfederationListener);

local CRP_DilemmaDecisionMade = {
    Key = "CRP_DilemmaDecisionMade",
    Context = {
        choice = function() return 1; end,
        dilemma = function() return "wh2_dlc09_agent_choice"; end,
    },
};
mock_listeners:trigger_listener(CRP_DilemmaDecisionMade);

local CRP_CheckResearchRewards = {
    Key = "CRP_CheckResearchRewards",
    Context = {
        technology = function() return "tech_dlc09_tmb_liche_priest_1"; end,
        faction = function() return humanFaction; end,
    },
};
mock_listeners:trigger_listener(CRP_CheckResearchRewards);

local CRP_MissionCompletedRewards = {
    Key = "CRP_MissionCompletedRewards",
    Context = {
        mission = function() return {
            mission_record_key = function()
                return "wh2_dlc09_books_of_nagash_6";
            end,
        }; end,
        faction = function() return humanFaction; end,
    },
};
mock_listeners:trigger_listener(CRP_MissionCompletedRewards);

local CRP_RitualCompletedReward = {
    Key = "CRP_RitualCompletedReward",
    Context = {
        succeeded = function() return true; end,
        ritual = function() return {
            ritual_key = function()
                return "wh2_dlc13_ritual_temple_quetzl_3_saurus_scar_veteran";
            end,
        }; end,
        performing_faction = function() return humanFaction; end,
    },
};
mock_listeners:trigger_listener(CRP_RitualCompletedReward);

local CRP_IncidentTriggered = {
    Key = "CRP_IncidentTriggered",
    Context = {
        dilemma = function() return "barrow_AK_hobo_barrow_king"; end,
    },
};
mock_listeners:trigger_listener(CRP_IncidentTriggered);


out("CRP: Saving callback");
InitialiseSaveHelper(cm, context);
--SavePreBattleData(crp);
SaveCharacterData(crp);
SaveFactionCharacterPoolData(crp);

crp = {};
_G.crp = crp;

out("CRP: Loading callback");
InitialiseLoadHelper(cm, context);
--LoadPreBattleData(crp);
LoadCharacterData(crp);
LoadFactionCharacterPoolData(crp);

a_crp_cataph_dragon_mage();
controlled_recruitment_pools();