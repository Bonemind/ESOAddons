wykkydsFramework.LoadSavedVariables = function()
	if mhFramework == nil then mhFramework = {} end
	
	WF_SavedVars.LootNotice = ZO_SavedVars:New("mhFrameworkNeatStuff", 2, "LootNotice", {}, "NeatStuff") or {}
	if WF_SavedVars.LootNotice["Enabled"] == nil then WF_SavedVars.LootNotice["Enabled"] = true end
	
	WF_SavedVars.GoldNotice = ZO_SavedVars:New("mhFrameworkNeatStuff", 2, "GoldNotice", {}, "NeatStuff") or {}
	if WF_SavedVars.GoldNotice["Enabled"] == nil then WF_SavedVars.GoldNotice["Enabled"] = true end
	if WF_SavedVars.GoldNotice["Scroll"] == nil then WF_SavedVars.GoldNotice["Scroll"] = true end
	
	WF_SavedVars.EnhancedPlayerHUD = ZO_SavedVars:New("mhFrameworkNeatStuff", 2, "EnhancedPlayerHUD", {}, "NeatStuff") or {}
	WF_SavedVars.AutoSheath = ZO_SavedVars:New("mhFrameworkNeatStuff", 2, "AutoSheath", {}, "NeatStuff") or {}
	WF_SavedVars.ReticleRangefinder = ZO_SavedVars:New("mhFrameworkNeatStuff", 2, "ReticleRangefinder", {}, "NeatStuff") or {}
	WF_SavedVars.MacroFrame = ZO_SavedVars:New("mhFrameworkFrames", 2, "MacroFrame", {}, "Frames") or {}
	WF_SavedVars.ChatBGFrame = ZO_SavedVars:New("mhFrameworkFrames", 2, "ChatBGFrame", {}, "Frames") or {}
	
	WF_SavedVars.SwizzyChatFade = ZO_SavedVars:New("mhFrameworkNeatStuff", 2, "SwizzyChatFade", {}, "NeatStuff") or {}
	if WF_SavedVars.SwizzyChatFade["Enabled"] == nil then WF_SavedVars.SwizzyChatFade["Enabled"] = false end
	
	WF_SavedVars.MultiScreen = ZO_SavedVars:New("mhFrameworkNeatStuff", 2, "MultiScreen", {}, "NeatStuff") or {}
	if WF_SavedVars.MultiScreen["Enabled"] == nil then WF_SavedVars.MultiScreen["Enabled"] = false end
	if WF_SavedVars.MultiScreen["Screens"] == nil then WF_SavedVars.MultiScreen["Screens"] = "2" end
	if WF_SavedVars.MultiScreen["Target"] == nil then WF_SavedVars.MultiScreen["Target"] = "2" end

	
	if WF_SavedVars.EnhancedPlayerHUD["Enabled"] == nil then WF_SavedVars.EnhancedPlayerHUD["Enabled"] = false end
	if WF_SavedVars.AutoSheath["Enabled"] == nil then WF_SavedVars.AutoSheath["Enabled"] = false end
	if WF_SavedVars.ReticleRangefinder["Enabled"] == nil then WF_SavedVars.ReticleRangefinder["Enabled"] = false end
	if WF_SavedVars.ChatBGFrame["Shown"] == nil then WF_SavedVars.ChatBGFrame["Shown"] = false end
	if WF_SavedVars.MacroFrame["Shown"] == nil then WF_SavedVars.MacroFrame["Shown"] = false end
	if not WF_SavedVars.MacroFrame["Settings"] then WF_SavedVars.MacroFrame["Settings"] = {
		Hidden = true,
		Moveable = true,
		ShiftX = 0,
		ShiftY = 0
	} end
	if not WF_SavedVars.MacroFrame["Macros"] then WF_SavedVars.MacroFrame["Macros"] = {} end
		
	WF_SavedVars.BazgrimToolbar = ZO_SavedVars:New("mhFrameworkNeatStuff", 2, "BazgrimToolbar", {}, "NeatStuff") or {}
	if not WF_SavedVars.BazgrimToolbar["Settings"] then WF_SavedVars.BazgrimToolbar["Settings"] = {
		Enabled = false,
		Hidden = false,
		Moveable = true,
		Background = false,
		ScrollingExp = true,
		ShiftX = 0,
		ShiftY = 60,
		Align = "CENTER",
		LockHCenter = true,
		BumpCompass = true
	} end
	if WF_SavedVars.BazgrimToolbar["Settings"].Background == nil then WF_SavedVars.BazgrimToolbar["Settings"].Background = false end
	if WF_SavedVars.BazgrimToolbar["Settings"].ScrollingExp == nil then WF_SavedVars.BazgrimToolbar["Settings"].ScrollingExp = true end
	

	if not WF_SavedVars.BazgrimToolbar["Tools"] then WF_SavedVars.BazgrimToolbar["Tools"] = {} end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS] = "Used / Total" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_FPS] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_FPS] = true end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME] = "12 hour" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_GOLD] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_GOLD] = true end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP] = "Earned / Total" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_ZONE] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_ZONE] = true end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_AP] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_AP] = false end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XPBar] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XPBar] = true end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_SpecialWorldXPBar] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_SpecialWorldXPBar] = false end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_NAME] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_NAME] = false end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_RACE] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_RACE] = false end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_CLASS] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_CLASS] = false end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_LEVEL] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_LEVEL] = true end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_GEMS] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_GEMS] = "Empty / Full" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_HORSE] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_HORSE] = "Fancy" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_SMITH] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_SMITH] = true end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_WOOD] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_WOOD] = true end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_CLOTH] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_CLOTH] = true end
	
	if not WF_SavedVars.BazgrimToolbar["ToolOptions"] then WF_SavedVars.BazgrimToolbar["ToolOptions"] = {} end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_title"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_title"] = false end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_icon"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_icon"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_low"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_low"] = 10 end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_mid"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_mid"] = 25 end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["fps_low"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["fps_low"] = 15 end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["fps_mid"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["fps_mid"] = 22 end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["time_title"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["time_title"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["time_ampm"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["time_ampm"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_title"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_title"] = false end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_icon"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_icon"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_comma"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_comma"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["xp_title"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["xp_title"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["xp_comma"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["xp_comma"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["zone_title"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["zone_title"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_title"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_title"] = false end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_icon"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_icon"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_comma"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_comma"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["level_title"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["level_title"] = false end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["gems_icon"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["gems_icon"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["horse_icon"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["horse_icon"] = true end
	
	-- Added by DewiMorgan
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_research_icons"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_research_icons"] = true end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_timer_target"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_timer_target"] = WF_TOOLBAR_STR_TIME_TO_NEXT_FREE end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_timers"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_timers"] = WF_TOOLBAR_STR_FANCY_STUDY end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_slots"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_slots"] = WF_TOOLBAR_STR_SLOTS_FREE_TOTAL end
	if WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_icon"] == nil then WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_icon"] = true end
	-- End Added by DewiMorgan
	
	WF_SavedVars.BazgrimSubtitle = ZO_SavedVars:New("mhFrameworkNeatStuff", 2, "BazgrimSubtitle", {}, "NeatStuff") or {}
	if not WF_SavedVars.BazgrimSubtitle["Settings"] then WF_SavedVars.BazgrimSubtitle["Settings"] = {
		Enabled = false,
		Hidden = false,
		Moveable = true,
		ShiftX = 0,
		ShiftY = 400,
		Align = "CENTER",
		LockHCenter = true,
		Scale = 100,
	} end
	
	mhFrameworkData = nil
end
