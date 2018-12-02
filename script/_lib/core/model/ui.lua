CRPUI = {
    UIData = {}
}

function CRPUI:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function CRPUI:InitialiseUI()
    Custom_Log("CRPUI Setting default values");
    self.UIData = _G.CRPUIResources;
   -- self:InitialiseListeners(humanFaction, lordsInPool);
    Custom_Log("Finished Initialising UI");
end

function CRPUI:InitialiseListeners(humanFaction, lordsInPool)
    Custom_Log("CRPUI Listeners initialising");
    local humanFactionName = humanFaction:name();
    Custom_Log("Got human faction name");
    if humanFactionName == "wh_main_grn_skull-takerz" then
        humanFactionName = "wh_main_grn_skull_takerz";
    end
    local humanSubCulture = humanFaction:subculture();
    Custom_Log("Initialised sub culture values");

    --[[core:add_listener(
    "UnitRecruitmentOpend",
    "PanelOpenedCampaign",
    function(context)
        Custom_Log("OPENED: "..context.string);
        return context.string == "units_recruitment";
    end,
    function(context)
        Custom_Log("\n"..context.string.." opened");
        local unitList = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "recruitment_docker", "recruitment_options", "recruitment_listbox", "local1", "unit_list", "listview", "list_box");
        for j = 0, unitList:ChildCount() - 1  do
            local child = UIComponent(unitList:Find(j));
            Custom_Log("unit ID "..child:Id());
            local unit_cap =  find_uicomponent(child, "unit_cap");
            unit_cap:SetVisible(true);

            for k = 0, unit_cap:ChildCount() - 1  do
                local subChild = UIComponent(unit_cap:Find(k));
                Custom_Log("Sub child Id: "..subChild:Id());
                Custom_Log("Sub child text: "..subChild:GetStateText());
            end
            --local max_units =  find_uicomponent(child, "max_units");
            --max_units:SetVisible(true);
        end
    end,
    true
    );--]]
end

function CRPUI:BuildTraitNameString(traitKey)
    --Custom_Log("Trait key: "..traitKey);
    local traitName = effect.get_localised_string("character_trait_levels_onscreen_name_"..traitKey);
    return traitName;
end

function CRPUI:BuildTraitLocString(traitKey, traitName)
    local formattedTraitName = self:GetFommattedTraitName(traitName);
    local traitDescription = formattedTraitName.."\n"..effect.get_localised_string("character_trait_levels_colour_text_"..traitKey);
    local traitData = self:GetTraitEffects(traitKey);
    --Custom_Log("Get trait data");
    if traitData ~= nil then
        for effectIndex, effectKey in pairs(traitData.Effects) do
            local effectData = self:GetEffectData(effectKey);
            --Custom_Log("Got effect data for key "..effectKey);
            local effectLoc = effect.get_localised_string("effects_description_"..effectKey);
            if string.find(effectLoc, "[HIDDEN]") == nil then 
                --Custom_Log("Got effect loc "..effectLoc);
                local effectValue = tonumber(traitData.Values[effectIndex]);
                --Custom_Log("Effect value "..effectValue);
                local effectSign = "";
                if effectValue > 0 then
                    effectSign = "+";
                else
                    effectSign = "";
                end

                effectLoc = effectLoc:gsub("%%%+n", effectSign .. tostring(effectValue));
                effectLoc = effectLoc:gsub("%+n%", effectValue);

                --Custom_Log("Added Image and subbed "..effectLoc);
                if (effectData.IsPositiveGood == "true" and effectValue > 0) or (effectData.IsPositiveGood == "false" and effectValue < 0) then
                    effectLoc = "[[col:green]]"..effectLoc.."[[/col]]";
                    effectLoc = "[[img:".."ui/campaign ui/effect_bundles/"..effectData.IconPositive.."]][[/img]]   "..effectLoc;
                else
                    effectLoc = "[[col:red]]"..effectLoc.."[[/col]]";
                    effectLoc = "[[img:".."ui/campaign ui/effect_bundles/"..effectData.IconNegative.."]][[/img]]   "..effectLoc;
                end
                --Custom_Log("Set colour "..effectLoc);
                
                --Custom_Log("Set image");
                traitDescription = traitDescription.."\n"..effectLoc;
                --Custom_Log("Completed loc "..effectLoc);
            end
        end
    end
    return traitDescription;
end

function CRPUI:GetFommattedTraitName(traitName)
    local headingPadding = "                                        ";
    local headingPaddingLength = headingPadding:len();
    local traitNameLength = traitName:len();
    local formattedTraitName = headingPadding:sub(1, math.floor(headingPaddingLength - (traitNameLength/2-1)))..traitName..headingPadding:sub(1, math.ceil(headingPaddingLength - (traitNameLength/2-1)));

    return formattedTraitName;
end

function CRPUI:GetTraitEffects(traitKey)
    local effects = self.UIData.DBResources.trait_level_effects[traitKey];
    return effects;
end

function CRPUI:GetEffectData(effectKey)
    local effectData = self.UIData.DBResources.effects[effectKey];
    return effectData;
end

function CRPUI:GetImagePathForTrait(traitKey)
    local traitData = self.UIData.DBResources.trait_level_effects[traitKey];
    if traitData ~= nil then
        return "ui/campaign ui/skills/"..traitData.Icon;
    end
    return "";
end

function CRPUI:RemoveFileExtension(fileName)
    return fileName:match("(.+)%..+");
end