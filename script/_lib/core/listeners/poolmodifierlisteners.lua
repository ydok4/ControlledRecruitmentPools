pm = {};

function InitialisePoolModifier()
    pm = PoolModifier:new({

    });
end

function PoolModifierListeners(core, crp)
	Custom_Log("Setting up pool modifier listeners");
	-- This handles generic diplomacy rewards
    core:add_listener(
		"DiplomacyLordImpacts",
		"PositiveDiplomaticEvent",
		true,
		function(context)
			Custom_Log("Received positive diplomatic event");
            local proposer = context:proposer();
            local recipient = context:recipient();

            if proposer:subculture() == recipient:subculture() then
                Custom_Log("Matching culture, checking for pool changes");
				if context:is_alliance() then
					Custom_Log("Is Alliance");
					--Custom_Log("Before getting rewards for proposer "..proposer:name());
					CheckAndReceiveRewards(proposer, recipient, "alliance");
					--Custom_Log("Before getting rewards for receiver "..recipient:name());
					CheckAndReceiveRewards(recipient, proposer, "alliance");
                end
			end
			Custom_Log("Finished positive diplomatic event");
		end,
		true
	);

	-- These listeners is specifically for Belegar
	local region = cm:get_region("wh_main_eastern_badlands_karak_eight_peaks");
	local receivedBelegarReward = cm:get_saved_value("CRP_Belegar_received_reward");
	if not receivedBelegarReward and region and not region:is_abandoned() and region:owning_faction():name() ~= "wh_main_dwf_karak_izor" then
		Custom_Log("Adding karak eight peaks listeners");
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
						Custom_Log("Giving Belegar scripted reward");
						CheckAndReceiveRewards(context:faction(), context:faction(), "scripted");
						cm:set_saved_value("CRP_Belegar_received_reward", true);
						Custom_Log_Finished();
					end
				end;
			end,
			true
		);

		core:add_listener(
			"CRP_karak_eight_peaks_occupied",
			"GarrisonOccupiedEvent",
			function(context)
				Custom_Log("Checking for Beleggar occupied garrison event");
				return context:garrison_residence():region():name() == "wh_main_eastern_badlands_karak_eight_peaks" and context:character():faction():name() == "wh_main_dwf_karak_izor";
			end,
			function(context)
				Custom_Log("Giving Belegar scripted reward");
				CheckAndReceiveRewards(context:character():faction(), context:character():faction(), "scripted");
				cm:set_saved_value("CRP_Belegar_received_reward", true);
				Custom_Log_Finished();
			end,
			true
		);
	end

	Custom_Log("Finished setting up modifier listeners");
end

function CheckAndReceiveRewards(receivingFaction, givingFaction, type)
	--Custom_Log("Check and receive rewards");
	local diplomacyRewards = GetRewardsForFaction(givingFaction);
	if diplomacyRewards ~= nil and diplomacyRewards[type] ~= nil then
		--Custom_Log("Got diplomacy rewards");
		if IsUniquePoolResourcesForFaction(receivingFaction) then
			--Custom_Log("Is a unique faction pool");
			local factionPoolResources = GetFactionPoolResources(receivingFaction);
			pm:GiveReward(receivingFaction, factionPoolResources, diplomacyRewards[type]);
			Custom_Log("Gave reward");
		else
			--Custom_Log("Creating a unique pool for the faction");
			pm:CreateUniquePool(receivingFaction);
			--Custom_Log("Created unique pool for the faction");
			CheckAndReceiveRewards(receivingFaction, givingFaction, type);
		end
	end
end