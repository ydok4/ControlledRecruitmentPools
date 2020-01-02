CRPUIController = {
    CRP = {},
    Logger = {},
    UIData = {},
    CharacterDetailsPanel = {
        Frame = {},
        FrameName = "CharacterDetailsFrame",
        FrameCloseButton = {},
        FrameCloseButtonName = "CharacterDetailsFrameCloseButton",
        DetailsListView = {},
        DetailsListViewName = "",
        -- Details fields
        CharacterNameText = {},
        CharacterNameTextName = "CharacterNameText",
        CharacterMountsText = {},
        CharacterMountsTextName = "CharacterMountsText",
        CharacterHomeRegionText = {},
        CharacterHomeRegionTextName = "CharacterHomeRegionText",
        CharacterPhysicalTraitsText = {},
        CharacterPhysicalTraitsTextName = "CharacterPhysicalTraitsText",
        CharacterPersonalityTraitsText = {},
        CharacterPersonalityTraitsTextName = "CharacterPersonalityTraitsText",
        CharacterBackgroundText = {},
        CharacterBackgroundTextName = "CharacterBackgroundText",
        CharacterWeaponText = {},
        CharacterOtherTrappingsText = {},
        CharacterOtherTrappingsTextName = "CharacterOtherTrappingsText",
        CharacterReligionText = {},
        CharacterReligionTextName = "CharacterReligionText",

        CharacterWeaponTextName = "CharacterWeaponText",
        CharacterArmourText = {},
        CharacterArmourTextName = "CharacterArmourText",
        CharacterMountsText = {},
        CharacterMountsTextName = "CharacterMountsText",
        CharacterBackStoryText = {},
        CharacterBackStoryTextName = "CharacterBackStoryText",
        CharacterImage = {},
        CharacterImageName = "CharacterImage",
    },
}

function CRPUIController:new (o)
    o = o or {};
    setmetatable(o, self);
    self.__index = self;
    return o;
end

function CRPUIController:InitialiseUI(crp, enableLogging)
    self.Logger = Logger:new({});
    self.Logger:Initialise("CRPUIController.txt", enableLogging);
    self.Logger:Log_Start();
    self.Logger:Log("CRPUIController Setting default values");
    self.UIData = _G.CRPUIControllerResources;
    self:InitialiseListeners(crp.HumanFaction, crp.CRPLordsInPools);
    self.CRP = crp;
    self.Logger:Log("Finished Initialising UI");
    self.Logger:Log_Finished();
end

function CRPUIController:InitialiseListeners(humanFaction, lordsInPool)
    self.Logger:Log("CRPUIController Listeners initialising");
    local humanFactionName = humanFaction:name();
    if humanFactionName == "wh_main_grn_skull-takerz" then
        humanFactionName = "wh_main_grn_skull_takerz";
    end
    local humanSubCulture = humanFaction:subculture();
    self.Logger:Log("Initialised sub culture values");
    --[[core:add_listener(
    "UnitRecruitmentOpend",
    "PanelOpenedCampaign",
    function(context)
        self.Logger:Log("OPENED: "..context.string);
        return context.string == "units_recruitment";
    end,
    function(context)
        self.Logger:Log("\n"..context.string.." opened");
        local unitList = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "recruitment_docker", "recruitment_options", "recruitment_listbox", "local1", "unit_list", "listview", "list_box");
        for j = 0, unitList:ChildCount() - 1  do
            local child = UIComponent(unitList:Find(j));
            self.Logger:Log("unit ID "..child:Id());
            local unit_cap =  find_uicomponent(child, "unit_cap");
            unit_cap:SetVisible(true);

            for k = 0, unit_cap:ChildCount() - 1  do
                local subChild = UIComponent(unit_cap:Find(k));
                self.Logger:Log("Sub child Id: "..subChild:Id());
                self.Logger:Log("Sub child text: "..subChild:GetStateText());
            end
            --local max_units =  find_uicomponent(child, "max_units");
            --max_units:SetVisible(true);
        end
    end,
    true
    );--]]
end

