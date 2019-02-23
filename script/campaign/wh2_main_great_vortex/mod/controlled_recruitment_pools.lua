crp = {};
_G.crp = crp;

require 'script/_lib/core/helpers/datahelpers';
require 'script/_lib/core/helpers/loadhelpers';
require 'script/_lib/core/helpers/resourcehelpers';
require 'script/_lib/core/helpers/savehelpers';


require 'script/_lib/core/model/character_generator';
require 'script/_lib/core/model/pool_modifier';
require 'script/_lib/core/model/model';
require 'script/_lib/core/model/ui';

require 'script/_lib/core/loaders/core_resource_loader';
require 'script/_lib/core/loaders/ui_resource_loader';

require 'script/_lib/core/listeners/listeners';

Custom_Log_Start();

function controlled_recruitment_pools()
    Custom_Log_Finished();
    out("CRP: Main mod function");
    Custom_Log("Main mod function");

    crp = ControlledRecruitmentPools:new({
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
        Custom_Log("New Game");
        crp:Initialise();
        -- This callback is required so that startup happens after
        -- the game spawns any startup armies. This allows them to be replaced if required.
        cm:callback(function() crp:NewGameStartUp(); end, 1);
        Custom_Log("Past new game callback");
    else
        crp:Initialise();
        Custom_Log("Existing game");
        if #crp.CRPLordsInPools > 0 then
            Custom_Log("Loaded lord data");
        end
    end

    crp.UIController:InitialiseUI(crp);
    SetupPostUIListeners(crp);
    Custom_Log("CRP: Finished");
    out("CRP: Finished startup");
    Custom_Log_Finished();
end

InitialiseListenerData(core, find_uicomponent, UIComponent);

-- Saving/Loading Callbacks
-- These need to be outside of the Constructor function
-- because that is called by the game too late
cm:add_saving_game_callback(
    function(context)
        Custom_Log_Finished();
        Custom_Log("Saving callback");
        out("CRP: Saving callback");
        InitialiseSaveHelper(cm, context);
        SavePreBattleData(crp);
        SaveCharacterData(crp);
        SaveFactionCharacterPoolData();
        Custom_Log_Finished();
    end
);

cm:add_loading_game_callback(
    function(context)
        out("CRP: Loading callback");
        InitialiseLoadHelper(cm, context);
        LoadPreBattleData(crp);
        LoadCharacterData(crp);
        LoadFactionCharacterPoolData(crp);
        out("CRP: Finished loading");
	end
);