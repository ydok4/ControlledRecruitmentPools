crp = {};
_G.crp = crp;

function controlled_recruitment_pools()
    Custom_Log("Mod Init function");
    crp = ControlledRecruitmentPools:new({
        HumanFaction = {},
        DefaultXCoordinate = 0,
        DefaultYCoordinate = 0,
    });
    crp:Initialise();

    if cm:is_new_game()  then
        Custom_Log("New Game");
        -- Clear existing generals
        crp:FactionStartup();
    else
        Custom_Log("Existing game");
    end

    SetupListeners();
    Custom_Log_Finished();
end