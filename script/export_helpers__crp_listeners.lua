crp = _G.crp;

function SetupListeners()
    core:add_listener(
        "UpdateRecruitmentPool",
        "FactionTurnStart",
        function(context)
            return crp:IsSupportedSubCulture(context:faction():subculture());
        end,
        function(context)
            crp:UpdateRecruitmentPool(context:faction(), 1);
            --Custom_Log_Finished();
        end,
        true
    );
end