WF_BazgrimToolbar = {}

--[[
	* FULLSCREEN_MODE_FULLSCREEN
	* FULLSCREEN_MODE_MAXIMIZED
	* FULLSCREEN_MODE_WINDOWED
]]--

WF_ScrollControls = {}
WF_ScrollControls.gameTimeStamp = 0
WF_ScrollControls.BaseExp = GetUnitXP("player")

WF_BazgrimToolbar_DefaultLabelColor = "|c7FA292"

WF_BazgrimToolbar.MakeSpacerControl = function(o)
	return WF_FRAMES.__NewImage("bazgrimToolbarSpacer", o)
		:SetTexture("/esoui/art/mappins/group_pin.dds")
		:SetDimensions( 12 * ( WF_GetOrDefault( 100, WF_SavedVars.BazgrimToolbar["Settings"].Scale ) / 100 ), 12 * ( WF_GetOrDefault( 100, WF_SavedVars.BazgrimToolbar["Settings"].Scale) / 100 ) )
		:SetHidden(false)
	.__END
end

WF_BazgrimToolbar.MakeToolControl = function(o, key, t)
	if t == "XPBar" then
		return WF_BazgrimToolbar.ScaledBar( o, "xpBar", {0,0,0,.6}, {.6, 1, .6, .95}, {1, .6, .6, .85}, {.7, .7, 1, .85}, {0,0,.75,.65}, 120, 60, 20, 100 )
	elseif t == "SpecialWorldXPBar" then
		return WF_BazgrimToolbar.ScaledBar( o, "specialXPBar", {0,0,0,.6}, {1, 0, 0, .95}, {104/255, 0, 0, .85}, {184/255, 0, 0, .85}, {1,0,0,.65}, 120, 60, 20, 100 )
	else
		return WF_FRAMES.__NewLabel("bazgrimToolbarControl", o)
			:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 15 * ( WF_GetOrDefault( 100, WF_SavedVars.BazgrimToolbar["Settings"].Scale) / 100 ), "soft-shadow-thick"))
			:SetColor(215/255,213/255,205/255,1)
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
			:SetText("")
			:SetHidden(false)
		.__END
	end
end

WF_BazgrimToolbar.MakeToolbar = function(o)
	local key = o:GetName()
	for k,t in pairs(o.Tools) do
		if not o.Tools[k].Control then o.Tools[k].Control = WF_BazgrimToolbar.MakeToolControl(o, key.."_"..t.Name, t.Name) end
	end
	local lastControl = nil
	for k,t in ipairs(WF_TOOLBAR_TOOLS) do
		if WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= nil 
		and WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= "Off" 
		and WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= false then
			o.Tools[t.Tool].Control:ClearAnchors()
			if not lastControl then 
				if o.Tools[t.Tool].Control.UseIcon then
					o.Tools[t.Tool].Control.PreviousAnchor = { LEFT, o, LEFT, 0, 0 }
					o.Tools[t.Tool].Control:SetAnchor(LEFT, o, LEFT, 0 + o.Tools[t.Tool].Control.BufferSize + 4, 0)
				else
					o.Tools[t.Tool].Control:SetAnchor(LEFT, o, LEFT, 0, 0)
				end
			else 
				if o.Tools[t.Tool].Spacer == nil then o.Tools[t.Tool].Spacer = WF_BazgrimToolbar.MakeSpacerControl(o) end
				o.Tools[t.Tool].Spacer:ClearAnchors()
				o.Tools[t.Tool].Spacer:SetHidden(false)
				o.Tools[t.Tool].Spacer:SetAnchor(LEFT, lastControl, RIGHT, 4, 0)
				if o.Tools[t.Tool].Control.UseIcon then
					o.Tools[t.Tool].Control.PreviousAnchor = { LEFT, o.Tools[t.Tool].Spacer, RIGHT, 4, 0 }
					o.Tools[t.Tool].Control:SetAnchor(LEFT, o.Tools[t.Tool].Spacer, RIGHT, 4 + o.Tools[t.Tool].Control.BufferSize + 4, 0)
				else
					o.Tools[t.Tool].Control:SetAnchor(LEFT, o.Tools[t.Tool].Spacer, RIGHT, 4, 0)
				end
			end
			lastControl = o.Tools[t.Tool].Control
			o.Tools[t.Tool].Control:SetHidden(false)
		else
			if o.Tools[t.Tool].Spacer ~= nil then o.Tools[t.Tool].Spacer:SetHidden(true); end
			o.Tools[t.Tool].Control:SetHidden(true); 
		end
	end
	o.UpdateAll()
	WF_BazgrimToolbar.ScrollingExp.Update()
	EVENT_MANAGER:RegisterForEvent("bazgrimToolbarZoneUpdate", EVENT_ZONE_CHANGED, WF_BazgrimToolbar.zoneUpdate)
