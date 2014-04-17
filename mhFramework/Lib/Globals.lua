WF_PairsByKeys = function(t, f)
	local a = {}
	for n in pairs(t) do table.insert(a, n) end
	table.sort(a, f)
	local i = 0
	local iter = function ()
		i = i + 1
		if a[i] == nil then return nil
		else return a[i], t[a[i]]
	end
	end
	return iter
end

WF_WindowsToLeaveOff = {}

WF_MACRO_TYPE_NIL = 1
WF_MACRO_TYPE_CHAT = 2
WF_MACRO_TYPE_EMOTE = 3
WF_MACRO_TYPE_ADDON = 4
WF_MACRO_TYPE_GEAR = 5
WF_MACRO_TYPE_SKILL = 6

WF_TOOLBAR_TOOL_BAGS = 1
WF_TOOLBAR_TOOL_FPS = 2
WF_TOOLBAR_TOOL_TIME = 3
WF_TOOLBAR_TOOL_GOLD = 4
WF_TOOLBAR_TOOL_XP = 5
WF_TOOLBAR_TOOL_ZONE = 6
WF_TOOLBAR_TOOL_AP = 7
WF_TOOLBAR_TOOL_XPBar = 8
WF_TOOLBAR_TOOL_NAME = 9
WF_TOOLBAR_TOOL_RACE = 10
WF_TOOLBAR_TOOL_CLASS = 11
WF_TOOLBAR_TOOL_LEVEL = 12
WF_TOOLBAR_TOOL_GEMS = 13
WF_TOOLBAR_TOOL_HORSE = 14
WF_TOOLBAR_TOOL_SpecialWorldXPBar = 15
WF_TOOLBAR_TOOL_SMITH = 16
WF_TOOLBAR_TOOL_WOOD  = 17
WF_TOOLBAR_TOOL_CLOTH = 18

-- Strings as globals for easier localization.
-- ToDo: move to separate per-language string file.
-- ToDo: wrap each string in t() translation function that is aware of the SI_* global variables.
-- ToDo: change dropdowns to separate their display label from their returned value?
WF_TOOLBAR_STR_SHOW_SMITH             = "Dewi's Smithing Research"
WF_TOOLBAR_STR_SHOW_WOOD              = "Dewi's Woodwork Research"
WF_TOOLBAR_STR_SHOW_CLOTH             = "Dewi's Clothier Research"
WF_TOOLBAR_STR_CRAFT_ICON             = "Include Craft-type Icons"
WF_TOOLBAR_STR_RESEARCH_ICONS         = "Include Research-type Icons"

WF_TOOLBAR_STR_SHOW_CRAFT             = "Dewi's Research Timers"
WF_TOOLBAR_STR_OFF                    = "Off"
WF_TOOLBAR_STR_FANCY_STUDY            = "Fancy ('Study', 'Read', etc)"
WF_TOOLBAR_STR_DESCRIPTIVE            = "Descriptive ('12 hours', '35 minutes', etc)"
WF_TOOLBAR_STR_PERCENTAGE_LEFT        = "Percentage left ('27%')"
WF_TOOLBAR_STR_PERCENTAGE_DONE        = "Percentage done ('73%')"
WF_TOOLBAR_STR_ADAPTIVE               = "Adaptive ('hh:mm' or 'mm:ss')"
WF_TOOLBAR_STR_COUNTDOWN              = "Countdown ('hh:mm:ss')"

WF_TOOLBAR_STR_TIMER_TARGET           = "Timer Target Time"
WF_TOOLBAR_STR_TIME_TO_NEXT_FREE      = "Time to next free slot"
WF_TOOLBAR_STR_TIME_TO_ALL_FREE       = "Time to all slots free"

