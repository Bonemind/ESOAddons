WF_SettingsMenu = {}
local defaultMenu = "|cFF2222Wykkyd|r Settings"
local hasBeenLoaded = false
local menus = {}
local menuBuffer = {}
local LAM = LibStub("LibAddonMenu-1.0")
local lastHeaderAdded = nil

WF_SettingsMenu.StartUp = function() 
	menus[defaultMenu] = { Key = WF_UTIL.UniqueName(defaultMenu.."Panel"), Name = defaultMenu }
	menus[defaultMenu].ID = LAM:CreateControlPanel(menus[defaultMenu].Key, menus[defaultMenu].Name)
	
	WF_SettingsMenu.AddHeader("Framework Settings")
	WF_SettingsMenu.AddCheckbox("Show Chat Background", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.ChatBGFrame["Shown"] )
	end, function(val)
		WF_SavedVars.ChatBGFrame["Shown"] = val
		local o = _G["wykkydsChatFrameBackPanel"]
		if o then
			if val then
				if o:IsHidden() then
					o:SetHidden(false); 
					o.bg:SetHidden(false); 
				end
			else
				if not o:IsHidden() then
					o:SetHidden(true); 
					o.bg:SetHidden(true); 
				end
			end
		end
	end)
	WF_SettingsMenu.AddCheckbox("Swizzy's Chat Fade Prevention", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.SwizzyChatFade["Enabled"] )
	end, function(val)
		WF_SavedVars.SwizzyChatFade["Enabled"] = val
		if val then
			WF_Tic( "swizzyrockedupintehjoint", function() ZO_ChatWindow.container.currentBuffer:ShowFadedLines(); end )
		else
			WF_Tic( "swizzyrockedupintehjoint" )
		end
	end)
	WF_SettingsMenu.AddCheckbox("Enable Auto-Sheath", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.AutoSheath["Enabled"] )
	end, function(val)
		WF_SavedVars.AutoSheath["Enabled"] = val
	end)
	WF_SettingsMenu.AddCheckbox("Enable Reticle Rangefinder", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.ReticleRangefinder["Enabled"] )
	end, function(val)
		WF_SavedVars.ReticleRangefinder["Enabled"] = val
		if val then
			WF_Tic( "WF_Reticle_RangeFinder_Tic", wykkydsFramework.TargetRange, .25 )
		else
			WF_Tic( "WF_Reticle_RangeFinder_Tic" )
		end
	end)
	WF_SettingsMenu.AddCheckbox("Enable Loot Notifications", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.LootNotice["Enabled"] )
	end, function(val)
		WF_SavedVars.LootNotice["Enabled"] = val
	end)
	WF_SettingsMenu.AddCheckbox("- Enable Gold Notifications", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.GoldNotice["Enabled"] )
	end, function(val)
		WF_SavedVars.GoldNotice["Enabled"] = val
	end)
	WF_SettingsMenu.AddCheckbox("- Scroll Gold Notifications", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.GoldNotice["Scroll"] )
	end, function(val)
		WF_SavedVars.GoldNotice["Scroll"] = val
	end)
	
	WF_SettingsMenu.AddHeader("Framework Advanced HUD")
	WF_SettingsMenu.AddCheckbox("Enhance Player HUD |c656565 (off reloads ui)|r", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.EnhancedPlayerHUD["Enabled"] )
	end, function(val)
		WF_SavedVars.EnhancedPlayerHUD["Enabled"] = val
		if val then
			WF_EnhancedPlayerHUD.Update(true)
		else
			ReloadUI()
		end
	end)
	WF_SettingsMenu.AddCheckbox("- Reposition HP, MP, SP |c656565 (off reloads ui)|r", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.EnhancedPlayerHUD["reposition"] )
	end, function(val)
		WF_SavedVars.EnhancedPlayerHUD["reposition"] = val
		if val then
			WF_EnhancedPlayerHUD.Update(true)
		else
			ReloadUI()
		end
	end)
	WF_SettingsMenu.AddCheckbox("- Always Show |c656565 (off reloads ui)|r", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.EnhancedPlayerHUD["always show"] )
	end, function(val)
		WF_SavedVars.EnhancedPlayerHUD["always show"] = val
		if val then
			PLAYER_ATTRIBUTE_BARS:ForceShow()
		else
			ReloadUI()
		end
	end)
	WF_SettingsMenu.AddDropdown("|cB0B0FF- Label Health|r", nil, {
		"Off",
		"Percent",
		"Current",
		"Current / Max",
		"Current / Percent",
	}, function() 
		return WF_GetOrDefault( "Off", WF_SavedVars.EnhancedPlayerHUD["label health"] )
	end, function(val)
		WF_SavedVars.EnhancedPlayerHUD["label health"] = val
		WF_EnhancedPlayerHUD.Update(true)
	end)
	WF_SettingsMenu.AddDropdown("|cB0B0FF- Label Stamina|r", nil, {
		"Off",
		"Percent",
		"Current",
		"Current / Max",
		"Current / Percent",
	}, function() 
		return WF_GetOrDefault( "Off", WF_SavedVars.EnhancedPlayerHUD["label stamina"] )
	end, function(val)
		WF_SavedVars.EnhancedPlayerHUD["label stamina"] = val
		WF_EnhancedPlayerHUD.Update(true)
	end)
	WF_SettingsMenu.AddDropdown("|cB0B0FF- Label Magicka|r", nil, {
		"Off",
		"Percent",
		"Current",
		"Current / Max",
		"Current / Percent",
	}, function() 
		return WF_GetOrDefault( "Off", WF_SavedVars.EnhancedPlayerHUD["label magicka"] )
	end, function(val)
		WF_SavedVars.EnhancedPlayerHUD["label magicka"] = val
		WF_EnhancedPlayerHUD.Update(true)
	end)
	
	WF_SettingsMenu.AddHeader("Multi-Screen Support")
	WF_SettingsMenu.AddCheckbox("Enable Multi-Screen Support", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.MultiScreen["Enabled"] )
	end, function(val)
		WF_SavedVars.MultiScreen["Enabled"] = val
		if WF_GetOrDefault( true, WF_SavedVars.MultiScreen["Enabled"] ) then
			if _G["WF_GuiRoot"] == nil then
				local newGuiRoot = WF_FRAMES.__NewTopLevel( "WF_GuiRoot" )
					:SetDimensions( GuiRoot:GetWidth(), GuiRoot:GetHeight() )
				.__END
			end
			GuiRoot:SetParent( WF_GuiRoot )
			GuiRoot:ClearAnchors()
			local size = tonumber(WF_GetOrDefault( "2", WF_SavedVars.MultiScreen["Screens"] ))
			local screen = tonumber(WF_GetOrDefault( "2", WF_SavedVars.MultiScreen["Target"] ))
			local width = ( GuiRoot:GetWidth() / size )
			GuiRoot:SetWidth( width )
			local targetLeft = width * ( screen - 1 )
			GuiRoot:SetAnchor( LEFT, WF_GuiRoot, LEFT, targetLeft, 0 )
		else
			if _G["WF_GuiRoot"] ~= nil then
				GuiRoot:SetParent( WF_GuiRoot )
				GuiRoot:ClearAnchors()
				GuiRoot:SetWidth( WF_GuiRoot:GetWidth() )
				GuiRoot:SetAnchor( LEFT, WF_GuiRoot, LEFT, 0, 0 )
			end
		end
	end)
	WF_SettingsMenu.AddDropdown("|cB0B0FFNumber of Screens|r", nil, {
		"2",
		"3",
		"4",
		"5",
	}, function() 
		return WF_GetOrDefault( "2", WF_SavedVars.MultiScreen["Screens"] )
	end, function(val)
		WF_SavedVars.MultiScreen["Screens"] = val
		if WF_GetOrDefault( true, WF_SavedVars.MultiScreen["Enabled"] ) then
			if _G["WF_GuiRoot"] == nil then
				local newGuiRoot = WF_FRAMES.__NewTopLevel( "WF_GuiRoot" )
					:SetDimensions( GuiRoot:GetWidth(), GuiRoot:GetHeight() )
				.__END
			end
			GuiRoot:SetParent( WF_GuiRoot )
			GuiRoot:ClearAnchors()
			local size = tonumber(WF_GetOrDefault( "2", WF_SavedVars.MultiScreen["Screens"] ))
			local screen = tonumber(WF_GetOrDefault( "2", WF_SavedVars.MultiScreen["Target"] ))
			local width = ( GuiRoot:GetWidth() / size )
			GuiRoot:SetWidth( width )
			local targetLeft = width * ( screen - 1 )
			GuiRoot:SetAnchor( LEFT, WF_GuiRoot, LEFT, targetLeft, 0 )
		else
			if _G["WF_GuiRoot"] ~= nil then
				GuiRoot:SetParent( WF_GuiRoot )
				GuiRoot:ClearAnchors()
				GuiRoot:SetWidth( WF_GuiRoot:GetWidth() )
				GuiRoot:SetAnchor( LEFT, WF_GuiRoot, LEFT, 0, 0 )
			end
		end
	end)
	WF_SettingsMenu.AddDropdown("|cB0B0FFTarget Screen|r", nil, {
		"1",
		"2",
		"3",
		"4",
		"5",
	}, function() 
		return WF_GetOrDefault( "2", WF_SavedVars.MultiScreen["Target"] )
	end, function(val)
		WF_SavedVars.MultiScreen["Target"] = val
		if WF_GetOrDefault( true, WF_SavedVars.MultiScreen["Enabled"] ) then
			if _G["WF_GuiRoot"] == nil then
				local newGuiRoot = WF_FRAMES.__NewTopLevel( "WF_GuiRoot" )
					:SetDimensions( GuiRoot:GetWidth(), GuiRoot:GetHeight() )
				.__END
			end
			GuiRoot:SetParent( WF_GuiRoot )
			GuiRoot:ClearAnchors()
			local size = tonumber(WF_GetOrDefault( "2", WF_SavedVars.MultiScreen["Screens"] ))
			local screen = tonumber(WF_GetOrDefault( "2", WF_SavedVars.MultiScreen["Target"] ))
			local width = ( GuiRoot:GetWidth() / size )
			GuiRoot:SetWidth( width )
			local targetLeft = width * ( screen - 1 )
			GuiRoot:SetAnchor( LEFT, WF_GuiRoot, LEFT, targetLeft, 0 )
		else
			if _G["WF_GuiRoot"] ~= nil then
				GuiRoot:SetParent( WF_GuiRoot )
				GuiRoot:ClearAnchors()
				GuiRoot:SetWidth( WF_GuiRoot:GetWidth() )
			GuiRoot:SetAnchor( LEFT, WF_GuiRoot, LEFT, 0, 0 )
			end
		end
	end)
	
	WF_SettingsMenu.AddHeader("Bazgrim's Toolbar")
	WF_SettingsMenu.AddCheckbox("Enable Bazgrim's Toolbar", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["Settings"].Enabled )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Settings"].Enabled = val
		if val then if bazgrimToolbar:IsHidden() then bazgrimToolbar:SetHidden(false); WF_BazgrimToolbar.Redraw(); end
		else if not bazgrimToolbar:IsHidden() then bazgrimToolbar:SetHidden(true); end
		end
	end)
	WF_SettingsMenu.AddDropdown("- Tool Alignment", nil, {
		"LEFT",
		"CENTER",
		"RIGHT",
	}, function()
		return WF_GetOrDefault( "CENTER", WF_SavedVars.BazgrimToolbar["Settings"].Align )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Settings"].Align = val
		bazgrimToolbar:SetFrameCoords()
	end)
	WF_SettingsMenu.AddCheckbox("- Lock Toolbar In Place", nil, function() 
		return not WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["Settings"].Moveable )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Settings"].Moveable = not val
		bazgrimToolbar:SetMouseEnabled(not val) 
		bazgrimToolbar:SetMovable(not val) 
	end)
	WF_SettingsMenu.AddCheckbox("- Lock Horizontal Center", "Only locks to horizontal center when alignment is set to CENTR", function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Settings"].LockHCenter )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Settings"].LockHCenter = val
		bazgrimToolbar:SetFrameCoords()
	end)
	WF_SettingsMenu.AddCheckbox("- Bump Compass Down", "Only bumps the compass if locked to center AND if top of frame is near top of screen", function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Settings"].BumpCompass )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Settings"].BumpCompass = val
	end)
	WF_SettingsMenu.AddCheckbox("- Enable Background", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["Settings"].Background )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Settings"].Background = val
		if val then if bazgrimToolbar.bg:IsHidden() then bazgrimToolbar.bg:SetHidden(false); end
		else if not bazgrimToolbar.bg:IsHidden() then bazgrimToolbar.bg:SetHidden(true); end
		end
	end)
	WF_SettingsMenu.AddCheckbox("- Enable Scrolling Exp", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Settings"].ScrollingExp )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Settings"].ScrollingExp = val
		WF_BazgrimToolbar.ScrollingExp.Update()
	end)
	WF_SettingsMenu.AddSlider("- Scale", nil, 50, 150, 1, function()
		return WF_GetOrDefault( 100, WF_SavedVars.BazgrimToolbar["Settings"].Scale)
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Settings"].Scale = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddDropdown("|cB0B0FFShow Time|r", nil, {
		"Off",
		"24 hour",
		"12 hour",
	}, function() 
		local val = WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME]
		if val == false then return "Off" end
		if val == nil or val == true then return "12 hour" end
		return val
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME] = val
		d(val)
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include 'Time' Title", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["time_title"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["time_title"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include AM/PM", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["time_ampm"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["time_ampm"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddCheckbox("|cB0B0FFShow FPS|r", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_FPS] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_FPS] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddDropdown("- Low FPS Threshold", nil, { 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30 }, function() 
		return WF_GetOrDefault( 15, WF_SavedVars.BazgrimToolbar["ToolOptions"]["fps_low"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["fps_low"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddDropdown("- Moderate FPS Threshold", nil, { 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60 }, function() 
		return WF_GetOrDefault( 22, WF_SavedVars.BazgrimToolbar["ToolOptions"]["fps_mid"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["fps_mid"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddCheckbox("|cB0B0FFShow Zone|r", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_ZONE] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_ZONE] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include 'Zone' Title", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["zone_title"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["zone_title"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddCheckbox("|cB0B0FFShow My Name|r", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_NAME] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_NAME] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddCheckbox("|cB0B0FFShow My Race|r", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_RACE] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_RACE] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddCheckbox("|cB0B0FFShow My Class|r", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_CLASS] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_CLASS] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddCheckbox("|cB0B0FFShow My Level|r", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_LEVEL] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_LEVEL] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include 'Level' Title", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["ToolOptions"]["level_title"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["level_title"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddCheckbox("|cB0B0FFShow XP Bar|r", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XPBar] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XPBar] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddDropdown("|cB0B0FFShow XP/VP|r", nil, {
		"Off",
		"Earned / Total",
		"Earned",
		"Earned % / Total",
		"Earned %",
		"Needed",
		"Needed %",
	}, function() 
		local val = WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP]
		if val == false then return "Off" end
		if val == nil or val == true then return "Earned / Total" end
		return val
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include 'XP/VP' Title", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["xp_title"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["xp_title"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Use Commas", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["xp_comma"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["xp_comma"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddCheckbox("|cB0B0FFShow Vampire/Werewolf XP Bar|r", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_SpecialWorldXPBar] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_SpecialWorldXPBar] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddDropdown("|cB0B0FFShow Horse Feeder|r", nil, {
		"Off",
		"Fancy",
		"Descriptive",
		"Countdown",
	}, function()
		local val = WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_HORSE]
		if val == false then return "Off" end
		if val == nil or val == true then return "Fancy" end
		return val
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_HORSE] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include Horse Icon", nil, function()  
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["horse_icon"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["horse_icon"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddDropdown("|cB0B0FFShow Bag Space|r", nil, {
		"Off",
		"Used / Total",
		"Used Space",
		"Used %",
		"Free Space",
		"Free %",
	}, function()
		local val = WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS]
		if val == false then return "Off" end
		if val == nil or val == true then return "Used / Total" end
		return val
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include 'Bags' Title", nil, function()  
		return WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_title"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_title"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include Bag Icon", "Only shows if Title is off", function()  
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_icon"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_icon"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddDropdown("- Low Space Threshold", nil, { 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 }, function() 
		return WF_GetOrDefault( 10, WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_low"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_low"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddDropdown("- Moderate Space Threshold", nil, { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35 }, function() 
		return WF_GetOrDefault( 25, WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_mid"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_mid"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddDropdown("|cB0B0FFShow Soul Gems|r", nil, {
		"Off",
		"Empty / Full",
		"Empty",
		"Full",
	}, function()
		local val = WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_GEMS]
		if val == false then return "Off" end
		if val == nil or val == true then return "Empty / Full" end
		return val
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_GEMS] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include Soul Gem Icon", nil, function()  
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["gems_icon"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["gems_icon"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddCheckbox("|cB0B0FFShow Gold|r", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_GOLD] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_GOLD] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include 'Gold' Title", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_title"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_title"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include Gold Icon", "Only shows when Title is off", function()  
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_icon"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_icon"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Use Commas", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_comma"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_comma"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	WF_SettingsMenu.AddCheckbox("|cB0B0FFShow Alliance Points|r", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_AP] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_AP] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include 'AP' Title", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_title"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_title"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Include AP Icon", nil, function()  
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_icon"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_icon"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("- Use Commas", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_comma"] )
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["ap_comma"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	-- Added by DewiMorgan
	-- Which crafts to display.
	-- This means three "header" texts in settings. The alternative's a single dropdown with 8 combinations.
	WF_SettingsMenu.AddCheckbox("|cB0B0FF" .. WF_TOOLBAR_STR_SHOW_SMITH, nil, function()
		return WF_GetOrDefault(true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_SMITH])
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_SMITH] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("|cB0B0FF" .. WF_TOOLBAR_STR_SHOW_WOOD, nil, function()
		return WF_GetOrDefault(true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_WOOD])
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_WOOD] = val
		WF_BazgrimToolbar.Redraw()
	end)
	WF_SettingsMenu.AddCheckbox("|cB0B0FF" .. WF_TOOLBAR_STR_SHOW_CLOTH, nil, function()
		return WF_GetOrDefault(true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_CLOTH])
	end, function(val)
		WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_CLOTH] = val
		WF_BazgrimToolbar.Redraw()
	end)

	-- Display the craft icons?
	WF_SettingsMenu.AddCheckbox("- " .. WF_TOOLBAR_STR_CRAFT_ICON, nil, function()
		return WF_GetOrDefault(true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_icon"])
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_icon"] = val
		WF_BazgrimToolbar.Redraw()
	end)

	-- Style of timer.
	WF_SettingsMenu.AddDropdown("|cB0B0FF" .. WF_TOOLBAR_STR_SHOW_CRAFT .. "|r", nil, {
		WF_TOOLBAR_STR_OFF,
		WF_TOOLBAR_STR_FANCY_STUDY,
		WF_TOOLBAR_STR_DESCRIPTIVE,
		WF_TOOLBAR_STR_PERCENTAGE_LEFT,
		WF_TOOLBAR_STR_PERCENTAGE_DONE,
		WF_TOOLBAR_STR_ADAPTIVE,
		WF_TOOLBAR_STR_COUNTDOWN,
	}, function()
		local val = WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_timers"]
		if val == false then return WF_TOOLBAR_STR_OFF end
		if val == nil or val == true then return WF_TOOLBAR_STR_FANCY_STUDY end
		return val
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_timers"] = val
		WF_BazgrimToolbar.Redraw()
	end)

	-- What are we timing?
	WF_SettingsMenu.AddDropdown("- " .. WF_TOOLBAR_STR_TIMER_TARGET, nil, {
		WF_TOOLBAR_STR_TIME_TO_NEXT_FREE,
		WF_TOOLBAR_STR_TIME_TO_ALL_FREE,
	}, function()
		local val = WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_timer_target"]
		if val == false then return WF_TOOLBAR_STR_TIME_TO_ALL_FREE end
		if val == nil or val == true then return WF_TOOLBAR_STR_TIME_TO_NEXT_FREE end
		return val
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_timer_target"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	-- Show the research slots?
	WF_SettingsMenu.AddDropdown("- " .. WF_TOOLBAR_STR_SLOTS, nil, {
		WF_TOOLBAR_STR_OFF,
		WF_TOOLBAR_STR_SLOTS_TOTAL,
		WF_TOOLBAR_STR_SLOTS_USED,
		WF_TOOLBAR_STR_SLOTS_FREE,
		WF_TOOLBAR_STR_SLOTS_USED_TOTAL,
		WF_TOOLBAR_STR_SLOTS_FREE_TOTAL,
	}, function()
		local val = WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_slots"]
		if val == false then return WF_TOOLBAR_STR_OFF end
		if val == nil or val == true then return WF_TOOLBAR_STR_SLOTS_FREE_TOTAL end
		return val
	end, function(val)
		WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_slots"] = val
		WF_BazgrimToolbar.Redraw()
	end)
	
	
	WF_SettingsMenu.AddHeader("Bazgrim's Subtitles")
	WF_SettingsMenu.AddCheckbox("Enable Subtitles", nil, function() 
		return WF_GetOrDefault( false, WF_SavedVars.BazgrimSubtitle["Settings"].Enabled)
	end, function(val)
		WF_SavedVars.BazgrimSubtitle["Settings"].Enabled = val
		if val then 
			if bazgrimSubtitles:IsHidden() then 
				bazgrimSubtitles:SetHidden(false); 
				bazgrimSubtitles:SetMouseEnabled(WF_SavedVars.BazgrimSubtitle["Settings"].Moveable) 
				bazgrimSubtitles:SetMovable(WF_SavedVars.BazgrimSubtitle["Settings"].Moveable)
				bazgrimSubtitles.bg:SetHidden(not WF_SavedVars.BazgrimSubtitle["Settings"].Moveable)
			end
		else 
			if not bazgrimSubtitles:IsHidden() then 
				bazgrimSubtitles:SetHidden(true); 
			end
		end
	end)
	WF_SettingsMenu.AddCheckbox("Lock Subtitles In Place (hide's bg)", nil, function() 
		return not WF_GetOrDefault( false, WF_SavedVars.BazgrimSubtitle["Settings"].Moveable)
	end, function(val)
		WF_SavedVars.BazgrimSubtitle["Settings"].Moveable = not val
		local o = _G["bazgrimSubtitles"]
		if o ~= nil then 
			o:SetMouseEnabled(not val) 
			o:SetMovable(not val)
			o.bg:SetHidden(val)
		end
	end)
	WF_SettingsMenu.AddCheckbox("Lock Horizontal Center", nil, function() 
		return WF_GetOrDefault( true, WF_SavedVars.BazgrimSubtitle["Settings"].LockHCenter )
	end, function(val)
		WF_SavedVars.BazgrimSubtitle["Settings"].LockHCenter = val
		bazgrimSubtitles:SetFrameCoords()
	end)
	WF_SettingsMenu.AddSlider("Text Scale", nil, 50, 150, 1, function()
		return WF_GetOrDefault( 100, WF_SavedVars.BazgrimSubtitle["Settings"].Scale)
	end, function(val)
		WF_SavedVars.BazgrimSubtitle["Settings"].Scale = val
		local o = _G["bazgrimSubtitles"]
		if o ~= nil then 
			o.Label:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 18 * (WF_GetOrDefault( 100, WF_SavedVars.BazgrimSubtitle["Settings"].Scale) / 100), "soft-shadow-thick"))
			o:SetDimensions(1000, ((18 * (WF_GetOrDefault( 100, WF_SavedVars.BazgrimSubtitle["Settings"].Scale) / 100)) + 2) * 3 )
			o.Label:SetDimensions(1000, ((18 * (WF_GetOrDefault( 100, WF_SavedVars.BazgrimSubtitle["Settings"].Scale) / 100)) + 2) * 3 )
		end
	end)
	WF_SettingsMenu.AddSlider("Fade Time", nil, 5, 20, 1, function()
		return WF_GetOrDefault( 8, WF_SavedVars.BazgrimSubtitle["Settings"].Fade)
	end, function(val)
		WF_SavedVars.BazgrimSubtitle["Settings"].Fade = val
	end)
	WF_SettingsMenu.AddDropdown("Align in Which Direction?", nil, {
		"LEFT",
		"CENTER",
		"RIGHT"
	}, function()
		return WF_SavedVars.BazgrimSubtitle["Settings"].Align or "CENTER"
	end, function(val)
		WF_SavedVars.BazgrimSubtitle["Settings"].Align = val
		local o = _G["bazgrimSubtitles"]
		if o ~= nil then 
			o.Label:SetHorizontalAlignment(
				WF_UTIL.TextAlign["h"][string.lower(WF_SavedVars.BazgrimSubtitle["Settings"].Align or "CENTER")]
			)
		end
	end)
	if table_count(menuBuffer) <= 0 then return end
	for b = 1, table_count(menuBuffer), 1 do
		menuBuffer[b]["callback"]( 
			menuBuffer[b]["parms"][1], 
			menuBuffer[b]["parms"][2], 
			menuBuffer[b]["parms"][3], 
			menuBuffer[b]["parms"][4], 
			menuBuffer[b]["parms"][5],
			menuBuffer[b]["parms"][6], 
			menuBuffer[b]["parms"][7], 
			menuBuffer[b]["parms"][8], 
			menuBuffer[b]["parms"][9], 
			menuBuffer[b]["parms"][10] 
		)
	end
end

local idAndBaseName = function(parentKey)
	local key = parentKey or defaultMenu
	if menus[key] ~= nil then
		return menus[key].ID, menus[key].Key
	else
		return nil, nil
	end
end

local idAndUniqueName = function(parentKey, suffix)
	local panelID, namePrefix = idAndBaseName(parentKey)
	return panelID, WF_UTIL.UniqueName(namePrefix..suffix)
end

WF_SettingsMenu.AddHeader = function(displayText, parentMenu)
	if displayText == nil then return nil; end
	local panel, name = idAndUniqueName(parentMenu, "Header")
	if panel == nil then
		local n = table_next(menuBuffer)
		menuBuffer[n] = {
			["callback"] = WF_SettingsMenu.AddHeader,
			["parms"] = {
				[1] = displayText,
				[2] = parentMenu
			}
		}
	else
		LAM:AddHeader(panel, name, "|cCAB222"..displayText.."|r")
	end
end

WF_SettingsMenu.AddSlider = function(text, tooltip, minValue, maxValue, step, getFunc, setFunc, warning, warningText, parentMenu)
	local panelID, controlName = idAndUniqueName(parentMenu, "Slider")
	if panelID == nil then
		local n = table_next(menuBuffer)
		menuBuffer[n] = {
			["callback"] = WF_SettingsMenu.AddSlider,
			["parms"] = {
				[1] = text, 
				[2] = tooltip, 
				[3] = minValue, 
				[4] = maxValue, 
				[5] = step, 
				[6] = getFunc, 
				[7] = setFunc, 
				[8] = warning, 
				[9] = warningText, 
				[10] = parentMenu
			}
		}
	else
		LAM:AddSlider(panelID, controlName, text, tooltip, minValue, maxValue, step, getFunc, setFunc, warning, warningText)
		
	end
end

WF_SettingsMenu.AddDropdown = function(text, tooltip, validChoices, getFunc, setFunc, warning, warningText, parentMenu)
	local panelID, controlName = idAndUniqueName(parentMenu, "Dropdown")
	if panelID == nil then
		local n = table_next(menuBuffer)
		menuBuffer[n] = {
			["callback"] = WF_SettingsMenu.AddDropdown,
			["parms"] = {
				[1] = text, 
				[2] = tooltip, 
				[3] = validChoices, 
				[4] = getFunc, 
				[5] = setFunc, 
				[6] = warning, 
				[7] = warningText, 
				[8] = parentMenu
			}
		}
	else
		LAM:AddDropdown(panelID, controlName, text, tooltip, validChoices, getFunc, setFunc, warning, warningText)
		
	end
end

WF_SettingsMenu.AddCheckbox = function(text, tooltip, getFunc, setFunc, warning, warningText, parentMenu)
	local panelID, controlName = idAndUniqueName(parentMenu, "Checkbox")
	if panelID == nil then
		local n = table_next(menuBuffer)
		menuBuffer[n] = {
			["callback"] = WF_SettingsMenu.AddCheckbox,
			["parms"] = {
				[1] = text, 
				[2] = tooltip, 
				[3] = getFunc, 
				[4] = setFunc, 
				[5] = warning, 
				[6] = warningText, 
				[7] = parentMenu
			}
		}
	else
		LAM:AddCheckbox(panelID, controlName, text, tooltip, getFunc, setFunc, warning, warningText)
		
	end
end

WF_SettingsMenu.AddColorPicker = function(text, tooltip, getFunc, setFunc, warning, warningText, parentMenu)
	local panelID, controlName = idAndUniqueName(parentMenu, "ColorPicker")
	if panelID == nil then
		local n = table_next(menuBuffer)
		menuBuffer[n] = {
			["callback"] = WF_SettingsMenu.AddColorPicker,
			["parms"] = {
				[1] = text, 
				[2] = tooltip, 
				[3] = getFunc, 
				[4] = setFunc, 
				[5] = warning, 
				[6] = warningText, 
				[7] = parentMenu
			}
		}
	else
		LAM:AddColorPicker(panelID, controlName, text, tooltip, getFunc, setFunc, warning, warningText)
		
	end
end

WF_SettingsMenu.AddEditBox = function(text, tooltip, isMultiLine, getFunc, setFunc, warning, warningText, parentMenu)
	local panelID, controlName = idAndUniqueName(parentMenu, "EditBox")
	if panelID == nil then
		local n = table_next(menuBuffer)
		menuBuffer[n] = {
			["callback"] = WF_SettingsMenu.AddEditBox,
			["parms"] = {
				[1] = text, 
				[2] = tooltip, 
				[3] = isMultiLine, 
				[4] = getFunc, 
				[5] = setFunc, 
				[6] = warning, 
				[7] = warningText, 
				[8] = parentMenu
			}
		}
	else
		LAM:AddEditBox(panelID, controlName, text, tooltip, isMultiLine, getFunc, setFunc, warning, warningText)
		
	end
end

WF_SettingsMenu.AddButton = function(text, tooltip, onClick, warning, warningText, parentMenu)
	local panelID, controlName = idAndUniqueName(parentMenu, "Button")
	if panelID == nil then
		local n = table_next(menuBuffer)
		menuBuffer[n] = {
			["callback"] = WF_SettingsMenu.AddButton,
			["parms"] = {
				[1] = text, 
				[2] = tooltip, 
				[3] = onClick, 
				[4] = warning, 
				[5] = warningText, 
				[6] = parentMenu
			}
		}
	else
		LAM:AddButton(panelID, controlName, text, tooltip, onClick, warning, warningText)
		
	end
end

--text = string; the text to display for this option
--tooltip = string; the tooltip text
--minValue = integer; the minimum value for the slider
--maxValue = integer; the maximum value for the slider
--step = integer; the incremental step size for the slider
--isMultiLine = boolean; make the editbox more than one line
--onClick = function; the function to execute when the button is clicked
--validChoices = table; choices to display in the dropdown
--getFunc = function; a function to return the current value (string) this option is set to
--setFunc = function; a function to save the new value this option is set to - passes through 1 argument, the new value (string)
--warning = boolean; display a warning icon for this option
--warningText = string; the tooltip text to display for the warning icon