function CRPUIController:SetupCharacterDetailsButton(generalPanel, nameComponent, characterDetails)
    if characterDetails.Mounts ~= '' then
        local newSubcomponentId = characterDetails.ArtSetId.."_"..characterDetails.SubType.."_mounts";
        local subtypeComponent = find_uicomponent(generalPanel, "dy_subtype");
        local mountsText = find_uicomponent(subtypeComponent, newSubcomponentId);
        --local subtypeComponentText = subtypeComponent:GetStateText();
        if not mountsText then
            local mountTextCloneAddress = subtypeComponent:CopyComponent(newSubcomponentId);
            subtypeComponent:Adopt(mountTextCloneAddress);
            mountsText = UIComponent(mountTextCloneAddress);
            local subtypeX, subtypeY = subtypeComponent:Position();
            mountsText:MoveTo(subtypeX, subtypeY + 20);
        end
        local ancillaryKey = string.match(characterDetails.Mounts, "(.*)/");
        if ancillaryKey ~= 'unmounted' then
            local localisedAncillary = effect.get_localised_string("ancillaries_onscreen_name_"..ancillaryKey);
            mountsText:SetStateText("Mounts: "..localisedAncillary);
            local localisedAncillaryTooltip = effect.get_localised_string("ancillaries_colour_text_"..ancillaryKey);
            mountsText:SetTooltipText(localisedAncillaryTooltip, true);
        else
            mountsText:SetStateText("Mounts: Unmounted");
        end
        subtypeComponent:SetVisible(true);
        mountsText:SetVisible(true);

        --[[local numSubComponents = generalPanel:ChildCount() - 1;
        for i = 0, numSubComponents do
            local subComponent = UIComponent(generalPanel:Find(i));
            self.Logger:Log("Found child: "..subComponent:Id());
        end
        self.Logger:Log_Finished();--]]
        local recruitmentCostComponent = find_uicomponent(generalPanel, "RecruitmentCost", "Cost");
        local recruitmentCostText = recruitmentCostComponent:GetStateText();
        self.Logger:Log("Original recruitment cost is: "..recruitmentCostText);
        self.Logger:Log("Bonus cost is: "..characterDetails.ExtraCost);
        local recruitmentCost = tonumber(recruitmentCostText);
        local newRecruitmentCost = nil;
        if recruitmentCost ~= nil then
            newRecruitmentCost = recruitmentCost + characterDetails.ExtraCost;
            recruitmentCostComponent:SetStateText(newRecruitmentCost);
        else
            self.Logger:Log("ERROR: Recruitment cost is not an int");
        end
        self.Logger:Log_Finished();
        return newRecruitmentCost;
        --[[if characterDetails == nil then
            self.Logger:Log("Character does not have any data");
            return;
        end
        local characterNameKey = CreateValidLuaTableKey(characterDetails.Name);
        local cdpButton = Button.new("circularButton"..characterNameKey, generalPanel, "CIRCULAR", "ui/skins/default/icon_end_turn.png");
        cdpButton:PositionRelativeTo(nameComponent, generalPanel:Width() / 1.5, 0);
        cdpButton:RegisterForClick(function(context) self:SetupCharacterDetailsPanel(characterDetails); end);--]]
        --cdpButton:Resize(50, 50);
    else
        local recruitmentCostComponent = find_uicomponent(generalPanel, "RecruitmentCost", "Cost");
        local recruitmentCostText = recruitmentCostComponent:GetStateText();
        return tonumber(recruitmentCostText);
    end
end