end

WF_BazgrimToolbar.Redraw = function()
	local key = "bazgrimToolbar"
	local o = _G[key]
	if o == nil then WF_BazgrimToolbar.Create(); return; end
	WF_BazgrimToolbar.MakeToolbar(o)
end

WF_BazgrimToolbar.GetAnchorPoint = function()
	local setting = WF_GetOrDefault( "CENTER", WF_SavedVars.BazgrimToolbar["Settings"].Align )
	if setting == "CENTER" then return CENTER end
	if setting == "LEFT" then return TOPLEFT end
	if setting == "RIGHT" then return TOPRIGHT end
end

local BumpCompass = function(windowRenudge)
	local resetpositionofcompass = false
	if not AZ_MOVED_TARGET and not AZ_MOVED_COMPASS then
		if WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Settings"].BumpCompass ) and (bazgrimToolbar.IsMoving or windowRenudge) then
			resetpositionofcompass = true
			if bazgrimToolbar:GetTop() <= 80 then
				if ZO_CompassFrame:GetTop() ~= bazgrimToolbar:GetTop() + 60 then
					ZO_CompassFrame:ClearAnchors()
					ZO_CompassFrame:SetAnchor( TOP, GuiRoot, TOP, 0, bazgrimToolbar:GetTop() + 60)
					ZO_TargetUnitFramereticleover:ClearAnchors()
					ZO_TargetUnitFramereticleover:SetAnchor( TOP, GuiRoot, TOP, 0, bazgrimToolbar:GetTop() + 108)
				end
			elseif bazgrimToolbar:GetTop() <= 100 then
					ZO_TargetUnitFramereticleover:ClearAnchors()
					ZO_TargetUnitFramereticleover:SetAnchor( TOP, GuiRoot, TOP, 0, bazgrimToolbar:GetTop() + 40)
			else
				if ZO_CompassFrame:GetTop() ~= 40 then
					ZO_CompassFrame:ClearAnchors()
					ZO_CompassFrame:SetAnchor( TOP, GuiRoot, TOP, 0, 40 )
					ZO_TargetUnitFramereticleover:ClearAnchors()
					ZO_TargetUnitFramereticleover:SetAnchor( TOP, GuiRoot, TOP, 0, 88 )
				end
			end
		elseif resetpositionofcompass then
			if ZO_CompassFrame:GetTop() ~= 40 then
				resetpositionofcompass = false
				ZO_CompassFrame:ClearAnchors()
				ZO_CompassFrame:SetAnchor( TOP, GuiRoot, TOP, 0, 40 )
				ZO_TargetUnitFramereticleover:ClearAnchors()
				ZO_TargetUnitFramereticleover:SetAnchor( TOP, GuiRoot, TOP, 0, 88 )
			end
		end
	end
end