WF_TOOLBAR_STR_SLOTS                  = "Dewi's Research Slots"
WF_TOOLBAR_STR_SLOTS_TOTAL            = "Total Slots"
WF_TOOLBAR_STR_SLOTS_USED             = "Slots Used"
WF_TOOLBAR_STR_SLOTS_FREE             = "Slots Free"
-- These two could be generated from the above, but this might pose translation challenges.
WF_TOOLBAR_STR_SLOTS_USED_TOTAL       = "Slots Used/Total Slots"
WF_TOOLBAR_STR_SLOTS_FREE_TOTAL       = "Slots Free/Total Slots"

-- Study strings for FANCY_STUDY display type.
-- Task name length grows over time for the most part, as a visual clue.
WF_TOOLBAR_STR_STUDY_1                = "Confused..."
WF_TOOLBAR_STR_STUDY_2                = "Fact finding"
WF_TOOLBAR_STR_STUDY_3                = "Processing"
WF_TOOLBAR_STR_STUDY_4                = "Studying"
WF_TOOLBAR_STR_STUDY_5                = "Pondering"
WF_TOOLBAR_STR_STUDY_6                = "Analyzing"
WF_TOOLBAR_STR_STUDY_HALF             = "Getting it!" -- Displayed at 50%
WF_TOOLBAR_STR_STUDY_7                = "Examining"
WF_TOOLBAR_STR_STUDY_8                = "Inspecting"
WF_TOOLBAR_STR_STUDY_9                = "Theorizing"
WF_TOOLBAR_STR_STUDY_10               = "Memorizing"
WF_TOOLBAR_STR_STUDY_11               = "Testing"
WF_TOOLBAR_STR_STUDY_12               = "Documenting"
WF_TOOLBAR_STR_STUDY_13               = "Documenting"
WF_TOOLBAR_STR_STUDY_14               = "Almost done!"
WF_TOOLBAR_STR_STUDY_DONE             = "Job's done!"
WF_TOOLBAR_STR_HOURS                  = "Hours"    
WF_TOOLBAR_STR_MINUTES                = "Minutes"
WF_TOOLBAR_STR_SECONDS                = "Seconds"
-- End Added by DewiMorgan

WF_TOOLBAR_TOOLS = {}


WF_UTIL = {}

WF_SavedVars = {}

wykkydsFramework.Globals = {}
wykkydsFramework.Globals.Constants = {}

wykkydsFramework.Events = {}
wykkydsFramework.Events.Registry = {}
wykkydsFramework.Events.GameEventTable = {}
wykkydsFramework.Events.GameEventsByCode = {}
wykkydsFramework.Events.Registered_onupdatecallback = {}

WF_UITOP = nil
WF_UIRIGHT = nil
WF_UICENTER = nil
WF_UIBOTTOM = nil
WF_UILEFT = nil

WF_FRAMES = {}
WF_FRAMES.PrepareBase = false

WF_CONSTANTS = {}

