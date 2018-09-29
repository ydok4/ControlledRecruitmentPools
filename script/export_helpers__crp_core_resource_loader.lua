require 'script/_lib/DarkElfRecruitmentPools'
require 'script/_lib/GreenskinRecruitmentPools'
require 'script/_lib/SavageOrcRecruitmentPools'


Custom_Log("Loading Core Data")

_G.CRPResources = {
    CultureResources = {
        -- Dark Elves
        wh2_main_sc_def_dark_elves = DarkElfRecruitmentPoolData,
        -- Greenskins
        wh_main_sc_grn_greenskins = GreenskinRecruitmentPoolData,
        wh_main_sc_grn_savage_orcs = SavageOrcRecruitmentPoolData,
    },
    -- Additional loader function
    -- This is intended to be used by other mods to load custom data.
    -- This can be used to change agent sub type distribution or add
    -- new agent sub types into the system.
    AddAdditionalResources = function (subculture, resources)
        local coreResources = _G.CRPResources.CultureResources[subculture];

        for key1, additionalFactionData in pairs(resources) do
            for key2, additionalSubPoolData in pairs(additionalFactionData.FactionPools) do
                if type(additionalSubPoolData) == "table" then
                    local existingData = coreResources[key1].FactionPools[key2];
                    if existingData == nil then
                        coreResources[key1].FactionPools[key2] = additionalSubPoolData; 
                    else
                        local additionalAgenySubTypes = {};
                        for key3, subPool in pairs(additionalSubPoolData.AgentSubTypes) do
                            -- If an agent has been marked for deletion from a pool
                            if subPool == false then
                                existingData.AgentSubTypes[key3] = nil;
                            else
                                additionalAgenySubTypes[key3] = subPool;
                            end
                        end
                        -- Add all the new agent sub types
                        ConcatTableWithKeys(existingData.AgentSubTypes, additionalAgenySubTypes);
                        existingData.SubPoolMaxSize = additionalSubPoolData.SubPoolMaxSize;
                    end
                -- If a pool has been marked for deletion or there are no longer any agent
                -- subTypes in it, remove the data
                elseif additionalSubPoolData == false or TableHasAnyValue(coreResources[key1].FactionPools[key2]) == false then
                    coreResources[key1].FactionPools[key2] = nil;
                end
            end
        end
    end,
}