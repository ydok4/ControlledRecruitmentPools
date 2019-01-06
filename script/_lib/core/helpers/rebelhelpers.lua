function GetRebelFactionForRegionAndFaction(region, faction)
    
end

function GetSubCultureFromUnitList(unitList, region)
    Custom_Log("Getting sub culture from unit list");
    if string.match(unitList, "wh_main_grn") then
        return "wh_main_sc_grn_greenskins";
    elseif string.match(unitList, "wh_main_emp") then
        return "wh_main_sc_emp_empire";
    elseif string.match(unitList, "wh_main_dwf") then
        return "wh_main_sc_dwf_dwarfs";
    elseif string.match(unitList, "wh_main_vmp") then
        return "wh_main_sc_vmp_vampire_counts";
    elseif string.match(unitList, "wh_dlc03_bst") then
        return "wh_dlc03_sc_bst_beastmen";
    elseif string.match(unitList, "wh_dlc05_wef") then
        return "wh_dlc05_sc_wef_wood_elves";
    elseif string.match(unitList, "wh_main_brt") then
        return "wh_main_sc_brt_bretonnia";
    elseif string.match(unitList, "wh_main_nor") or string.match(unitList, "wh_dlc08_nor") then
        return "wh_main_sc_nor_norsca";
    elseif string.match(unitList, "wh_main_chs") or string.match(unitList, "wh_dlc01_chs") then
        return "wh_main_sc_chs_chaos";
    elseif string.match(unitList, "wh2_main_skv") then
        return "wh2_main_sc_skv_skaven";
    elseif string.match(unitList, "wh2_main_def") then
        return "wh2_main_sc_def_dark_elves";
    elseif string.match(unitList, "wh2_main_lzd") then
        return "wh2_main_sc_lzd_lizardmen";
    elseif string.match(unitList, "wh2_main_hef") then
        return "wh2_main_sc_hef_high_elves";
    -- Tomb Kings aren't supported as of yet
    --elseif string.match(unitList, "wh2_dlc09_tmb") then
    --    return "";
    elseif string.match(unitList, "wh2_dlc11_cst") then
        return "wh2_dlc11_sc_cst_vampire_coast";
    end
    return nil;
end

function GetValidNonActiveFactionForSubCulture(crp, subcultureKey)
    Custom_Log("Starting GetValidNonActiveFactionForSubCulture");
    local faction_list = cm:model():world():faction_list();
	local validFactionList = {};
	for i = 0, faction_list:num_items() - 1 do
		local faction = faction_list:item_at(i);
		if faction:subculture() == subcultureKey and faction:is_quest_battle_faction() == false then
            if (crp:IsSupportedSubCulture(faction:subculture()) or crp:IsRogueArmy(faction:name())) and crp:IsExcludedFaction(faction) == false
            and cm:faction_is_alive(faction) == false then
				validFactionList[#validFactionList + 1] = faction:name();
			end;
		end;
    end;

    local selectedFactionKey = GetRandomObjectFromList(validFactionList);
    Custom_Log("Selected faction "..selectedFactionKey);
    return selectedFactionKey;
end