WF_CONSTANTS.ChatChannels = {
	p = { channel = CHAT_CHANNEL_PARTY, channelDescr = "CHAT_CHANNEL_PARTY" },
	party = { channel = CHAT_CHANNEL_PARTY, channelDescr = "CHAT_CHANNEL_PARTY" },
	em = { channel = CHAT_CHANNEL_EMOTE, channelDescr = "CHAT_CHANNEL_EMOTE" },
	emote = { channel = CHAT_CHANNEL_EMOTE, channelDescr = "CHAT_CHANNEL_EMOTE" },
	s = { channel = CHAT_CHANNEL_SAY, channelDescr = "CHAT_CHANNEL_SAY" },
	say = { channel = CHAT_CHANNEL_SAY, channelDescr = "CHAT_CHANNEL_SAY" },
	g1 = { channel = CHAT_CHANNEL_GUILD_1, channelDescr = "CHAT_CHANNEL_GUILD_1" },
	g2 = { channel = CHAT_CHANNEL_GUILD_2, channelDescr = "CHAT_CHANNEL_GUILD_2" },
	g3 = { channel = CHAT_CHANNEL_GUILD_3, channelDescr = "CHAT_CHANNEL_GUILD_3" },
	g4 = { channel = CHAT_CHANNEL_GUILD_4, channelDescr = "CHAT_CHANNEL_GUILD_4" },
	g5 = { channel = CHAT_CHANNEL_GUILD_5, channelDescr = "CHAT_CHANNEL_GUILD_5" },
	o1 = { channel = CHAT_CHANNEL_OFFICER_1, channelDescr = "CHAT_CHANNEL_OFFICER_1" },
	o2 = { channel = CHAT_CHANNEL_OFFICER_2, channelDescr = "CHAT_CHANNEL_OFFICER_2" },
	o3 = { channel = CHAT_CHANNEL_OFFICER_3, channelDescr = "CHAT_CHANNEL_OFFICER_3" },
	o4 = { channel = CHAT_CHANNEL_OFFICER_4, channelDescr = "CHAT_CHANNEL_OFFICER_4" },
	o5 = { channel = CHAT_CHANNEL_OFFICER_5, channelDescr = "CHAT_CHANNEL_OFFICER_5" },
	guild1 = { channel = CHAT_CHANNEL_GUILD_1, channelDescr = "CHAT_CHANNEL_GUILD_1" },
	guild2 = { channel = CHAT_CHANNEL_GUILD_2, channelDescr = "CHAT_CHANNEL_GUILD_2" },
	guild3 = { channel = CHAT_CHANNEL_GUILD_3, channelDescr = "CHAT_CHANNEL_GUILD_3" },
	guild4 = { channel = CHAT_CHANNEL_GUILD_4, channelDescr = "CHAT_CHANNEL_GUILD_4" },
	guild5 = { channel = CHAT_CHANNEL_GUILD_5, channelDescr = "CHAT_CHANNEL_GUILD_5" },
	officer1 = { channel = CHAT_CHANNEL_OFFICER_1, channelDescr = "CHAT_CHANNEL_OFFICER_1" },
	officer2 = { channel = CHAT_CHANNEL_OFFICER_2, channelDescr = "CHAT_CHANNEL_OFFICER_2" },
	officer3 = { channel = CHAT_CHANNEL_OFFICER_3, channelDescr = "CHAT_CHANNEL_OFFICER_3" },
	officer4 = { channel = CHAT_CHANNEL_OFFICER_4, channelDescr = "CHAT_CHANNEL_OFFICER_4" },
	officer5 = { channel = CHAT_CHANNEL_OFFICER_5, channelDescr = "CHAT_CHANNEL_OFFICER_5" },
	z = { channel = CHAT_CHANNEL_ZONE, channelDescr = "CHAT_CHANNEL_ZONE" },
	zone = { channel = CHAT_CHANNEL_ZONE, channelDescr = "CHAT_CHANNEL_ZONE" },
	y = { channel = CHAT_CHANNEL_YELL, channelDescr = "CHAT_CHANNEL_YELL" },
	yell = { channel = CHAT_CHANNEL_YELL, channelDescr = "CHAT_CHANNEL_YELL" },
}

WF_UTIL.TextAlign = {
	["h"] = {
		["left"]=TEXT_ALIGN_LEFT,
		["center"]=TEXT_ALIGN_CENTER,
		["right"]=TEXT_ALIGN_RIGHT,
	},
	["v"] = {
		["top"]=TEXT_ALIGN_TOP,
		["center"]=TEXT_ALIGN_CENTER,
		["bottom"]=TEXT_ALIGN_BOTTOM,
	},
}
for k,v in pairs(WF_UTIL.TextAlign["h"]) do WF_UTIL.TextAlign["h"][string.upper(k)] = v end
for k,v in pairs(WF_UTIL.TextAlign["v"]) do WF_UTIL.TextAlign["v"][string.upper(k)] = v end
WF_UTIL.TextAlign["H"] = WF_UTIL.TextAlign["h"]
WF_UTIL.TextAlign["V"] = WF_UTIL.TextAlign["v"]

WF_UTIL.Buffer = {}

