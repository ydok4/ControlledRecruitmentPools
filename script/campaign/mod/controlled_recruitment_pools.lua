crp = {};
_G.crp = crp;

require 'script/_lib/core/helpers/datahelpers';
require 'script/_lib/core/helpers/loadhelpers';
require 'script/_lib/core/helpers/resourcehelpers';
require 'script/_lib/core/helpers/savehelpers';

require 'script/_lib/core/model/CharacterGenerator';
require 'script/_lib/core/model/pool_modifier';
require 'script/_lib/core/model/ControlledRecruitmentPoolsController';
require 'script/_lib/core/model/CRPUIController';
require 'script/_lib/core/model/Logger';

require 'script/_lib/core/loaders/core_resource_loader';
require 'script/_lib/core/loaders/ui_resource_loader';

require 'script/_lib/core/listeners/crp_listeners';

function controlled_recruitment_pools()
    out("CRP: Main mod function");
    local enableLogging = true;
    InitialiseResourcesCache();
    crp = ControlledRecruitmentPoolsController:new({
        HumanFaction = {},
        DefaultXCoordinate = 0,
        DefaultYCoordinate = 0,
        -- If this is a new game crp.CRPLordsInPools and crp.CRPResources will be nil
        -- Otherwise it should be populated from the loading callback
        --CRPResources = crp.CRPResources,
        CRPLordsInPools = crp.CRPLordsInPools,
        PreBattleData = crp.PreBattleData,
    });
    if cm:is_new_game() then
        crp:Initialise(enableLogging);
        -- This callback is required so that startup happens after
        -- the game spawns any startup armies. This allows them to be replaced if required.
        cm:callback(function() crp:NewGameStartUp(); end, 1);
    else
        crp:Initialise(enableLogging);
        cm:callback(function()
            crp:CreateCachedAgentData(crp.HumanFaction);
            crp.Logger:Log_Finished();
        end, 1);
    end

    crp.UIController:InitialiseUI(crp, enableLogging);
    CRP_SetupPostUIListeners(crp, core, find_uicomponent, UIComponent);
    -- Remove the listeners which give AI factions bloodline chars cause we already do that
    core:remove_listener("vampire_bloodline_ai_characters");
    out("CRP: Finished startup");
    --cm:spawn_character_to_pool(crp.HumanFaction:name(), "", "", "", "", 20, true, "champion", "wh2_dlc14_def_master", true, "wh2_dlc14_art_set_def_master_01");
    --[[local naggarondRegion = cm:get_region("wh2_main_vor_naggarond_naggarond");
    crp.Logger:Log("Got Naggarond region");
    local naggarondGarrisonCommander = cm:get_garrison_commander_of_region(naggarondRegion);
    crp.Logger:Log("Got garrison commander");
    --local garrisonCommanderLookupString = "character_cqi:"..naggarondGarrisonCommander:command_queue_index();
    --cm:grant_unit_to_character(garrisonCommanderLookupString, "wh2_dlc10_def_inf_sisters_of_slaughter");
    --crp.Logger:Log("Granted unit to character");
    crp.Logger:Log("Garrison commander cqi is: "..naggarondGarrisonCommander:command_queue_index());
    local spawnX, spawnY = cm:find_valid_spawn_location_for_character_from_settlement(
        crp.HumanFaction:name(),
        naggarondRegion:name(),
        -- Spawn on sea
        false,
        -- Rebellion spawn
        true,
        10
    );--]]
    --[[cm:create_agent(
        crp.HumanFaction:name(),
        "champion",
        "wh2_dlc14_def_master",
        spawnX,
        spawnY,
        true,
        function(cqi)
            crp.Logger:Log("Created agent");
            local newAgent = cm:get_character_by_cqi(cqi);
            cm:embed_agent_in_force(newAgent, naggarondGarrisonCommander:military_force());
            crp.Logger:Log("Embedded agent");
            crp.Logger:Log_Finished();
        end
    );--]]
    --[[core:add_listener(
        "CRP_NewCharacterEnteredRecruitmentPool",
        "NewCharacterEnteredRecruitmentPool",
        function(context)
            return true;
        end,
        function(context)
            crp.Logger:Log("CRP_NewCharacterEnteredRecruitmentPool");
            local characterDetails = context:character_details();
            if characterDetails == nil
            or characterDetails.is_null_interface == nil then
                crp.Logger:Log("Character is nil");
            elseif characterDetails:is_null_interface() then
                crp.Logger:Log("Character is null interface");
            else
                crp.Logger:Log("Got character_details");
                if characterDetails.character_type == nil then
                    crp.Logger:Log("Character type is nil");
                else
                    crp.Logger:Log("Character type is not nil");
                    local characterType = characterDetails:character_type();
                    crp.Logger:Log("Got character type");
                    if characterType == nil then
                        crp.Logger:Log("characterType value is nil");
                    else
                        crp.Logger:Log("characterType is: "..characterType);
                    end
                end
                local characterForename = characterDetails:get_forename();
                crp.Logger:Log("Got forename");
                local localisedForename = effect.get_localised_string(characterForename);
                crp.Logger:Log("Got forename");
                local localisedSurname = effect.get_localised_string(characterDetails:get_surname());
                crp.Logger:Log("Got surname");
                crp.Logger:Log("Character: "..(localisedForename..localisedSurname).." has entered the pool.");
                crp.Logger:Log_Finished();
            end
        end,
        true
    );--]]
    --cm:add_event_restricted_unit_record(string unit key);
    crp.Logger:Log_Finished();
end

CRP_InitialiseListenerData();

-- Saving/Loading Callbacks
-- These need to be outside of the Constructor function
-- because that is called by the game too late
cm:add_saving_game_callback(
    function(context)
        crp.Logger:Log("Saving callback");
        out("CRP: Saving callback");
        InitialiseSaveHelper(cm, context);
        --SavePreBattleData(crp);
        SaveCharacterData(crp);
        SaveFactionCharacterPoolData(crp);
        crp.Logger:Log_Finished();
    end
);

cm:add_loading_game_callback(
    function(context)
        out("CRP: Loading callback");
        InitialiseLoadHelper(cm, context);
        --LoadPreBattleData(crp);
        LoadCharacterData(crp);
        LoadFactionCharacterPoolData(crp);
        out("CRP: Finished loading");
	end
);