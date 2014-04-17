--[[
  * Wykkyd's [ Quest Tools ]
  * Sponsored & Supported by: Mostly Harmless (mostly-harmless-guild.com)
  * Author: Wykkyd, aka Wykkyd Gaming (wykkyd.gaming@gmail.com)
  * Special Thanks To: Zenimax Online Studios & Bethesda for The Elder Scrolls Online
]]--

local LAM = LibStub("LibAddonMenu-1.0")

WF_QuestTools = {}
WF_QuestTools.__index = WF_QuestTools
WF_QuestTools.AddonID = "mhQuestTools"

WF_QuestTools.Ready, WF_QuestTools.AddonName, WF_QuestTools.AddonAbbrev, WF_QuestTools.AddonVersion, WF_QuestTools.AddonDescr = WF_RegisterFactory(
	WF_QuestTools.AddonID,
	{
		AddonID = WF_QuestTools.AddonID,
		AddonName = "[WF] Quest Tools",
		AddonAbbrev = "qt",
		Author = "Wykkyd",
		AddonVersion = "1.4.12.2",
		ExpectedFrameworkVersion = "1.4.12.1",
		StartUp = function()
			WF_SlashCommand("qt", WF_QuestTools.CommandLine)
			WF_SlashCommand("qta", WF_QuestTools.Abandon)
			WF_SlashCommand("qtbl", WF_QuestTools.BlackList)
			WF_SlashCommand("qts", WF_QuestTools.Share)
			WF_SlashCommand("qtwl", WF_QuestTools.WhiteList)
			WF_SlashCommand("qtt", WF_QuestTools.Track)

			WF_Event( EVENT_QUEST_ADDED, WF_QuestTools.QuestAdded, WF_QuestTools.AddonID, false )
			if WF_QuestTools.UISettings["Enabled"] then
				WF_QuestTools.UI.QuestTracker()
			end

			WF_SettingsMenu.AddHeader("Quest Tools")
			WF_SettingsMenu.AddCheckbox("Enable Quest Tracker (/qt tracker)", nil, function()
				return WF_GetOrDefault( true, WF_QuestTools.UISettings["Enabled"])
			end, function(val)
				WF_QuestTools.UISettings["Enabled"] = val
				WF_QuestTools.UI.QuestEventCallback()
			end)
			WF_SettingsMenu.AddCheckbox("- Show All Quest Details", nil, function()
				return WF_GetOrDefault( false, WF_QuestTools.UISettings.ShowAllDetails)
			end, function(val)
				WF_QuestTools.UISettings.ShowAllDetails = val
				WF_QuestTools.UI.QuestEventCallback()
			end)
			WF_SettingsMenu.AddCheckbox("- Single Quest Only (coming soon)", nil, function()
				return WF_GetOrDefault( false, WF_QuestTools.UISettings.SingleQuest)
			end, function(val)
				WF_QuestTools.UISettings.SingleQuest = val
				WF_QuestTools.UI.QuestEventCallback()
			end)
			WF_SettingsMenu.AddCheckbox("Always Share (/qt always share)", nil, function()
				return WF_GetOrDefault( false, WF_QuestTools.UISettings.SetToAlwaysShare)
			end, function(val)
				WF_QuestTools.UISettings.SetToAlwaysShare = val
			end)
			WF_SettingsMenu.AddCheckbox("Always Track (/qt always track)", nil, function()
				return WF_GetOrDefault( true, WF_QuestTools.UISettings.SetToAlwaysTrack)
			end, function(val)
				WF_QuestTools.UISettings.SetToAlwaysTrack = val
			end)
			WF_SettingsMenu.AddColorPicker("Tracker Drag Bar", "Color of the bar at the top for moving the window",
				function()
					local color = { r = 0.25, g = 0.25, b = 0.25, a = .65 }
					color = WF_GetOrDefault(color, WF_QuestTools.UISettings.barColor)
					return color.r, color.g, color.b, color.a
				end,
				function(r,g,b,a)
					WF_QuestTools.UISettings.barColor.r = r
					WF_QuestTools.UISettings.barColor.g = g
					WF_QuestTools.UISettings.barColor.b = b
					WF_QuestTools.UISettings.barColor.a = a
					if WF_QuestTools_Tracker ~= nil then
						WF_QuestTools_Tracker.Title.Backdrop:SetCenterColor( r, g, b, a )
						WF_QuestTools_Tracker.MouseOut()
					end
				end
			)
			WF_SettingsMenu.AddColorPicker("Background", "Opacity and color of the background frame",
				function()
					local color = WF_GetOrDefault({ r = 0, g = 0, b = 0, a = 0.55}, WF_QuestTools.UISettings.Background)
					return color.r, color.g, color.b, color.a
				end,
				function(r,g,b,a)
					WF_QuestTools.UISettings.Background.r = r
					WF_QuestTools.UISettings.Background.g = g
					WF_QuestTools.UISettings.Background.b = b
					WF_QuestTools.UISettings.Background.a = a
					if WF_QuestTools_Tracker ~= nil then
						WF_QuestTools_Tracker.UnderlayBackdrop:SetCenterColor( r, g, b, a )
						WF_QuestTools_Tracker.MouseOut()
					end
				end
			)
			
			WF_SettingsMenu.AddCheckbox("Joviex's Tweaks", nil, function()
				return WF_GetOrDefault( false, WF_QuestTools.UISettings.Joviex)
			end, function(val)
				WF_QuestTools.UISettings.Joviex = val
				if val then WF_QuestTools.ZoneFontChange()
				else WF_QuestTools.UI.QuestEventCallback() end
			end)
			WF_SettingsMenu.AddHeader("Joviex's Quest Tracker Tweaks")
			WF_SettingsMenu.AddSlider("Tracker Width", "Width of the Quest Tracker Frame", 200, 500, 10,
				function()
					return WF_GetOrDefault( 250, WF_QuestTools.Background.width)
				end,
				function(val)
					WF_QuestTools.Background.width = val
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddSlider("Mouseout Alpha", "Transparency of the panel when the mouse exits the quest tracker", 0, 100, 1,
				function()
					return WF_GetOrDefault( 0.4, WF_QuestTools.Background.out ) * 100
				end,
				function(val)
					val = val / 100
					WF_QuestTools.Background.out = val
					if WF_QuestTools_Tracker ~= nil then
						WF_QuestTools_Tracker.OutAlpha = val
						WF_QuestTools_Tracker.MouseOut()
					end
				end
			)

			WF_SettingsMenu.AddCheckbox("Sort Quests by LVL", nil, function()
				local val = false
				if WF_QuestTools.Filter.Sort ~= nil then
					val = WF_QuestTools.Filter.Sort
				end
				return val
			end, function(val)
				WF_QuestTools.Filter.Sort = val
				WF_QuestTools.ZoneFontChange()
			end)

			WF_SettingsMenu.AddCheckbox("Override Quest Level Color", nil, function()
				local override = false
				if WF_QuestTools.Filter.Override ~= nil then
					override = WF_QuestTools.Filter.Override
				end
				return override
			end, function(val)
				WF_QuestTools.Filter.Override = val
				WF_QuestTools.ZoneFontChange()
			end)

			WF_SettingsMenu.AddColorPicker("    Very Easy", "Color of Quests -4 your current level",
				function()
					local color = { ["r"] = .65, ["g"] = .65, ["b"] = .65}
					if WF_QuestTools.Filter.Worthless ~= nil then
						color = WF_QuestTools.Filter.Worthless
					end
					return color.r, color.g, color.b, 1
				end,
				function(r,g,b,a)
					WF_QuestTools.Filter.Worthless = {["r"] = r, ["g"] = g, ["b"] = b}
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddColorPicker("    Easy", "Color of Quests -2 your current level",
				function()
					local color = { ["r"] = .65, ["g"] = 1, ["b"] = .65}
					if WF_QuestTools.Filter.Easy ~= nil then
						color = WF_QuestTools.Filter.Easy
					end
					return color.r, color.g, color.b, 1
				end,
				function(r,g,b,a)
					WF_QuestTools.Filter.Easy = {["r"] = r, ["g"] = g, ["b"] = b}
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddColorPicker("    Normal", "Color of Quests at your current level",
				function()
					local color = { ["r"] = .8, ["g"] = .8, ["b"] = .35}
					if WF_QuestTools.Filter.Par ~= nil then
						color = WF_QuestTools.Filter.Par
					end
					return color.r, color.g, color.b, 1
				end,
				function(r,g,b,a)
					WF_QuestTools.Filter.Par = {["r"] = r, ["g"] = g, ["b"] = b}
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddColorPicker("    Difficult", "Color of Quests +2 your current level",
				function()
					local color = { ["r"] = .8, ["g"] = .8, ["b"] = .35}
					if WF_QuestTools.Filter.Difficult ~= nil then
						color = WF_QuestTools.Filter.Difficult
					end
					return color.r, color.g, color.b, 1
				end,
				function(r,g,b,a)
					WF_QuestTools.Filter.Difficult = {["r"] = r, ["g"] = g, ["b"] = b}
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddColorPicker("    Very Hard", "Color of Quests +4 your current level",
				function()
					local color = { ["r"] = 1, ["g"] = .65, ["b"] = .65}
					if WF_QuestTools.Filter.Hard ~= nil then
						color = WF_QuestTools.Filter.Hard
					end
					return color.r, color.g, color.b, 1
				end,
				function(r,g,b,a)
					WF_QuestTools.Filter.Hard = {["r"] = r, ["g"] = g, ["b"] = b}
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddDropdown("Zone Title Font", "The zone font", WF_QuestTools._fonts,
				function()
					return WF_GetOrDefault( "Univers 57", WF_QuestTools.Zone.Font )
				end,
				function(val)
					WF_QuestTools.Zone.Font = val
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddDropdown("Zone Font Style", "The zone font style", WF_QuestTools._fontStyles,
				function()
					return WF_GetOrDefault( "soft-shadow-thin", WF_QuestTools.Zone.Style )
				end,
				function(val)
					WF_QuestTools.Zone.Style = val
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddSlider("Zone Font Size", "The zone font size", 8, 24, 1,
				function()
					return WF_GetOrDefault( 22, WF_QuestTools.Zone.Size )
				end,
				function(val)
					WF_QuestTools.Zone.Size = val
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddColorPicker("Zone Font Color", "The zone title color",
				function()
					local color = { ["r"] = .85, ["g"] = .85, ["b"] = .65}
					if WF_QuestTools.Zone.Color ~= nil then
						color = WF_QuestTools.Zone.Color
					end
					return color.r, color.g, color.b, 1
				end,
				function(r,g,b,a)
					WF_QuestTools.Zone.Color = {["r"] = r, ["g"] = g, ["b"] = b}
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddSlider("Zone Quest Counter Font Size", "The number of quests per zone font size", 8, 22, 1,
				function()
					val = WF_GetOrDefault( 14, WF_QuestTools.Zone.CounterSize )
					if val > WF_QuestTools.Zone.Size then
						val = WF_QuestTools.Zone.Size
					end
					return val
				end,
				function(val)
					if val > WF_QuestTools.Zone.Size then
						val = WF_QuestTools.Zone.Size
					end
					WF_QuestTools.Zone.CounterSize = val
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddColorPicker("Zone Quest Counter Color", "The color of the counter for the quest's in this zone",
				function()
					local color = { ["r"] = .35, ["g"] = .65, ["b"] = 1}
					if WF_QuestTools.Zone.Color ~= nil then
						color = WF_QuestTools.Zone.Counter
					end
					return color.r, color.g, color.b, 1
				end,
				function(r,g,b,a)
					WF_QuestTools.Zone.Counter = {["r"] = r, ["g"] = g, ["b"] = b}
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddDropdown("Quest Title Font", "The quest title font", WF_QuestTools._fonts,
				function()
					return WF_GetOrDefault( "Univers 57", WF_QuestTools.Title.Font )
				end,
				function(val)
					WF_QuestTools.Title.Font = val
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddDropdown("Quest Title Font Style", "The quest title font style", WF_QuestTools._fontStyles,
				function()
					return WF_GetOrDefault( "soft-shadow-thin", WF_QuestTools.Title.Style )
				end,
				function(val)
					WF_QuestTools.Title.Style = val
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddSlider("Quest Title Font Size", "The quest title font size", 8, 24, 1,
				function()
					return WF_GetOrDefault( 16, WF_QuestTools.Title.Size )
				end,
				function(val)
					WF_QuestTools.Title.Size = val
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddDropdown("Objective Font", "The quest objective font", WF_QuestTools._fonts,
				function()
					return WF_GetOrDefault( "Univers 57", WF_QuestTools.Body.Font )
				end,
				function(val)
					WF_QuestTools.Body.Font = val
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddDropdown("Objective Font Style", "The quest objective font style", WF_QuestTools._fontStyles,
				function()
					return WF_GetOrDefault( "soft-shadow-thin", WF_QuestTools.Body.Style )
				end,
				function(val)
					WF_QuestTools.Body.Style = val
					WF_QuestTools.ZoneFontChange()
				end
			)

			WF_SettingsMenu.AddSlider("Objective Font Size", "The quest objective font size", 8, 24,1,
				function()
					return WF_GetOrDefault( 13, WF_QuestTools.Body.Size )
				end,
				function(val)
					WF_QuestTools.Body.Size = val
					WF_QuestTools.ZoneFontChange()
				end
			)
		end,
		SavedVariables = function()
			local defaults = {}
			WF_QuestTools.Filter = ZO_SavedVars:New(WF_QuestTools.AddonID, 2, "filter", WF_QuestTools.Filter, "QT")
			WF_QuestTools.Zone = ZO_SavedVars:New(WF_QuestTools.AddonID, 2, "zone", WF_QuestTools.Zone, "QT")
			WF_QuestTools.Title = ZO_SavedVars:New(WF_QuestTools.AddonID, 2, "title", WF_QuestTools.Title, "QT")
			WF_QuestTools.Body = ZO_SavedVars:New(WF_QuestTools.AddonID, 2, "body", WF_QuestTools.Body, "QT")

			WF_QuestTools.QuestsToAbandon = ZO_SavedVars:New(WF_QuestTools.AddonID, 2, "BlackList", {}, "QT") or {}
			WF_QuestTools.QuestsToShare = ZO_SavedVars:New(WF_QuestTools.AddonID, 2, "WhiteList", {}, "QT") or {}

			defaults = {
				Enabled = false,
				Hidden = false,
				Moveable = true,
				ShiftX = 250,
				ShiftY = 0,
				ShowAllDetails = false,
				SingleQuest = false,
				Joviex = false,
				SetToAlwaysShare = false,
				SetToAlwaysTrack = true,
				barColor = {r=.25,g=.25,b=.25,a=.65},
				Background = {r=0,g=0,b=0,a=.55},
			}
			WF_QuestTools.UISettings = ZO_SavedVars:New(WF_QuestTools.AddonID, 2, "UISettings", defaults, "QT") or defaults
			if not WF_QuestTools.UISettings.CollapseState then WF_QuestTools.UISettings.CollapseState = {} end
			
		end,
	}
)
