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
    local humanSubCulture = humanFaction:subculture();
    core:add_listener(
        "GeneralRecruitmentOpened",
        "PanelOpenedCampaign",
        function(context)
            return context.string == "character_panel";
        end,
        function(context)
            Custom_Log("Panel Opened");
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
                        Custom_Log("General Found In List "..keyName);
                        local poolData = lordsInPool[humanFactionName][keyName];
                        local traitName = effect.get_localised_string("character_trait_levels_onscreen_name_"..poolData.InnateTrait);
                        local traitDescription = traitName.."\n"..effect.get_localised_string("character_trait_levels_colour_text_"..poolData.InnateTrait);
                        local traitImagePath = self:GetImagePathForTrait(humanSubCulture, poolData.InnateTrait);
                        Custom_Log("TraitName: "..traitName);
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

function CRPUI:GetImagePathForTrait(humanSubCulture, traitKey)
    local subCultureUIData = self.UIData.CulturePoolResources[humanSubCulture];
    if subCultureUIData ~= nil and subCultureUIData.Traits[traitKey] ~= nil then
        Custom_Log("Found Culture UI Data "..subCultureUIData.IconPath);
        return subCultureUIData.IconPath;
    elseif self.UIData.CulturePoolResources["shared"].Traits[traitKey] ~= nil then
        Custom_Log("Found Culture UI Data "..subCultureUIData.IconPath);
        return subCultureUIData.IconPath;
    end
    return "";
end