function CRPUIController:SetupCharacterDetailsPanel(characterDetails)
    self.Logger:Log_Finished();
    self.Logger:Log("Clicked button with keyName "..characterDetails.Name);
    -- Create the frame
    local cdpFrame = Util.getComponentWithName(self.CharacterDetailsPanel.FrameName)
    if not cdpFrame then
        self.Logger:Log("Frame not found, creating it");
        self.CharacterDetailsPanel.Frame = Frame.new(self.CharacterDetailsPanel.FrameName);
        cdpFrame = self.CharacterDetailsPanel.Frame;
        cdpFrame:Scale(1.70);
        cdpFrame:SetTitle(characterDetails.Name.." Character Sheet");
        Util.centreComponentOnScreen(cdpFrame);
    else
        cdpFrame:SetTitle(characterDetails.Name.." Character Sheet");
    end
    -- Create the close button
    local cdpCloseButton = Util.getComponentWithName(self.CharacterDetailsPanel.FrameCloseButtonName);
    if cdpCloseButton then
        cdpCloseButton:SetVisible(true);
    else
        self.CharacterDetailsPanel.FrameCloseButton = self:SetupFrameCloseButton(cdpFrame, self.CharacterDetailsPanel.FrameCloseButtonName);
        cdpCloseButton = self.CharacterDetailsPanel.FrameCloseButton;
    end

    local detailsListView = Util.getComponentWithName(self.CharacterDetailsPanel.DetailsListViewName);
    if detailsListView then
        self.Logger:Log("List view already exists");
        -- Set the ui data
        self:SetDataForCharacter(characterDetails);
        -- Make the list visible
        detailsListView:SetVisible(true);
    else
        self.Logger:Log("Creating new list");
        detailsListView = ListView.new(self.CharacterDetailsPanel.DetailsListViewName, cdpFrame, "HORIZONTAL");
        -- Add the content
        -- Setup containers so we can use the FlowLayouts for easy formatting
        local frameContainerRows = Container.new(FlowLayout.VERTICAL);
        --local frameContainerColumns = Container.new(FlowLayout.HORIZONTAL);
        self.Logger:Log("Made containers");
        -- Add the character Name field
        self.CharacterDetailsPanel.CharacterNameText = Text.new(self.CharacterDetailsPanel.CharacterNameTextName, cdpFrame, "NORMAL", "");
        local characterNameTextObject = self.CharacterDetailsPanel.CharacterNameText;
        frameContainerRows:AddComponent(characterNameTextObject);
        self.Logger:Log("Added name text");
        -- Add the character Social Class field
        self.CharacterDetailsPanel.CharacterMountsText = Text.new(self.CharacterDetailsPanel.CharacterMountsTextName, cdpFrame, "NORMAL", "");
        local characterMountsTextObject = self.CharacterDetailsPanel.CharacterMountsText;
        frameContainerRows:AddComponent(characterMountsTextObject);
        self.Logger:Log("Added Social class text");
        -- Add the character Home Region field
        self.CharacterDetailsPanel.CharacterHomeRegionText = Text.new(self.CharacterDetailsPanel.CharacterHomeRegionTextName, cdpFrame, "NORMAL", "");
        local characterHomeRegionTextObject = self.CharacterDetailsPanel.CharacterHomeRegionText;
        frameContainerRows:AddComponent(characterHomeRegionTextObject);
        self.Logger:Log("Added home region text");
        -- Add the character Physical Traits field
        self.CharacterDetailsPanel.CharacterPhysicalTraitsText = Text.new(self.CharacterDetailsPanel.CharacterPhysicalTraitsTextName, cdpFrame, "NORMAL", "");
        local CharacterPhysicalTraitsTextObject = self.CharacterDetailsPanel.CharacterPhysicalTraitsText;
        frameContainerRows:AddComponent(CharacterPhysicalTraitsTextObject);
        self.Logger:Log("Added physical traits text");
        -- Add the character Personality Traits field
        self.CharacterDetailsPanel.CharacterPersonalityTraitsText = Text.new(self.CharacterDetailsPanel.CharacterPersonalityTraitsTextName, cdpFrame, "NORMAL", "");
        local characterPersonalityTraitsTextObject = self.CharacterDetailsPanel.CharacterPersonalityTraitsText;
        frameContainerRows:AddComponent(characterPersonalityTraitsTextObject);
        self.Logger:Log("Added personality traits text");
        -- Add the character Background field
        self.CharacterDetailsPanel.CharacterBackgroundText = Text.new(self.CharacterDetailsPanel.CharacterBackgroundTextName, cdpFrame, "NORMAL", "");
        local characterBackgroundTextObject = self.CharacterDetailsPanel.CharacterBackgroundText;
        frameContainerRows:AddComponent(characterBackgroundTextObject);
        self.Logger:Log("Added background text");
        -- Add the character Other trappings field
        self.CharacterDetailsPanel.CharacterOtherTrappingsText = Text.new(self.CharacterDetailsPanel.CharacterOtherTrappingsTextName, cdpFrame, "NORMAL", "");
        local characterOtherTrappingsTextObject = self.CharacterDetailsPanel.CharacterOtherTrappingsText;
        frameContainerRows:AddComponent(characterOtherTrappingsTextObject);
        self.Logger:Log("Added other trappings text");
        -- Add the character Other trappings field
        self.CharacterDetailsPanel.CharacterReligionText = Text.new(self.CharacterDetailsPanel.CharacterReligionTextName, cdpFrame, "NORMAL", "");
        local characterReligionTextObject = self.CharacterDetailsPanel.CharacterReligionText;
        frameContainerRows:AddComponent(characterReligionTextObject);
        self.Logger:Log("Added religion text");
        -- Add the character Weapon(s) Field
        --[[self.CharacterDetailsPanel.CharacterWeaponText = Text.new(self.CharacterDetailsPanel.CharacterWeaponTextName, cdpFrame, "NORMAL", characterName);
        local characterWeaponTextObject = self.CharacterDetailsPanel.CharacterWeaponText;
        frameContainerRows:AddComponent(characterWeaponTextObject);
        -- Add the character Armour Field
        self.CharacterDetailsPanel.CharacterArmourText = Text.new(self.CharacterDetailsPanel.CharacterArmourTextName, cdpFrame, "NORMAL", characterName);
        local characterArmourTextObject = self.CharacterDetailsPanel.CharacterArmourText;
        frameContainerRows:AddComponent(characterArmourTextObject);
        -- Add the character Mounts field
        self.CharacterDetailsPanel.CharacterMountsText = Text.new(self.CharacterDetailsPanel.CharacterMountsTextName, cdpFrame, "NORMAL", characterName);
        local characterMountsTextObject = self.CharacterDetailsPanel.CharacterMountsText;
        frameContainerRows:AddComponent(characterMountsTextObject);
        -- Add the character Backstory field
        self.CharacterDetailsPanel.CharacterBackStoryText = Text.new(self.CharacterDetailsPanel.CharacterBackStoryTextName, cdpFrame, "NORMAL", characterName);
        local characterBackStoryTextObject = self.CharacterDetailsPanel.CharacterBackStoryText;
        frameContainerRows:AddComponent(characterBackStoryTextObject);
        -- Add the character Image field
        self.CharacterDetailsPanel.CharacterImage = Image.new("normalImage", cdpFrame, "ui/skins/default/advisor_beastmen_2d.png");
        local characterImageObject = self.CharacterDetailsPanel.CharacterImage;
        frameContainerRows:AddComponent(characterImageObject);--]]

        self:SetDataForCharacter(characterDetails);
        local fX, fY = cdpFrame:Bounds();
        detailsListView:Resize(fX*(1/3), fY/2);
        --frameContainerRows:PositionRelativeTo(detailsListView, generalPanel:Width() / 0.5, 0);
        detailsListView:AddContainer(frameContainerRows);
        -- Centre the root container on the frame
        Util.centreComponentOnComponent(detailsListView, cdpFrame);
        self.Logger:Log("Centred containers on frame");
    end

    -- Hide any existing panels
    self:SetPanelStatus(false);
    -- Set the frame as visible
    cdpFrame:SetVisible(true);
    self.Logger:Log("Finished button click");
