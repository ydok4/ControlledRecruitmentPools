pm = {};

function InitialisePoolModifier()
    pm = PoolModifier:new({

    });
end

function CRP_PoolModifierListeners(crp, core)
	crp.Logger:Log("Setting up pool modifier listeners");
	-- This handles generic diplomacy rewards
    core:add_listener(
		"CRP_DiplomacyLordImpacts",
		"PositiveDiplomaticEvent",
		function(context)
            local recipient = context:recipient();
			local isRecipientSupported = (IsSupportedSubCulture(recipient:subculture())
			or IsRogueArmy(recipient:name()))
			and crp:IsExcludedFaction(recipient) == false;

			local proposer = context:proposer();
			local isProposerSupported = (IsSupportedSubCulture(proposer:subculture())
			or IsRogueArmy(proposer:name()))
			and crp:IsExcludedFaction(proposer) == false;

			return isRecipientSupported == true
			and isProposerSupported == true;
		end,
		function(context)
			crp.Logger:Log("Received positive diplomatic event for supported factions");
            local proposer = context:proposer();
            local recipient = context:recipient();

            if proposer:subculture() == recipient:subculture() then
                crp.Logger:Log("Matching culture, checking for pool changes");
				if context:is_alliance() then
					crp.Logger:Log("Is Alliance");
					--crp.Logger:Log("Before getting rewards for proposer "..proposer:name());
					CheckAndReceiveRewards(proposer, recipient, "alliance");
					--crp.Logger:Log("Before getting rewards for receiver "..recipient:name());
					CheckAndReceiveRewards(recipient, proposer, "alliance");
                end
			end
			crp.Logger:Log("Finished positive diplomatic event");
		end,
		true
	);

	core:add_listener(
        "CRP_CheckHordeBuildingRewards",
        "MilitaryForceBuildingCompleteEvent",
		function(context)
			crp.Logger:Log_Finished();
            local faction = context:character():faction();
            local factionName = faction:name();
            return (IsSupportedSubCulture(faction:subculture()) or IsRogueArmy(factionName)) and crp:IsExcludedFaction(faction) == false;
        end,
        function(context)
            local faction = context:character():faction();
            CheckAndReceiveRewards(faction, faction, context:building());
        end,
        true
	);

	core:add_listener(
        "CRP_UpdateBuildingFactionPoolLimits",
        "FactionTurnStart",
        function(context)
            local faction = context:faction();
            local factionName = faction:name();
            return (IsSupportedSubCulture(faction:subculture())
            or (IsRogueArmy(factionName)) and crp:IsExcludedFaction(faction) == false);
        end,
        function(context)
            local faction = context:faction();
			local regionList = faction:region_list();
			local buildingCache = {};
			-- For every region the player controls
			for i = 0, regionList:num_items() - 1 do
				local region = regionList:item_at(i);
				local settlementSlotList = region:settlement():slot_list();
				for j = 0, settlementSlotList:num_items() - 1 do
					local slot = settlementSlotList:item_at(j);
					local building = slot:building();
					local buildingChainKey = building:chain();
					if buildingCache[buildingChainKey] == nil then
						buildingCache[buildingChainKey] = {
							Amount = 0,
							AmountWithLevels = 0,
						};
					end
					buildingCache[buildingChainKey] = {
						Amount = buildingCache[buildingChainKey].Amount + 1,
						AmountWithLevels = buildingCache[buildingChainKey].AmountWithLevels + building:building_level(),
					};
				end
			end
			for buildingChainKey, buildingCacheData in pairs(buildingCache) do
				CheckAndReceiveRewards(faction, faction, buildingChainKey, buildingCacheData);
			end
        end,
        true
    );

	-- Mortal Empires only listeners
	if cm:get_campaign_name() == "main_warhammer" then
		-- These listeners are specifically for Belegar
		local region = cm:get_region("wh_main_eastern_badlands_karak_eight_peaks");
		local receivedBelegarReward = cm:get_saved_value("CRP_Belegar_received_reward");
		if not receivedBelegarReward and region and not region:is_abandoned() and region:owning_faction():name() ~= "wh_main_dwf_karak_izor" then
			crp.Logger:Log("Adding karak eight peaks listeners");
			core:add_listener(
				"CRP_karak_faction_joins_confederation",
				"FactionJoinsConfederation",
				function(context)
					local faction_name = context:faction():name();
					local confederation_name = context:confederation():name();
					return faction_name == "wh_main_dwf_karak_izor" or confederation_name == "wh_main_dwf_karak_izor";
				end,
				function(context)
					if region and not region:is_abandoned() then
						if region:owning_faction():name() == "wh_main_dwf_karak_izor" then
							crp.Logger:Log("Giving Belegar scripted reward");
							CheckAndReceiveRewards(context:faction(), context:faction(), "scripted");
							cm:set_saved_value("CRP_Belegar_received_reward", true);
							crp.Logger:Log_Finished();
						end
					end;
				end,
				true
			);

			core:add_listener(
				"CRP_karak_eight_peaks_occupied",
				"GarrisonOccupiedEvent",
				function(context)
					crp.Logger:Log("Checking for Belegar occupied garrison event");
					return context:garrison_residence():region():name() == "wh_main_eastern_badlands_karak_eight_peaks" and context:character():faction():name() == "wh_main_dwf_karak_izor";
				end,
				function(context)
					crp.Logger:Log("Giving Belegar scripted reward");
					CheckAndReceiveRewards(context:character():faction(), context:character():faction(), "scripted");
					cm:set_saved_value("CRP_Belegar_received_reward", true);
					crp.Logger:Log_Finished();
				end,
				true
			);
		end
	end

	crp.Logger:Log("Finished setting up modifier listeners");
end

function CheckAndReceiveRewards(receivingFaction, givingFaction, type, cacheData)
	if cacheData == nil or cacheData.Amount == nil then
		cacheData = {
			Amount = 1,
		};
	end
	--crp.Logger:Log("Check and receive rewards");
	local rewardData = GetRewardsForFaction(givingFaction);
	if rewardData ~= nil and rewardData[type] ~= nil then
		--crp.Logger:Log("Got diplomacy rewards");
		if IsUniquePoolResourcesForFaction(receivingFaction) then
			--crp.Logger:Log("Is a unique faction pool");
			pm:GiveReward(receivingFaction, rewardData[type], cacheData);
			--crp.Logger:Log("Gave reward");
		else
			--crp.Logger:Log("Creating a unique pool for the faction");
			pm:CreateUniquePool(receivingFaction);
			--crp.Logger:Log("Created unique pool for the faction");
			CheckAndReceiveRewards(receivingFaction, givingFaction, type, cacheData);
		end
	end
end