local updateAll = function()
	local w = 0
	if WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["Settings"].LetOutsideGui ) ~= true and not bazgrimToolbar.IsMoving then
		local leftEdge, rightEdge, bottomEdge = GuiRoot:GetLeft(), GuiRoot:GetRight(), GuiRoot:GetBottom()
		local x, y = bazgrimToolbar:GetCenter()
		local gCenterX, gCenterY = GuiRoot:GetCenter()
		if gCenterX ~= nil and gCenterY ~= nil then
			if bazgrimToolbar:GetTop() < 0 then
				local anchorPoint, adj = WF_BazgrimToolbar.GetAnchorPoint(), 0
				if anchorPoint == TOPLEFT then
					adj = bazgrimToolbar:GetLeft()
					bazgrimToolbar:ClearAnchors()
					bazgrimToolbar:SetAnchor( TOP, GuiRoot, TOP, x-gCenterX, 0 )
					bazgrimToolbar:SetFrameCoords()
				elseif anchorPoint == TOPRIGHT then
					adj = bazgrimToolbar:GetRight()
					bazgrimToolbar:ClearAnchors()
					bazgrimToolbar:SetAnchor( TOP, GuiRoot, TOP, x-gCenterX, 0 )
					bazgrimToolbar:SetFrameCoords()
				else
					bazgrimToolbar:ClearAnchors()
					bazgrimToolbar:SetAnchor( TOP, GuiRoot, TOP, 0, 0 )
					bazgrimToolbar:SetFrameCoords()
				end
				BumpCompass(true)
			elseif y > bottomEdge then
				local anchorPoint, adj = WF_BazgrimToolbar.GetAnchorPoint(), 0
				if anchorPoint == TOPLEFT then
					adj = bazgrimToolbar:GetLeft()
					bazgrimToolbar:ClearAnchors()
					bazgrimToolbar:SetAnchor( BOTTOM, GuiRoot, BOTTOM, x-gCenterX, 0 )
					bazgrimToolbar:SetFrameCoords()
				elseif anchorPoint == TOPRIGHT then
					adj = bazgrimToolbar:GetRight()
					bazgrimToolbar:ClearAnchors()
					bazgrimToolbar:SetAnchor( BOTTOM, GuiRoot, BOTTOM, x-gCenterX, 0 )
					bazgrimToolbar:SetFrameCoords()
				else
					bazgrimToolbar:ClearAnchors()
					bazgrimToolbar:SetAnchor( BOTTOM, GuiRoot, BOTTOM, 0, 0 )
					bazgrimToolbar:SetFrameCoords()
				end
				BumpCompass(true)
			elseif x < leftEdge then
				bazgrimToolbar:ClearAnchors()
				bazgrimToolbar:SetAnchor( LEFT, GuiRoot, LEFT, 0, y-gCenterY )
				bazgrimToolbar:SetFrameCoords()
				BumpCompass(true)
			elseif bazgrimToolbar:GetLeft() < leftEdge then
				local anchorPoint, adj = WF_BazgrimToolbar.GetAnchorPoint(), 0
				if anchorPoint == TOPLEFT then
					adj = bazgrimToolbar:GetLeft()
					bazgrimToolbar:ClearAnchors()
					bazgrimToolbar:SetAnchor( LEFT, GuiRoot, LEFT, 0, y-gCenterY )
					bazgrimToolbar:SetFrameCoords()
					BumpCompass(true)
				end
			elseif x > rightEdge then
				bazgrimToolbar:ClearAnchors()
				bazgrimToolbar:SetAnchor( RIGHT, GuiRoot, RIGHT, 0, y-gCenterY )
				bazgrimToolbar:SetFrameCoords()
				BumpCompass(true)
			elseif bazgrimToolbar:GetRight() > rightEdge then
				local anchorPoint, adj = WF_BazgrimToolbar.GetAnchorPoint(), 0
				if anchorPoint == TOPRIGHT then
					adj = bazgrimToolbar:GetRight()
					bazgrimToolbar:ClearAnchors()
					bazgrimToolbar:SetAnchor( RIGHT, GuiRoot, RIGHT, 0, y-gCenterY )
					bazgrimToolbar:SetFrameCoords()
				end
				BumpCompass(true)
			end
		end
	end
	BumpCompass()
	for k,t in ipairs(WF_TOOLBAR_TOOLS) do
		local scale = ( WF_GetOrDefault( 100, WF_SavedVars.BazgrimToolbar["Settings"].Scale) / 100 )
		if bazgrimToolbar.Tools[t.Tool].Spacer ~= nil then
			bazgrimToolbar.Tools[t.Tool].Spacer:SetDimensions( 12 * scale, 12 * scale )
		end
		if bazgrimToolbar.Tools[t.Tool].Control ~= nil then
			if t.Tool == WF_TOOLBAR_TOOL_XPBar then
				bazgrimToolbar.Tools[t.Tool].Control:SetScale( scale )
			elseif t.Tool == WF_TOOLBAR_TOOL_SpecialWorldXPBar then
				bazgrimToolbar.Tools[t.Tool].Control:SetScale( scale )
			else
				if bazgrimToolbar.Tools[t.Tool].Control.Icon ~= nil then
					bazgrimToolbar.Tools[t.Tool].Control.Icon:SetScale( scale )
				end
				bazgrimToolbar.Tools[t.Tool].Control:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 15 * scale, "soft-shadow-thick"))
			end
		end
	end
	for k,t in ipairs(WF_TOOLBAR_TOOLS) do
		if t.Tool == WF_TOOLBAR_TOOL_XPBar then
			local newPct = 120 * ( t.Method() or .6 )
			if bazgrimToolbar.Tools[t.Tool].Spacer ~= nil then
				if WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= false and WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= "Off"
				then w = w + bazgrimToolbar.Tools[t.Tool].Spacer:GetWidth() + 4 end
			end
			if bazgrimToolbar.Tools[t.Tool].Control ~= nil then
				bazgrimToolbar.Tools[t.Tool].Control:SetPct( newPct )
				if WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= false and WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= "Off"
				then w = w + bazgrimToolbar.Tools[t.Tool].Control:GetWidth() + 4 end
			end
		elseif t.Tool == WF_TOOLBAR_TOOL_SpecialWorldXPBar then
			local newPct = 120 * ( t.Method() or .6 )
			if bazgrimToolbar.Tools[t.Tool].Spacer ~= nil then
				if WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= false and WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= "Off"
				then w = w + bazgrimToolbar.Tools[t.Tool].Spacer:GetWidth() + 4 end
			end
			if bazgrimToolbar.Tools[t.Tool].Control ~= nil then
				bazgrimToolbar.Tools[t.Tool].Control:SetPct( newPct )
				if WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= false and WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= "Off"
				then w = w + bazgrimToolbar.Tools[t.Tool].Control:GetWidth() + 4 end
			end
		else
			local txt, c = t.Method()
			if bazgrimToolbar.Tools[t.Tool].Spacer ~= nil then
				if WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= false and WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= "Off"
				then w = w + bazgrimToolbar.Tools[t.Tool].Spacer:GetWidth() + 4 end
			end
			if bazgrimToolbar.Tools[t.Tool].Control ~= nil then
				bazgrimToolbar.Tools[t.Tool].Control:SetText(txt)
				bazgrimToolbar.Tools[t.Tool].Control:SetColor(c[1],c[2],c[3],c[4])
				if WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= false and WF_SavedVars.BazgrimToolbar["Tools"][t.Tool] ~= "Off"
				then w = w + bazgrimToolbar.Tools[t.Tool].Control:GetWidth() + 4 end
				if bazgrimToolbar.Tools[t.Tool].Control.UseIcon then
					w = w + 4 + ( bazgrimToolbar.Tools[t.Tool].Control.BufferSize * ( WF_GetOrDefault( 100, WF_SavedVars.BazgrimToolbar["Settings"].Scale) / 100 ) )
				end
			end
		end
	end
	bazgrimToolbar:SetWidth(w)