end

function CRPUIController:SetDataForCharacter(characterDetails)
    self.Logger:Log("Setting character data");
    self.CharacterDetailsPanel.CharacterNameText:SetText(characterDetails.Name);
    self.CharacterDetailsPanel.CharacterMountsText:SetText(characterDetails.Mounts);
    self.CharacterDetailsPanel.CharacterHomeRegionText:SetText(characterDetails.HomeRegion);
    self.CharacterDetailsPanel.CharacterPhysicalTraitsText:SetText("Physical Traits");
    self.CharacterDetailsPanel.CharacterPersonalityTraitsText:SetText("Personality Traits");
    self.CharacterDetailsPanel.CharacterBackgroundText:SetText("Background");
    self.CharacterDetailsPanel.CharacterOtherTrappingsText:SetText("Other trappings");
    self.CharacterDetailsPanel.CharacterReligionText:SetText("Religion");
    self.Logger:Log("Finished setting character data");
end

function CRPUIController:SetupFrameCloseButton(frame, buttonName)
    local frameCloseButton = Button.new(buttonName, frame, "CIRCULAR", "ui/skins/default/icon_check.png");
    local frameWidth, frameHeight = frame:Bounds();
    local buttonWidth, buttonHeight = frameCloseButton:Bounds();
    frameCloseButton:PositionRelativeTo(frame, (frameWidth / 2) - (buttonWidth / 2), frameHeight - (buttonHeight *2 ));
    frameCloseButton:RegisterForClick(function(context) self:CloseFrame(frame); end);
    return frameCloseButton;
end

