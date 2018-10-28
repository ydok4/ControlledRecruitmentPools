-- Mock Data
testFaction = {
    name = function()
        return "wh_main_brt_bretonnia";
    end,
    subculture = function()
        return "wh_main_sc_brt_bretonnia";
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

-- Mock functions
function get_cm()
    return   {
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
        add_listener = function () end,
        add_saving_game_callback = function() end,
        add_loading_game_callback = function() end,
    };
end

cm = get_cm();

core = {
    add_listener = function() end,
}

require 'script/export_helpers__crp__datahelpers'
require 'script/export_helpers__crp_core_resource_loader'
require 'script/export_helpers__crp_ui_resource_loader'
require 'script/export_helpers__crp_listeners'
require 'script/export_helpers__crp_model'
require 'script/export_helpers__crp_ui'

require 'script/export_helpers__crp_z_mixu_resource_loader'
require 'script/export_helpers__crp_z_mixu_ui_resource_loader'

require 'script/campaign/mod/controlled_recruitment_pools'

math.randomseed(os.time())

-- This is used in game by Warhammer but we have it hear so it won't throw errors when running
-- in ZeroBrane IDE
function --Custom_Log(text)
  print(text)
end

crp = ControlledRecruitmentPools:new({
    HumanFaction = {},
    DefaultXCoordinate = 0,
    DefaultYCoordinate = 0,
});



--controlled_recruitment_pools();

crp:Initialise();
crp:GetCurrentPoolForFaction(testFaction);
local trait = crp:GetRandomCharacterTrait(testFaction, "dlc07_brt_prophetess_beasts");
local traitPath = crp.UIController:GetImagePathForTrait(trait);
local artSetId = crp:GetArtSetForSubType("wh2_main_def_dreadlord");
local traitEffects = crp.UIController:GetTraitEffects("wh2_main_skill_innate_all_aggressive");
local traitDescription = crp.UIController:BuildTraitLocString("wh2_main_skill_innate_all_aggressive", "Knowledgeable");
--crp.UIController:GetImagePathForTrait("wh_main_sc_vmp_vampire_counts", "");
--local factionResources = crp:GetFactionPoolResources(testFaction);
--local supported = crp:IsSupportedSubCulture(testFaction:subculture()) or crp:IsRogueArmy(testFaction:name());
--local currentPoolCounts = crp:GetCurrentPoolForFaction(testFaction);
local imagePath = crp.UIController:GetImagePathForTrait(testFaction:subculture(), "wh2_main_skill_innate_all_aggressive");
--local test = crp:SelectGeneralToGenerateFromPool(factionResources, currentPoolCounts, "EmpireGenerals");

--crp:UpdateRecruitmentPool(testFaction, 0);