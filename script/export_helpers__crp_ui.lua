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
            Custom_Log("\n"..context.string.." opened");
            local uiContext = context.string;
            cm:callback(function()
                local generalsList = find_uicomponent(core:get_ui_root(), "character_panel", "general_selection_panel", "character_list_parent", "character_list", "listview", "list_clip", "list_box");
                self:GetGeneralCandidates(humanFactionName, humanSubCulture, generalsList, lordsInPool);
            end,
            0);
        end,
        true
    );

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
    Custom_Log("Created panel opened listener");

    core:add_listener(
        "ClickedReplaceButton",
        "ComponentLClickUp",
        function(context)
            return context.string == "button_replace_general";
        end,
        function(context)
            Custom_Log("Clicked replace");
            cm:callback(function()
                local generalsList = find_uicomponent(core:get_ui_root(), "character_details_panel", "general_selection_panel", "character_list", "listview", "list_clip", "list_box");
                --self:GetGeneralCandidates(humanFactionName, humanSubCulture, generalsList, lordsInPool);
            end,
            0);
        end,
        true
    );

    core:add_listener(
        "GeneralRecruitmentClosed",
        "PanelClosedCampaign",
        function(context)
            return context.string == "character_panel"
            or context.string == "appoint_new_general"
            or context.string == "character_details_panel";
        end,
        function(context)
            Custom_Log("Panel closed\n");
        end,
        true
    );
end

function CRPUI:GetGeneralCandidates(humanFactionName, humanSubCulture, generalsList, lordsInPool)
        local factionIntrigue = 0;
        local charIsSelected = false;
        if humanSubCulture == "wh2_main_sc_hef_high_elves" then
            --cm:trigger_incident(humanFactionName, "wh2_main_hef_add_influence", true);
            local intrigueText = find_uicomponent(core:get_ui_root(), "layout", "resources_bar", "topbar_list_parent", "dy_intrigue"):GetStateText();
            factionIntrigue = tonumber(intrigueText);
        end

        if generalsList and generalsList:ChildCount() > 0 then
            Custom_Log("There are "..generalsList:ChildCount().." in the list");
            for i = 0, generalsList:ChildCount() - 1  do
                local generalPanel = UIComponent(generalsList:Find(i));

                local name = find_uicomponent(generalPanel, "dy_name"):GetStateText();
                local keyName = "";
                keyName = CreateValidLuaTableKey(name);
                if humanSubCulture == "wh2_main_sc_hef_high_elves" then
                    local intrigueCostContainer = find_uicomponent(generalPanel, "IntrigueCost");
                    if intrigueCostContainer ~= nil then
                        local intrigueCost = find_uicomponent(intrigueCostContainer, "Cost");
                        if intrigueCost ~= nil then
                            Custom_Log("Checking "..keyName);
                            local poolData = lordsInPool[humanFactionName][keyName];
                            if poolData then
                                if poolData.SubType == "wh2_main_hef_prince_mid" or poolData.SubType == "wh2_main_hef_princess_mid" then
                                    Custom_Log("Lord is mid prince or princess");
                                    intrigueCost:SetStateText("15");
                                    intrigueCostContainer:SetVisible(true);
                                    if factionIntrigue < 15 then
                                        generalPanel:SetState("inactive");
                                    else
                                        charIsSelected = true;
                                    end
                                elseif poolData.SubType == "wh2_main_hef_prince_high"or poolData.SubType == "wh2_main_hef_princess_high" then
                                    Custom_Log("Lord is high prince or princess");
                                    intrigueCost:SetStateText("60");
                                    intrigueCostContainer:SetVisible(true);
                                    if factionIntrigue < 60 then
                                        generalPanel:SetState("inactive");
                                    else
                                        charIsSelected = true;
                                    end
                                elseif charIsSelected == false then
                                    Custom_Log("Setting lord as selected "..keyName);
                                    generalPanel:SetState("selected");
                                    charIsSelected = true;
                                end
                            end
                        else
                            Custom_Log("Intrigue cost is nil");
                        end
                    else
                        Custom_Log("Intrigue container is nil");
                    end
                -- High Elves require manually tracking of whether or not a character is selected
                -- because we need to disable lords if the player does not meet the influence cost
                -- for everyone else this isn't a problem (yet).
                else
                    charIsSelected = true;
                end

                --[[for j = 0, generalPanel:ChildCount() - 1  do
                    local child = UIComponent(generalPanel:Find(j));
                    Custom_Log("generalPanel ID "..child:Id());
                    for k = 0, child:ChildCount() - 1  do
                        local subChild = UIComponent(child:Find(k));
                        Custom_Log("Sub child Id: "..subChild:Id());
                        --Custom_Log(subChild:GetTooltipText());
                    end
                end--]]
                local skillIcon = find_uicomponent(generalPanel, "icon_background_skill");
                --[[if lordsInPool[humanFactionName] ~= nil then
                    Custom_Log("Checking Key: "..keyName);
                    if lordsInPool[humanFactionName][keyName] ~= nil then
                        local poolData = lordsInPool[humanFactionName][keyName];
                        Custom_Log("General Found In List "..keyName);
                        local traitKey = poolData.InnateTrait;
                        Custom_Log("Trait Key: "..traitKey);
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

                local toolTipText = skillIcon:GetTooltipText();--]]
            end

            if charIsSelected == false then
                Custom_Log("No character can be recruited");
                local raiseForcesButton = find_uicomponent(core:get_ui_root(), "character_panel", "raise_forces_options", "button_raise");
                raiseForcesButton:SetState("inactive");
            end
        else
            Custom_Log("There are no generals in the list");
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