-- Mock functions
function get_cm()
    return   {
        create_agent = function()
            return;
        end,
        get_human_factions = function()
            return nil;
        end,
    };
end

require 'script/export_helpers__crp__datahelpers'
require 'script/export_helpers__crp_core_resource_loader'
require 'script/export_helpers__crp_models'
require 'script/export_helpers__crp_z_mixu_resource_loader'



math.randomseed(os.time())

-- This is used in game by Warhammer but we have it hear so it won't throw errors when running
-- in ZeroBrane IDE
function Custom_Log(text)
  print(text);
end

crp = ControlledRecruitmentPools:new({
    HumanFaction = {},
    DefaultXCoordinate = 0,
    DefaultYCoordinate = 0,
});

testFaction = {
    name = function()
        return "wh_main_sc_brt_bretonnia";
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



crp:Initialise();

local factionResources = crp:GetFactionResources(testFaction);
local currentPoolCounts = crp:GetCurrentPoolForFaction(testFaction);

--crp:SelectGeneralToGenerateFromPool(factionResources, currentPoolCounts, "GreenskinWarbosses");
--crp:UpdateRecruitmentPool(testFaction, 0);