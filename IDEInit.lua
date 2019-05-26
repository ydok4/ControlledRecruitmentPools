-- Mock Data
testCharacter = {
    cqi = function() return 123 end,
    get_forename = function() return "Direfan"; end,
    get_surname = function() return "Cylostra"; end,
    character_subtype_key = function() return "grn_orc_warboss"; end,
    command_queue_index = function() end,
    has_military_force = function() return false end,
    faction = function() return humanFaction; end,
    region = function() return get_cm():get_region(); end,
    logical_position_x = function() return 100; end,
    logical_position_y = function() return 110; end,
    command_queue_index = function() return 10; end,
}

humanFaction = {
    name = function()
        return "wh_main_emp_wissenland";
    end,
    subculture = function()
        return "wh_main_sc_emp_empire";
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
}

testFaction = {
    name = function()
        return "wh2_dlc11_cst_the_drowned";
    end,
    subculture = function()
        return "wh_main_sc_grn_greenskins";
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
}

testFaction2 = {
    name = function()
        return "wh2_dlc11_cst_rogue_grey_point_scuttlers";
    end,
    subculture = function()
        return "wh_main_sc_nor_norsca";
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
}

effect = {
    get_localised_string = function()
        return "Murdredesa";
    end,
}

-- This can be modified in the testing driver
-- so we can simulate turns changing easily
local turn_number = 1;
-- Mock functions
function get_cm()
    return   {
        is_new_game = function() return false; end,
        create_agent = function()
            return;
        end,
        get_human_factions = function()
            return {humanFaction};
        end,
        disable_event_feed_events = function() end,
        model = function ()
            return {
                turn_number = function() return turn_number; end,
                world = function()
                    return {
                        faction_by_key = function ()
                            return humanFaction;
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
        add_listener = function () end,
        add_saving_game_callback = function() end,
        add_loading_game_callback = function() end,
        spawn_character_to_pool = function() end,
        callback = function() end,
        transfer_region_to_faction = function() end,
        get_faction = function() return testFaction2; end,
        lift_all_shroud = function() end,
        kill_all_armies_for_faction = function() end,
        get_region = function()
            return {
                owning_faction = function() return testFaction; end,
                name = function() return "region_name"; end,
                is_province_capital = function() return false; end,
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
            }
        end,
        set_character_immortality = function() end,
        get_campaign_name = function() return "main_warhammer"; end,
        apply_effect_bundle_to_characters_force = function() end,
        kill_character = function() end,
        trigger_incident = function() end,
        trigger_dilemma = function() end,
        trigger_mission = function() end,
        create_force_with_general = function() end,
        force_add_trait = function() end,
        force_remove_trait = function() end,
        get_character_by_cqi = function() end,
        char_is_mobile_general_with_army = function() return true; end,
    };
end

cm = get_cm();

core = {
    add_listener = function() end,
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

require 'script/campaign/mod/controlled_recruitment_pools'
require 'script/campaign/mod/z_crp_cataph_patch'
require 'script/campaign/mod/z_crp_deco_goblin_patch'
require 'script/campaign/mod/z_crp_mixu_patch'
require 'script/campaign/mod/z_crp_wez_speshul_patch'
require 'script/campaign/mod/z_crp_zf_engineer_patch'

math.randomseed(os.time())

-- This is used in game by Warhammer but we have it here so it won't throw errors when running
-- in ZeroBrane IDE
function Custom_Log(text)
  print(text);
end

controlled_recruitment_pools();
crp = _G.crp;
local destinationTable = {};
local sourceTable = {};
if destinationTable == {} then
    local test = ""; 
end
local defaultLordsForFaction = GetDefaultLordForFaction(testFaction);
CheckAndReceiveRewards(testFaction, testFaction, "scripted");
CheckAndReceiveRewards(testFaction2, testFaction, "alliance");

local factionPoolResources = GetFactionPoolResources(testFaction);
local currentFactionPools = crp:GetCurrentPoolForFaction(testFaction);
crp:EnforceMinimumValues(testFaction, currentFactionPools);
local agentSubTypeKey = "til_merchant";
crp:ReplaceExistingLords(testFaction, factionPoolResources);
RecalculatePoolLimits();



--local subculture = GetSubCultureFromUnitList(agentSubTypeKey);
local name = crp.CharacterGenerator:GetCharacterNameForSubculture(testFaction, agentSubTypeKey);
local artSetId = crp.CharacterGenerator:GetArtSetForSubType(agentSubTypeKey);
local trait = crp.CharacterGenerator:GetRandomCharacterTrait(testFaction, agentSubTypeKey);
local traitPath = crp.UIController:GetImagePathForTrait(trait);
crp:SetupInitialMinimumValues(testFaction, currentFactionPools, factionPoolResources);
local traitEffects = crp.UIController:GetTraitEffects("wh2_main_skill_innate_all_aggressive");
local traitDescription = crp.UIController:BuildTraitLocString("wh2_main_skill_innate_all_aggressive", "Knowledgeable");
--crp.UIController:GetImagePathForTrait("wh_main_sc_vmp_vampire_counts", "");
--local factionResources = GetFactionPoolResources(testFaction);
--local supported = IsSupportedSubCulture(testFaction:subculture()) or IsRogueArmy(testFaction:name());
--local currentPoolCounts = crp:GetCurrentPoolForFaction(testFaction);
local imagePath = crp.UIController:GetImagePathForTrait(testFaction:subculture(), "wh2_main_skill_innate_all_aggressive");
local replacementLords = GetReplacementLordsForFaction(testFaction);

if replacementLords ~= nil then
    for replacementSubType, replacementData in pairs(replacementLords) do
        local test = replacementSubType;
    end
end

local empirePool = _G.CRPResources.CulturePoolResources["wh_main_sc_emp_empire"]["wh_main_emp_empire"].FactionPools;
empirePool["GrandMasterPool"] = {
    AgentSubTypes = {
        dlc420_emp_grand_master = {
            MinimumAmount = 10,
            MaximumAmount = 20,
        },
    },
    SubPoolInitialMinSize = 12,
    SubPoolMaxSize = 20,
};

crp:UpdateRecruitmentPool(testFaction, 1, true);
crp:IsThereACharacterInPool(testFaction);
GetDefaultLordForFaction(testFaction);
crp:UpdateRecruitmentPool(humanFaction, 1);
crp:ProcessNewCharacter(testCharacter);
local test = "";

 --[[       -- This contains the max poolsize of the faction
        local serialised_faction_resources = {};

        -- Contains the the pool keys for specific factions
        local serialised_faction_pool_keys = {};
        -- Contains the pool data for each faction
        local serialised_faction_pool_resources = {};

        -- Contains the keys for the faction pool agent subtypes
        local serialised_faction_pool_agent_keys = {};
        -- Contiains the number of each agent subtype with a key that correspond to the subtype, pool and faction
        local serialised_faction_pool_agent_resources = {};

        for cultureResourceKey, cultureResourceData in pairs(_G.CRPResources.CulturePoolResources) do
            Custom_Log("Saving culture factions for "..cultureResourceKey);
            for factionResourceKey, factionResourceData in pairs(cultureResourceData) do
                Custom_Log("Saving faction resources for "..factionResourceKey);
                if cultureResourceKey ~= factionResourceKey then
                    local factionPoolKeys = {};
                    serialised_faction_resources[factionResourceKey] = { cultureResourceKey, factionResourceData.PoolMaxSize};
                    for factionPoolKey, factionPoolData in pairs(factionResourceData.FactionPools) do
                        serialised_faction_pool_resources[factionResourceKey..factionPoolKey] = { factionPoolKey, factionPoolData.SubPoolInitialMinSize, factionPoolData.SubPoolMaxSize};
                        local factionPoolAgentKeys = {};
                        for agentSubTypeKey, agentSubTypeData in pairs(factionPoolData.AgentSubTypes) do
                            serialised_faction_pool_agent_resources[factionResourceKey..factionPoolKey..agentSubTypeKey] = { agentSubTypeKey, agentSubTypeData.MinimumAmount, agentSubTypeData.MaximumAmount};
                            factionPoolAgentKeys[#factionPoolAgentKeys + 1] = agentSubTypeKey;
                        end
                        serialised_faction_pool_agent_keys[factionResourceKey..factionPoolKey] = factionPoolAgentKeys;
                        factionPoolKeys[#factionPoolKeys + 1] = factionPoolKey;
                    end
                    serialised_faction_pool_keys[factionResourceKey] = factionPoolKeys;
                end
            end
        end

    local test = "";

    local faction_resources = serialised_faction_resources;

    local faction_pool_keys = serialised_faction_pool_keys;
    local faction_pool_resources = serialised_faction_pool_resources;

    local faction_pool_agent_keys = serialised_faction_pool_agent_keys;
    local faction_pool_agent_resources = serialised_faction_pool_agent_resources;

    for factionResourceKey, factionResourceData in pairs(faction_resources) do
        local factionCulture = factionResourceData[1];
        local mappedFactionPools = {};
        for factionPoolIndex, factionPoolKey in pairs(faction_pool_keys[factionResourceKey]) do
            local factionPoolResources = faction_pool_resources[factionResourceKey..factionPoolKey];
            local factionAgentSubTypes = {};
            for agentSubTypeIndex, agentSubTypeKey in pairs(faction_pool_agent_keys[factionResourceKey..factionPoolKey]) do
                local agentResources = faction_pool_agent_resources[factionResourceKey..factionPoolKey..agentSubTypeKey];
                local mappedAgentSubType = {
                    MinimumAmount = agentResources[2],
                    MaximumAmount = agentResources[3],
                };
                factionAgentSubTypes[agentSubTypeKey] = mappedAgentSubType;
            end
            mappedFactionPools[factionPoolKey] = {
                AgentSubTypes = factionAgentSubTypes,
                SubPoolInitialMinSize = factionPoolResources[2],
                SubPoolMaxSize = factionPoolResources[3],
            };
        end

        local mappedFactionData = {
            FactionPools = mappedFactionPools,
            PoolMaxSize = factionResourceData[2],
        };
        _G.CRPResources.CulturePoolResources[factionCulture][factionResourceKey].FactionPools = mappedFactionData.FactionPools;
        _G.CRPResources.CulturePoolResources[factionCulture][factionResourceKey].PoolMaxSize = mappedFactionData.PoolMaxSize;
    end

    local test2 = "";--]]

    local preBattleDataAttackers = {};
    for attacker_force_cqi, preBattleData in pairs(preBattleDataAttackers) do
        local test3 = "";
    end