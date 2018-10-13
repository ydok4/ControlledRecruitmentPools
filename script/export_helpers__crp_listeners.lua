crp = _G.crp;

function SetupListeners()
    core:add_listener(
        "UpdateRecruitmentPool",
        "FactionTurnStart",
        function(context)
            Custom_Log("Checking faction: "..tostring(context:faction():name()));
            return crp:IsSupportedSubCulture(context:faction():subculture()) or crp:IsRogueArmy(context:faction():name());
        end,
        function(context)
            if context:faction():subculture() == "rebels" then
                Custom_Log("Updating rebels");
            else
                crp:UpdateRecruitmentPool(context:faction(), 1);
            end
            Custom_Log_Finished();
        end,
        true
    );
end