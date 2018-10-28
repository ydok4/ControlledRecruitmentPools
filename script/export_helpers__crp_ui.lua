CRPUI = {
    UIData = {}
}

function CRPUI:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function CRPUI:InitialiseUI(humanFaction, lordsInPool)
    Custom_Log("CRPUI Setting default values");
    self.UIData = _G.CRPUIResources;
    self:InitialiseListeners(humanFaction, lordsInPool);
end

function CRPUI:InitialiseListeners(humanFaction, lordsInPool)
    Custom_Log("CRPUI Listeners initialising");
    local humanFactionName = humanFaction:name();
    if humanFactionName == "wh_main_grn_skull-takerz" then
        humanFactionName = "wh_main_grn_skull_takerz";
    end
    local humanSubCulture = humanFaction:subculture();
    core:add_listener(
        "GeneralRecruitmentOpened",
        "PanelOpenedCampaign",
        function(context)
            return context.string == "character_panel";
        end,
        function(context)
            Custom_Log("\nPanel Opened");
            self:GetGeneralCandidates(humanFactionName, humanSubCulture, lordsInPool);
        end,
        true
    );
    Custom_Log("Created panel opened listener");

    core:add_listener(
        "GeneralRecruitmentClosed",
        "PanelClosedCampaign",
        function(context)
            return context.string == "character_panel";
        end,
        function(context)
            Custom_Log("Panel closed");
        end,
        true
    );
end

function CRPUI:GetGeneralCandidates(humanFactionName, humanSubCulture, lordsInPool)
    local generalsList = find_uicomponent(core:get_ui_root(), "character_panel", "general_selection_panel", "character_list_parent", "character_list", "listview", "list_clip", "list_box");
        if generalsList then
            for i = 0, generalsList:ChildCount() - 1  do
                local generalPanel = UIComponent(generalsList:Find(i));

                local name = find_uicomponent(generalPanel, "dy_name"):GetStateText();
                local skillIcon = find_uicomponent(generalPanel, "icon_background_skill");

                local keyName = name:gsub("%s+", "");
                if lordsInPool[humanFactionName] ~= nil then
                    if lordsInPool[humanFactionName][keyName] ~= nil then
                        local poolData = lordsInPool[humanFactionName][keyName];
                        Custom_Log("General Found In List "..keyName);
                        local traitKey = poolData.InnateTrait;
                        --Custom_Log("Trait Key: "..traitKey);
                        local traitName = self:BuildTraitNameString(traitKey);
                        --Custom_Log("Trait Name: "..traitName);
                        local traitDescription = self:BuildTraitLocString(traitKey, traitName);
                        --Custom_Log("Built trait description");
                        local traitImagePath = self:GetImagePathForTrait(traitKey);
                        --Custom_Log("trait image path: "..traitImagePath);
                        --Custom_Log("TraitName: "..traitName);
                        skillIcon:SetStateText(traitName);
                        skillIcon:SetTooltipText(traitDescription);
                        skillIcon:SetImage(traitImagePath);
                        skillIcon:SetVisible(true);
                    end
                else
                    Custom_Log("Human subculture has no data "..humanFactionName);
                end

                local toolTipText = skillIcon:GetTooltipText();
            end
        end
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
            if effectData[3] and effectValue > 0 then
                effectLoc = "[[col:green]]"..effectLoc.."[[/col]]";
            else
                effectLoc = "[[col:red]]"..effectLoc.."[[/col]]";
            end
            --Custom_Log("Set colour "..effectLoc);
            effectLoc = "[[img:".."ui/campaign ui/effect_bundles/"..effectData[1].."]][[/img]]   "..effectLoc;
            --Custom_Log("Set image");
            traitDescription = traitDescription.."\n"..effectLoc;
            --Custom_Log("Completed loc "..effectLoc);
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