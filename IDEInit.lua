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
require 'script/export_helpers__crp_z_mixu_resource_loader'
require 'script/campaign/mod/controlled_recruitment_pools'


math.randomseed(os.time())

-- This is used in game by Warhammer but we have it hear so it won't throw errors when running
-- in ZeroBrane IDE
function --Custom_Log(text)
  print(text);
end

crp = ControlledRecruitmentPools:new({
    HumanFaction = {},
    DefaultXCoordinate = 0,
    DefaultYCoordinate = 0,
});

testFaction = {
    name = function()
        return "wh2_dlc09_rogue_black_creek_raiders";
    end,
    subculture = function()
        return "wh2_dlc09_rogue_black_creek_raiders";
    end,
    character_list = function()
        return {
            num_items = function()
                return 0;
            end
        };
    end,
}

controlled_recruitment_pools();

local factionResources = crp:GetFactionResources(testFaction);
local supported = crp:IsSupportedSubCulture(testFaction:subculture()) or crp:IsRogueArmy(testFaction:name());
local currentPoolCounts = crp:GetCurrentPoolForFaction(testFaction);

--crp:SelectGeneralToGenerateFromPool(factionResources, currentPoolCounts, "GreenskinWarbosses");
crp:UpdateRecruitmentPool(testFaction, 0);