wykkydsFramework.emotes = nil
wykkydsFramework.emotesSorted = nil

wykkydsFramework.LoadEmotes = function() 
	if wykkydsFramework.emotes == nil then 
		wykkydsFramework.emotes = {}
		wykkydsFramework.emotesSorted = {}
		local tbl = {}
		for e = 1, GetNumEmotes(), 1 do 
			local em = GetEmoteSlashName(e)
			if em ~= nil and string_trim(em) ~= "" then tbl[em] = e end
		end 
		for em,e in WF_PairsByKeys(tbl) do
			wykkydsFramework.emotes[ em ] = e
			wykkydsFramework.emotesSorted[ table_next(wykkydsFramework.emotesSorted) ] = { name = em, code = e }
		end
	end
	return wykkydsFramework.emotes
end

WF_CONSTANTS.EquipSlot = {
	["EQUIP_SLOT_HEAD"] = EQUIP_SLOT_HEAD,
	["EQUIP_SLOT_NECK"] = EQUIP_SLOT_NECK,
	["EQUIP_SLOT_CHEST"] = EQUIP_SLOT_CHEST,
	["EQUIP_SLOT_SHOULDERS"] = EQUIP_SLOT_SHOULDERS,
	["EQUIP_SLOT_MAIN_HAND"] = EQUIP_SLOT_MAIN_HAND,
	["EQUIP_SLOT_OFF_HAND"] = EQUIP_SLOT_OFF_HAND,
	["EQUIP_SLOT_WAIST"] = EQUIP_SLOT_WAIST,
	["EQUIP_SLOT_LEGS"] = EQUIP_SLOT_LEGS,
	["EQUIP_SLOT_FEET"] = EQUIP_SLOT_FEET,
	["EQUIP_SLOT_COSTUME"] = EQUIP_SLOT_COSTUME,
	["EQUIP_SLOT_RING1"] = EQUIP_SLOT_RING1,
	["EQUIP_SLOT_RING2"] = EQUIP_SLOT_RING2,
	["EQUIP_SLOT_HAND"] = EQUIP_SLOT_HAND,
	["EQUIP_SLOT_BACKUP_MAIN"] = EQUIP_SLOT_BACKUP_MAIN,
	["EQUIP_SLOT_BACKUP_OFF"] = EQUIP_SLOT_BACKUP_OFF,
}
WF_CONSTANTS.EquipSlotBagSlot = {
	["EQUIP_SLOT_HEAD"] = 0,
	["EQUIP_SLOT_NECK"] = 1,
	["EQUIP_SLOT_CHEST"] = 2,
	["EQUIP_SLOT_SHOULDERS"] = 3,
	["EQUIP_SLOT_MAIN_HAND"] = 4,
	["EQUIP_SLOT_OFF_HAND"] = 5,
	["EQUIP_SLOT_WAIST"] = 6,
	["EQUIP_SLOT_LEGS"] = 8,
	["EQUIP_SLOT_FEET"] = 9,
	["EQUIP_SLOT_COSTUME"] = 10,
	["EQUIP_SLOT_RING1"] = 11,
	["EQUIP_SLOT_RING2"] = 12,
	["EQUIP_SLOT_HAND"] = 16,
	["EQUIP_SLOT_BACKUP_MAIN"] = 20,
	["EQUIP_SLOT_BACKUP_OFF"] = 21,
}
WF_CONSTANTS.EquipSlotDescrByBagSlot = {}
for descr,slot in pairs(WF_CONSTANTS.EquipSlotBagSlot) do WF_CONSTANTS.EquipSlotDescrByBagSlot[slot] = descr end

SOUL_GEM_PETTY = 1
SOUL_GEM_MINOR = 11
SOUL_GEM_LESSER = 21
SOUL_GEM_COMMON = 31
SOUL_GEM_GREATER = 41
SOUL_GEM_GRAND = 50

SOUL_GEM_LOC_INVENTORY = true
SOUL_GEN_LOC_ANYWHERE = false