function CRPUIController:CloseFrame(frame)
    -- Set the custom frame as invisible
    frame:SetVisible(false);
    -- Re show any relevant panels
    self:SetPanelStatus(true);
end

function CRPUIController:SetPanelStatus(status)
    local layoutPanel = find_uicomponent(core:get_ui_root(), "layout");
    if layoutPanel then
        layoutPanel:SetVisible(status);
    end
    local settlementPanel = find_uicomponent(core:get_ui_root(), "settlement_panel");
    if settlementPanel then
        settlementPanel:SetVisible(status);
    end
    local unitsPanel = find_uicomponent(core:get_ui_root(), "units_panel");
    if unitsPanel then
        unitsPanel:SetVisible(status);
    end
    local characterPanel = find_uicomponent(core:get_ui_root(), "character_panel");
    if characterPanel then
        characterPanel:SetVisible(status);
    end
end


function CRPUIController:BuildTraitNameString(traitKey)
    --self.Logger:Log("Trait key: "..traitKey);
    local traitName = effect.get_localised_string("character_trait_levels_onscreen_name_"..traitKey);
    return traitName;
end

function CRPUIController:BuildTraitLocString(traitKey, traitName)
    local formattedTraitName = self:GetFommattedTraitName(traitName);
    local traitDescription = formattedTraitName.."\n"..effect.get_localised_string("character_trait_levels_colour_text_"..traitKey);
    local traitData = self:GetTraitEffects(traitKey);
    --self.Logger:Log("Get trait data");
    if traitData ~= nil then
        for effectIndex, effectKey in pairs(traitData.Effects) do
            local effectData = self:GetEffectData(effectKey);
            --self.Logger:Log("Got effect data for key "..effectKey);
            local effectLoc = effect.get_localised_string("effects_description_"..effectKey);
            if string.find(effectLoc, "[HIDDEN]") == nil then 
                --self.Logger:Log("Got effect loc "..effectLoc);
                local effectValue = tonumber(traitData.Values[effectIndex]);
                --self.Logger:Log("Effect value "..effectValue);
                local effectSign = "";
                if effectValue > 0 then
                    effectSign = "+";
                else
                    effectSign = "";
                end

                effectLoc = effectLoc:gsub("%%%+n", effectSign .. tostring(effectValue));
                effectLoc = effectLoc:gsub("%+n%", effectValue);

                --self.Logger:Log("Added Image and subbed "..effectLoc);
                if (effectData.IsPositiveGood == "true" and effectValue > 0) or (effectData.IsPositiveGood == "false" and effectValue < 0) then
                    effectLoc = "[[col:green]]"..effectLoc.."[[/col]]";
                    effectLoc = "[[img:".."ui/campaign ui/effect_bundles/"..effectData.IconPositive.."]][[/img]]   "..effectLoc;
                else
                    effectLoc = "[[col:red]]"..effectLoc.."[[/col]]";
                    effectLoc = "[[img:".."ui/campaign ui/effect_bundles/"..effectData.IconNegative.."]][[/img]]   "..effectLoc;
                end
                --self.Logger:Log("Set colour "..effectLoc);
                --self.Logger:Log("Set image");
                traitDescription = traitDescription.."\n"..effectLoc;
                --self.Logger:Log("Completed loc "..effectLoc);
            end
        end
    end
    return traitDescription;
end

function CRPUIController:GetFommattedTraitName(traitName)
    local headingPadding = "                                        ";
    local headingPaddingLength = headingPadding:len();
    local traitNameLength = traitName:len();
    local formattedTraitName = headingPadding:sub(1, math.floor(headingPaddingLength - (traitNameLength/2-1)))..traitName..headingPadding:sub(1, math.ceil(headingPaddingLength - (traitNameLength/2-1)));

    return formattedTraitName;
end

function CRPUIController:GetTraitEffects(traitKey)
    local effects = self.UIData.DBResources.trait_level_effects[traitKey];
    return effects;
end

function CRPUIController:GetEffectData(effectKey)
    local effectData = self.UIData.DBResources.effects[effectKey];
    return effectData;
end

function CRPUIController:GetImagePathForTrait(traitKey)
    local traitData = self.UIData.DBResources.trait_level_effects[traitKey];
    if traitData ~= nil then
        return "ui/campaign ui/skills/"..traitData.Icon;
    end
    return "";
end

function CRPUIController:RemoveFileExtension(fileName)
    return fileName:match("(.+)%..+");
end