end

WF_BazgrimToolbar.Create = function()
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_TIME, 	Method = WF_BazgrimToolbar.GetTime })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_FPS, 	Method = WF_BazgrimToolbar.GetFramesPerSecond })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_ZONE, 	Method = WF_BazgrimToolbar.GetZone })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_NAME, 	Method = WF_BazgrimToolbar.GetUnit_Name })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_RACE, 	Method = WF_BazgrimToolbar.GetUnit_Race })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_CLASS, 	Method = WF_BazgrimToolbar.GetUnit_Class })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_LEVEL, 	Method = WF_BazgrimToolbar.GetUnit_Level })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_XPBar, 	Method = WF_BazgrimToolbar.GetXPBar })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_XP, 	Method = WF_BazgrimToolbar.GetXP })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_SpecialWorldXPBar, 	Method = WF_BazgrimToolbar.GetSpecialWorldXPBar })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_HORSE, 	Method = WF_BazgrimToolbar.GetHorse })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_BAGS, 	Method = WF_BazgrimToolbar.GetBagDetails })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_GEMS, 	Method = WF_BazgrimToolbar.GetSoulGems })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_GOLD, 	Method = WF_BazgrimToolbar.GetMoney })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_AP, 	Method = WF_BazgrimToolbar.GetAP })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_SMITH, 	Method = WF_BazgrimToolbar.GetSmith })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_WOOD, 	Method = WF_BazgrimToolbar.GetWood })
	table.insert(WF_TOOLBAR_TOOLS, { Tool = WF_TOOLBAR_TOOL_CLOTH, 	Method = WF_BazgrimToolbar.GetCloth })
	
	local key = "bazgrimToolbar"
	local o = _G[key]
	
	if o == nil then o = WF_FRAMES.__NewTopLevel(key)
		:SetAnchor(WF_BazgrimToolbar.GetAnchorPoint(), GuiRoot, WF_BazgrimToolbar.GetAnchorPoint(), WF_SavedVars.BazgrimToolbar["Settings"].ShiftX, WF_SavedVars.BazgrimToolbar["Settings"].ShiftY)
		:SetDimensions(1000,20)
		:SetMovable(WF_SavedVars.BazgrimToolbar["Settings"].Moveable)
		:SetMouseEnabled(WF_SavedVars.BazgrimToolbar["Settings"].Moveable)
		:SetHidden( not WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["Settings"].Enabled ) )	
	.__END
	end
	o.bg = WF_FRAMES.__NewBackdrop(key.."BG", o)
		:SetAnchor(TOPLEFT, o, TOPLEFT, -2, -2)
		:SetAnchor(BOTTOMRIGHT, o, BOTTOMRIGHT, 2, 2)
		:SetCenterColor(0.1,0.1,0.1,.5)
		:SetEdgeColor(0,0,0,1)
		:SetEdgeTexture("", 8, 1, 1)
		:SetHidden(not WF_SavedVars.BazgrimToolbar["Settings"].Background)
	.__END
	o.ScrollingWindow = WF_FRAMES.__NewTopLevel(key.."scrollWindow")
		:SetDimensions(320,260)
		:SetHidden(false)
		:SetAnchor(CENTER,GuiRoot,CENTER,0,0)
	.__END
	o.ScrollingText = WF_FRAMES.__NewLabel(key.."scrollText", o.ScrollingWindow)
		:SetFont("ZoFontGame")
		:SetColor(1,1,1,1)
		:SetText("")
		:SetAnchor(BOTTOMLEFT,tlsc,BOTTOMLEFT,-200,0)
		:SetHidden(false)
	.__END
	o.SetFrameCoords = function(self)
		local setting = WF_BazgrimToolbar.GetAnchorPoint()
		local lockCenter = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Settings"].LockHCenter)
		local x, y = 0, 0
		if setting == CENTER then
			local addOnX, addOnY = self:GetCenter()
			local guiRootX, guiRootY = GuiRoot:GetCenter()
			x = addOnX - guiRootX
			y = addOnY - guiRootY
			if lockCenter then x = 0 end
		else
			y = self:GetTop()
			if setting == TOPLEFT then x = self:GetLeft()
			else x = self:GetRight() - GuiRoot:GetRight() end
		end
		WF_SavedVars.BazgrimToolbar["Settings"].ShiftX = x
		WF_SavedVars.BazgrimToolbar["Settings"].ShiftY = y
		self:ClearAnchors()
		self:SetAnchor(WF_BazgrimToolbar.GetAnchorPoint(), GuiRoot, WF_BazgrimToolbar.GetAnchorPoint(), x, y)
	end
	o:SetFrameCoords()
	o.IsMoving = false
	o:SetHandler("OnMoveStart", function(self) self.IsMoving = true end)
	o:SetHandler("OnMoveStop", function(self) self:SetFrameCoords(); self.IsMoving = false; end)
	o.Tools = {
		[WF_TOOLBAR_TOOL_BAGS] = { Name = "Bags", Control = nil },
		[WF_TOOLBAR_TOOL_FPS] = { Name = "FPS", Control = nil },
		[WF_TOOLBAR_TOOL_TIME] = { Name = "Time", Control = nil },
		[WF_TOOLBAR_TOOL_ZONE] = { Name = "Zone", Control = nil },
		[WF_TOOLBAR_TOOL_GOLD] = { Name = "Money", Control = nil },
		[WF_TOOLBAR_TOOL_AP] = { Name = "AP", Control = nil },
		[WF_TOOLBAR_TOOL_XP] = { Name = "XP", Control = nil },
		[WF_TOOLBAR_TOOL_XPBar] = { Name = "XPBar", Control = nil },
		[WF_TOOLBAR_TOOL_SpecialWorldXPBar] = { Name = "SpecialWorldXPBar", Control = nil },
		[WF_TOOLBAR_TOOL_NAME] = { Name = "Name", Control = nil },
		[WF_TOOLBAR_TOOL_RACE] = { Name = "Race", Control = nil },
		[WF_TOOLBAR_TOOL_CLASS] = { Name = "Class", Control = nil },
		[WF_TOOLBAR_TOOL_LEVEL] = { Name = "Level", Control = nil },
		[WF_TOOLBAR_TOOL_GEMS] = { Name = "Gems", Control = nil },
		[WF_TOOLBAR_TOOL_HORSE] = { Name = "Horse", Control = nil },
		[WF_TOOLBAR_TOOL_SMITH] = { Name = "Smith", Control = nil },
		[WF_TOOLBAR_TOOL_WOOD] = { Name = "Wood", Control = nil },
		[WF_TOOLBAR_TOOL_CLOTH] = { Name = "Cloth", Control = nil }, 
	}
	o.UpdateAll = function() updateAll() end
	BumpCompass(true)
	WF_BazgrimToolbar.MakeToolbar(o)
