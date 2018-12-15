-- Mock Data
testFaction = {
    name = function()
        return "wh_main_grn_crooked_moon";
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
}

effect = {
    get_localised_string = function()
        return "[test]";
    end,
}

function out()
    return;
end

-- Mock functions
function get_cm()
    return   {
        is_new_game = function() return false; end,
        create_agent = function()
            return;
        end,
        get_human_factions = function()
            return {testFaction};
        end,
        disable_event_feed_events = function() end,
        model = function ()
            return {
                world = function()
                    return {
                        faction_by_key = function ()
                            return testFaction;
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
    };
end

cm = get_cm();

core = {
    add_listener = function() end,
}

require 'script/campaign/mod/controlled_recruitment_pools'
require 'script/campaign/mod/z_crp_deco_goblin_patch'
require 'script/campaign/mod/z_crp_mixu_patch'




math.randomseed(os.time())

-- This is used in game by Warhammer but we have it hear so it won't throw errors when running
-- in ZeroBrane IDE
function --Custom_Log(text)
  print(text)
end

controlled_recruitment_pools();
crp = _G.crp;
local destinationTable = {};
local sourceTable = {};
if destinationTable == {} then
    local test = ""; 
end
local currentFactionPools = crp:GetCurrentPoolForFaction(testFaction);
local agentSubTypeKey = "wh_grn_forest_goblin_warboss";
crp:ReplaceExistingLords(testFaction, currentFactionPools);
crp:RecalculatePoolLimits();
local name = crp:GetCharacterNameForSubculture(testFaction, agentSubTypeKey);
local artSetId = crp:GetArtSetForSubType(agentSubTypeKey);
local factionPoolResources = crp:GetFactionPoolResources(testFaction);
local trait = crp:GetRandomCharacterTrait(testFaction, agentSubTypeKey);
local traitPath = crp.UIController:GetImagePathForTrait(trait);
crp:SetupInitialMinimumValues(testFaction, currentFactionPools);
local traitEffects = crp.UIController:GetTraitEffects("wh2_main_skill_innate_all_aggressive");
local traitDescription = crp.UIController:BuildTraitLocString("wh2_main_skill_innate_all_aggressive", "Knowledgeable");
--crp.UIController:GetImagePathForTrait("wh_main_sc_vmp_vampire_counts", "");
--local factionResources = crp:GetFactionPoolResources(testFaction);
--local supported = crp:IsSupportedSubCulture(testFaction:subculture()) or crp:IsRogueArmy(testFaction:name());
--local currentPoolCounts = crp:GetCurrentPoolForFaction(testFaction);
local imagePath = crp.UIController:GetImagePathForTrait(testFaction:subculture(), "wh2_main_skill_innate_all_aggressive");
--local test = crp:SelectGeneralToGenerateFromPool(factionResources, currentPoolCounts, "EmpireGenerals");

crp:UpdateRecruitmentPool(testFaction, 1, true);
crp:IsThereACharacterInPool(testFaction);