wykkydsFramework.Events.GameEventTable = {
	["EVENT_ABILITY_COOLDOWN_UPDATED"] = {		CODE = EVENT_ABILITY_COOLDOWN_UPDATED,		DESCR = "EVENT_ABILITY_COOLDOWN_UPDATED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			abilityId = { name = "abilityId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_ABILITY_LIST_CHANGED"] = {		CODE = EVENT_ABILITY_LIST_CHANGED,		DESCR = "EVENT_ABILITY_LIST_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ABILITY_PROGRESSION_FULL_UPDATE"] = {		CODE = EVENT_ABILITY_PROGRESSION_FULL_UPDATE,		DESCR = "EVENT_ABILITY_PROGRESSION_FULL_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ABILITY_PROGRESSION_RANK_UPDATE"] = {		CODE = EVENT_ABILITY_PROGRESSION_RANK_UPDATE,		DESCR = "EVENT_ABILITY_PROGRESSION_RANK_UPDATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			progressionIndex = { name = "progressionIndex", dataType = "luaindex", paramNum = 2 },
			rank = { name = "rank", dataType = "integer", paramNum = 3 },
			maxRank = { name = "maxRank", dataType = "integer", paramNum = 4 },
			morph = { name = "morph", dataType = "integer", paramNum = 5 },		},	},
	["EVENT_ABILITY_PROGRESSION_RESULT"] = {		CODE = EVENT_ABILITY_PROGRESSION_RESULT,		DESCR = "EVENT_ABILITY_PROGRESSION_RESULT",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_ABILITY_PROGRESSION_XP_UPDATE"] = {		CODE = EVENT_ABILITY_PROGRESSION_XP_UPDATE,		DESCR = "EVENT_ABILITY_PROGRESSION_XP_UPDATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			progressionIndex = { name = "progressionIndex", dataType = "luaindex", paramNum = 2 },
			lastRankXP = { name = "lastRankXP", dataType = "integer", paramNum = 3 },
			nextRankXP = { name = "nextRankXP", dataType = "integer", paramNum = 4 },
			currentXP = { name = "currentXP", dataType = "integer", paramNum = 5 },
			atMorph = { name = "atMorph", dataType = "bool", paramNum = 6 },		},	},
	["EVENT_ABILITY_RANGE_CHANGED"] = {		CODE = EVENT_ABILITY_RANGE_CHANGED,		DESCR = "EVENT_ABILITY_RANGE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ACHIEVEMENTS_UPDATED"] = {		CODE = EVENT_ACHIEVEMENTS_UPDATED,		DESCR = "EVENT_ACHIEVEMENTS_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ACHIEVEMENT_AWARDED"] = {		CODE = EVENT_ACHIEVEMENT_AWARDED,		DESCR = "EVENT_ACHIEVEMENT_AWARDED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			name = { name = "name", dataType = "string", paramNum = 2 },
			points = { name = "points", dataType = "integer", paramNum = 3 },
			id = { name = "id", dataType = "integer", paramNum = 4 },
			link = { name = "link", dataType = "string", paramNum = 5 },		},	},
	["EVENT_ACHIEVEMENT_UPDATED"] = {		CODE = EVENT_ACHIEVEMENT_UPDATED,		DESCR = "EVENT_ACHIEVEMENT_UPDATED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			id = { name = "id", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_ACTION_PAGE_UPDATED"] = {		CODE = EVENT_ACTION_PAGE_UPDATED,		DESCR = "EVENT_ACTION_PAGE_UPDATED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			physicalPage = { name = "physicalPage", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_ACTION_SLOTS_FULL_UPDATE"] = {		CODE = EVENT_ACTION_SLOTS_FULL_UPDATE,		DESCR = "EVENT_ACTION_SLOTS_FULL_UPDATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			isHotbarSwap = { name = "isHotbarSwap", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_ACTION_SLOT_ABILITY_SLOTTED"] = {		CODE = EVENT_ACTION_SLOT_ABILITY_SLOTTED,		DESCR = "EVENT_ACTION_SLOT_ABILITY_SLOTTED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			newAbilitySlotted = { name = "newAbilitySlotted", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_ACTION_SLOT_STATE_UPDATED"] = {		CODE = EVENT_ACTION_SLOT_STATE_UPDATED,		DESCR = "EVENT_ACTION_SLOT_STATE_UPDATED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			slotNum = { name = "slotNum", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_ACTION_SLOT_UPDATED"] = {		CODE = EVENT_ACTION_SLOT_UPDATED,		DESCR = "EVENT_ACTION_SLOT_UPDATED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			slotNum = { name = "slotNum", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_ACTION_UPDATE_COOLDOWNS"] = {		CODE = EVENT_ACTION_UPDATE_COOLDOWNS,		DESCR = "EVENT_ACTION_UPDATE_COOLDOWNS",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ACTIVE_QUEST_TOOL_CHANGED"] = {		CODE = EVENT_ACTIVE_QUEST_TOOL_CHANGED,		DESCR = "EVENT_ACTIVE_QUEST_TOOL_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },
			toolIndex = { name = "toolIndex", dataType = "luaindex", paramNum = 3 },		},	},
	["EVENT_ACTIVE_QUEST_TOOL_CLEARED"] = {		CODE = EVENT_ACTIVE_QUEST_TOOL_CLEARED,		DESCR = "EVENT_ACTIVE_QUEST_TOOL_CLEARED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ACTIVE_QUICKSLOT_CHANGED"] = {		CODE = EVENT_ACTIVE_QUICKSLOT_CHANGED,		DESCR = "EVENT_ACTIVE_QUICKSLOT_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_ACTIVE_WEAPON_PAIR_CHANGED"] = {		CODE = EVENT_ACTIVE_WEAPON_PAIR_CHANGED,		DESCR = "EVENT_ACTIVE_WEAPON_PAIR_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			activeWeaponPair = { name = "activeWeaponPair", dataType = "integer", paramNum = 2 },
			locked = { name = "locked", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_AGENT_CHAT_REQUESTED"] = {		CODE = EVENT_AGENT_CHAT_REQUESTED,		DESCR = "EVENT_AGENT_CHAT_REQUESTED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ALLIANCE_POINT_UPDATE"] = {		CODE = EVENT_ALLIANCE_POINT_UPDATE,		DESCR = "EVENT_ALLIANCE_POINT_UPDATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			alliancePoints = { name = "alliancePoints", dataType = "integer", paramNum = 2 },
			playSound = { name = "playSound", dataType = "bool", paramNum = 3 },
			difference = { name = "difference", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_ARTIFACT_CONTROL_STATE"] = {		CODE = EVENT_ARTIFACT_CONTROL_STATE,		DESCR = "EVENT_ARTIFACT_CONTROL_STATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			artifactName = { name = "artifactName", dataType = "string", paramNum = 2 },
			keepId = { name = "keepId", dataType = "integer", paramNum = 3 },
			playerName = { name = "playerName", dataType = "string", paramNum = 4 },
			playerAlliance = { name = "playerAlliance", dataType = "integer", paramNum = 5 },
			controlEvent = { name = "controlEvent", dataType = "integer", paramNum = 6 },
			controlState = { name = "controlState", dataType = "integer", paramNum = 7 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 8 },		},	},	["EVENT_ASSIGNED_CAMPAIGN_CHANGED"] = {		CODE = EVENT_ASSIGNED_CAMPAIGN_CHANGED,		DESCR = "EVENT_ASSIGNED_CAMPAIGN_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			newAssignedCampaignId = { name = "newAssignedCampaignId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_ATTRIBUTE_FORCE_RESPEC"] = {		CODE = EVENT_ATTRIBUTE_FORCE_RESPEC,		DESCR = "EVENT_ATTRIBUTE_FORCE_RESPEC",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ATTRIBUTE_UPGRADE_UPDATED"] = {		CODE = EVENT_ATTRIBUTE_UPGRADE_UPDATED,		DESCR = "EVENT_ATTRIBUTE_UPGRADE_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_AVENGE_KILL"] = {		CODE = EVENT_AVENGE_KILL,		DESCR = "EVENT_AVENGE_KILL",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			avengedPlayerName = { name = "avengedPlayerName", dataType = "string", paramNum = 2 },
			killedPlayerName = { name = "killedPlayerName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_BATTLE_TOKEN_UPDATE"] = {		CODE = EVENT_BATTLE_TOKEN_UPDATE,		DESCR = "EVENT_BATTLE_TOKEN_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			battleTokens = { name = "battleTokens", dataType = "integer", paramNum = 2 },			playSound = { name = "playSound", dataType = "bool", paramNum = 3 },			difference = { name = "difference", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_BEGIN_CAST"] = {		CODE = EVENT_BEGIN_CAST,		DESCR = "EVENT_BEGIN_CAST",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			actionName = { name = "actionName", dataType = "string", paramNum = 3 },
			startTime = { name = "startTime", dataType = "number", paramNum = 4 },
			endTime = { name = "endTime", dataType = "number", paramNum = 5 },
			isChannel = { name = "isChannel", dataType = "bool", paramNum = 6 },
			barType = { name = "barType", dataType = "integer", paramNum = 7 },
			blockable = { name = "blockable", dataType = "bool", paramNum = 8 },
			interruptible = { name = "interruptible", dataType = "bool", paramNum = 9 },
			isChargeUp = { name = "isChargeUp", dataType = "bool", paramNum = 10 },		},	},
	["EVENT_BEGIN_LOCKPICK"] = {		CODE = EVENT_BEGIN_LOCKPICK,		DESCR = "EVENT_BEGIN_LOCKPICK",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_BEGIN_SIEGE_CONTROL"] = {		CODE = EVENT_BEGIN_SIEGE_CONTROL,		DESCR = "EVENT_BEGIN_SIEGE_CONTROL",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_BEGIN_SIEGE_UPGRADE"] = {		CODE = EVENT_BEGIN_SIEGE_UPGRADE,		DESCR = "EVENT_BEGIN_SIEGE_UPGRADE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_BOSSES_CHANGED"] = {		CODE = EVENT_BOSSES_CHANGED,		DESCR = "EVENT_BOSSES_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_BROADCAST"] = {		CODE = EVENT_BROADCAST,		DESCR = "EVENT_BROADCAST",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			message = { name = "message", dataType = "string", paramNum = 2 },		},	},
	["EVENT_BUYBACK_RECEIPT"] = {		CODE = EVENT_BUYBACK_RECEIPT,		DESCR = "EVENT_BUYBACK_RECEIPT",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			itemLink = { name = "itemLink", dataType = "string", paramNum = 2 },
			itemQuantity = { name = "itemQuantity", dataType = "integer", paramNum = 3 },
			money = { name = "money", dataType = "integer", paramNum = 4 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 5 },		},	},
	["EVENT_BUY_RECEIPT"] = {		CODE = EVENT_BUY_RECEIPT,		DESCR = "EVENT_BUY_RECEIPT",		PARAMS = {
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
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 12 },		},	},
	["EVENT_CAMERA_DISTANCE_SETTING_CHANGED"] = {		CODE = EVENT_CAMERA_DISTANCE_SETTING_CHANGED,		DESCR = "EVENT_CAMERA_DISTANCE_SETTING_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CAMPAIGN_EMPEROR_CHANGED"] = {		CODE = EVENT_CAMPAIGN_EMPEROR_CHANGED,		DESCR = "EVENT_CAMPAIGN_EMPEROR_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_CAMPAIGN_HISTORY_WINDOW_CHANGED"] = {		CODE = EVENT_CAMPAIGN_HISTORY_WINDOW_CHANGED,		DESCR = "EVENT_CAMPAIGN_HISTORY_WINDOW_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CAMPAIGN_LEADERBOARD_DATA_CHANGED"] = {		CODE = EVENT_CAMPAIGN_LEADERBOARD_DATA_CHANGED,		DESCR = "EVENT_CAMPAIGN_LEADERBOARD_DATA_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CAMPAIGN_QUEUE_JOINED"] = {		CODE = EVENT_CAMPAIGN_QUEUE_JOINED,		DESCR = "EVENT_CAMPAIGN_QUEUE_JOINED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			isGroup = { name = "isGroup", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_CAMPAIGN_QUEUE_LEFT"] = {		CODE = EVENT_CAMPAIGN_QUEUE_LEFT,		DESCR = "EVENT_CAMPAIGN_QUEUE_LEFT",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			isGroup = { name = "isGroup", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_CAMPAIGN_QUEUE_POSITION_CHANGED"] = {		CODE = EVENT_CAMPAIGN_QUEUE_POSITION_CHANGED,		DESCR = "EVENT_CAMPAIGN_QUEUE_POSITION_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			isGroup = { name = "isGroup", dataType = "bool", paramNum = 3 },
			position = { name = "position", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_CAMPAIGN_QUEUE_STATE_CHANGED"] = {		CODE = EVENT_CAMPAIGN_QUEUE_STATE_CHANGED,		DESCR = "EVENT_CAMPAIGN_QUEUE_STATE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			isGroup = { name = "isGroup", dataType = "bool", paramNum = 3 },
			state = { name = "state", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_CAMPAIGN_SCORE_DATA_CHANGED"] = {		CODE = EVENT_CAMPAIGN_SCORE_DATA_CHANGED,		DESCR = "EVENT_CAMPAIGN_SCORE_DATA_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CAMPAIGN_SELECTION_DATA_CHANGED"] = {		CODE = EVENT_CAMPAIGN_SELECTION_DATA_CHANGED,		DESCR = "EVENT_CAMPAIGN_SELECTION_DATA_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CAMPAIGN_STATE_INITIALIZED"] = {		CODE = EVENT_CAMPAIGN_STATE_INITIALIZED,		DESCR = "EVENT_CAMPAIGN_STATE_INITIALIZED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_CANCEL_MOUSE_REQUEST_DESTROY_ITEM"] = {		CODE = EVENT_CANCEL_MOUSE_REQUEST_DESTROY_ITEM,		DESCR = "EVENT_CANCEL_MOUSE_REQUEST_DESTROY_ITEM",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CANNOT_DO_THAT_WHILE_DEAD"] = {		CODE = EVENT_CANNOT_DO_THAT_WHILE_DEAD,		DESCR = "EVENT_CANNOT_DO_THAT_WHILE_DEAD",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CANNOT_FISH_WHILE_SWIMMING"] = {		CODE = EVENT_CANNOT_FISH_WHILE_SWIMMING,		DESCR = "EVENT_CANNOT_FISH_WHILE_SWIMMING",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CAPTURE_AREA_STATUS"] = {		CODE = EVENT_CAPTURE_AREA_STATUS,		DESCR = "EVENT_CAPTURE_AREA_STATUS",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },
			objectiveId = { name = "objectiveId", dataType = "integer", paramNum = 3 },
			battlegroundContext = { name = "battlegroundContext", dataType = "integer", paramNum = 4 },
			curValue = { name = "curValue", dataType = "integer", paramNum = 5 },
			maxValue = { name = "maxValue", dataType = "integer", paramNum = 6 },
			currentCapturePlayers = { name = "currentCapturePlayers", dataType = "integer", paramNum = 7 },		},	},
	["EVENT_CHATTER_BEGIN"] = {		CODE = EVENT_CHATTER_BEGIN,		DESCR = "EVENT_CHATTER_BEGIN",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			optionCount = { name = "optionCount", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_CHATTER_END"] = {		CODE = EVENT_CHATTER_END,		DESCR = "EVENT_CHATTER_END",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CHAT_CHANNEL_INVITE"] = {		CODE = EVENT_CHAT_CHANNEL_INVITE,		DESCR = "EVENT_CHAT_CHANNEL_INVITE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			channelName = { name = "channelName", dataType = "string", paramNum = 2 },
			playerName = { name = "playerName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_CHAT_CHANNEL_JOIN"] = {		CODE = EVENT_CHAT_CHANNEL_JOIN,		DESCR = "EVENT_CHAT_CHANNEL_JOIN",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			channelId = { name = "channelId", dataType = "integer", paramNum = 2 },
			customChannelId = { name = "customChannelId", dataType = "integer", paramNum = 3 },
			channelName = { name = "channelName", dataType = "string", paramNum = 4 },		},	},
	["EVENT_CHAT_CHANNEL_LEAVE"] = {		CODE = EVENT_CHAT_CHANNEL_LEAVE,		DESCR = "EVENT_CHAT_CHANNEL_LEAVE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			channelId = { name = "channelId", dataType = "integer", paramNum = 2 },
			customChannelId = { name = "customChannelId", dataType = "integer", paramNum = 3 },
			channelName = { name = "channelName", dataType = "string", paramNum = 4 },		},	},
	["EVENT_CHAT_LOG_TOGGLED"] = {		CODE = EVENT_CHAT_LOG_TOGGLED,		DESCR = "EVENT_CHAT_LOG_TOGGLED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			opened = { name = "opened", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_CHAT_MESSAGE_CHANNEL"] = {		CODE = EVENT_CHAT_MESSAGE_CHANNEL,		DESCR = "EVENT_CHAT_MESSAGE_CHANNEL",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			messageType = { name = "messageType", dataType = "integer", paramNum = 2 },
			fromName = { name = "fromName", dataType = "string", paramNum = 3 },
			text = { name = "text", dataType = "string", paramNum = 4 },		},	},
	["EVENT_CHAT_MESSAGE_COMBAT"] = {		CODE = EVENT_CHAT_MESSAGE_COMBAT,		DESCR = "EVENT_CHAT_MESSAGE_COMBAT",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			text = { name = "text", dataType = "string", paramNum = 2 },		},	},
	["EVENT_CLOSE_BANK"] = {		CODE = EVENT_CLOSE_BANK,		DESCR = "EVENT_CLOSE_BANK",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CLOSE_GUILD_BANK"] = {		CODE = EVENT_CLOSE_GUILD_BANK,		DESCR = "EVENT_CLOSE_GUILD_BANK",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CLOSE_HOOK_POINT_STORE"] = {		CODE = EVENT_CLOSE_HOOK_POINT_STORE,		DESCR = "EVENT_CLOSE_HOOK_POINT_STORE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CLOSE_STORE"] = {		CODE = EVENT_CLOSE_STORE,		DESCR = "EVENT_CLOSE_STORE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CLOSE_TRADING_HOUSE"] = {		CODE = EVENT_CLOSE_TRADING_HOUSE,		DESCR = "EVENT_CLOSE_TRADING_HOUSE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_COMBAT_EVENT"] = {		CODE = EVENT_COMBAT_EVENT,		DESCR = "EVENT_COMBAT_EVENT",		PARAMS = {
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
			log = { name = "log", dataType = "bool", paramNum = 14 },		},	},
	["EVENT_CONTROLLED_SIEGE_SOCKETS_CHANGED"] = {		CODE = EVENT_CONTROLLED_SIEGE_SOCKETS_CHANGED,		DESCR = "EVENT_CONTROLLED_SIEGE_SOCKETS_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CONVERSATION_FAILED_INVENTORY_FULL"] = {		CODE = EVENT_CONVERSATION_FAILED_INVENTORY_FULL,		DESCR = "EVENT_CONVERSATION_FAILED_INVENTORY_FULL",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_CONVERSATION_UPDATED"] = {		CODE = EVENT_CONVERSATION_UPDATED,		DESCR = "EVENT_CONVERSATION_UPDATED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			conversationBodyText = { name = "conversationBodyText", dataType = "string", paramNum = 2 },
			conversationOptionCount = { name = "conversationOptionCount", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_CORONATE_EMPEROR_NOTIFICATION"] = {		CODE = EVENT_CORONATE_EMPEROR_NOTIFICATION,		DESCR = "EVENT_CORONATE_EMPEROR_NOTIFICATION",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			emperorName = { name = "emperorName", dataType = "string", paramNum = 3 },
			emperorAlliance = { name = "emperorAlliance", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_CRAFTING_STATION_INTERACT"] = {		CODE = EVENT_CRAFTING_STATION_INTERACT,		DESCR = "EVENT_CRAFTING_STATION_INTERACT",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			craftSkill = { name = "craftSkill", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_CRAFT_COMPLETED"] = {		CODE = EVENT_CRAFT_COMPLETED,		DESCR = "EVENT_CRAFT_COMPLETED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			craftSkill = { name = "craftSkill", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_CURRENT_CAMPAIGN_CHANGED"] = {		CODE = EVENT_CURRENT_CAMPAIGN_CHANGED,		DESCR = "EVENT_CURRENT_CAMPAIGN_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			newCurrentCampaignId = { name = "newCurrentCampaignId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_CURRENT_WEAPON_SET_UPDATE"] = {		CODE = EVENT_CURRENT_WEAPON_SET_UPDATE,		DESCR = "EVENT_CURRENT_WEAPON_SET_UPDATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			weaponSetIndex = { name = "weaponSetIndex", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_CURSOR_DROPPED"] = {		CODE = EVENT_CURSOR_DROPPED,		DESCR = "EVENT_CURSOR_DROPPED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			type = { name = "type", dataType = "integer", paramNum = 2 },
			param1 = { name = "param1", dataType = "integer", paramNum = 3 },
			param2 = { name = "param2", dataType = "integer", paramNum = 4 },
			param3 = { name = "param3", dataType = "integer", paramNum = 5 },
			param4 = { name = "param4", dataType = "integer", paramNum = 6 },
			param5 = { name = "param5", dataType = "integer", paramNum = 7 },
			param6 = { name = "param6", dataType = "integer", paramNum = 8 },		},	},
	["EVENT_CURSOR_PICKUP"] = {		CODE = EVENT_CURSOR_PICKUP,		DESCR = "EVENT_CURSOR_PICKUP",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			type = { name = "type", dataType = "integer", paramNum = 2 },
			param1 = { name = "param1", dataType = "integer", paramNum = 3 },
			param2 = { name = "param2", dataType = "integer", paramNum = 4 },
			param3 = { name = "param3", dataType = "integer", paramNum = 5 },
			param4 = { name = "param4", dataType = "integer", paramNum = 6 },
			param5 = { name = "param5", dataType = "integer", paramNum = 7 },
			param6 = { name = "param6", dataType = "integer", paramNum = 8 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 9 },		},	},
	["EVENT_DELAY_CAST"] = {		CODE = EVENT_DELAY_CAST,		DESCR = "EVENT_DELAY_CAST",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			actionName = { name = "actionName", dataType = "string", paramNum = 3 },
			startTime = { name = "startTime", dataType = "number", paramNum = 4 },
			endTime = { name = "endTime", dataType = "number", paramNum = 5 },
			isChannel = { name = "isChannel", dataType = "bool", paramNum = 6 },		},	},
	["EVENT_DEPOSE_EMPEROR_NOTIFICATION"] = {		CODE = EVENT_DEPOSE_EMPEROR_NOTIFICATION,		DESCR = "EVENT_DEPOSE_EMPEROR_NOTIFICATION",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },
			emperorName = { name = "emperorName", dataType = "string", paramNum = 3 },
			emperorAlliance = { name = "emperorAlliance", dataType = "integer", paramNum = 4 },
			abdication = { name = "abdication", dataType = "bool", paramNum = 5 },		},	},
	["EVENT_DIFFICULTY_LEVEL_CHANGED"] = {		CODE = EVENT_DIFFICULTY_LEVEL_CHANGED,		DESCR = "EVENT_DIFFICULTY_LEVEL_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			difficultyLevel = { name = "difficultyLevel", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_DISABLE_SIEGE_AIM_ABILITY"] = {		CODE = EVENT_DISABLE_SIEGE_AIM_ABILITY,		DESCR = "EVENT_DISABLE_SIEGE_AIM_ABILITY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_DISABLE_SIEGE_FIRE_ABILITY"] = {		CODE = EVENT_DISABLE_SIEGE_FIRE_ABILITY,		DESCR = "EVENT_DISABLE_SIEGE_FIRE_ABILITY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_DISABLE_SIEGE_PACKUP_ABILITY"] = {		CODE = EVENT_DISABLE_SIEGE_PACKUP_ABILITY,		DESCR = "EVENT_DISABLE_SIEGE_PACKUP_ABILITY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_DISGUISE_STATE_CHANGED"] = {		CODE = EVENT_DISGUISE_STATE_CHANGED,		DESCR = "EVENT_DISGUISE_STATE_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			disguiseState = { name = "disguiseState", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_DISPLAY_ACTIVE_COMBAT_TIP"] = {		CODE = EVENT_DISPLAY_ACTIVE_COMBAT_TIP,		DESCR = "EVENT_DISPLAY_ACTIVE_COMBAT_TIP",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			activeCombatTipId = { name = "activeCombatTipId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_DISPLAY_TUTORIAL"] = {		CODE = EVENT_DISPLAY_TUTORIAL,		DESCR = "EVENT_DISPLAY_TUTORIAL",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			tutorialIndex = { name = "tutorialIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_DISPOSITION_UPDATE"] = {		CODE = EVENT_DISPOSITION_UPDATE,		DESCR = "EVENT_DISPOSITION_UPDATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },		},	},
	["EVENT_DROWN_TIMER_UPDATE"] = {		CODE = EVENT_DROWN_TIMER_UPDATE,		DESCR = "EVENT_DROWN_TIMER_UPDATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			startTime = { name = "startTime", dataType = "number", paramNum = 3 },
			endTime = { name = "endTime", dataType = "number", paramNum = 4 },		},	},
	["EVENT_EFFECTS_FULL_UPDATE"] = {		CODE = EVENT_EFFECTS_FULL_UPDATE,		DESCR = "EVENT_EFFECTS_FULL_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_EFFECT_CHANGED"] = {		CODE = EVENT_EFFECT_CHANGED,		DESCR = "EVENT_EFFECT_CHANGED",		PARAMS = {
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
			statusEffectType = { name = "statusEffectType", dataType = "integer", paramNum = 13 },		},	},
	["EVENT_ENABLE_SIEGE_AIM_ABILITY"] = {		CODE = EVENT_ENABLE_SIEGE_AIM_ABILITY,		DESCR = "EVENT_ENABLE_SIEGE_AIM_ABILITY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ENABLE_SIEGE_FIRE_ABILITY"] = {		CODE = EVENT_ENABLE_SIEGE_FIRE_ABILITY,		DESCR = "EVENT_ENABLE_SIEGE_FIRE_ABILITY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ENABLE_SIEGE_PACKUP_ABILITY"] = {		CODE = EVENT_ENABLE_SIEGE_PACKUP_ABILITY,		DESCR = "EVENT_ENABLE_SIEGE_PACKUP_ABILITY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_END_CAST"] = {		CODE = EVENT_END_CAST,		DESCR = "EVENT_END_CAST",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			interrupted = { name = "interrupted", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_END_CRAFTING_STATION_INTERACT"] = {		CODE = EVENT_END_CRAFTING_STATION_INTERACT,		DESCR = "EVENT_END_CRAFTING_STATION_INTERACT",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_END_FAST_TRAVEL_INTERACTION"] = {		CODE = EVENT_END_FAST_TRAVEL_INTERACTION,		DESCR = "EVENT_END_FAST_TRAVEL_INTERACTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_END_FAST_TRAVEL_KEEP_INTERACTION"] = {		CODE = EVENT_END_FAST_TRAVEL_KEEP_INTERACTION,		DESCR = "EVENT_END_FAST_TRAVEL_KEEP_INTERACTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_END_KEEP_GUILD_CLAIM_INTERACTION"] = {		CODE = EVENT_END_KEEP_GUILD_CLAIM_INTERACTION,		DESCR = "EVENT_END_KEEP_GUILD_CLAIM_INTERACTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_END_KEEP_GUILD_RELEASE_INTERACTION"] = {		CODE = EVENT_END_KEEP_GUILD_RELEASE_INTERACTION,		DESCR = "EVENT_END_KEEP_GUILD_RELEASE_INTERACTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_END_SIEGE_CONTROL"] = {		CODE = EVENT_END_SIEGE_CONTROL,		DESCR = "EVENT_END_SIEGE_CONTROL",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_END_SOUL_GEM_RESURRECTION"] = {		CODE = EVENT_END_SOUL_GEM_RESURRECTION,		DESCR = "EVENT_END_SOUL_GEM_RESURRECTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ENTER_GROUND_TARGET_MODE"] = {		CODE = EVENT_ENTER_GROUND_TARGET_MODE,		DESCR = "EVENT_ENTER_GROUND_TARGET_MODE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_EXPERIENCE_GAIN"] = {		CODE = EVENT_EXPERIENCE_GAIN,		DESCR = "EVENT_EXPERIENCE_GAIN",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			value = { name = "value", dataType = "integer", paramNum = 2 },
			reason = { name = "reason", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_EXPERIENCE_GAIN_DISCOVERY"] = {		CODE = EVENT_EXPERIENCE_GAIN_DISCOVERY,		DESCR = "EVENT_EXPERIENCE_GAIN_DISCOVERY",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			areaName = { name = "areaName", dataType = "string", paramNum = 2 },
			value = { name = "value", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_EXPERIENCE_UPDATE"] = {		CODE = EVENT_EXPERIENCE_UPDATE,		DESCR = "EVENT_EXPERIENCE_UPDATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			currentExp = { name = "currentExp", dataType = "integer", paramNum = 3 },
			maxExp = { name = "maxExp", dataType = "integer", paramNum = 4 },
			reason = { name = "reason", dataType = "integer", paramNum = 5 },		},	},
	["EVENT_FAST_TRAVEL_KEEP_NETWORK_LINK_CHANGED"] = {		CODE = EVENT_FAST_TRAVEL_KEEP_NETWORK_LINK_CHANGED,		DESCR = "EVENT_FAST_TRAVEL_KEEP_NETWORK_LINK_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			linkIndex = { name = "linkIndex", dataType = "luaindex", paramNum = 2 },
			linkType = { name = "linkType", dataType = "integer", paramNum = 3 },
			owningAlliance = { name = "owningAlliance", dataType = "integer", paramNum = 4 },
			oldLinkType = { name = "oldLinkType", dataType = "integer", paramNum = 5 },
			oldOwningAlliance = { name = "oldOwningAlliance", dataType = "integer", paramNum = 6 },
			isLocal = { name = "isLocal", dataType = "bool", paramNum = 7 },		},	},
	["EVENT_FAST_TRAVEL_KEEP_NETWORK_UPDATED"] = {		CODE = EVENT_FAST_TRAVEL_KEEP_NETWORK_UPDATED,		DESCR = "EVENT_FAST_TRAVEL_KEEP_NETWORK_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_FAST_TRAVEL_NETWORK_UPDATED"] = {		CODE = EVENT_FAST_TRAVEL_NETWORK_UPDATED,		DESCR = "EVENT_FAST_TRAVEL_NETWORK_UPDATED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			nodeIndex = { name = "nodeIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_FEEDBACK_REQUESTED"] = {		CODE = EVENT_FEEDBACK_REQUESTED,		DESCR = "EVENT_FEEDBACK_REQUESTED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			feedbackId = { name = "feedbackId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_FEEDBACK_TOO_FREQUENT_SCREENSHOT"] = {		CODE = EVENT_FEEDBACK_TOO_FREQUENT_SCREENSHOT,		DESCR = "EVENT_FEEDBACK_TOO_FREQUENT_SCREENSHOT",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_FINESSE_RANK_CHANGED"] = {		CODE = EVENT_FINESSE_RANK_CHANGED,		DESCR = "EVENT_FINESSE_RANK_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			rankNum = { name = "rankNum", dataType = "luaindex", paramNum = 3 },
			name = { name = "name", dataType = "string", paramNum = 4 },
			xpBonus = { name = "xpBonus", dataType = "integer", paramNum = 5 },
			loot = { name = "loot", dataType = "bool", paramNum = 6 },		},	},
	["EVENT_FISHING_LURE_CLEARED"] = {		CODE = EVENT_FISHING_LURE_CLEARED,		DESCR = "EVENT_FISHING_LURE_CLEARED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_FISHING_LURE_SET"] = {		CODE = EVENT_FISHING_LURE_SET,		DESCR = "EVENT_FISHING_LURE_SET",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			fishingLure = { name = "fishingLure", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_FORWARD_CAMPS_UPDATED"] = {		CODE = EVENT_FORWARD_CAMPS_UPDATED,		DESCR = "EVENT_FORWARD_CAMPS_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GAME_CAMERA_ACTIVATED"] = {		CODE = EVENT_GAME_CAMERA_ACTIVATED,		DESCR = "EVENT_GAME_CAMERA_ACTIVATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GAME_CAMERA_DEACTIVATED"] = {		CODE = EVENT_GAME_CAMERA_DEACTIVATED,		DESCR = "EVENT_GAME_CAMERA_DEACTIVATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GAME_CAMERA_UI_MODE_CHANGED"] = {		CODE = EVENT_GAME_CAMERA_UI_MODE_CHANGED,		DESCR = "EVENT_GAME_CAMERA_UI_MODE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GAME_FOCUS_CHANGED"] = {		CODE = EVENT_GAME_FOCUS_CHANGED,		DESCR = "EVENT_GAME_FOCUS_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			hasFocus = { name = "hasFocus", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_GAME_SCORE"] = {		CODE = EVENT_GAME_SCORE,		DESCR = "EVENT_GAME_SCORE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			alliance1 = { name = "alliance1", dataType = "integer", paramNum = 2 },
			alliance2 = { name = "alliance2", dataType = "integer", paramNum = 3 },
			alliance3 = { name = "alliance3", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_GAME_STATE_CHANGED"] = {		CODE = EVENT_GAME_STATE_CHANGED,		DESCR = "EVENT_GAME_STATE_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			oldState = { name = "oldState", dataType = "integer", paramNum = 2 },
			newState = { name = "newState", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_GAME_TIMER_PAUSED"] = {		CODE = EVENT_GAME_TIMER_PAUSED,		DESCR = "EVENT_GAME_TIMER_PAUSED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			isPaused = { name = "isPaused", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_GRAVEYARD_USAGE_FAILURE"] = {		CODE = EVENT_GRAVEYARD_USAGE_FAILURE,		DESCR = "EVENT_GRAVEYARD_USAGE_FAILURE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GROUPING_TOOLS_STATUS_UPDATE"] = {		CODE = EVENT_GROUPING_TOOLS_STATUS_UPDATE,		DESCR = "EVENT_GROUPING_TOOLS_STATUS_UPDATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			inQueue = { name = "inQueue", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_GROUP_CAMPAIGN_ASSIGNMENTS_CHANGED"] = {		CODE = EVENT_GROUP_CAMPAIGN_ASSIGNMENTS_CHANGED,		DESCR = "EVENT_GROUP_CAMPAIGN_ASSIGNMENTS_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GROUP_DISBANDED"] = {		CODE = EVENT_GROUP_DISBANDED,		DESCR = "EVENT_GROUP_DISBANDED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GROUP_INVITE_RECEIVED"] = {		CODE = EVENT_GROUP_INVITE_RECEIVED,		DESCR = "EVENT_GROUP_INVITE_RECEIVED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			inviterName = { name = "inviterName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_GROUP_INVITE_REMOVED"] = {		CODE = EVENT_GROUP_INVITE_REMOVED,		DESCR = "EVENT_GROUP_INVITE_REMOVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GROUP_INVITE_RESPONSE"] = {		CODE = EVENT_GROUP_INVITE_RESPONSE,		DESCR = "EVENT_GROUP_INVITE_RESPONSE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			inviterName = { name = "inviterName", dataType = "string", paramNum = 2 },
			response = { name = "response", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_GROUP_MEMBER_CONNECTED_STATUS"] = {		CODE = EVENT_GROUP_MEMBER_CONNECTED_STATUS,		DESCR = "EVENT_GROUP_MEMBER_CONNECTED_STATUS",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			isOnline = { name = "isOnline", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_GROUP_MEMBER_JOINED"] = {		CODE = EVENT_GROUP_MEMBER_JOINED,		DESCR = "EVENT_GROUP_MEMBER_JOINED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			memberName = { name = "memberName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_GROUP_MEMBER_LEFT"] = {		CODE = EVENT_GROUP_MEMBER_LEFT,		DESCR = "EVENT_GROUP_MEMBER_LEFT",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			memberName = { name = "memberName", dataType = "string", paramNum = 2 },
			reason = { name = "reason", dataType = "integer", paramNum = 3 },
			wasLocalPlayer = { name = "wasLocalPlayer", dataType = "bool", paramNum = 4 },		},	},
	["EVENT_GROUP_MEMBER_ROLES_CHANGED"] = {		CODE = EVENT_GROUP_MEMBER_ROLES_CHANGED,		DESCR = "EVENT_GROUP_MEMBER_ROLES_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			dps = { name = "dps", dataType = "bool", paramNum = 3 },
			healer = { name = "healer", dataType = "bool", paramNum = 4 },
			tank = { name = "tank", dataType = "bool", paramNum = 5 },		},	},
	["EVENT_GROUP_NOTIFICATION_MESSAGE"] = {		CODE = EVENT_GROUP_NOTIFICATION_MESSAGE,		DESCR = "EVENT_GROUP_NOTIFICATION_MESSAGE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			messageId = { name = "messageId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_GROUP_SUPPORT_RANGE_UPDATE"] = {		CODE = EVENT_GROUP_SUPPORT_RANGE_UPDATE,		DESCR = "EVENT_GROUP_SUPPORT_RANGE_UPDATE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },
			status = { name = "status", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_GROUP_TYPE_CHANGED"] = {		CODE = EVENT_GROUP_TYPE_CHANGED,		DESCR = "EVENT_GROUP_TYPE_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			largeGroup = { name = "largeGroup", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_GUEST_CAMPAIGN_CHANGED"] = {		CODE = EVENT_GUEST_CAMPAIGN_CHANGED,		DESCR = "EVENT_GUEST_CAMPAIGN_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			newGuestCampaignId = { name = "newGuestCampaignId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_GUILD_BANK_DESELECTED"] = {		CODE = EVENT_GUILD_BANK_DESELECTED,		DESCR = "EVENT_GUILD_BANK_DESELECTED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GUILD_BANK_ITEMS_READY"] = {		CODE = EVENT_GUILD_BANK_ITEMS_READY,		DESCR = "EVENT_GUILD_BANK_ITEMS_READY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GUILD_BANK_ITEM_ADDED"] = {		CODE = EVENT_GUILD_BANK_ITEM_ADDED,		DESCR = "EVENT_GUILD_BANK_ITEM_ADDED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_GUILD_BANK_ITEM_REMOVED"] = {		CODE = EVENT_GUILD_BANK_ITEM_REMOVED,		DESCR = "EVENT_GUILD_BANK_ITEM_REMOVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_GUILD_BANK_OPEN_ERROR"] = {		CODE = EVENT_GUILD_BANK_OPEN_ERROR,		DESCR = "EVENT_GUILD_BANK_OPEN_ERROR",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_GUILD_BANK_SELECTED"] = {		CODE = EVENT_GUILD_BANK_SELECTED,		DESCR = "EVENT_GUILD_BANK_SELECTED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			guildId = { name = "guildId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_GUILD_BANK_TRANSFER_ERROR"] = {		CODE = EVENT_GUILD_BANK_TRANSFER_ERROR,		DESCR = "EVENT_GUILD_BANK_TRANSFER_ERROR",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_GUILD_BANK_UPDATED_QUANTITY"] = {		CODE = EVENT_GUILD_BANK_UPDATED_QUANTITY,		DESCR = "EVENT_GUILD_BANK_UPDATED_QUANTITY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_GUILD_MEMBER_ACHIEVEMENT_AWARDED"] = {		CODE = EVENT_GUILD_MEMBER_ACHIEVEMENT_AWARDED,		DESCR = "EVENT_GUILD_MEMBER_ACHIEVEMENT_AWARDED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			playerName = { name = "playerName", dataType = "string", paramNum = 2 },
			id = { name = "id", dataType = "integer", paramNum = 3 },
			link = { name = "link", dataType = "string", paramNum = 4 },		},	},
	["EVENT_GUILD_REPUTATION_ADDED"] = {		CODE = EVENT_GUILD_REPUTATION_ADDED,		DESCR = "EVENT_GUILD_REPUTATION_ADDED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			repIndex = { name = "repIndex", dataType = "luaindex", paramNum = 2 },
			repName = { name = "repName", dataType = "string", paramNum = 3 },
			rankName = { name = "rankName", dataType = "string", paramNum = 4 },
			curPoints = { name = "curPoints", dataType = "integer", paramNum = 5 },		},	},
	["EVENT_GUILD_REPUTATION_LOADED"] = {		CODE = EVENT_GUILD_REPUTATION_LOADED,		DESCR = "EVENT_GUILD_REPUTATION_LOADED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_GUILD_REPUTATION_POINTS_UPDATED"] = {		CODE = EVENT_GUILD_REPUTATION_POINTS_UPDATED,		DESCR = "EVENT_GUILD_REPUTATION_POINTS_UPDATED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			repIndex = { name = "repIndex", dataType = "luaindex", paramNum = 2 },
			repName = { name = "repName", dataType = "string", paramNum = 3 },
			rankName = { name = "rankName", dataType = "string", paramNum = 4 },
			pointGain = { name = "pointGain", dataType = "integer", paramNum = 5 },		},	},
	["EVENT_GUILD_REPUTATION_RANK_UPDATED"] = {		CODE = EVENT_GUILD_REPUTATION_RANK_UPDATED,		DESCR = "EVENT_GUILD_REPUTATION_RANK_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			repIndex = { name = "repIndex", dataType = "luaindex", paramNum = 2 },
			repName = { name = "repName", dataType = "string", paramNum = 3 },
			rankName = { name = "rankName", dataType = "string", paramNum = 4 },
			curPoints = { name = "curPoints", dataType = "integer", paramNum = 5 },
			newRank = { name = "newRank", dataType = "bool", paramNum = 6 },		},	},
	["EVENT_HELP_INITIALIZED"] = {		CODE = EVENT_HELP_INITIALIZED,		DESCR = "EVENT_HELP_INITIALIZED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_HELP_SEARCH_RESULTS_READY"] = {		CODE = EVENT_HELP_SEARCH_RESULTS_READY,		DESCR = "EVENT_HELP_SEARCH_RESULTS_READY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_HIDE_BOOK"] = {		CODE = EVENT_HIDE_BOOK,		DESCR = "EVENT_HIDE_BOOK",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_HIDE_OBJECTIVE_STATUS"] = {		CODE = EVENT_HIDE_OBJECTIVE_STATUS,		DESCR = "EVENT_HIDE_OBJECTIVE_STATUS",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_HOOK_POINTS_UPDATED"] = {		CODE = EVENT_HOOK_POINTS_UPDATED,		DESCR = "EVENT_HOOK_POINTS_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_HOT_BAR_RESULT"] = {		CODE = EVENT_HOT_BAR_RESULT,		DESCR = "EVENT_HOT_BAR_RESULT",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_INTERACTABLE_IMPOSSIBLE_TO_PICK"] = {		CODE = EVENT_INTERACTABLE_IMPOSSIBLE_TO_PICK,		DESCR = "EVENT_INTERACTABLE_IMPOSSIBLE_TO_PICK",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			interactableName = { name = "interactableName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_INTERACTABLE_LOCKED"] = {		CODE = EVENT_INTERACTABLE_LOCKED,		DESCR = "EVENT_INTERACTABLE_LOCKED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			interactableName = { name = "interactableName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_INTERACTION_TRANSITION_PENDING"] = {		CODE = EVENT_INTERACTION_TRANSITION_PENDING,		DESCR = "EVENT_INTERACTION_TRANSITION_PENDING",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_INTERACT_BUSY"] = {		CODE = EVENT_INTERACT_BUSY,		DESCR = "EVENT_INTERACT_BUSY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_INTERFACE_SETTING_CHANGED"] = {		CODE = EVENT_INTERFACE_SETTING_CHANGED,		DESCR = "EVENT_INTERFACE_SETTING_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			system = { name = "system", dataType = "integer", paramNum = 2 },
			settingId = { name = "settingId", dataType = "integer", paramNum = 3 },
			value = { name = "value", dataType = "bool", paramNum = 4 },		},	},
	["EVENT_INVENTORY_BOUGHT_BAG_SPACE"] = {		CODE = EVENT_INVENTORY_BOUGHT_BAG_SPACE,		DESCR = "EVENT_INVENTORY_BOUGHT_BAG_SPACE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			numberOfSlots = { name = "numberOfSlots", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_INVENTORY_BOUGHT_BANK_SPACE"] = {		CODE = EVENT_INVENTORY_BOUGHT_BANK_SPACE,		DESCR = "EVENT_INVENTORY_BOUGHT_BANK_SPACE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			numberOfSlots = { name = "numberOfSlots", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_INVENTORY_BUY_BAG_SPACE"] = {		CODE = EVENT_INVENTORY_BUY_BAG_SPACE,		DESCR = "EVENT_INVENTORY_BUY_BAG_SPACE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			cost = { name = "cost", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_INVENTORY_BUY_BANK_SPACE"] = {		CODE = EVENT_INVENTORY_BUY_BANK_SPACE,		DESCR = "EVENT_INVENTORY_BUY_BANK_SPACE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			cost = { name = "cost", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_INVENTORY_CLOSE_BUY_SPACE"] = {		CODE = EVENT_INVENTORY_CLOSE_BUY_SPACE,		DESCR = "EVENT_INVENTORY_CLOSE_BUY_SPACE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_INVENTORY_FULL_UPDATE"] = {		CODE = EVENT_INVENTORY_FULL_UPDATE,		DESCR = "EVENT_INVENTORY_FULL_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_INVENTORY_ITEM_DESTROYED"] = {		CODE = EVENT_INVENTORY_ITEM_DESTROYED,		DESCR = "EVENT_INVENTORY_ITEM_DESTROYED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_INVENTORY_ITEM_USED"] = {		CODE = EVENT_INVENTORY_ITEM_USED,		DESCR = "EVENT_INVENTORY_ITEM_USED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_INVENTORY_SINGLE_SLOT_UPDATE"] = {		CODE = EVENT_INVENTORY_SINGLE_SLOT_UPDATE,		DESCR = "EVENT_INVENTORY_SINGLE_SLOT_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			bagId = { name = "bagId", dataType = "integer", paramNum = 2 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 3 },
			isNewItem = { name = "isNewItem", dataType = "bool", paramNum = 4 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 5 },
			updateReason = { name = "updateReason", dataType = "integer", paramNum = 6 },		},	},
	["EVENT_INVENTORY_SLOT_LOCKED"] = {		CODE = EVENT_INVENTORY_SLOT_LOCKED,		DESCR = "EVENT_INVENTORY_SLOT_LOCKED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			bagId = { name = "bagId", dataType = "integer", paramNum = 2 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_INVENTORY_SLOT_UNLOCKED"] = {		CODE = EVENT_INVENTORY_SLOT_UNLOCKED,		DESCR = "EVENT_INVENTORY_SLOT_UNLOCKED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			bagId = { name = "bagId", dataType = "integer", paramNum = 2 },
			slotId = { name = "slotId", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_ITEM_REPAIR_FAILURE"] = {		CODE = EVENT_ITEM_REPAIR_FAILURE,		DESCR = "EVENT_ITEM_REPAIR_FAILURE",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_ITEM_SLOT_CHANGED"] = {		CODE = EVENT_ITEM_SLOT_CHANGED,		DESCR = "EVENT_ITEM_SLOT_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_JUMP_FAILED"] = {		CODE = EVENT_JUMP_FAILED,		DESCR = "EVENT_JUMP_FAILED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_KEEPS_INITIALIZED"] = {		CODE = EVENT_KEEPS_INITIALIZED,		DESCR = "EVENT_KEEPS_INITIALIZED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_KEEP_ALLIANCE_OWNER_CHANGED"] = {		CODE = EVENT_KEEP_ALLIANCE_OWNER_CHANGED,		DESCR = "EVENT_KEEP_ALLIANCE_OWNER_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },
			owningAlliance = { name = "owningAlliance", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_KEEP_BATTLE_TOKENS_UPDATE"] = {		CODE = EVENT_KEEP_BATTLE_TOKENS_UPDATE,		DESCR = "EVENT_KEEP_BATTLE_TOKENS_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_KEEP_CAPTURE_REWARDS"] = {		CODE = EVENT_KEEP_CAPTURE_REWARDS,		DESCR = "EVENT_KEEP_CAPTURE_REWARDS",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },			captured = { name = "captured", dataType = "bool", paramNum = 3 },			alliance = { name = "alliance", dataType = "integer", paramNum = 4 },			experience = { name = "experience", dataType = "integer", paramNum = 5 },			alliancePoints = { name = "alliancePoints", dataType = "integer", paramNum = 6 },		},	},
	["EVENT_KEEP_COMBAT_STATE_CHANGED"] = {		CODE = EVENT_KEEP_COMBAT_STATE_CHANGED,		DESCR = "EVENT_KEEP_COMBAT_STATE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },			inCombat = { name = "inCombat", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_KEEP_END_INTERACTION"] = {		CODE = EVENT_KEEP_END_INTERACTION,		DESCR = "EVENT_KEEP_END_INTERACTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_KEEP_GATE_STATE_CHANGED"] = {		CODE = EVENT_KEEP_GATE_STATE_CHANGED,		DESCR = "EVENT_KEEP_GATE_STATE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },			open = { name = "open", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_KEEP_GUILD_CLAIM_UPDATE"] = {		CODE = EVENT_KEEP_GUILD_CLAIM_UPDATE,		DESCR = "EVENT_KEEP_GUILD_CLAIM_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_KEEP_INITIALIZED"] = {		CODE = EVENT_KEEP_INITIALIZED,		DESCR = "EVENT_KEEP_INITIALIZED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_KEEP_OWNERSHIP_CHANGED_NOTIFICATION"] = {		CODE = EVENT_KEEP_OWNERSHIP_CHANGED_NOTIFICATION,		DESCR = "EVENT_KEEP_OWNERSHIP_CHANGED_NOTIFICATION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			campaignId = { name = "campaignId", dataType = "integer", paramNum = 2 },			keepId = { name = "keepId", dataType = "integer", paramNum = 3 },			oldOwner = { name = "oldOwner", dataType = "integer", paramNum = 4 },			newOwner = { name = "newOwner", dataType = "integer", paramNum = 5 },		},	},
	["EVENT_KEEP_RESOURCE_LOCK_UPDATE"] = {		CODE = EVENT_KEEP_RESOURCE_LOCK_UPDATE,		DESCR = "EVENT_KEEP_RESOURCE_LOCK_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_KEEP_RESOURCE_UPDATE"] = {		CODE = EVENT_KEEP_RESOURCE_UPDATE,		DESCR = "EVENT_KEEP_RESOURCE_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_KEEP_START_INTERACTION"] = {		CODE = EVENT_KEEP_START_INTERACTION,		DESCR = "EVENT_KEEP_START_INTERACTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_KEEP_UNDER_ATTACK_CHANGED"] = {		CODE = EVENT_KEEP_UNDER_ATTACK_CHANGED,		DESCR = "EVENT_KEEP_UNDER_ATTACK_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },			underAttack = { name = "underAttack", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_KILL_LOCATIONS_UPDATED"] = {		CODE = EVENT_KILL_LOCATIONS_UPDATED,		DESCR = "EVENT_KILL_LOCATIONS_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_KILL_SPAM"] = {		CODE = EVENT_KILL_SPAM,		DESCR = "EVENT_KILL_SPAM",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			killingPlayer = { name = "killingPlayer", dataType = "string", paramNum = 2 },			killingPlayerAlliance = { name = "killingPlayerAlliance", dataType = "integer", paramNum = 3 },			killedPlayer = { name = "killedPlayer", dataType = "string", paramNum = 4 },			killedPlayerAlliance = { name = "killedPlayerAlliance", dataType = "integer", paramNum = 5 },			subzoneName = { name = "subzoneName", dataType = "string", paramNum = 6 },		},	},
	["EVENT_LEADER_UPDATE"] = {		CODE = EVENT_LEADER_UPDATE,		DESCR = "EVENT_LEADER_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			leaderTag = { name = "leaderTag", dataType = "string", paramNum = 2 },		},	},
	["EVENT_LEAVE_CAMPAIGN_QUEUE_RESPONSE"] = {		CODE = EVENT_LEAVE_CAMPAIGN_QUEUE_RESPONSE,		DESCR = "EVENT_LEAVE_CAMPAIGN_QUEUE_RESPONSE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			response = { name = "response", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_LEAVE_RAM_ESCORT"] = {		CODE = EVENT_LEAVE_RAM_ESCORT,		DESCR = "EVENT_LEAVE_RAM_ESCORT",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LEVEL_UPDATE"] = {		CODE = EVENT_LEVEL_UPDATE,		DESCR = "EVENT_LEVEL_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			level = { name = "level", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_LEVEL_UP_INFO_UPDATED"] = {		CODE = EVENT_LEVEL_UP_INFO_UPDATED,		DESCR = "EVENT_LEVEL_UP_INFO_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LINKED_WORLD_POSITION_CHANGED"] = {		CODE = EVENT_LINKED_WORLD_POSITION_CHANGED,		DESCR = "EVENT_LINKED_WORLD_POSITION_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LOCAL_PLAYER_ABILITY_OCCURED"] = {		CODE = EVENT_LOCAL_PLAYER_ABILITY_OCCURED,		DESCR = "EVENT_LOCAL_PLAYER_ABILITY_OCCURED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LOCAL_PLAYER_CHARGEUP_BEGIN"] = {		CODE = EVENT_LOCAL_PLAYER_CHARGEUP_BEGIN,		DESCR = "EVENT_LOCAL_PLAYER_CHARGEUP_BEGIN",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LOCAL_PLAYER_CHARGEUP_COMPLETE"] = {		CODE = EVENT_LOCAL_PLAYER_CHARGEUP_COMPLETE,		DESCR = "EVENT_LOCAL_PLAYER_CHARGEUP_COMPLETE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LOCAL_PLAYER_KICKOFF_CAST"] = {		CODE = EVENT_LOCAL_PLAYER_KICKOFF_CAST,		DESCR = "EVENT_LOCAL_PLAYER_KICKOFF_CAST",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LOCAL_PLAYER_WEAPON_ABILITY_WAIT_BEGIN"] = {		CODE = EVENT_LOCAL_PLAYER_WEAPON_ABILITY_WAIT_BEGIN,		DESCR = "EVENT_LOCAL_PLAYER_WEAPON_ABILITY_WAIT_BEGIN",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LOCAL_PLAYER_WEAPON_ABILITY_WAIT_END"] = {		CODE = EVENT_LOCAL_PLAYER_WEAPON_ABILITY_WAIT_END,		DESCR = "EVENT_LOCAL_PLAYER_WEAPON_ABILITY_WAIT_END",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LOCKPICK_BROKE"] = {		CODE = EVENT_LOCKPICK_BROKE,		DESCR = "EVENT_LOCKPICK_BROKE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			inactivityLengthMs = { name = "inactivityLengthMs", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_LOCKPICK_FAILED"] = {		CODE = EVENT_LOCKPICK_FAILED,		DESCR = "EVENT_LOCKPICK_FAILED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LOCKPICK_SUCCESS"] = {		CODE = EVENT_LOCKPICK_SUCCESS,		DESCR = "EVENT_LOCKPICK_SUCCESS",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LOGOUT_DEFERRED"] = {		CODE = EVENT_LOGOUT_DEFERRED,		DESCR = "EVENT_LOGOUT_DEFERRED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			deferMilliseconds = { name = "deferMilliseconds", dataType = "integer", paramNum = 2 },			quitRequested = { name = "quitRequested", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_LOGOUT_DISALLOWED"] = {		CODE = EVENT_LOGOUT_DISALLOWED,		DESCR = "EVENT_LOGOUT_DISALLOWED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			quitRequested = { name = "quitRequested", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_LOOT_CLOSED"] = {		CODE = EVENT_LOOT_CLOSED,		DESCR = "EVENT_LOOT_CLOSED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LOOT_ITEM_FAILED"] = {		CODE = EVENT_LOOT_ITEM_FAILED,		DESCR = "EVENT_LOOT_ITEM_FAILED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			reason = { name = "reason", dataType = "integer", paramNum = 2 },			itemName = { name = "itemName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_LOOT_RECEIVED"] = {		CODE = EVENT_LOOT_RECEIVED,		DESCR = "EVENT_LOOT_RECEIVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			receivedBy = { name = "receivedBy", dataType = "string", paramNum = 2 },			itemName = { name = "itemName", dataType = "string", paramNum = 3 },			quantity = { name = "quantity", dataType = "integer", paramNum = 4 },			itemSound = { name = "itemSound", dataType = "integer", paramNum = 5 },			lootType = { name = "lootType", dataType = "integer", paramNum = 6 },			self = { name = "self", dataType = "bool", paramNum = 7 },		},	},
	["EVENT_LOOT_UPDATED"] = {		CODE = EVENT_LOOT_UPDATED,		DESCR = "EVENT_LOOT_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_LORE_BOOK_ALREADY_KNOWN"] = {		CODE = EVENT_LORE_BOOK_ALREADY_KNOWN,		DESCR = "EVENT_LORE_BOOK_ALREADY_KNOWN",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			bookTitle = { name = "bookTitle", dataType = "string", paramNum = 2 },		},	},
	["EVENT_LORE_BOOK_LEARNED"] = {		CODE = EVENT_LORE_BOOK_LEARNED,		DESCR = "EVENT_LORE_BOOK_LEARNED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			categoryIndex = { name = "categoryIndex", dataType = "luaindex", paramNum = 2 },
			collectionIndex = { name = "collectionIndex", dataType = "luaindex", paramNum = 3 },
			bookIndex = { name = "bookIndex", dataType = "luaindex", paramNum = 4 },
			guildIndex = { name = "guildIndex", dataType = "luaindex", paramNum = 5 },		},	},
	["EVENT_LORE_COLLECTION_COMPLETED"] = {		CODE = EVENT_LORE_COLLECTION_COMPLETED,		DESCR = "EVENT_LORE_COLLECTION_COMPLETED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			categoryIndex = { name = "categoryIndex", dataType = "luaindex", paramNum = 2 },
			collectionIndex = { name = "collectionIndex", dataType = "luaindex", paramNum = 3 },		},	},
	["EVENT_LORE_LIBRARY_INITIALIZED"] = {		CODE = EVENT_LORE_LIBRARY_INITIALIZED,		DESCR = "EVENT_LORE_LIBRARY_INITIALIZED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_MAIL_ATTACHED_MONEY_CHANGED"] = {		CODE = EVENT_MAIL_ATTACHED_MONEY_CHANGED,		DESCR = "EVENT_MAIL_ATTACHED_MONEY_CHANGED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			moneyAmount = { name = "moneyAmount", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_MAIL_ATTACHMENT_ADDED"] = {		CODE = EVENT_MAIL_ATTACHMENT_ADDED,		DESCR = "EVENT_MAIL_ATTACHMENT_ADDED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			attachmentSlot = { name = "attachmentSlot", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_MAIL_ATTACHMENT_REMOVED"] = {		CODE = EVENT_MAIL_ATTACHMENT_REMOVED,		DESCR = "EVENT_MAIL_ATTACHMENT_REMOVED",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			attachmentSlot = { name = "attachmentSlot", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_MAIL_CLOSE_MAILBOX"] = {		CODE = EVENT_MAIL_CLOSE_MAILBOX,		DESCR = "EVENT_MAIL_CLOSE_MAILBOX",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_MAIL_COD_CHANGED"] = {		CODE = EVENT_MAIL_COD_CHANGED,		DESCR = "EVENT_MAIL_COD_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			codAmount = { name = "codAmount", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_MAIL_INBOX_UPDATE"] = {		CODE = EVENT_MAIL_INBOX_UPDATE,		DESCR = "EVENT_MAIL_INBOX_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_MAIL_NUM_UNREAD_CHANGED"] = {		CODE = EVENT_MAIL_NUM_UNREAD_CHANGED,		DESCR = "EVENT_MAIL_NUM_UNREAD_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			numUnread = { name = "numUnread", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_MAIL_OPEN_MAILBOX"] = {		CODE = EVENT_MAIL_OPEN_MAILBOX,		DESCR = "EVENT_MAIL_OPEN_MAILBOX",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_MAIL_READABLE"] = {		CODE = EVENT_MAIL_READABLE,		DESCR = "EVENT_MAIL_READABLE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			mailId = { name = "mailId", dataType = "id64", paramNum = 2 },		},	},
	["EVENT_MAIL_REMOVED"] = {		CODE = EVENT_MAIL_REMOVED,		DESCR = "EVENT_MAIL_REMOVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			mailId = { name = "mailId", dataType = "id64", paramNum = 2 },		},	},
	["EVENT_MAIL_SEND_FAILED"] = {		CODE = EVENT_MAIL_SEND_FAILED,		DESCR = "EVENT_MAIL_SEND_FAILED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_MAIL_SEND_SUCCESS"] = {		CODE = EVENT_MAIL_SEND_SUCCESS,		DESCR = "EVENT_MAIL_SEND_SUCCESS",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_MAIL_TAKE_ATTACHED_ITEM_SUCCESS"] = {		CODE = EVENT_MAIL_TAKE_ATTACHED_ITEM_SUCCESS,		DESCR = "EVENT_MAIL_TAKE_ATTACHED_ITEM_SUCCESS",		PARAMS = {
			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },
			mailId = { name = "mailId", dataType = "id64", paramNum = 2 },		},	},
	["EVENT_MAIL_TAKE_ATTACHED_MONEY_SUCCESS"] = {		CODE = EVENT_MAIL_TAKE_ATTACHED_MONEY_SUCCESS,		DESCR = "EVENT_MAIL_TAKE_ATTACHED_MONEY_SUCCESS",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			mailId = { name = "mailId", dataType = "id64", paramNum = 2 },		},	},
	["EVENT_MAP_PING"] = {		CODE = EVENT_MAP_PING,		DESCR = "EVENT_MAP_PING",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			pingEventType = { name = "pingEventType", dataType = "integer", paramNum = 2 },			pingType = { name = "pingType", dataType = "integer", paramNum = 3 },			pingTag = { name = "pingTag", dataType = "string", paramNum = 4 },			offsetX = { name = "offsetX", dataType = "number", paramNum = 5 },			offsetY = { name = "offsetY", dataType = "number", paramNum = 6 },		},	},
	["EVENT_MEDAL_AWARDED"] = {		CODE = EVENT_MEDAL_AWARDED,		DESCR = "EVENT_MEDAL_AWARDED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			name = { name = "name", dataType = "string", paramNum = 2 },			texture = { name = "texture", dataType = "string", paramNum = 3 },			condition = { name = "condition", dataType = "string", paramNum = 4 },		},	},
	["EVENT_MINIMAP_FILTERS_INITIALIZED"] = {		CODE = EVENT_MINIMAP_FILTERS_INITIALIZED,		DESCR = "EVENT_MINIMAP_FILTERS_INITIALIZED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_MISSING_LURE"] = {		CODE = EVENT_MISSING_LURE,		DESCR = "EVENT_MISSING_LURE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_MONEY_UPDATE"] = {		CODE = EVENT_MONEY_UPDATE,		DESCR = "EVENT_MONEY_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			newMoney = { name = "newMoney", dataType = "integer", paramNum = 2 },			oldMoney = { name = "oldMoney", dataType = "integer", paramNum = 3 },			reason = { name = "reason", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_MOUNTED_STATE_CHANGED"] = {		CODE = EVENT_MOUNTED_STATE_CHANGED,		DESCR = "EVENT_MOUNTED_STATE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			mounted = { name = "mounted", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_MOUNTS_FULL_UPDATE"] = {		CODE = EVENT_MOUNTS_FULL_UPDATE,		DESCR = "EVENT_MOUNTS_FULL_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_MOUNT_FAILURE"] = {		CODE = EVENT_MOUNT_FAILURE,		DESCR = "EVENT_MOUNT_FAILURE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			reason = { name = "reason", dataType = "integer", paramNum = 2 },			arg1 = { name = "arg1", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_MOUNT_UPDATE"] = {		CODE = EVENT_MOUNT_UPDATE,		DESCR = "EVENT_MOUNT_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			mountIndex = { name = "mountIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_MOUSEOVER_CHANGED"] = {		CODE = EVENT_MOUSEOVER_CHANGED,		DESCR = "EVENT_MOUSEOVER_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_MOUSE_REQUEST_ABANDON_QUEST"] = {		CODE = EVENT_MOUSE_REQUEST_ABANDON_QUEST,		DESCR = "EVENT_MOUSE_REQUEST_ABANDON_QUEST",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },			name = { name = "name", dataType = "string", paramNum = 3 },		},	},
	["EVENT_MOUSE_REQUEST_DESTROY_ITEM"] = {		CODE = EVENT_MOUSE_REQUEST_DESTROY_ITEM,		DESCR = "EVENT_MOUSE_REQUEST_DESTROY_ITEM",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			bagId = { name = "bagId", dataType = "integer", paramNum = 2 },			slotIndex = { name = "slotIndex", dataType = "integer", paramNum = 3 },			itemCount = { name = "itemCount", dataType = "integer", paramNum = 4 },			name = { name = "name", dataType = "string", paramNum = 5 },			needsConfirm = { name = "needsConfirm", dataType = "bool", paramNum = 6 },		},	},
	["EVENT_NEW_DISCOVERY_AREA"] = {		CODE = EVENT_NEW_DISCOVERY_AREA,		DESCR = "EVENT_NEW_DISCOVERY_AREA",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			zoneName = { name = "zoneName", dataType = "string", paramNum = 2 },			discoveryName = { name = "discoveryName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_NEW_MOVEMENT_IN_UI_MODE"] = {		CODE = EVENT_NEW_MOVEMENT_IN_UI_MODE,		DESCR = "EVENT_NEW_MOVEMENT_IN_UI_MODE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_NEW_REVEAL"] = {		CODE = EVENT_NEW_REVEAL,		DESCR = "EVENT_NEW_REVEAL",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			revealIndex = { name = "revealIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_NON_COMBAT_BONUS_CHANGED"] = {		CODE = EVENT_NON_COMBAT_BONUS_CHANGED,		DESCR = "EVENT_NON_COMBAT_BONUS_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			nonConbatBonus = { name = "nonConbatBonus", dataType = "integer", paramNum = 2 },			oldValue = { name = "oldValue", dataType = "integer", paramNum = 3 },			newValue = { name = "newValue", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_NOT_ENOUGH_MONEY"] = {		CODE = EVENT_NOT_ENOUGH_MONEY,		DESCR = "EVENT_NOT_ENOUGH_MONEY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_OBJECTIVES_UPDATED"] = {		CODE = EVENT_OBJECTIVES_UPDATED,		DESCR = "EVENT_OBJECTIVES_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_OBJECTIVE_COMPLETED"] = {		CODE = EVENT_OBJECTIVE_COMPLETED,		DESCR = "EVENT_OBJECTIVE_COMPLETED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			zoneIndex = { name = "zoneIndex", dataType = "luaindex", paramNum = 2 },			poiIndex = { name = "poiIndex", dataType = "luaindex", paramNum = 3 },			xpGained = { name = "xpGained", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_OBJECTIVE_CONTROL_STATE"] = {		CODE = EVENT_OBJECTIVE_CONTROL_STATE,		DESCR = "EVENT_OBJECTIVE_CONTROL_STATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			objectiveKeepId = { name = "objectiveKeepId", dataType = "integer", paramNum = 2 },			objectiveObjectiveId = { name = "objectiveObjectiveId", dataType = "integer", paramNum = 3 },			battlegroundContext = { name = "battlegroundContext", dataType = "integer", paramNum = 4 },			objectiveName = { name = "objectiveName", dataType = "string", paramNum = 5 },			objectiveType = { name = "objectiveType", dataType = "integer", paramNum = 6 },			objectiveControlEvent = { name = "objectiveControlEvent", dataType = "integer", paramNum = 7 },			objectiveControlState = { name = "objectiveControlState", dataType = "integer", paramNum = 8 },			objectiveParam1 = { name = "objectiveParam1", dataType = "integer", paramNum = 9 },			objectiveParam2 = { name = "objectiveParam2", dataType = "integer", paramNum = 10 },		},	},
	["EVENT_OPEN_BANK"] = {		CODE = EVENT_OPEN_BANK,		DESCR = "EVENT_OPEN_BANK",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_OPEN_GUILD_BANK"] = {		CODE = EVENT_OPEN_GUILD_BANK,		DESCR = "EVENT_OPEN_GUILD_BANK",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_OPEN_HOOK_POINT_STORE"] = {		CODE = EVENT_OPEN_HOOK_POINT_STORE,		DESCR = "EVENT_OPEN_HOOK_POINT_STORE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_OPEN_STORE"] = {		CODE = EVENT_OPEN_STORE,		DESCR = "EVENT_OPEN_STORE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_OPEN_TRADING_HOUSE"] = {		CODE = EVENT_OPEN_TRADING_HOUSE,		DESCR = "EVENT_OPEN_TRADING_HOUSE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_PLAYER_ACTIVATED"] = {		CODE = EVENT_PLAYER_ACTIVATED,		DESCR = "EVENT_PLAYER_ACTIVATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_PLAYER_ALIVE"] = {		CODE = EVENT_PLAYER_ALIVE,		DESCR = "EVENT_PLAYER_ALIVE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_PLAYER_AURA_UPDATE"] = {		CODE = EVENT_PLAYER_AURA_UPDATE,		DESCR = "EVENT_PLAYER_AURA_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			auraIndex = { name = "auraIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_PLAYER_COMBAT_STATE"] = {		CODE = EVENT_PLAYER_COMBAT_STATE,		DESCR = "EVENT_PLAYER_COMBAT_STATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			inCombat = { name = "inCombat", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_PLAYER_DEACTIVATED"] = {		CODE = EVENT_PLAYER_DEACTIVATED,		DESCR = "EVENT_PLAYER_DEACTIVATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_PLAYER_DEAD"] = {		CODE = EVENT_PLAYER_DEAD,		DESCR = "EVENT_PLAYER_DEAD",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_PLAYER_DEATH_INFO_UPDATE"] = {		CODE = EVENT_PLAYER_DEATH_INFO_UPDATE,		DESCR = "EVENT_PLAYER_DEATH_INFO_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_PLAYER_DEATH_REQUEST_FAILURE"] = {		CODE = EVENT_PLAYER_DEATH_REQUEST_FAILURE,		DESCR = "EVENT_PLAYER_DEATH_REQUEST_FAILURE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_PLAYER_IN_PIN_AREA_CHANGED"] = {		CODE = EVENT_PLAYER_IN_PIN_AREA_CHANGED,		DESCR = "EVENT_PLAYER_IN_PIN_AREA_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			pinType = { name = "pinType", dataType = "integer", paramNum = 2 },			param1 = { name = "param1", dataType = "integer", paramNum = 3 },			param2 = { name = "param2", dataType = "integer", paramNum = 4 },			param3 = { name = "param3", dataType = "integer", paramNum = 5 },			playerIsInside = { name = "playerIsInside", dataType = "bool", paramNum = 6 },		},	},
	["EVENT_PLAYER_TITLES_UPDATE"] = {		CODE = EVENT_PLAYER_TITLES_UPDATE,		DESCR = "EVENT_PLAYER_TITLES_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_PLEDGE_OF_MARA_OFFER"] = {		CODE = EVENT_PLEDGE_OF_MARA_OFFER,		DESCR = "EVENT_PLEDGE_OF_MARA_OFFER",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			targetName = { name = "targetName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_PLEDGE_OF_MARA_OFFER_REMOVED"] = {		CODE = EVENT_PLEDGE_OF_MARA_OFFER_REMOVED,		DESCR = "EVENT_PLEDGE_OF_MARA_OFFER_REMOVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_PLEDGE_OF_MARA_RESULT"] = {		CODE = EVENT_PLEDGE_OF_MARA_RESULT,		DESCR = "EVENT_PLEDGE_OF_MARA_RESULT",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			reason = { name = "reason", dataType = "integer", paramNum = 2 },			targetName = { name = "targetName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_POIS_INITIALIZED"] = {		CODE = EVENT_POIS_INITIALIZED,		DESCR = "EVENT_POIS_INITIALIZED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_POI_DISCOVERED"] = {		CODE = EVENT_POI_DISCOVERED,		DESCR = "EVENT_POI_DISCOVERED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			zoneIndex = { name = "zoneIndex", dataType = "luaindex", paramNum = 2 },			poiIndex = { name = "poiIndex", dataType = "luaindex", paramNum = 3 },		},	},
	["EVENT_POI_UPDATED"] = {		CODE = EVENT_POI_UPDATED,		DESCR = "EVENT_POI_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			zoneIndex = { name = "zoneIndex", dataType = "luaindex", paramNum = 2 },			poiIndex = { name = "poiIndex", dataType = "luaindex", paramNum = 3 },		},	},
	["EVENT_POWER_UPDATE"] = {		CODE = EVENT_POWER_UPDATE,		DESCR = "EVENT_POWER_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			powerIndex = { name = "powerIndex", dataType = "luaindex", paramNum = 3 },			powerType = { name = "powerType", dataType = "integer", paramNum = 4 },			powerValue = { name = "powerValue", dataType = "integer", paramNum = 5 },			powerMax = { name = "powerMax", dataType = "integer", paramNum = 6 },			powerEffectiveMax = { name = "powerEffectiveMax", dataType = "integer", paramNum = 7 },		},	},
	["EVENT_PREFERRED_CAMPAIGN_CHANGED"] = {		CODE = EVENT_PREFERRED_CAMPAIGN_CHANGED,		DESCR = "EVENT_PREFERRED_CAMPAIGN_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			newPreferredCampaignId = { name = "newPreferredCampaignId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_PREFERRED_TARGET_HIGHLIGHT_UPDATE"] = {		CODE = EVENT_PREFERRED_TARGET_HIGHLIGHT_UPDATE,		DESCR = "EVENT_PREFERRED_TARGET_HIGHLIGHT_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			highlighted = { name = "highlighted", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_PVP_FLAG_CHANGED"] = {		CODE = EVENT_PVP_FLAG_CHANGED,		DESCR = "EVENT_PVP_FLAG_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			isEnabled = { name = "isEnabled", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_QUEST_ADDED"] = {		CODE = EVENT_QUEST_ADDED,		DESCR = "EVENT_QUEST_ADDED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },			questName = { name = "questName", dataType = "string", paramNum = 3 },			objectiveName = { name = "objectiveName", dataType = "string", paramNum = 4 },		},	},
	["EVENT_QUEST_ADVANCED"] = {		CODE = EVENT_QUEST_ADVANCED,		DESCR = "EVENT_QUEST_ADVANCED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },			questName = { name = "questName", dataType = "string", paramNum = 3 },			isPushed = { name = "isPushed", dataType = "bool", paramNum = 4 },			isComplete = { name = "isComplete", dataType = "bool", paramNum = 5 },			mainStepChanged = { name = "mainStepChanged", dataType = "bool", paramNum = 6 },		},	},
	["EVENT_QUEST_COMPLETE_ATTEMPT_FAILED_INVENTORY_FULL"] = {		CODE = EVENT_QUEST_COMPLETE_ATTEMPT_FAILED_INVENTORY_FULL,		DESCR = "EVENT_QUEST_COMPLETE_ATTEMPT_FAILED_INVENTORY_FULL",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_QUEST_COMPLETE_DIALOG"] = {		CODE = EVENT_QUEST_COMPLETE_DIALOG,		DESCR = "EVENT_QUEST_COMPLETE_DIALOG",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_QUEST_COMPLETE_EXPERIENCE"] = {		CODE = EVENT_QUEST_COMPLETE_EXPERIENCE,		DESCR = "EVENT_QUEST_COMPLETE_EXPERIENCE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			questName = { name = "questName", dataType = "string", paramNum = 2 },			xpGained = { name = "xpGained", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_QUEST_CONDITION_COUNTER_CHANGED"] = {		CODE = EVENT_QUEST_CONDITION_COUNTER_CHANGED,		DESCR = "EVENT_QUEST_CONDITION_COUNTER_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },			questName = { name = "questName", dataType = "string", paramNum = 3 },			conditionText = { name = "conditionText", dataType = "string", paramNum = 4 },			conditionType = { name = "conditionType", dataType = "integer", paramNum = 5 },			currConditionVal = { name = "currConditionVal", dataType = "integer", paramNum = 6 },			newConditionVal = { name = "newConditionVal", dataType = "integer", paramNum = 7 },			conditionMax = { name = "conditionMax", dataType = "integer", paramNum = 8 },			isFailCondition = { name = "isFailCondition", dataType = "bool", paramNum = 9 },			stepOverrideText = { name = "stepOverrideText", dataType = "string", paramNum = 10 },			isPushed = { name = "isPushed", dataType = "bool", paramNum = 11 },			isComplete = { name = "isComplete", dataType = "bool", paramNum = 12 },			isConditionComplete = { name = "isConditionComplete", dataType = "bool", paramNum = 13 },			isStepHidden = { name = "isStepHidden", dataType = "bool", paramNum = 14 },		},	},
	["EVENT_QUEST_DAILY_COUNT_CHANGED"] = {		CODE = EVENT_QUEST_DAILY_COUNT_CHANGED,		DESCR = "EVENT_QUEST_DAILY_COUNT_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			dailyCount = { name = "dailyCount", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_QUEST_INTERACT_DIALOG"] = {		CODE = EVENT_QUEST_INTERACT_DIALOG,		DESCR = "EVENT_QUEST_INTERACT_DIALOG",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_QUEST_LIST_UPDATED"] = {		CODE = EVENT_QUEST_LIST_UPDATED,		DESCR = "EVENT_QUEST_LIST_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_QUEST_OFFERED"] = {		CODE = EVENT_QUEST_OFFERED,		DESCR = "EVENT_QUEST_OFFERED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			questIndex = { name = "questIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_QUEST_POSITION_REQUEST_COMPLETE"] = {		CODE = EVENT_QUEST_POSITION_REQUEST_COMPLETE,		DESCR = "EVENT_QUEST_POSITION_REQUEST_COMPLETE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			taskId = { name = "taskId", dataType = "integer", paramNum = 2 },			pinType = { name = "pinType", dataType = "integer", paramNum = 3 },			xLoc = { name = "xLoc", dataType = "number", paramNum = 4 },			yLoc = { name = "yLoc", dataType = "number", paramNum = 5 },			areaRadius = { name = "areaRadius", dataType = "number", paramNum = 6 },			insideCurrentMapWorld = { name = "insideCurrentMapWorld", dataType = "bool", paramNum = 7 },		},	},
	["EVENT_QUEST_REMOVED"] = {		CODE = EVENT_QUEST_REMOVED,		DESCR = "EVENT_QUEST_REMOVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			isCompleted = { name = "isCompleted", dataType = "bool", paramNum = 2 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 3 },			questName = { name = "questName", dataType = "string", paramNum = 4 },			zoneIndex = { name = "zoneIndex", dataType = "luaindex", paramNum = 5 },			poiIndex = { name = "poiIndex", dataType = "luaindex", paramNum = 6 },		},	},
	["EVENT_QUEST_SHARED"] = {		CODE = EVENT_QUEST_SHARED,		DESCR = "EVENT_QUEST_SHARED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			questId = { name = "questId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_QUEST_SHARE_REMOVED"] = {		CODE = EVENT_QUEST_SHARE_REMOVED,		DESCR = "EVENT_QUEST_SHARE_REMOVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			questId = { name = "questId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_QUEST_SHARE_UPDATE"] = {		CODE = EVENT_QUEST_SHARE_UPDATE,		DESCR = "EVENT_QUEST_SHARE_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			update = { name = "update", dataType = "integer", paramNum = 2 },			playerName = { name = "playerName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_QUEST_SHOW_JOURNAL_ENTRY"] = {		CODE = EVENT_QUEST_SHOW_JOURNAL_ENTRY,		DESCR = "EVENT_QUEST_SHOW_JOURNAL_ENTRY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_QUEST_TIMER_PAUSED"] = {		CODE = EVENT_QUEST_TIMER_PAUSED,		DESCR = "EVENT_QUEST_TIMER_PAUSED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },			isPaused = { name = "isPaused", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_QUEST_TIMER_UPDATED"] = {		CODE = EVENT_QUEST_TIMER_UPDATED,		DESCR = "EVENT_QUEST_TIMER_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_QUEST_TOOL_UPDATED"] = {		CODE = EVENT_QUEST_TOOL_UPDATED,		DESCR = "EVENT_QUEST_TOOL_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			journalIndex = { name = "journalIndex", dataType = "luaindex", paramNum = 2 },			questName = { name = "questName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_QUEUE_FOR_CAMPAIGN_RESPONSE"] = {		CODE = EVENT_QUEUE_FOR_CAMPAIGN_RESPONSE,		DESCR = "EVENT_QUEUE_FOR_CAMPAIGN_RESPONSE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			response = { name = "response", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_RAM_ESCORT_COUNT_UPDATE"] = {		CODE = EVENT_RAM_ESCORT_COUNT_UPDATE,		DESCR = "EVENT_RAM_ESCORT_COUNT_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			numEscorts = { name = "numEscorts", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_RANK_POINT_UPDATE"] = {		CODE = EVENT_RANK_POINT_UPDATE,		DESCR = "EVENT_RANK_POINT_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			rankPoints = { name = "rankPoints", dataType = "integer", paramNum = 3 },			difference = { name = "difference", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_REASSIGN_CAMPAIGN_FAILED"] = {		CODE = EVENT_REASSIGN_CAMPAIGN_FAILED,		DESCR = "EVENT_REASSIGN_CAMPAIGN_FAILED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_RECIPE_LEARNED"] = {		CODE = EVENT_RECIPE_LEARNED,		DESCR = "EVENT_RECIPE_LEARNED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			recipeListIndex = { name = "recipeListIndex", dataType = "luaindex", paramNum = 2 },			recipeIndex = { name = "recipeIndex", dataType = "luaindex", paramNum = 3 },		},	},
	["EVENT_REMOVE_ACTIVE_COMBAT_TIP"] = {		CODE = EVENT_REMOVE_ACTIVE_COMBAT_TIP,		DESCR = "EVENT_REMOVE_ACTIVE_COMBAT_TIP",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			activeCombatTipId = { name = "activeCombatTipId", dataType = "integer", paramNum = 2 },			result = { name = "result", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_REMOVE_TUTORIAL"] = {		CODE = EVENT_REMOVE_TUTORIAL,		DESCR = "EVENT_REMOVE_TUTORIAL",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			tutorialIndex = { name = "tutorialIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_REQUIREMENTS_FAIL"] = {		CODE = EVENT_REQUIREMENTS_FAIL,		DESCR = "EVENT_REQUIREMENTS_FAIL",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			errorId = { name = "errorId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_RESURRECT_FAILURE"] = {		CODE = EVENT_RESURRECT_FAILURE,		DESCR = "EVENT_RESURRECT_FAILURE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			targetName = { name = "targetName", dataType = "string", paramNum = 2 },			reason = { name = "reason", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_RESURRECT_REQUEST"] = {		CODE = EVENT_RESURRECT_REQUEST,		DESCR = "EVENT_RESURRECT_REQUEST",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			requester = { name = "requester", dataType = "string", paramNum = 2 },			timeLeftToAccept = { name = "timeLeftToAccept", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_RESURRECT_REQUEST_REMOVED"] = {		CODE = EVENT_RESURRECT_REQUEST_REMOVED,		DESCR = "EVENT_RESURRECT_REQUEST_REMOVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_RETICLE_HIDDEN_UPDATE"] = {		CODE = EVENT_RETICLE_HIDDEN_UPDATE,		DESCR = "EVENT_RETICLE_HIDDEN_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			hidden = { name = "hidden", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_RETICLE_TARGET_CHANGED"] = {		CODE = EVENT_RETICLE_TARGET_CHANGED,		DESCR = "EVENT_RETICLE_TARGET_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_REVENGE_KILL"] = {		CODE = EVENT_REVENGE_KILL,		DESCR = "EVENT_REVENGE_KILL",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			killedPlayerName = { name = "killedPlayerName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_SCRIPTED_WORLD_EVENT_INVITE"] = {		CODE = EVENT_SCRIPTED_WORLD_EVENT_INVITE,		DESCR = "EVENT_SCRIPTED_WORLD_EVENT_INVITE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			eventId = { name = "eventId", dataType = "integer", paramNum = 2 },			scriptedEventName = { name = "scriptedEventName", dataType = "string", paramNum = 3 },			inviterName = { name = "inviterName", dataType = "string", paramNum = 4 },			questName = { name = "questName", dataType = "string", paramNum = 5 },		},	},
	["EVENT_SELL_RECEIPT"] = {		CODE = EVENT_SELL_RECEIPT,		DESCR = "EVENT_SELL_RECEIPT",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			itemName = { name = "itemName", dataType = "string", paramNum = 2 },			itemQuantity = { name = "itemQuantity", dataType = "integer", paramNum = 3 },			money = { name = "money", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_SERVER_SHUTDOWN_INFO"] = {		CODE = EVENT_SERVER_SHUTDOWN_INFO,		DESCR = "EVENT_SERVER_SHUTDOWN_INFO",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			action = { name = "action", dataType = "integer", paramNum = 2 },			timeRemaining = { name = "timeRemaining", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_SET_CHEVRON"] = {		CODE = EVENT_SET_CHEVRON,		DESCR = "EVENT_SET_CHEVRON",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			slotNum = { name = "slotNum", dataType = "integer", paramNum = 2 },			percent = { name = "percent", dataType = "number", paramNum = 3 },		},	},
	["EVENT_SHOW_BOOK"] = {		CODE = EVENT_SHOW_BOOK,		DESCR = "EVENT_SHOW_BOOK",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			bookTitle = { name = "bookTitle", dataType = "string", paramNum = 2 },			body = { name = "body", dataType = "string", paramNum = 3 },			medium = { name = "medium", dataType = "integer", paramNum = 4 },			showTitle = { name = "showTitle", dataType = "bool", paramNum = 5 },		},	},
	["EVENT_SHOW_LINKED_CAST"] = {		CODE = EVENT_SHOW_LINKED_CAST,		DESCR = "EVENT_SHOW_LINKED_CAST",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			linkTime = { name = "linkTime", dataType = "number", paramNum = 2 },		},	},
	["EVENT_SHOW_SCOREBOARD"] = {		CODE = EVENT_SHOW_SCOREBOARD,		DESCR = "EVENT_SHOW_SCOREBOARD",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SHOW_SCOREBUTTON"] = {		CODE = EVENT_SHOW_SCOREBUTTON,		DESCR = "EVENT_SHOW_SCOREBUTTON",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SHOW_TIME"] = {		CODE = EVENT_SHOW_TIME,		DESCR = "EVENT_SHOW_TIME",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			state = { name = "state", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_SHOW_TREASURE_MAP"] = {		CODE = EVENT_SHOW_TREASURE_MAP,		DESCR = "EVENT_SHOW_TREASURE_MAP",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			treasureMapIndex = { name = "treasureMapIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_SIEGE_BUSY"] = {		CODE = EVENT_SIEGE_BUSY,		DESCR = "EVENT_SIEGE_BUSY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			siegeName = { name = "siegeName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_SIEGE_CONTROL_ANOTHER_PLAYER"] = {		CODE = EVENT_SIEGE_CONTROL_ANOTHER_PLAYER,		DESCR = "EVENT_SIEGE_CONTROL_ANOTHER_PLAYER",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			siegeName = { name = "siegeName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_SIEGE_CREATION_FAILED_CLOSEST_DOOR_ALREADY_HAS_RAM"] = {		CODE = EVENT_SIEGE_CREATION_FAILED_CLOSEST_DOOR_ALREADY_HAS_RAM,		DESCR = "EVENT_SIEGE_CREATION_FAILED_CLOSEST_DOOR_ALREADY_HAS_RAM",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SIEGE_CREATION_FAILED_NO_VALID_DOOR"] = {		CODE = EVENT_SIEGE_CREATION_FAILED_NO_VALID_DOOR,		DESCR = "EVENT_SIEGE_CREATION_FAILED_NO_VALID_DOOR",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SIEGE_FIRE_FAILED_COOLDOWN"] = {		CODE = EVENT_SIEGE_FIRE_FAILED_COOLDOWN,		DESCR = "EVENT_SIEGE_FIRE_FAILED_COOLDOWN",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SIEGE_FIRE_FAILED_RETARGETING"] = {		CODE = EVENT_SIEGE_FIRE_FAILED_RETARGETING,		DESCR = "EVENT_SIEGE_FIRE_FAILED_RETARGETING",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SIEGE_PACK_FAILED_INVENTORY_FULL"] = {		CODE = EVENT_SIEGE_PACK_FAILED_INVENTORY_FULL,		DESCR = "EVENT_SIEGE_PACK_FAILED_INVENTORY_FULL",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SIEGE_PACK_FAILED_NOT_CREATOR"] = {		CODE = EVENT_SIEGE_PACK_FAILED_NOT_CREATOR,		DESCR = "EVENT_SIEGE_PACK_FAILED_NOT_CREATOR",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SKILLS_FULL_UPDATE"] = {		CODE = EVENT_SKILLS_FULL_UPDATE,		DESCR = "EVENT_SKILLS_FULL_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SKILL_ADDEDFORCE_RESPEC"] = {		CODE = EVENT_SKILL_ADDEDFORCE_RESPEC,		DESCR = "EVENT_SKILL_ADDEDFORCE_RESPEC",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SKILL_LINE_ADDED"] = {		CODE = EVENT_SKILL_LINE_ADDED,		DESCR = "EVENT_SKILL_LINE_ADDED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			skillType = { name = "skillType", dataType = "integer", paramNum = 2 },			skillIndex = { name = "skillIndex", dataType = "luaindex", paramNum = 3 },		},	},
	["EVENT_SKILL_POINTS_CHANGED"] = {		CODE = EVENT_SKILL_POINTS_CHANGED,		DESCR = "EVENT_SKILL_POINTS_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			pointsBefore = { name = "pointsBefore", dataType = "integer", paramNum = 2 },			pointsNow = { name = "pointsNow", dataType = "integer", paramNum = 3 },			isSkyShard = { name = "isSkyShard", dataType = "bool", paramNum = 4 },		},	},
	["EVENT_SKILL_RANK_UPDATE"] = {		CODE = EVENT_SKILL_RANK_UPDATE,		DESCR = "EVENT_SKILL_RANK_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			skillType = { name = "skillType", dataType = "integer", paramNum = 2 },			skillIndex = { name = "skillIndex", dataType = "luaindex", paramNum = 3 },			rank = { name = "rank", dataType = "luaindex", paramNum = 4 },		},	},
	["EVENT_SKILL_XP_UPDATE"] = {		CODE = EVENT_SKILL_XP_UPDATE,		DESCR = "EVENT_SKILL_XP_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			skillType = { name = "skillType", dataType = "integer", paramNum = 2 },			skillIndex = { name = "skillIndex", dataType = "luaindex", paramNum = 3 },			lastRankXP = { name = "lastRankXP", dataType = "integer", paramNum = 4 },			nextRankXP = { name = "nextRankXP", dataType = "integer", paramNum = 5 },			currentXP = { name = "currentXP", dataType = "integer", paramNum = 6 },		},	},
	["EVENT_SLOT_IS_LOCKED_FAILURE"] = {		CODE = EVENT_SLOT_IS_LOCKED_FAILURE,		DESCR = "EVENT_SLOT_IS_LOCKED_FAILURE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			bagId = { name = "bagId", dataType = "integer", paramNum = 2 },			slotId = { name = "slotId", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_SMITHING_TRAIT_RESEARCH_COMPLETED"] = {		CODE = EVENT_SMITHING_TRAIT_RESEARCH_COMPLETED,		DESCR = "EVENT_SMITHING_TRAIT_RESEARCH_COMPLETED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			craftingSkillType = { name = "craftingSkillType", dataType = "integer", paramNum = 2 },			researchLineIndex = { name = "researchLineIndex", dataType = "luaindex", paramNum = 3 },			traitIndex = { name = "traitIndex", dataType = "luaindex", paramNum = 4 },		},	},
	["EVENT_SMITHING_TRAIT_RESEARCH_STARTED"] = {		CODE = EVENT_SMITHING_TRAIT_RESEARCH_STARTED,		DESCR = "EVENT_SMITHING_TRAIT_RESEARCH_STARTED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			craftingSkillType = { name = "craftingSkillType", dataType = "integer", paramNum = 2 },			researchLineIndex = { name = "researchLineIndex", dataType = "luaindex", paramNum = 3 },			traitIndex = { name = "traitIndex", dataType = "luaindex", paramNum = 4 },		},	},
	["EVENT_SOCKETING_ITEM_ALREADY_HAS_PROPERTY"] = {		CODE = EVENT_SOCKETING_ITEM_ALREADY_HAS_PROPERTY,		DESCR = "EVENT_SOCKETING_ITEM_ALREADY_HAS_PROPERTY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			itemLink = { name = "itemLink", dataType = "string", paramNum = 2 },			property = { name = "property", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_SOCKETING_UNIT_DESTROYED"] = {		CODE = EVENT_SOCKETING_UNIT_DESTROYED,		DESCR = "EVENT_SOCKETING_UNIT_DESTROYED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SOCKETING_UNIT_SOCKETS_CHANGED"] = {		CODE = EVENT_SOCKETING_UNIT_SOCKETS_CHANGED,		DESCR = "EVENT_SOCKETING_UNIT_SOCKETS_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_SOUL_GEM_ITEM_CHARGE_FAILURE"] = {		CODE = EVENT_SOUL_GEM_ITEM_CHARGE_FAILURE,		DESCR = "EVENT_SOUL_GEM_ITEM_CHARGE_FAILURE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_STABLE_INTERACT_END"] = {		CODE = EVENT_STABLE_INTERACT_END,		DESCR = "EVENT_STABLE_INTERACT_END",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_STABLE_INTERACT_START"] = {		CODE = EVENT_STABLE_INTERACT_START,		DESCR = "EVENT_STABLE_INTERACT_START",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_START_FAST_TRAVEL_INTERACTION"] = {		CODE = EVENT_START_FAST_TRAVEL_INTERACTION,		DESCR = "EVENT_START_FAST_TRAVEL_INTERACTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			nodeIndex = { name = "nodeIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_START_FAST_TRAVEL_KEEP_INTERACTION"] = {		CODE = EVENT_START_FAST_TRAVEL_KEEP_INTERACTION,		DESCR = "EVENT_START_FAST_TRAVEL_KEEP_INTERACTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			keepId = { name = "keepId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_START_KEEP_GUILD_CLAIM_INTERACTION"] = {		CODE = EVENT_START_KEEP_GUILD_CLAIM_INTERACTION,		DESCR = "EVENT_START_KEEP_GUILD_CLAIM_INTERACTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_START_KEEP_GUILD_RELEASE_INTERACTION"] = {		CODE = EVENT_START_KEEP_GUILD_RELEASE_INTERACTION,		DESCR = "EVENT_START_KEEP_GUILD_RELEASE_INTERACTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_START_SOUL_GEM_RESURRECTION"] = {		CODE = EVENT_START_SOUL_GEM_RESURRECTION,		DESCR = "EVENT_START_SOUL_GEM_RESURRECTION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			durationMs = { name = "durationMs", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_STATS_UPDATED"] = {		CODE = EVENT_STATS_UPDATED,		DESCR = "EVENT_STATS_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },		},	},
	["EVENT_STEALTH_STATE_CHANGED"] = {		CODE = EVENT_STEALTH_STATE_CHANGED,		DESCR = "EVENT_STEALTH_STATE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			stealthState = { name = "stealthState", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_STORE_FAILURE"] = {		CODE = EVENT_STORE_FAILURE,		DESCR = "EVENT_STORE_FAILURE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_STYLE_LEARNED"] = {		CODE = EVENT_STYLE_LEARNED,		DESCR = "EVENT_STYLE_LEARNED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			styleIndex = { name = "styleIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_SYNERGY_ABILITY_GAINED"] = {		CODE = EVENT_SYNERGY_ABILITY_GAINED,		DESCR = "EVENT_SYNERGY_ABILITY_GAINED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			synergyBuffSlot = { name = "synergyBuffSlot", dataType = "integer", paramNum = 2 },			grantedAbilityName = { name = "grantedAbilityName", dataType = "string", paramNum = 3 },			beginTime = { name = "beginTime", dataType = "number", paramNum = 4 },			endTime = { name = "endTime", dataType = "number", paramNum = 5 },			iconName = { name = "iconName", dataType = "string", paramNum = 6 },		},	},
	["EVENT_SYNERGY_ABILITY_LOST"] = {		CODE = EVENT_SYNERGY_ABILITY_LOST,		DESCR = "EVENT_SYNERGY_ABILITY_LOST",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			synergyBuffSlot = { name = "synergyBuffSlot", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_TARGET_CHANGED"] = {		CODE = EVENT_TARGET_CHANGED,		DESCR = "EVENT_TARGET_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },		},	},
	["EVENT_TITLE_UPDATE"] = {		CODE = EVENT_TITLE_UPDATE,		DESCR = "EVENT_TITLE_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },		},	},
	["EVENT_TRACKING_UPDATE"] = {		CODE = EVENT_TRACKING_UPDATE,		DESCR = "EVENT_TRACKING_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_TRADE_ACCEPT_FAILED_NOT_ENOUGH_MONEY"] = {		CODE = EVENT_TRADE_ACCEPT_FAILED_NOT_ENOUGH_MONEY,		DESCR = "EVENT_TRADE_ACCEPT_FAILED_NOT_ENOUGH_MONEY",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_TRADE_CANCELED"] = {		CODE = EVENT_TRADE_CANCELED,		DESCR = "EVENT_TRADE_CANCELED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			cancelerName = { name = "cancelerName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_TRADE_CONFIRMATION_CHANGED"] = {		CODE = EVENT_TRADE_CONFIRMATION_CHANGED,		DESCR = "EVENT_TRADE_CONFIRMATION_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			who = { name = "who", dataType = "integer", paramNum = 2 },			level = { name = "level", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_TRADE_ELEVATION_FAILED"] = {		CODE = EVENT_TRADE_ELEVATION_FAILED,		DESCR = "EVENT_TRADE_ELEVATION_FAILED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			reason = { name = "reason", dataType = "integer", paramNum = 2 },			itemName = { name = "itemName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_TRADE_FAILED"] = {		CODE = EVENT_TRADE_FAILED,		DESCR = "EVENT_TRADE_FAILED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			reason = { name = "reason", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_TRADE_INVITE_ACCEPTED"] = {		CODE = EVENT_TRADE_INVITE_ACCEPTED,		DESCR = "EVENT_TRADE_INVITE_ACCEPTED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_TRADE_INVITE_CANCELED"] = {		CODE = EVENT_TRADE_INVITE_CANCELED,		DESCR = "EVENT_TRADE_INVITE_CANCELED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_TRADE_INVITE_CONSIDERING"] = {		CODE = EVENT_TRADE_INVITE_CONSIDERING,		DESCR = "EVENT_TRADE_INVITE_CONSIDERING",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			inviter = { name = "inviter", dataType = "string", paramNum = 2 },		},	},
	["EVENT_TRADE_INVITE_DECLINED"] = {		CODE = EVENT_TRADE_INVITE_DECLINED,		DESCR = "EVENT_TRADE_INVITE_DECLINED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_TRADE_INVITE_FAILED"] = {		CODE = EVENT_TRADE_INVITE_FAILED,		DESCR = "EVENT_TRADE_INVITE_FAILED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			reason = { name = "reason", dataType = "integer", paramNum = 2 },			name = { name = "name", dataType = "string", paramNum = 3 },		},	},
	["EVENT_TRADE_INVITE_REMOVED"] = {		CODE = EVENT_TRADE_INVITE_REMOVED,		DESCR = "EVENT_TRADE_INVITE_REMOVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_TRADE_INVITE_WAITING"] = {		CODE = EVENT_TRADE_INVITE_WAITING,		DESCR = "EVENT_TRADE_INVITE_WAITING",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			invitee = { name = "invitee", dataType = "string", paramNum = 2 },		},	},
	["EVENT_TRADE_ITEM_ADDED"] = {		CODE = EVENT_TRADE_ITEM_ADDED,		DESCR = "EVENT_TRADE_ITEM_ADDED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			who = { name = "who", dataType = "integer", paramNum = 2 },			tradeIndex = { name = "tradeIndex", dataType = "luaindex", paramNum = 3 },			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_TRADE_ITEM_ADD_FAILED"] = {		CODE = EVENT_TRADE_ITEM_ADD_FAILED,		DESCR = "EVENT_TRADE_ITEM_ADD_FAILED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			reason = { name = "reason", dataType = "integer", paramNum = 2 },			itemName = { name = "itemName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_TRADE_ITEM_REMOVED"] = {		CODE = EVENT_TRADE_ITEM_REMOVED,		DESCR = "EVENT_TRADE_ITEM_REMOVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			who = { name = "who", dataType = "integer", paramNum = 2 },			tradeIndex = { name = "tradeIndex", dataType = "luaindex", paramNum = 3 },			itemSoundCategory = { name = "itemSoundCategory", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_TRADE_ITEM_UPDATED"] = {		CODE = EVENT_TRADE_ITEM_UPDATED,		DESCR = "EVENT_TRADE_ITEM_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			who = { name = "who", dataType = "integer", paramNum = 2 },			tradeIndex = { name = "tradeIndex", dataType = "luaindex", paramNum = 3 },		},	},
	["EVENT_TRADE_MONEY_CHANGED"] = {		CODE = EVENT_TRADE_MONEY_CHANGED,		DESCR = "EVENT_TRADE_MONEY_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			who = { name = "who", dataType = "integer", paramNum = 2 },			money = { name = "money", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_TRADE_SUCCEEDED"] = {		CODE = EVENT_TRADE_SUCCEEDED,		DESCR = "EVENT_TRADE_SUCCEEDED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_TRADING_HOUSE_AWAITING_RESPONSE"] = {		CODE = EVENT_TRADING_HOUSE_AWAITING_RESPONSE,		DESCR = "EVENT_TRADING_HOUSE_AWAITING_RESPONSE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			responseType = { name = "responseType", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_TRADING_HOUSE_CONFIRM_ITEM_PURCHASE"] = {		CODE = EVENT_TRADING_HOUSE_CONFIRM_ITEM_PURCHASE,		DESCR = "EVENT_TRADING_HOUSE_CONFIRM_ITEM_PURCHASE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			pendingPurchaseIndex = { name = "pendingPurchaseIndex", dataType = "luaindex", paramNum = 2 },		},	},
	["EVENT_TRADING_HOUSE_ERROR"] = {		CODE = EVENT_TRADING_HOUSE_ERROR,		DESCR = "EVENT_TRADING_HOUSE_ERROR",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			errorCode = { name = "errorCode", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_TRADING_HOUSE_PENDING_ITEM_UPDATE"] = {		CODE = EVENT_TRADING_HOUSE_PENDING_ITEM_UPDATE,		DESCR = "EVENT_TRADING_HOUSE_PENDING_ITEM_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			slotId = { name = "slotId", dataType = "integer", paramNum = 2 },			isPending = { name = "isPending", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_TRADING_HOUSE_RESPONSE_RECEIVED"] = {		CODE = EVENT_TRADING_HOUSE_RESPONSE_RECEIVED,		DESCR = "EVENT_TRADING_HOUSE_RESPONSE_RECEIVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			responseType = { name = "responseType", dataType = "integer", paramNum = 2 },			result = { name = "result", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_TRADING_HOUSE_SEARCH_RESULTS_RECEIVED"] = {		CODE = EVENT_TRADING_HOUSE_SEARCH_RESULTS_RECEIVED,		DESCR = "EVENT_TRADING_HOUSE_SEARCH_RESULTS_RECEIVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			guildId = { name = "guildId", dataType = "integer", paramNum = 2 },			numItemsOnPage = { name = "numItemsOnPage", dataType = "integer", paramNum = 3 },			currentPage = { name = "currentPage", dataType = "integer", paramNum = 4 },			hasMorePages = { name = "hasMorePages", dataType = "bool", paramNum = 5 },		},	},
	["EVENT_TRADING_HOUSE_STATUS_RECEIVED"] = {		CODE = EVENT_TRADING_HOUSE_STATUS_RECEIVED,		DESCR = "EVENT_TRADING_HOUSE_STATUS_RECEIVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_TRAIT_LEARNED"] = {		CODE = EVENT_TRAIT_LEARNED,		DESCR = "EVENT_TRAIT_LEARNED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			itemName = { name = "itemName", dataType = "string", paramNum = 2 },			itemTrait = { name = "itemTrait", dataType = "string", paramNum = 3 },		},	},
	["EVENT_TUTORIAL_SYSTEM_ENABLED_STATE_CHANGED"] = {		CODE = EVENT_TUTORIAL_SYSTEM_ENABLED_STATE_CHANGED,		DESCR = "EVENT_TUTORIAL_SYSTEM_ENABLED_STATE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			enabled = { name = "enabled", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_UI_ERROR"] = {		CODE = EVENT_UI_ERROR,		DESCR = "EVENT_UI_ERROR",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			stringId = { name = "stringId", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED"] = {		CODE = EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED,		DESCR = "EVENT_UNIT_ATTRIBUTE_VISUAL_ADDED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			unitAttributeVisual = { name = "unitAttributeVisual", dataType = "integer", paramNum = 3 },			statType = { name = "statType", dataType = "integer", paramNum = 4 },			attributeType = { name = "attributeType", dataType = "integer", paramNum = 5 },			powerType = { name = "powerType", dataType = "integer", paramNum = 6 },			value = { name = "value", dataType = "number", paramNum = 7 },			maxValue = { name = "maxValue", dataType = "number", paramNum = 8 },		},	},
	["EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED"] = {		CODE = EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED,		DESCR = "EVENT_UNIT_ATTRIBUTE_VISUAL_REMOVED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			unitAttributeVisual = { name = "unitAttributeVisual", dataType = "integer", paramNum = 3 },			statType = { name = "statType", dataType = "integer", paramNum = 4 },			attributeType = { name = "attributeType", dataType = "integer", paramNum = 5 },			powerType = { name = "powerType", dataType = "integer", paramNum = 6 },			value = { name = "value", dataType = "number", paramNum = 7 },			maxValue = { name = "maxValue", dataType = "number", paramNum = 8 },		},	},
	["EVENT_UNIT_ATTRIBUTE_VISUAL_UPDATED"] = {		CODE = EVENT_UNIT_ATTRIBUTE_VISUAL_UPDATED,		DESCR = "EVENT_UNIT_ATTRIBUTE_VISUAL_UPDATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			unitAttributeVisual = { name = "unitAttributeVisual", dataType = "integer", paramNum = 3 },			statType = { name = "statType", dataType = "integer", paramNum = 4 },			attributeType = { name = "attributeType", dataType = "integer", paramNum = 5 },			powerType = { name = "powerType", dataType = "integer", paramNum = 6 },			oldValue = { name = "oldValue", dataType = "number", paramNum = 7 },			newValue = { name = "newValue", dataType = "number", paramNum = 8 },			oldMaxValue = { name = "oldMaxValue", dataType = "number", paramNum = 9 },			newMaxValue = { name = "newMaxValue", dataType = "number", paramNum = 10 },		},	},
	["EVENT_UNIT_CREATED"] = {		CODE = EVENT_UNIT_CREATED,		DESCR = "EVENT_UNIT_CREATED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },		},	},
	["EVENT_UNIT_DEATH_STATE_CHANGED"] = {		CODE = EVENT_UNIT_DEATH_STATE_CHANGED,		DESCR = "EVENT_UNIT_DEATH_STATE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			isDead = { name = "isDead", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_UNIT_DESTROYED"] = {		CODE = EVENT_UNIT_DESTROYED,		DESCR = "EVENT_UNIT_DESTROYED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },		},	},
	["EVENT_UNIT_FRAME_UPDATE"] = {		CODE = EVENT_UNIT_FRAME_UPDATE,		DESCR = "EVENT_UNIT_FRAME_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },		},	},
	["EVENT_UPDATE_BUYBACK"] = {		CODE = EVENT_UPDATE_BUYBACK,		DESCR = "EVENT_UPDATE_BUYBACK",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_UPDATE_GAME_STATE"] = {		CODE = EVENT_UPDATE_GAME_STATE,		DESCR = "EVENT_UPDATE_GAME_STATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_VETERAN_DIFFICULTY_CHANGED"] = {		CODE = EVENT_VETERAN_DIFFICULTY_CHANGED,		DESCR = "EVENT_VETERAN_DIFFICULTY_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			isDifficult = { name = "isDifficult", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_VETERAN_POINTS_UPDATE"] = {		CODE = EVENT_VETERAN_POINTS_UPDATE,		DESCR = "EVENT_VETERAN_POINTS_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			currentPoints = { name = "currentPoints", dataType = "integer", paramNum = 3 },			maxPoints = { name = "maxPoints", dataType = "integer", paramNum = 4 },			reason = { name = "reason", dataType = "integer", paramNum = 5 },		},	},
	["EVENT_VETERAN_RANK_UPDATE"] = {		CODE = EVENT_VETERAN_RANK_UPDATE,		DESCR = "EVENT_VETERAN_RANK_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			rank = { name = "rank", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_WEAPON_SET_FULL_UPDATE"] = {		CODE = EVENT_WEAPON_SET_FULL_UPDATE,		DESCR = "EVENT_WEAPON_SET_FULL_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_WEAPON_SET_RANK_UPDATE"] = {		CODE = EVENT_WEAPON_SET_RANK_UPDATE,		DESCR = "EVENT_WEAPON_SET_RANK_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			weaponSetIndex = { name = "weaponSetIndex", dataType = "integer", paramNum = 2 },			rank = { name = "rank", dataType = "integer", paramNum = 3 },			maxRank = { name = "maxRank", dataType = "integer", paramNum = 4 },		},	},
	["EVENT_WEAPON_SET_XP_UPDATE"] = {		CODE = EVENT_WEAPON_SET_XP_UPDATE,		DESCR = "EVENT_WEAPON_SET_XP_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			weaponSetIndex = { name = "weaponSetIndex", dataType = "integer", paramNum = 2 },			lastRankXP = { name = "lastRankXP", dataType = "integer", paramNum = 3 },			nextRankXP = { name = "nextRankXP", dataType = "integer", paramNum = 4 },			currentXP = { name = "currentXP", dataType = "integer", paramNum = 5 },		},	},
	["EVENT_WEAPON_SWAP_LOCKED"] = {		CODE = EVENT_WEAPON_SWAP_LOCKED,		DESCR = "EVENT_WEAPON_SWAP_LOCKED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			swapLevel = { name = "swapLevel", dataType = "integer", paramNum = 2 },		},	},
	["EVENT_WEREWOLF_STATE_CHANGED"] = {		CODE = EVENT_WEREWOLF_STATE_CHANGED,		DESCR = "EVENT_WEREWOLF_STATE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			werewolf = { name = "werewolf", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_ZONE_CHANGED"] = {		CODE = EVENT_ZONE_CHANGED,		DESCR = "EVENT_ZONE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			zoneName = { name = "zoneName", dataType = "string", paramNum = 2 },			subZoneName = { name = "subZoneName", dataType = "string", paramNum = 3 },			newSubzone = { name = "newSubzone", dataType = "bool", paramNum = 4 },		},	},
	["EVENT_ZONE_CHANNEL_CHANGED"] = {		CODE = EVENT_ZONE_CHANNEL_CHANGED,		DESCR = "EVENT_ZONE_CHANNEL_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ZONE_SCORING_CHANGED"] = {		CODE = EVENT_ZONE_SCORING_CHANGED,		DESCR = "EVENT_ZONE_SCORING_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_ZONE_UPDATE"] = {		CODE = EVENT_ZONE_UPDATE,		DESCR = "EVENT_ZONE_UPDATE",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			unitTag = { name = "unitTag", dataType = "string", paramNum = 2 },			newZoneName = { name = "newZoneName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_ACTION_LAYER_POPPED"] = {		CODE = EVENT_ACTION_LAYER_POPPED,		DESCR = "EVENT_ACTION_LAYER_POPPED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			layerIndex = { name = "layerIndex", dataType = "luaindex", paramNum = 2 },			activeLayerIndex = { name = "activeLayerIndex", dataType = "luaindex", paramNum = 3 },		},	},
	["EVENT_ACTION_LAYER_PUSHED"] = {		CODE = EVENT_ACTION_LAYER_PUSHED,		DESCR = "EVENT_ACTION_LAYER_PUSHED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			layerIndex = { name = "layerIndex", dataType = "luaindex", paramNum = 2 },			activeLayerIndex = { name = "activeLayerIndex", dataType = "luaindex", paramNum = 3 },		},	},
	["EVENT_ADD_ON_LOADED"] = {		CODE = EVENT_ADD_ON_LOADED,		DESCR = "EVENT_ADD_ON_LOADED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			addonName = { name = "addonName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_CAPS_LOCK_STATE_CHANGED"] = {		CODE = EVENT_CAPS_LOCK_STATE_CHANGED,		DESCR = "EVENT_CAPS_LOCK_STATE_CHANGED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			capsLockEnabled = { name = "capsLockEnabled", dataType = "bool", paramNum = 2 },		},	},
	["EVENT_GLOBAL_MOUSE_DOWN"] = {		CODE = EVENT_GLOBAL_MOUSE_DOWN,		DESCR = "EVENT_GLOBAL_MOUSE_DOWN",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			button = { name = "button", dataType = "integer", paramNum = 2 },			ctrl = { name = "ctrl", dataType = "bool", paramNum = 3 },			alt = { name = "alt", dataType = "bool", paramNum = 4 },			shift = { name = "shift", dataType = "bool", paramNum = 5 },			command = { name = "command", dataType = "bool", paramNum = 6 },		},	},
	["EVENT_GLOBAL_MOUSE_UP"] = {		CODE = EVENT_GLOBAL_MOUSE_UP,		DESCR = "EVENT_GLOBAL_MOUSE_UP",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			button = { name = "button", dataType = "integer", paramNum = 2 },			ctrl = { name = "ctrl", dataType = "bool", paramNum = 3 },			alt = { name = "alt", dataType = "bool", paramNum = 4 },			shift = { name = "shift", dataType = "bool", paramNum = 5 },			command = { name = "command", dataType = "bool", paramNum = 6 },		},	},
	["EVENT_GUI_HIDDEN"] = {		CODE = EVENT_GUI_HIDDEN,		DESCR = "EVENT_GUI_HIDDEN",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			guiName = { name = "guiName", dataType = "string", paramNum = 2 },			hidden = { name = "hidden", dataType = "bool", paramNum = 3 },		},	},
	["EVENT_KEYBINDINGS_LOADED"] = {		CODE = EVENT_KEYBINDINGS_LOADED,		DESCR = "EVENT_KEYBINDINGS_LOADED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },		},	},
	["EVENT_KEYBINDING_CLEARED"] = {		CODE = EVENT_KEYBINDING_CLEARED,		DESCR = "EVENT_KEYBINDING_CLEARED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			layerIndex = { name = "layerIndex", dataType = "luaindex", paramNum = 2 },			categoryIndex = { name = "categoryIndex", dataType = "luaindex", paramNum = 3 },			actionIndex = { name = "actionIndex", dataType = "luaindex", paramNum = 4 },			bindingIndex = { name = "bindingIndex", dataType = "luaindex", paramNum = 5 },		},	},
	["EVENT_KEYBINDING_SET"] = {		CODE = EVENT_KEYBINDING_SET,		DESCR = "EVENT_KEYBINDING_SET",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			layerIndex = { name = "layerIndex", dataType = "luaindex", paramNum = 2 },			categoryIndex = { name = "categoryIndex", dataType = "luaindex", paramNum = 3 },			actionIndex = { name = "actionIndex", dataType = "luaindex", paramNum = 4 },			bindingIndex = { name = "bindingIndex", dataType = "luaindex", paramNum = 5 },			keyCode = { name = "keyCode", dataType = "integer", paramNum = 6 },			mod1 = { name = "mod1", dataType = "integer", paramNum = 7 },			mod2 = { name = "mod2", dataType = "integer", paramNum = 8 },			mod3 = { name = "mod3", dataType = "integer", paramNum = 9 },			mod4 = { name = "mod4", dataType = "integer", paramNum = 10 },		},	},
	["EVENT_LUA_ERROR"] = {		CODE = EVENT_LUA_ERROR,		DESCR = "EVENT_LUA_ERROR",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			error = { name = "error", dataType = "string", paramNum = 2 },		},	},
	["EVENT_SCREEN_RESIZED"] = {		CODE = EVENT_SCREEN_RESIZED,		DESCR = "EVENT_SCREEN_RESIZED",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			x = { name = "x", dataType = "integer", paramNum = 2 },			y = { name = "y", dataType = "integer", paramNum = 3 },		},	},
	["EVENT_SCRIPT_ACCESS_VIOLATION"] = {		CODE = EVENT_SCRIPT_ACCESS_VIOLATION,		DESCR = "EVENT_SCRIPT_ACCESS_VIOLATION",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			protectedFunctionName = { name = "protectedFunctionName", dataType = "string", paramNum = 2 },		},	},
	["EVENT_SHOW_GUI"] = {		CODE = EVENT_SHOW_GUI,		DESCR = "EVENT_SHOW_GUI",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			guiName = { name = "guiName", dataType = "string", paramNum = 2 },			desiredStateName = { name = "desiredStateName", dataType = "string", paramNum = 3 },		},	},
	["EVENT_UPDATE_GUI_LOADING_PROGRESS"] = {		CODE = EVENT_UPDATE_GUI_LOADING_PROGRESS,		DESCR = "EVENT_UPDATE_GUI_LOADING_PROGRESS",		PARAMS = {			eventCode = { name = "eventCode", dataType = "integer", paramNum = 1 },			guiName = { name = "guiName", dataType = "string", paramNum = 2 },			assetsLoaded = { name = "assetsLoaded", dataType = "integer", paramNum = 3 },			assetsTotal = { name = "assetsTotal", dataType = "integer", paramNum = 4 },		},	},
}

for e,t in pairs(wykkydsFramework.Events.GameEventTable) do
	if t.CODE ~= nil then wykkydsFramework.Events.GameEventsByCode[ t.CODE ] = t end
end