end

WF_BazgrimToolbar.ScaledBar = function( parent, name, bg, fg, lowFg, midFg, edge, width, pct, lowPct, midPct )
	local key = parent:GetName()..name
	local o = _G[key]
	if o == nil then o = WF_FRAMES.__NewTopLevel(key)
			:SetParent( parent )
			:SetDimensions(width,9)
			:SetHidden(false)
			:SetAnchor(CENTER,GuiRoot,CENTER,0,0)
		.__END
		o.bg = WF_FRAMES.__NewBackdrop(key.."BG", o)
			:SetAnchor(TOPLEFT, o, TOPLEFT, -1, -1)
			:SetAnchor(BOTTOMRIGHT, o, BOTTOMRIGHT, 1, 1)
			:SetCenterColor(bg[1], bg[2], bg[3], bg[4], bg[5])
			:SetEdgeColor(edge[1], edge[2], edge[3], edge[4], edge[5])
			:SetEdgeTexture("", 8, 1, 1)
			:SetHidden(false)
		.__END
		o.inner = WF_FRAMES.__NewBackdrop(key.."exp", o)
			:SetAnchor(LEFT, o, LEFT, 0, 0)
			:SetCenterColor(fg[1], fg[2], fg[3], fg[4], fg[5])
			:SetEdgeColor(0,0,0,0)
			:SetEdgeTexture("", 8, 1, 1)
			:SetHidden(false)
			:SetDimensions(pct,9)
		.__END
		o.fg = fg
		o.lowFg = lowFg
		o.midFg = midFg
		o.lowPct = lowPct
		o.midPct = midPct
		o.SetPct = function( self, newPct )
			self.inner:SetDimensions(newPct,9)
			if newPct <= self.midPct and newPct > self.lowPct then self.inner:SetCenterColor(self.midFg[1], self.midFg[2], self.midFg[3], self.midFg[4], self.midFg[5]) 
			elseif newPct <= self.lowPct then self.inner:SetCenterColor(self.lowFg[1], self.lowFg[2], self.lowFg[3], self.lowFg[4], self.lowFg[5]) 
			else self.inner:SetCenterColor(self.fg[1], self.fg[2], self.fg[3], self.fg[4], self.fg[5]) end
		end
	end
	return o
end