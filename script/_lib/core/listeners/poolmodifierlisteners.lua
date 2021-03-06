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
					CheckAndReceiveRewards(crp, proposer, recipient, "alliance_"..recipient:name());
					CheckAndReceiveRewards(crp, recipient, proposer, "alliance_"..proposer:name());
					if proposer:military_allies_with(recipient) then
						CheckAndReceiveRewards(crp, proposer, recipient, "military_alliance_"..recipient:name());
						CheckAndReceiveRewards(crp, recipient, proposer, "military_alliance_"..proposer:name());
					elseif proposer:defensive_allies_with(recipient) then
						CheckAndReceiveRewards(crp, proposer, recipient, "defensive_alliance_"..recipient:name());
						CheckAndReceiveRewards(crp, recipient, proposer, "defensive_alliance_"..proposer:name());
					end
                end
			end
			crp.Logger:Log("Finished positive diplomatic event");
			crp.Logger:Log_Finished();
		end,
		true
	);

	core:add_listener(
        "CRP_CheckHordeBuildingRewards",
        "MilitaryForceBuildingCompleteEvent",
		function(context)
			crp.Logger:Log_Finished();
            local faction = context:character():faction();
			return crp:IsExcludedFaction(faction) == false and IsSupportedSubCulture(faction:subculture()) == true;
        end,
		function(context)
			local faction = context:character():faction();
			crp.Logger:Log("Horde faction has completed building: "..faction:name());
			crp.Logger:Log("Building is: "..context:building());
            local faction = context:character():faction();
			CheckAndReceiveRewards(crp, faction, faction, context:building());
			crp.Logger:Log_Finished();
        end,
        true
	);

	core:add_listener(
        "CRP_UpdateBuildingFactionPoolLimits",
        "FactionTurnStart",
        function(context)
            local faction = context:faction();
            return crp:IsExcludedFaction(faction) == false and IsSupportedSubCulture(faction:subculture()) == true;
        end,
        function(context)
			local faction = context:faction();
			crp.Logger:Log("Check and receive rewards for faction: "..faction:name());
			local regionList = faction:region_list();
			local buildingCache = {};
			local factionRewardData = GetRewardsForFaction(faction);
			-- For every region the player controls
			for i = 0, regionList:num_items() - 1 do
				local region = regionList:item_at(i);
				--crp.Logger:Log("Checking region: "..region:name());
				if region:is_null_interface() == false
				and region:is_abandoned() == false then
					local settlement = region:settlement();
					if settlement:is_null_interface() == false then
						local settlementSlotList = settlement:slot_list();
						for j = 0, settlementSlotList:num_items() - 1 do
							local slot = settlementSlotList:item_at(j);
							local building = slot:building();
							if building:is_null_interface() == false then
								--crp.Logger:Log("Checking building: "..building:name());
								local buildingChainKey = building:chain();
								--crp.Logger:Log("Checking building chain: "..buildingChainKey);
								local buildingSuperChainKey = building:superchain();
								--crp.Logger:Log("Checking building super chain: "..buildingSuperChainKey);
								--crp.Logger:Log("Building level is: "..building:building_level());
								if string.match(buildingSuperChainKey, "settlement_major")
								or string.match(buildingSuperChainKey, "sch_special_settlement") then
									buildingSuperChainKey = "wh_main_sch_settlement_major";
								end
								local foundRewards = {};
								if factionRewardData[building:name()] ~= nil
								and (factionRewardData[building:name()].MinimumRequireBuildingLevel == nil
								or building:building_level() >= factionRewardData[building:name()].MinimumRequireBuildingLevel) then
									foundRewards[building:name()] = factionRewardData[building:name()];
								end
								if factionRewardData[buildingChainKey] ~= nil
								and (factionRewardData[buildingChainKey].MinimumRequireBuildingLevel == nil
								or building:building_level() >= factionRewardData[buildingChainKey].MinimumRequireBuildingLevel) then
									foundRewards[buildingChainKey] = factionRewardData[buildingChainKey];
								end
								if factionRewardData[buildingSuperChainKey]
								and (factionRewardData[buildingSuperChainKey].MinimumRequireBuildingLevel == nil
								or building:building_level() >= factionRewardData[buildingSuperChainKey].MinimumRequireBuildingLevel) then
									foundRewards[buildingSuperChainKey] = factionRewardData[buildingSuperChainKey];
								end
								if TableHasAnyValue(foundRewards) then
									for rewardKey, rewardData in pairs(foundRewards) do
										for index, poolKey in pairs(rewardData.Pools) do
											if buildingCache[poolKey] == nil then
												buildingCache[poolKey] = {
													RewardKey = rewardKey,
													Amount = 0,
													AmountWithLevels = 0,
												};
											end
											buildingCache[poolKey].Amount = buildingCache[poolKey].Amount + 1;
											buildingCache[poolKey].AmountWithLevels = buildingCache[poolKey].AmountWithLevels + (building:building_level() + 1);
										end
									end
								end
							end
						end
					end
				end
			end
			crp.Logger:Log("Completed building cache.");
			for rewardKey, buildingCacheData in pairs(buildingCache) do
				crp.Logger:Log("Building has reward for pool: "..rewardKey.." Amount: "..buildingCacheData.Amount.." AmountWithLevels: "..buildingCacheData.AmountWithLevels);
				CheckAndReceiveRewards(crp, faction, faction, buildingCacheData.RewardKey, buildingCacheData);
			end
			crp.Logger:Log_Finished();
        end,
        true
    );

    core:add_listener(
		"CRP_CheckResearchRewards",
		"ResearchCompleted",
		true,
		function(context)
			local faction = context:faction();
			local technologyKey = context:technology();
			local rewardsForFaction = GetRewardsForFaction(faction);
			if rewardsForFaction ~= nil then
				for rewardKey, rewardData in pairs(rewardsForFaction) do
					if rewardData.IsTech == true
					and string.match(technologyKey, rewardKey) then
						crp.Logger:Log("Got reward for technology: "..technologyKey.." in faction: "..faction:name());
						CheckAndReceiveRewards(crp, faction, faction, rewardKey);
						crp.Logger:Log_Finished();
						break;
					end
				end
			end
		end,
		true
	);

	core:add_listener(
		"CRP_MissionCompletedRewards",
		"MissionSucceeded",
		true,
		function(context)
			local faction = context:faction();
			local missionKey = context:mission():mission_record_key();
			local missionReward = GetRewardByKey(faction, missionKey);
			if missionReward ~= nil then
				crp.Logger:Log("Got reward for mission: "..missionKey.." in faction: "..faction:name());
				CheckAndReceiveRewards(crp, faction, faction, missionKey);
				crp.Logger:Log_Finished();
			end
		end,
		true
	);

	core:add_listener(
		"CRP_RitualCompletedReward",
		"RitualCompletedEvent",
		function(context)
			return context:succeeded();
		 end,
		function(context)
			local faction = context:performing_faction();
			local factionName = faction:name();
			local ritualKey = context:ritual():ritual_key();
			local ritualReward = GetRewardByKey(faction, ritualKey);
			if ritualReward ~= nil then
				crp.Logger:Log("Got reward for ritual: "..ritualKey.." in faction: "..factionName);
				CheckAndReceiveRewards(crp, faction, faction, ritualKey);
				crp.Logger:Log_Finished();
			end
		end,
		true
	);

	local lastDilemma = nil;
    core:add_listener(
        "CRP_DilemmaDecisionMade",
        "DilemmaChoiceMadeEvent",
        function(context)
            return true;
        end,
        function(context)
            lastDilemma = {
                ChoiceKey = context:choice(),
                DilemmaKey = context:dilemma(),
            };
            local rewardForDilemma = GetRewardForDilemma(crp.HumanFaction, lastDilemma.DilemmaKey, lastDilemma.ChoiceKey);
            if rewardForDilemma ~= nil then
                crp.Logger:Log("Choice selected is: "..lastDilemma.ChoiceKey);
                crp.Logger:Log("Dilemma is: "..lastDilemma.DilemmaKey);
				CheckAndReceiveRewards(crp, crp.HumanFaction, crp.HumanFaction, lastDilemma.DilemmaKey, lastDilemma);
                crp.Logger:Log_Finished();
			end
			lastDilemma = nil;
        end,
        true
	);

	core:add_listener(
        "CRP_IncidentTriggered",
        "IncidentOccuredEvent",
        function(context)
            return true;
        end,
        function(context)
			local incidentKey = context:dilemma();
            local rewardForIncident = GetRewardByKey(crp.HumanFaction, incidentKey);
            if rewardForIncident ~= nil then
                crp.Logger:Log("Incident is: "..incidentKey);
				CheckAndReceiveRewards(crp, crp.HumanFaction, crp.HumanFaction, incidentKey);
                crp.Logger:Log_Finished();
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
							CheckAndReceiveRewards(crp, context:faction(), context:faction(), "scripted");
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
					CheckAndReceiveRewards(crp, context:character():faction(), context:character():faction(), "scripted");
					cm:set_saved_value("CRP_Belegar_received_reward", true);
					crp.Logger:Log_Finished();
				end,
				true
			);
		end
	end

	crp.Logger:Log("Finished setting up modifier listeners");
end

function CheckAndReceiveRewards(crp, receivingFaction, givingFaction, type, cacheData)
	if cacheData == nil then
		cacheData = {
			Amount = 1,
		};
	end
	--crp.Logger:Log("Check and receive rewards");
	local rewardData = GetRewardsForFaction(givingFaction);
	if rewardData ~= nil and rewardData[type] ~= nil then
		--crp.Logger:Log("Found rewards for matching key");
		if IsUniquePoolResourcesForFaction(receivingFaction) then
			--crp.Logger:Log("Faction already has a unique faction pool");
			pm:GiveReward(crp, receivingFaction, rewardData[type], cacheData);
			--crp.Logger:Log("Gave reward");
		else
			crp.Logger:Log("Creating a unique pool for the faction");
			pm:CreateUniquePool(receivingFaction);
			--crp.Logger:Log("Created unique pool for the faction");
			CheckAndReceiveRewards(crp, receivingFaction, givingFaction, type, cacheData);
		end
	end
end