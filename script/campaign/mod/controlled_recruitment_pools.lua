crp = {};
_G.crp = crp;

function controlled_recruitment_pools()
    crp = ControlledRecruitmentPools:new({
        HumanFaction = {},
        DefaultXCoordinate = 0,
        DefaultYCoordinate = 0,
    });

    crp:Initialise();

    Custom_Log("Mod startup");
    if cm:is_new_game()  then
        if crp:IsSupportedSubCulture(crp.HumanFaction:subculture()) then
            crp:UpdateRecruitmentPool(crp.HumanFaction, 0);
        end
        Custom_Log("New Game");
    else
        Custom_Log("Existing game");
    end

    SetupListeners();
    Custom_Log_Finished();
end