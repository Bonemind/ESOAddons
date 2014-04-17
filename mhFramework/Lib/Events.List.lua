wykkydsFramework.Events.GameEventTable = {
	["EVENT_ABILITY_COOLDOWN_UPDATED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			abilityId = { name = "abilityId", dataType = "integer", paramNum = 2 },
	["EVENT_ABILITY_LIST_CHANGED"] = {
	["EVENT_ABILITY_PROGRESSION_FULL_UPDATE"] = {
	["EVENT_ABILITY_PROGRESSION_RANK_UPDATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			progressionIndex = { name = "progressionIndex", dataType = "luaindex", paramNum = 2 },
			rank = { name = "rank", dataType = "integer", paramNum = 3 },
			maxRank = { name = "maxRank", dataType = "integer", paramNum = 4 },
			morph = { name = "morph", dataType = "integer", paramNum = 5 },
	["EVENT_ABILITY_PROGRESSION_RESULT"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			reason = { name = "reason", dataType = "integer", paramNum = 2 },
	["EVENT_ABILITY_PROGRESSION_XP_UPDATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			progressionIndex = { name = "progressionIndex", dataType = "luaindex", paramNum = 2 },
			lastRankXP = { name = "lastRankXP", dataType = "integer", paramNum = 3 },
			nextRankXP = { name = "nextRankXP", dataType = "integer", paramNum = 4 },
			currentXP = { name = "currentXP", dataType = "integer", paramNum = 5 },
			atMorph = { name = "atMorph", dataType = "bool", paramNum = 6 },
	["EVENT_ABILITY_RANGE_CHANGED"] = {
	["EVENT_ACHIEVEMENTS_UPDATED"] = {
	["EVENT_ACHIEVEMENT_AWARDED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			name = { name = "name", dataType = "string", paramNum = 2 },
			points = { name = "points", dataType = "integer", paramNum = 3 },
			id = { name = "id", dataType = "integer", paramNum = 4 },
			link = { name = "link", dataType = "string", paramNum = 5 },
	["EVENT_ACHIEVEMENT_UPDATED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			id = { name = "id", dataType = "integer", paramNum = 2 },
	["EVENT_ACTION_PAGE_UPDATED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			physicalPage = { name = "physicalPage", dataType = "luaindex", paramNum = 2 },
	["EVENT_ACTION_SLOTS_FULL_UPDATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			isHotbarSwap = { name = "isHotbarSwap", dataType = "bool", paramNum = 2 },
	["EVENT_ACTION_SLOT_ABILITY_SLOTTED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			newAbilitySlotted = { name = "newAbilitySlotted", dataType = "bool", paramNum = 2 },
	["EVENT_ACTION_SLOT_STATE_UPDATED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			slotNum = { name = "slotNum", dataType = "luaindex", paramNum = 2 },
	["EVENT_ACTION_SLOT_UPDATED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			slotNum = { name = "slotNum", dataType = "luaindex", paramNum = 2 },
	["EVENT_ACTION_UPDATE_COOLDOWNS"] = {
	["EVENT_ACTIVE_QUEST_TOOL_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },
			toolIndex = { name = "toolIndex", dataType = "luaindex", paramNum = 3 },
	["EVENT_ACTIVE_QUEST_TOOL_CLEARED"] = {
	["EVENT_ACTIVE_QUICKSLOT_CHANGED"] = {
			slotId = { name = "slotId", dataType = "integer", paramNum = 2 },
	["EVENT_ACTIVE_WEAPON_PAIR_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			activeWeaponPair = { name = "activeWeaponPair", dataType = "integer", paramNum = 2 },
			locked = { name = "locked", dataType = "bool", paramNum = 3 },
	["EVENT_AGENT_CHAT_REQUESTED"] = {
	["EVENT_ALLIANCE_POINT_UPDATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			alliancePoints = { name = "alliancePoints", dataType = "integer", paramNum = 2 },
			playSound = { name = "playSound", dataType = "bool", paramNum = 3 },
			difference = { name = "difference", dataType = "integer", paramNum = 4 },
	["EVENT_ARTIFACT_CONTROL_STATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			artifactName = { name = "artifactName", dataType = "string", paramNum = 2 },
			keepId = { name = "keepId", dataType = "integer", paramNum = 3 },
			playerName = { name = "playerName", dataType = "string", paramNum = 4 },
			playerAlliance = { name = "playerAlliance", dataType = "integer", paramNum = 5 },
			controlEvent = { name = "controlEvent", dataType = "integer", paramNum = 6 },
			controlState = { name = "controlState", dataType = "integer", paramNum = 7 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 8 },
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			newAssignedCampaignId = { name = "newAssignedCampaignId", dataType = "integer", paramNum = 2 },
	["EVENT_ATTRIBUTE_FORCE_RESPEC"] = {
	["EVENT_ATTRIBUTE_UPGRADE_UPDATED"] = {
	["EVENT_AVENGE_KILL"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			avengedPlayerName = { name = "avengedPlayerName", dataType = "string", paramNum = 2 },
			killedPlayerName = { name = "killedPlayerName", dataType = "string", paramNum = 3 },
	["EVENT_BATTLE_TOKEN_UPDATE"] = {
	["EVENT_BEGIN_CAST"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			actionName = { name = "actionName", dataType = "string", paramNum = 3 },
			startTime = { name = "startTime", dataType = "number", paramNum = 4 },
			endTime = { name = "endTime", dataType = "number", paramNum = 5 },
			isChannel = { name = "isChannel", dataType = "bool", paramNum = 6 },
			barType = { name = "barType", dataType = "integer", paramNum = 7 },
			blockable = { name = "blockable", dataType = "bool", paramNum = 8 },
			interruptible = { name = "interruptible", dataType = "bool", paramNum = 9 },
			isChargeUp = { name = "isChargeUp", dataType = "bool", paramNum = 10 },
	["EVENT_BEGIN_LOCKPICK"] = {
	["EVENT_BEGIN_SIEGE_CONTROL"] = {
	["EVENT_BEGIN_SIEGE_UPGRADE"] = {
	["EVENT_BOSSES_CHANGED"] = {
	["EVENT_BROADCAST"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			message = { name = "message", dataType = "string", paramNum = 2 },
	["EVENT_BUYBACK_RECEIPT"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			itemLink = { name = "itemLink", dataType = "string", paramNum = 2 },
			itemQuantity = { name = "itemQuantity", dataType = "integer", paramNum = 3 },
			money = { name = "money", dataType = "integer", paramNum = 4 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 5 },
	["EVENT_BUY_RECEIPT"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			entryName = { name = "entryName", dataType = "string", paramNum = 2 },
			entryType = { name = "entryType", dataType = "integer", paramNum = 3 },
			entryQuantity = { name = "entryQuantity", dataType = "integer", paramNum = 4 },
			money = { name = "money", dataType = "integer", paramNum = 5 },
			specialCurrencyType1 = { name = "specialCurrencyType1", dataType = "integer", paramNum = 6 },
			specialCurrencyInfo1 = { name = "specialCurrencyInfo1", dataType = "string", paramNum = 7 },
			specialCurrencyQuantity1 = { name = "specialCurrencyQuantity1", dataType = "integer", paramNum = 8 },
			specialCurrencyType2 = { name = "specialCurrencyType2", dataType = "integer", paramNum = 9 },
			specialCurrencyInfo2 = { name = "specialCurrencyInfo2", dataType = "string", paramNum = 10 },
			specialCurrencyQuantity2 = { name = "specialCurrencyQuantity2", dataType = "integer", paramNum = 11 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 12 },
	["EVENT_CAMERA_DISTANCE_SETTING_CHANGED"] = {
	["EVENT_CAMPAIGN_EMPEROR_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
	["EVENT_CAMPAIGN_HISTORY_WINDOW_CHANGED"] = {
	["EVENT_CAMPAIGN_LEADERBOARD_DATA_CHANGED"] = {
	["EVENT_CAMPAIGN_QUEUE_JOINED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			isGroup = { name = "isGroup", dataType = "bool", paramNum = 3 },
	["EVENT_CAMPAIGN_QUEUE_LEFT"] = {
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			isGroup = { name = "isGroup", dataType = "bool", paramNum = 3 },
	["EVENT_CAMPAIGN_QUEUE_POSITION_CHANGED"] = {
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			isGroup = { name = "isGroup", dataType = "bool", paramNum = 3 },
			position = { name = "position", dataType = "integer", paramNum = 4 },
	["EVENT_CAMPAIGN_QUEUE_STATE_CHANGED"] = {
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			isGroup = { name = "isGroup", dataType = "bool", paramNum = 3 },
			state = { name = "state", dataType = "integer", paramNum = 4 },
	["EVENT_CAMPAIGN_SCORE_DATA_CHANGED"] = {
	["EVENT_CAMPAIGN_SELECTION_DATA_CHANGED"] = {
	["EVENT_CAMPAIGN_STATE_INITIALIZED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
	["EVENT_CANCEL_MOUSE_REQUEST_DESTROY_ITEM"] = {
	["EVENT_CANNOT_DO_THAT_WHILE_DEAD"] = {
	["EVENT_CANNOT_FISH_WHILE_SWIMMING"] = {
	["EVENT_CAPTURE_AREA_STATUS"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },
			objectiveId = { name = "objectiveId", dataType = "integer", paramNum = 3 },
			battlegroundContext = { name = "battlegroundContext", dataType = "integer", paramNum = 4 },
			curValue = { name = "curValue", dataType = "integer", paramNum = 5 },
			maxValue = { name = "maxValue", dataType = "integer", paramNum = 6 },
			currentCapturePlayers = { name = "currentCapturePlayers", dataType = "integer", paramNum = 7 },
	["EVENT_CHATTER_BEGIN"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			optionCount = { name = "optionCount", dataType = "integer", paramNum = 2 },
	["EVENT_CHATTER_END"] = {
	["EVENT_CHAT_CHANNEL_INVITE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			channelName = { name = "channelName", dataType = "string", paramNum = 2 },
			playerName = { name = "playerName", dataType = "string", paramNum = 3 },
	["EVENT_CHAT_CHANNEL_JOIN"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			channelId = { name = "channelId", dataType = "integer", paramNum = 2 },
			customChannelId = { name = "customChannelId", dataType = "integer", paramNum = 3 },
			channelName = { name = "channelName", dataType = "string", paramNum = 4 },
	["EVENT_CHAT_CHANNEL_LEAVE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			channelId = { name = "channelId", dataType = "integer", paramNum = 2 },
			customChannelId = { name = "customChannelId", dataType = "integer", paramNum = 3 },
			channelName = { name = "channelName", dataType = "string", paramNum = 4 },
	["EVENT_CHAT_LOG_TOGGLED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			opened = { name = "opened", dataType = "bool", paramNum = 2 },
	["EVENT_CHAT_MESSAGE_CHANNEL"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			messageType = { name = "messageType", dataType = "integer", paramNum = 2 },
			fromName = { name = "fromName", dataType = "string", paramNum = 3 },
			text = { name = "text", dataType = "string", paramNum = 4 },
	["EVENT_CHAT_MESSAGE_COMBAT"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			text = { name = "text", dataType = "string", paramNum = 2 },
	["EVENT_CLOSE_BANK"] = {
	["EVENT_CLOSE_GUILD_BANK"] = {
	["EVENT_CLOSE_HOOK_POINT_STORE"] = {
	["EVENT_CLOSE_STORE"] = {
	["EVENT_CLOSE_TRADING_HOUSE"] = {
	["EVENT_COMBAT_EVENT"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			result = { name = "result", dataType = "integer", paramNum = 2 },
			isError = { name = "isError", dataType = "bool", paramNum = 3 },
			abilityName = { name = "abilityName", dataType = "string", paramNum = 4 },
			abilityGraphic = { name = "abilityGraphic", dataType = "integer", paramNum = 5 },
			abilityActionSlotType = { name = "abilityActionSlotType", dataType = "integer", paramNum = 6 },
			sourceName = { name = "sourceName", dataType = "string", paramNum = 7 },
			sourceType = { name = "sourceType", dataType = "integer", paramNum = 8 },
			targetName = { name = "targetName", dataType = "string", paramNum = 9 },
			targetType = { name = "targetType", dataType = "integer", paramNum = 10 },
			hitValue = { name = "hitValue", dataType = "integer", paramNum = 11 },
			powerType = { name = "powerType", dataType = "integer", paramNum = 12 },
			damageType = { name = "damageType", dataType = "integer", paramNum = 13 },
			log = { name = "log", dataType = "bool", paramNum = 14 },
	["EVENT_CONTROLLED_SIEGE_SOCKETS_CHANGED"] = {
	["EVENT_CONVERSATION_FAILED_INVENTORY_FULL"] = {
	["EVENT_CONVERSATION_UPDATED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			conversationBodyText = { name = "conversationBodyText", dataType = "string", paramNum = 2 },
			conversationOptionCount = { name = "conversationOptionCount", dataType = "integer", paramNum = 3 },
	["EVENT_CORONATE_EMPEROR_NOTIFICATION"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			emperorName = { name = "emperorName", dataType = "string", paramNum = 3 },
			emperorAlliance = { name = "emperorAlliance", dataType = "integer", paramNum = 4 },
	["EVENT_CRAFTING_STATION_INTERACT"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			craftSkill = { name = "craftSkill", dataType = "integer", paramNum = 2 },
	["EVENT_CRAFT_COMPLETED"] = {
			craftSkill = { name = "craftSkill", dataType = "integer", paramNum = 2 },
	["EVENT_CURRENT_CAMPAIGN_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			newCurrentCampaignId = { name = "newCurrentCampaignId", dataType = "integer", paramNum = 2 },
	["EVENT_CURRENT_WEAPON_SET_UPDATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			weaponSetIndex = { name = "weaponSetIndex", dataType = "integer", paramNum = 2 },
	["EVENT_CURSOR_DROPPED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			type = { name = "type", dataType = "integer", paramNum = 2 },
			param1 = { name = "param1", dataType = "integer", paramNum = 3 },
			param2 = { name = "param2", dataType = "integer", paramNum = 4 },
			param3 = { name = "param3", dataType = "integer", paramNum = 5 },
			param4 = { name = "param4", dataType = "integer", paramNum = 6 },
			param5 = { name = "param5", dataType = "integer", paramNum = 7 },
			param6 = { name = "param6", dataType = "integer", paramNum = 8 },
	["EVENT_CURSOR_PICKUP"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			type = { name = "type", dataType = "integer", paramNum = 2 },
			param1 = { name = "param1", dataType = "integer", paramNum = 3 },
			param2 = { name = "param2", dataType = "integer", paramNum = 4 },
			param3 = { name = "param3", dataType = "integer", paramNum = 5 },
			param4 = { name = "param4", dataType = "integer", paramNum = 6 },
			param5 = { name = "param5", dataType = "integer", paramNum = 7 },
			param6 = { name = "param6", dataType = "integer", paramNum = 8 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 9 },
	["EVENT_DELAY_CAST"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			actionName = { name = "actionName", dataType = "string", paramNum = 3 },
			startTime = { name = "startTime", dataType = "number", paramNum = 4 },
			endTime = { name = "endTime", dataType = "number", paramNum = 5 },
			isChannel = { name = "isChannel", dataType = "bool", paramNum = 6 },
	["EVENT_DEPOSE_EMPEROR_NOTIFICATION"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			emperorName = { name = "emperorName", dataType = "string", paramNum = 3 },
			emperorAlliance = { name = "emperorAlliance", dataType = "integer", paramNum = 4 },
			abdication = { name = "abdication", dataType = "bool", paramNum = 5 },
	["EVENT_DIFFICULTY_LEVEL_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			difficultyLevel = { name = "difficultyLevel", dataType = "integer", paramNum = 2 },
	["EVENT_DISABLE_SIEGE_AIM_ABILITY"] = {
	["EVENT_DISABLE_SIEGE_FIRE_ABILITY"] = {
	["EVENT_DISABLE_SIEGE_PACKUP_ABILITY"] = {
	["EVENT_DISGUISE_STATE_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			disguiseState = { name = "disguiseState", dataType = "integer", paramNum = 3 },
	["EVENT_DISPLAY_ACTIVE_COMBAT_TIP"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			activeCombatTipId = { name = "activeCombatTipId", dataType = "integer", paramNum = 2 },
	["EVENT_DISPLAY_TUTORIAL"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			tutorialIndex = { name = "tutorialIndex", dataType = "luaindex", paramNum = 2 },
	["EVENT_DISPOSITION_UPDATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
	["EVENT_DROWN_TIMER_UPDATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			startTime = { name = "startTime", dataType = "number", paramNum = 3 },
			endTime = { name = "endTime", dataType = "number", paramNum = 4 },
	["EVENT_EFFECTS_FULL_UPDATE"] = {
	["EVENT_EFFECT_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			changeType = { name = "changeType", dataType = "integer", paramNum = 2 },
			effectSlot = { name = "effectSlot", dataType = "integer", paramNum = 3 },
			effectName = { name = "effectName", dataType = "string", paramNum = 4 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 5 },
			beginTime = { name = "beginTime", dataType = "number", paramNum = 6 },
			endTime = { name = "endTime", dataType = "number", paramNum = 7 },
			stackCount = { name = "stackCount", dataType = "integer", paramNum = 8 },
			iconName = { name = "iconName", dataType = "string", paramNum = 9 },
			buffType = { name = "buffType", dataType = "string", paramNum = 10 },
			effectType = { name = "effectType", dataType = "integer", paramNum = 11 },
			abilityType = { name = "abilityType", dataType = "integer", paramNum = 12 },
			statusEffectType = { name = "statusEffectType", dataType = "integer", paramNum = 13 },
	["EVENT_ENABLE_SIEGE_AIM_ABILITY"] = {
	["EVENT_ENABLE_SIEGE_FIRE_ABILITY"] = {
	["EVENT_ENABLE_SIEGE_PACKUP_ABILITY"] = {
	["EVENT_END_CAST"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			interrupted = { name = "interrupted", dataType = "integer", paramNum = 3 },
	["EVENT_END_CRAFTING_STATION_INTERACT"] = {
	["EVENT_END_FAST_TRAVEL_INTERACTION"] = {
	["EVENT_END_FAST_TRAVEL_KEEP_INTERACTION"] = {
	["EVENT_END_KEEP_GUILD_CLAIM_INTERACTION"] = {
	["EVENT_END_KEEP_GUILD_RELEASE_INTERACTION"] = {
	["EVENT_END_SIEGE_CONTROL"] = {
	["EVENT_END_SOUL_GEM_RESURRECTION"] = {
	["EVENT_ENTER_GROUND_TARGET_MODE"] = {
	["EVENT_EXPERIENCE_GAIN"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			value = { name = "value", dataType = "integer", paramNum = 2 },
			reason = { name = "reason", dataType = "integer", paramNum = 3 },
	["EVENT_EXPERIENCE_GAIN_DISCOVERY"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			areaName = { name = "areaName", dataType = "string", paramNum = 2 },
			value = { name = "value", dataType = "integer", paramNum = 3 },
	["EVENT_EXPERIENCE_UPDATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			currentExp = { name = "currentExp", dataType = "integer", paramNum = 3 },
			maxExp = { name = "maxExp", dataType = "integer", paramNum = 4 },
			reason = { name = "reason", dataType = "integer", paramNum = 5 },
	["EVENT_FAST_TRAVEL_KEEP_NETWORK_LINK_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			linkIndex = { name = "linkIndex", dataType = "luaindex", paramNum = 2 },
			linkType = { name = "linkType", dataType = "integer", paramNum = 3 },
			owningAlliance = { name = "owningAlliance", dataType = "integer", paramNum = 4 },
			oldLinkType = { name = "oldLinkType", dataType = "integer", paramNum = 5 },
			oldOwningAlliance = { name = "oldOwningAlliance", dataType = "integer", paramNum = 6 },
			isLocal = { name = "isLocal", dataType = "bool", paramNum = 7 },
	["EVENT_FAST_TRAVEL_KEEP_NETWORK_UPDATED"] = {
	["EVENT_FAST_TRAVEL_NETWORK_UPDATED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			nodeIndex = { name = "nodeIndex", dataType = "luaindex", paramNum = 2 },
	["EVENT_FEEDBACK_REQUESTED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			feedbackId = { name = "feedbackId", dataType = "integer", paramNum = 2 },
	["EVENT_FEEDBACK_TOO_FREQUENT_SCREENSHOT"] = {
	["EVENT_FINESSE_RANK_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			rankNum = { name = "rankNum", dataType = "luaindex", paramNum = 3 },
			name = { name = "name", dataType = "string", paramNum = 4 },
			xpBonus = { name = "xpBonus", dataType = "integer", paramNum = 5 },
			loot = { name = "loot", dataType = "bool", paramNum = 6 },
	["EVENT_FISHING_LURE_CLEARED"] = {
	["EVENT_FISHING_LURE_SET"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			fishingLure = { name = "fishingLure", dataType = "luaindex", paramNum = 2 },
	["EVENT_FORWARD_CAMPS_UPDATED"] = {
	["EVENT_GAME_CAMERA_ACTIVATED"] = {
	["EVENT_GAME_CAMERA_DEACTIVATED"] = {
	["EVENT_GAME_CAMERA_UI_MODE_CHANGED"] = {
	["EVENT_GAME_FOCUS_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			hasFocus = { name = "hasFocus", dataType = "bool", paramNum = 2 },
	["EVENT_GAME_SCORE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			alliance1 = { name = "alliance1", dataType = "integer", paramNum = 2 },
			alliance2 = { name = "alliance2", dataType = "integer", paramNum = 3 },
			alliance3 = { name = "alliance3", dataType = "integer", paramNum = 4 },
	["EVENT_GAME_STATE_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			oldState = { name = "oldState", dataType = "integer", paramNum = 2 },
			newState = { name = "newState", dataType = "integer", paramNum = 3 },
	["EVENT_GAME_TIMER_PAUSED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			isPaused = { name = "isPaused", dataType = "bool", paramNum = 2 },
	["EVENT_GRAVEYARD_USAGE_FAILURE"] = {
	["EVENT_GROUPING_TOOLS_STATUS_UPDATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			inQueue = { name = "inQueue", dataType = "bool", paramNum = 2 },
	["EVENT_GROUP_CAMPAIGN_ASSIGNMENTS_CHANGED"] = {
	["EVENT_GROUP_DISBANDED"] = {
	["EVENT_GROUP_INVITE_RECEIVED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			inviterName = { name = "inviterName", dataType = "string", paramNum = 2 },
	["EVENT_GROUP_INVITE_REMOVED"] = {
	["EVENT_GROUP_INVITE_RESPONSE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			inviterName = { name = "inviterName", dataType = "string", paramNum = 2 },
			response = { name = "response", dataType = "integer", paramNum = 3 },
	["EVENT_GROUP_MEMBER_CONNECTED_STATUS"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			isOnline = { name = "isOnline", dataType = "bool", paramNum = 3 },
	["EVENT_GROUP_MEMBER_JOINED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			memberName = { name = "memberName", dataType = "string", paramNum = 2 },
	["EVENT_GROUP_MEMBER_LEFT"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			memberName = { name = "memberName", dataType = "string", paramNum = 2 },
			reason = { name = "reason", dataType = "integer", paramNum = 3 },
			wasLocalPlayer = { name = "wasLocalPlayer", dataType = "bool", paramNum = 4 },
	["EVENT_GROUP_MEMBER_ROLES_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			dps = { name = "dps", dataType = "bool", paramNum = 3 },
			healer = { name = "healer", dataType = "bool", paramNum = 4 },
			tank = { name = "tank", dataType = "bool", paramNum = 5 },
	["EVENT_GROUP_NOTIFICATION_MESSAGE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			messageId = { name = "messageId", dataType = "integer", paramNum = 2 },
	["EVENT_GROUP_SUPPORT_RANGE_UPDATE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			status = { name = "status", dataType = "bool", paramNum = 3 },
	["EVENT_GROUP_TYPE_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			largeGroup = { name = "largeGroup", dataType = "bool", paramNum = 2 },
	["EVENT_GUEST_CAMPAIGN_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			newGuestCampaignId = { name = "newGuestCampaignId", dataType = "integer", paramNum = 2 },
	["EVENT_GUILD_BANK_DESELECTED"] = {
	["EVENT_GUILD_BANK_ITEMS_READY"] = {
	["EVENT_GUILD_BANK_ITEM_ADDED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 2 },
	["EVENT_GUILD_BANK_ITEM_REMOVED"] = {
			slotId = { name = "slotId", dataType = "integer", paramNum = 2 },
	["EVENT_GUILD_BANK_OPEN_ERROR"] = {
			reason = { name = "reason", dataType = "integer", paramNum = 2 },
	["EVENT_GUILD_BANK_SELECTED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			guildId = { name = "guildId", dataType = "integer", paramNum = 2 },
	["EVENT_GUILD_BANK_TRANSFER_ERROR"] = {
			reason = { name = "reason", dataType = "integer", paramNum = 2 },
	["EVENT_GUILD_BANK_UPDATED_QUANTITY"] = {
			slotId = { name = "slotId", dataType = "integer", paramNum = 2 },
	["EVENT_GUILD_MEMBER_ACHIEVEMENT_AWARDED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			playerName = { name = "playerName", dataType = "string", paramNum = 2 },
			id = { name = "id", dataType = "integer", paramNum = 3 },
			link = { name = "link", dataType = "string", paramNum = 4 },
	["EVENT_GUILD_REPUTATION_ADDED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			repIndex = { name = "repIndex", dataType = "luaindex", paramNum = 2 },
			repName = { name = "repName", dataType = "string", paramNum = 3 },
			rankName = { name = "rankName", dataType = "string", paramNum = 4 },
			curPoints = { name = "curPoints", dataType = "integer", paramNum = 5 },
	["EVENT_GUILD_REPUTATION_LOADED"] = {
	["EVENT_GUILD_REPUTATION_POINTS_UPDATED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			repIndex = { name = "repIndex", dataType = "luaindex", paramNum = 2 },
			repName = { name = "repName", dataType = "string", paramNum = 3 },
			rankName = { name = "rankName", dataType = "string", paramNum = 4 },
			pointGain = { name = "pointGain", dataType = "integer", paramNum = 5 },
	["EVENT_GUILD_REPUTATION_RANK_UPDATED"] = {
			repIndex = { name = "repIndex", dataType = "luaindex", paramNum = 2 },
			repName = { name = "repName", dataType = "string", paramNum = 3 },
			rankName = { name = "rankName", dataType = "string", paramNum = 4 },
			curPoints = { name = "curPoints", dataType = "integer", paramNum = 5 },
			newRank = { name = "newRank", dataType = "bool", paramNum = 6 },
	["EVENT_HELP_INITIALIZED"] = {
	["EVENT_HELP_SEARCH_RESULTS_READY"] = {
	["EVENT_HIDE_BOOK"] = {
	["EVENT_HIDE_OBJECTIVE_STATUS"] = {
	["EVENT_HOOK_POINTS_UPDATED"] = {
	["EVENT_HOT_BAR_RESULT"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			reason = { name = "reason", dataType = "integer", paramNum = 2 },
	["EVENT_INTERACTABLE_IMPOSSIBLE_TO_PICK"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			interactableName = { name = "interactableName", dataType = "string", paramNum = 2 },
	["EVENT_INTERACTABLE_LOCKED"] = {
			interactableName = { name = "interactableName", dataType = "string", paramNum = 2 },
	["EVENT_INTERACTION_TRANSITION_PENDING"] = {
	["EVENT_INTERACT_BUSY"] = {
	["EVENT_INTERFACE_SETTING_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			system = { name = "system", dataType = "integer", paramNum = 2 },
			settingId = { name = "settingId", dataType = "integer", paramNum = 3 },
			value = { name = "value", dataType = "bool", paramNum = 4 },
	["EVENT_INVENTORY_BOUGHT_BAG_SPACE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			numberOfSlots = { name = "numberOfSlots", dataType = "integer", paramNum = 2 },
	["EVENT_INVENTORY_BOUGHT_BANK_SPACE"] = {
			numberOfSlots = { name = "numberOfSlots", dataType = "integer", paramNum = 2 },
	["EVENT_INVENTORY_BUY_BAG_SPACE"] = {
			cost = { name = "cost", dataType = "integer", paramNum = 2 },
	["EVENT_INVENTORY_BUY_BANK_SPACE"] = {
			cost = { name = "cost", dataType = "integer", paramNum = 2 },
	["EVENT_INVENTORY_CLOSE_BUY_SPACE"] = {
	["EVENT_INVENTORY_FULL_UPDATE"] = {
	["EVENT_INVENTORY_ITEM_DESTROYED"] = {
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 2 },
	["EVENT_INVENTORY_ITEM_USED"] = {
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 2 },
	["EVENT_INVENTORY_SINGLE_SLOT_UPDATE"] = {
			bagId = { name = "bagId", dataType = "integer", paramNum = 2 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 3 },
			isNewItem = { name = "isNewItem", dataType = "bool", paramNum = 4 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 5 },
			updateReason = { name = "updateReason", dataType = "integer", paramNum = 6 },
	["EVENT_INVENTORY_SLOT_LOCKED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			bagId = { name = "bagId", dataType = "integer", paramNum = 2 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 3 },
	["EVENT_INVENTORY_SLOT_UNLOCKED"] = {
			bagId = { name = "bagId", dataType = "integer", paramNum = 2 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 3 },
	["EVENT_ITEM_REPAIR_FAILURE"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			reason = { name = "reason", dataType = "integer", paramNum = 2 },
	["EVENT_ITEM_SLOT_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 2 },
	["EVENT_JUMP_FAILED"] = {
			reason = { name = "reason", dataType = "integer", paramNum = 2 },
	["EVENT_KEEPS_INITIALIZED"] = {
	["EVENT_KEEP_ALLIANCE_OWNER_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },
			owningAlliance = { name = "owningAlliance", dataType = "integer", paramNum = 3 },
	["EVENT_KEEP_BATTLE_TOKENS_UPDATE"] = {
	["EVENT_KEEP_CAPTURE_REWARDS"] = {
	["EVENT_KEEP_COMBAT_STATE_CHANGED"] = {
	["EVENT_KEEP_END_INTERACTION"] = {
	["EVENT_KEEP_GATE_STATE_CHANGED"] = {
	["EVENT_KEEP_GUILD_CLAIM_UPDATE"] = {
	["EVENT_KEEP_INITIALIZED"] = {
	["EVENT_KEEP_OWNERSHIP_CHANGED_NOTIFICATION"] = {
	["EVENT_KEEP_RESOURCE_LOCK_UPDATE"] = {
	["EVENT_KEEP_RESOURCE_UPDATE"] = {
	["EVENT_KEEP_START_INTERACTION"] = {
	["EVENT_KEEP_UNDER_ATTACK_CHANGED"] = {
	["EVENT_KILL_LOCATIONS_UPDATED"] = {
	["EVENT_KILL_SPAM"] = {
	["EVENT_LEADER_UPDATE"] = {
	["EVENT_LEAVE_CAMPAIGN_QUEUE_RESPONSE"] = {
	["EVENT_LEAVE_RAM_ESCORT"] = {
	["EVENT_LEVEL_UPDATE"] = {
	["EVENT_LEVEL_UP_INFO_UPDATED"] = {
	["EVENT_LINKED_WORLD_POSITION_CHANGED"] = {
	["EVENT_LOCAL_PLAYER_ABILITY_OCCURED"] = {
	["EVENT_LOCAL_PLAYER_CHARGEUP_BEGIN"] = {
	["EVENT_LOCAL_PLAYER_CHARGEUP_COMPLETE"] = {
	["EVENT_LOCAL_PLAYER_KICKOFF_CAST"] = {
	["EVENT_LOCAL_PLAYER_WEAPON_ABILITY_WAIT_BEGIN"] = {
	["EVENT_LOCAL_PLAYER_WEAPON_ABILITY_WAIT_END"] = {
	["EVENT_LOCKPICK_BROKE"] = {
	["EVENT_LOCKPICK_FAILED"] = {
	["EVENT_LOCKPICK_SUCCESS"] = {
	["EVENT_LOGOUT_DEFERRED"] = {
	["EVENT_LOGOUT_DISALLOWED"] = {
	["EVENT_LOOT_CLOSED"] = {
	["EVENT_LOOT_ITEM_FAILED"] = {
	["EVENT_LOOT_RECEIVED"] = {
	["EVENT_LOOT_UPDATED"] = {
	["EVENT_LORE_BOOK_ALREADY_KNOWN"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			bookTitle = { name = "bookTitle", dataType = "string", paramNum = 2 },
	["EVENT_LORE_BOOK_LEARNED"] = {
			categoryIndex = { name = "categoryIndex", dataType = "luaindex", paramNum = 2 },
			collectionIndex = { name = "collectionIndex", dataType = "luaindex", paramNum = 3 },
			bookIndex = { name = "bookIndex", dataType = "luaindex", paramNum = 4 },
			guildIndex = { name = "guildIndex", dataType = "luaindex", paramNum = 5 },
	["EVENT_LORE_COLLECTION_COMPLETED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			categoryIndex = { name = "categoryIndex", dataType = "luaindex", paramNum = 2 },
			collectionIndex = { name = "collectionIndex", dataType = "luaindex", paramNum = 3 },
	["EVENT_LORE_LIBRARY_INITIALIZED"] = {
	["EVENT_MAIL_ATTACHED_MONEY_CHANGED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			moneyAmount = { name = "moneyAmount", dataType = "integer", paramNum = 2 },
	["EVENT_MAIL_ATTACHMENT_ADDED"] = {
			attachmentSlot = { name = "attachmentSlot", dataType = "luaindex", paramNum = 2 },
	["EVENT_MAIL_ATTACHMENT_REMOVED"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			attachmentSlot = { name = "attachmentSlot", dataType = "luaindex", paramNum = 2 },
	["EVENT_MAIL_CLOSE_MAILBOX"] = {
	["EVENT_MAIL_COD_CHANGED"] = {
			codAmount = { name = "codAmount", dataType = "integer", paramNum = 2 },
	["EVENT_MAIL_INBOX_UPDATE"] = {
	["EVENT_MAIL_NUM_UNREAD_CHANGED"] = {
			numUnread = { name = "numUnread", dataType = "integer", paramNum = 2 },
	["EVENT_MAIL_OPEN_MAILBOX"] = {
	["EVENT_MAIL_READABLE"] = {
			mailId = { name = "mailId", dataType = "id64", paramNum = 2 },
	["EVENT_MAIL_REMOVED"] = {
			mailId = { name = "mailId", dataType = "id64", paramNum = 2 },
	["EVENT_MAIL_SEND_FAILED"] = {
			reason = { name = "reason", dataType = "integer", paramNum = 2 },
	["EVENT_MAIL_SEND_SUCCESS"] = {
	["EVENT_MAIL_TAKE_ATTACHED_ITEM_SUCCESS"] = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			mailId = { name = "mailId", dataType = "id64", paramNum = 2 },
	["EVENT_MAIL_TAKE_ATTACHED_MONEY_SUCCESS"] = {
	["EVENT_MAP_PING"] = {
	["EVENT_MEDAL_AWARDED"] = {
	["EVENT_MINIMAP_FILTERS_INITIALIZED"] = {
	["EVENT_MISSING_LURE"] = {
	["EVENT_MONEY_UPDATE"] = {
	["EVENT_MOUNTED_STATE_CHANGED"] = {
	["EVENT_MOUNTS_FULL_UPDATE"] = {
	["EVENT_MOUNT_FAILURE"] = {
	["EVENT_MOUNT_UPDATE"] = {
	["EVENT_MOUSEOVER_CHANGED"] = {
	["EVENT_MOUSE_REQUEST_ABANDON_QUEST"] = {
	["EVENT_MOUSE_REQUEST_DESTROY_ITEM"] = {
	["EVENT_NEW_DISCOVERY_AREA"] = {
	["EVENT_NEW_MOVEMENT_IN_UI_MODE"] = {
	["EVENT_NEW_REVEAL"] = {
	["EVENT_NON_COMBAT_BONUS_CHANGED"] = {
	["EVENT_NOT_ENOUGH_MONEY"] = {
	["EVENT_OBJECTIVES_UPDATED"] = {
	["EVENT_OBJECTIVE_COMPLETED"] = {
	["EVENT_OBJECTIVE_CONTROL_STATE"] = {
	["EVENT_OPEN_BANK"] = {
	["EVENT_OPEN_GUILD_BANK"] = {
	["EVENT_OPEN_HOOK_POINT_STORE"] = {
	["EVENT_OPEN_STORE"] = {
	["EVENT_OPEN_TRADING_HOUSE"] = {
	["EVENT_PLAYER_ACTIVATED"] = {
	["EVENT_PLAYER_ALIVE"] = {
	["EVENT_PLAYER_AURA_UPDATE"] = {
	["EVENT_PLAYER_COMBAT_STATE"] = {
	["EVENT_PLAYER_DEACTIVATED"] = {
	["EVENT_PLAYER_DEAD"] = {
	["EVENT_PLAYER_DEATH_INFO_UPDATE"] = {
	["EVENT_PLAYER_DEATH_REQUEST_FAILURE"] = {
	["EVENT_PLAYER_IN_PIN_AREA_CHANGED"] = {
	["EVENT_PLAYER_TITLES_UPDATE"] = {
	["EVENT_PLEDGE_OF_MARA_OFFER"] = {
	["EVENT_PLEDGE_OF_MARA_OFFER_REMOVED"] = {
	["EVENT_PLEDGE_OF_MARA_RESULT"] = {
	["EVENT_POIS_INITIALIZED"] = {
	["EVENT_POI_DISCOVERED"] = {
	["EVENT_POI_UPDATED"] = {
	["EVENT_POWER_UPDATE"] = {
	["EVENT_PREFERRED_CAMPAIGN_CHANGED"] = {
	["EVENT_PREFERRED_TARGET_HIGHLIGHT_UPDATE"] = {
	["EVENT_PVP_FLAG_CHANGED"] = {
	["EVENT_QUEST_ADDED"] = {
	["EVENT_QUEST_ADVANCED"] = {
	["EVENT_QUEST_COMPLETE_ATTEMPT_FAILED_INVENTORY_FULL"] = {
	["EVENT_QUEST_COMPLETE_DIALOG"] = {
	["EVENT_QUEST_COMPLETE_EXPERIENCE"] = {
	["EVENT_QUEST_CONDITION_COUNTER_CHANGED"] = {
	["EVENT_QUEST_DAILY_COUNT_CHANGED"] = {
	["EVENT_QUEST_INTERACT_DIALOG"] = {
	["EVENT_QUEST_LIST_UPDATED"] = {
	["EVENT_QUEST_OFFERED"] = {
	["EVENT_QUEST_POSITION_REQUEST_COMPLETE"] = {
	["EVENT_QUEST_REMOVED"] = {
	["EVENT_QUEST_SHARED"] = {
	["EVENT_QUEST_SHARE_REMOVED"] = {
	["EVENT_QUEST_SHARE_UPDATE"] = {
	["EVENT_QUEST_SHOW_JOURNAL_ENTRY"] = {
	["EVENT_QUEST_TIMER_PAUSED"] = {
	["EVENT_QUEST_TIMER_UPDATED"] = {
	["EVENT_QUEST_TOOL_UPDATED"] = {
	["EVENT_QUEUE_FOR_CAMPAIGN_RESPONSE"] = {
	["EVENT_RAM_ESCORT_COUNT_UPDATE"] = {
	["EVENT_RANK_POINT_UPDATE"] = {
	["EVENT_REASSIGN_CAMPAIGN_FAILED"] = {
	["EVENT_RECIPE_LEARNED"] = {
	["EVENT_REMOVE_ACTIVE_COMBAT_TIP"] = {
	["EVENT_REMOVE_TUTORIAL"] = {
	["EVENT_REQUIREMENTS_FAIL"] = {
	["EVENT_RESURRECT_FAILURE"] = {
	["EVENT_RESURRECT_REQUEST"] = {
	["EVENT_RESURRECT_REQUEST_REMOVED"] = {
	["EVENT_RETICLE_HIDDEN_UPDATE"] = {
	["EVENT_RETICLE_TARGET_CHANGED"] = {
	["EVENT_REVENGE_KILL"] = {
	["EVENT_SCRIPTED_WORLD_EVENT_INVITE"] = {
	["EVENT_SELL_RECEIPT"] = {
	["EVENT_SERVER_SHUTDOWN_INFO"] = {
	["EVENT_SET_CHEVRON"] = {
	["EVENT_SHOW_BOOK"] = {
	["EVENT_SHOW_LINKED_CAST"] = {
	["EVENT_SHOW_SCOREBOARD"] = {
	["EVENT_SHOW_SCOREBUTTON"] = {
	["EVENT_SHOW_TIME"] = {
	["EVENT_SHOW_TREASURE_MAP"] = {
	["EVENT_SIEGE_BUSY"] = {
	["EVENT_SIEGE_CONTROL_ANOTHER_PLAYER"] = {
	["EVENT_SIEGE_CREATION_FAILED_CLOSEST_DOOR_ALREADY_HAS_RAM"] = {
	["EVENT_SIEGE_CREATION_FAILED_NO_VALID_DOOR"] = {
	["EVENT_SIEGE_FIRE_FAILED_COOLDOWN"] = {
	["EVENT_SIEGE_FIRE_FAILED_RETARGETING"] = {
	["EVENT_SIEGE_PACK_FAILED_INVENTORY_FULL"] = {
	["EVENT_SIEGE_PACK_FAILED_NOT_CREATOR"] = {
	["EVENT_SKILLS_FULL_UPDATE"] = {
	["EVENT_SKILL_ADDEDFORCE_RESPEC"] = {
	["EVENT_SKILL_LINE_ADDED"] = {
	["EVENT_SKILL_POINTS_CHANGED"] = {
	["EVENT_SKILL_RANK_UPDATE"] = {
	["EVENT_SKILL_XP_UPDATE"] = {
	["EVENT_SLOT_IS_LOCKED_FAILURE"] = {
	["EVENT_SMITHING_TRAIT_RESEARCH_COMPLETED"] = {
	["EVENT_SMITHING_TRAIT_RESEARCH_STARTED"] = {
	["EVENT_SOCKETING_ITEM_ALREADY_HAS_PROPERTY"] = {
	["EVENT_SOCKETING_UNIT_DESTROYED"] = {
	["EVENT_SOCKETING_UNIT_SOCKETS_CHANGED"] = {
	["EVENT_SOUL_GEM_ITEM_CHARGE_FAILURE"] = {
	["EVENT_STABLE_INTERACT_END"] = {
	["EVENT_STABLE_INTERACT_START"] = {
	["EVENT_START_FAST_TRAVEL_INTERACTION"] = {
	["EVENT_START_FAST_TRAVEL_KEEP_INTERACTION"] = {
	["EVENT_START_KEEP_GUILD_CLAIM_INTERACTION"] = {
	["EVENT_START_KEEP_GUILD_RELEASE_INTERACTION"] = {
	["EVENT_START_SOUL_GEM_RESURRECTION"] = {
	["EVENT_STATS_UPDATED"] = {
	["EVENT_STEALTH_STATE_CHANGED"] = {
	["EVENT_STORE_FAILURE"] = {
	["EVENT_STYLE_LEARNED"] = {
	["EVENT_SYNERGY_ABILITY_GAINED"] = {
	["EVENT_SYNERGY_ABILITY_LOST"] = {
	["EVENT_TARGET_CHANGED"] = {
	["EVENT_TITLE_UPDATE"] = {
	["EVENT_TRACKING_UPDATE"] = {
	["EVENT_TRADE_ACCEPT_FAILED_NOT_ENOUGH_MONEY"] = {
	["EVENT_TRADE_CANCELED"] = {
	["EVENT_TRADE_CONFIRMATION_CHANGED"] = {
	["EVENT_TRADE_ELEVATION_FAILED"] = {
	["EVENT_TRADE_FAILED"] = {
	["EVENT_TRADE_INVITE_ACCEPTED"] = {
	["EVENT_TRADE_INVITE_CANCELED"] = {
	["EVENT_TRADE_INVITE_CONSIDERING"] = {
	["EVENT_TRADE_INVITE_DECLINED"] = {
	["EVENT_TRADE_INVITE_FAILED"] = {
	["EVENT_TRADE_INVITE_REMOVED"] = {
	["EVENT_TRADE_INVITE_WAITING"] = {
	["EVENT_TRADE_ITEM_ADDED"] = {
	["EVENT_TRADE_ITEM_ADD_FAILED"] = {
	["EVENT_TRADE_ITEM_REMOVED"] = {
	["EVENT_TRADE_ITEM_UPDATED"] = {
	["EVENT_TRADE_MONEY_CHANGED"] = {
	["EVENT_TRADE_SUCCEEDED"] = {
	["EVENT_TRADING_HOUSE_AWAITING_RESPONSE"] = {
	["EVENT_TRADING_HOUSE_CONFIRM_ITEM_PURCHASE"] = {
	["EVENT_TRADING_HOUSE_ERROR"] = {
	["EVENT_TRADING_HOUSE_PENDING_ITEM_UPDATE"] = {
	["EVENT_TRADING_HOUSE_RESPONSE_RECEIVED"] = {
	["EVENT_TRADING_HOUSE_SEARCH_RESULTS_RECEIVED"] = {
	["EVENT_TRADING_HOUSE_STATUS_RECEIVED"] = {
	["EVENT_TRAIT_LEARNED"] = {
	["EVENT_TUTORIAL_SYSTEM_ENABLED_STATE_CHANGED"] = {
	["EVENT_UI_ERROR"] = {
	["EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED"] = {
	["EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED"] = {
	["EVENT_UNIT_ATTRIBUTE_VISUAL_UPDATED"] = {
	["EVENT_UNIT_CREATED"] = {
	["EVENT_UNIT_DEATH_STATE_CHANGED"] = {
	["EVENT_UNIT_DESTROYED"] = {
	["EVENT_UNIT_FRAME_UPDATE"] = {
	["EVENT_UPDATE_BUYBACK"] = {
	["EVENT_UPDATE_GAME_STATE"] = {
	["EVENT_VETERAN_DIFFICULTY_CHANGED"] = {
	["EVENT_VETERAN_POINTS_UPDATE"] = {
	["EVENT_VETERAN_RANK_UPDATE"] = {
	["EVENT_WEAPON_SET_FULL_UPDATE"] = {
	["EVENT_WEAPON_SET_RANK_UPDATE"] = {
	["EVENT_WEAPON_SET_XP_UPDATE"] = {
	["EVENT_WEAPON_SWAP_LOCKED"] = {
	["EVENT_WEREWOLF_STATE_CHANGED"] = {
	["EVENT_ZONE_CHANGED"] = {
	["EVENT_ZONE_CHANNEL_CHANGED"] = {
	["EVENT_ZONE_SCORING_CHANGED"] = {
	["EVENT_ZONE_UPDATE"] = {
	["EVENT_ACTION_LAYER_POPPED"] = {
	["EVENT_ACTION_LAYER_PUSHED"] = {
	["EVENT_ADD_ON_LOADED"] = {
	["EVENT_CAPS_LOCK_STATE_CHANGED"] = {
	["EVENT_GLOBAL_MOUSE_DOWN"] = {
	["EVENT_GLOBAL_MOUSE_UP"] = {
	["EVENT_GUI_HIDDEN"] = {
	["EVENT_KEYBINDINGS_LOADED"] = {
	["EVENT_KEYBINDING_CLEARED"] = {
	["EVENT_KEYBINDING_SET"] = {
	["EVENT_LUA_ERROR"] = {
	["EVENT_SCREEN_RESIZED"] = {
	["EVENT_SCRIPT_ACCESS_VIOLATION"] = {
	["EVENT_SHOW_GUI"] = {
	["EVENT_UPDATE_GUI_LOADING_PROGRESS"] = {
}

for e,t in pairs(wykkydsFramework.Events.GameEventTable) do
	if t.CODE ~= nil then wykkydsFramework.Events.GameEventsByCode[ t.CODE ] = t end
end