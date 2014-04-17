WF_BazgrimSubtitles = {}
WF_BazgrimSubtitles.gameTimeStamp = 0

WF_BazgrimSubtitles.Draw = function()
	WF_BazgrimSubtitles.Create()
	if WF_SavedVars.BazgrimSubtitle["Settings"].Enabled then
		EVENT_MANAGER:RegisterForEvent( "bazgrimSubtitles", EVENT_CHAT_MESSAGE_CHANNEL, WF_BazgrimSubtitles.Subtitle )
	else
		EVENT_MANAGER:UnregisterForEvent( "bazgrimSubtitles", EVENT_CHAT_MESSAGE_CHANNEL )
	end
end

WF_BazgrimSubtitles.Create = function()
	local key = "bazgrimSubtitles"
	
	if not _G[key] then 
		local o = WF_FRAMES.__NewTopLevel(key)
			:SetDimensions(1000, ((18 * (WF_GetOrDefault( 100, WF_SavedVars.BazgrimSubtitle["Settings"].Scale) / 100)) + 2) * 3 )
			:SetAnchor( CENTER, GuiRoot, CENTER, WF_GetOrDefault(0, WF_SavedVars.BazgrimSubtitle["Settings"].ShiftX), WF_GetOrDefault(400, WF_SavedVars.BazgrimSubtitle["Settings"].ShiftY) )
			:SetHidden( not WF_SavedVars.BazgrimSubtitle["Settings"].Enabled )
			:SetMovable( WF_SavedVars.BazgrimSubtitle["Settings"].Moveable )
			:SetMouseEnabled( WF_SavedVars.BazgrimSubtitle["Settings"].Moveable )
		.__END
		bazgrimSubtitles.SetFrameCoords = function(self)
			local addOnX, addOnY = self:GetCenter()
			local guiRootX, guiRootY = GuiRoot:GetCenter()
			local x = addOnX - guiRootX
			local y = addOnY - guiRootY
			if WF_GetOrDefault( true, WF_SavedVars.BazgrimSubtitle["Settings"].LockHCenter ) then x = 0 end
			WF_SavedVars.BazgrimSubtitle["Settings"].ShiftX = x
			WF_SavedVars.BazgrimSubtitle["Settings"].ShiftY = y
			if WF_GetOrDefault( true, WF_SavedVars.BazgrimSubtitle["Settings"].LockHCenter ) then
				self:ClearAnchors()
				self:SetAnchor(CENTER, GuiRoot, CENTER, 0, WF_SavedVars.BazgrimSubtitle["Settings"].ShiftY)
			end
		end
		bazgrimSubtitles.Label = WF_FRAMES.__NewLabel(key.."Label", o)
			:SetDimensions(1000, ((18 * (WF_GetOrDefault( 100, WF_SavedVars.BazgrimSubtitle["Settings"].Scale) / 100)) + 2) * 3 )
			:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 18 * (WF_GetOrDefault( 100, WF_SavedVars.BazgrimSubtitle["Settings"].Scale) / 100), "soft-shadow-thick"))
			:SetColor( .75, .85, 1, 1 )
			:SetText( "Hello, this is Bazgrims Subtitles Text Wrap. I'll just keep typing until the text finally wraps for this demonstration. How's your day going? Oh look! It wrapped!" )
			:SetAnchor( CENTER, bazgrimSubtitles, CENTER, 0, 0 )
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"][string.lower( WF_GetOrDefault("CENTER", WF_SavedVars.BazgrimSubtitle["Settings"].Align) )])
			:SetWrapMode( 1000 )
		.__END
		bazgrimSubtitles.bg = WF_FRAMES.__NewBackdrop(key.."BG", o.Label)
			:SetAnchor(TOPLEFT, bazgrimSubtitles.Label, TOPLEFT, -2, -2)
			:SetAnchor(BOTTOMRIGHT, bazgrimSubtitles.Label, BOTTOMRIGHT, 2, 2)
			:SetCenterColor(0.1,0.1,0.1,.33)
			:SetEdgeColor(0,0,0,1)
			:SetEdgeTexture("", 8, 1, 1)
			:SetHidden( not WF_SavedVars.BazgrimSubtitle["Settings"].Moveable )
		.__END
	end
	bazgrimSubtitles:SetFrameCoords()
	bazgrimSubtitles:SetHandler("OnMoveStop", function(self) bazgrimSubtitles:SetFrameCoords() end)
	bazgrimSubtitles:SetHidden( not WF_SavedVars.BazgrimSubtitle["Settings"].Enabled )
end
	
WF_BazgrimSubtitles.Subtitle = function(eventCode, channel, name, Text)
	if not WF_SavedVars.BazgrimSubtitle["Settings"].Enabled then return end
	local namefinal, crap = SplitString("^",name)
	if (channel == CHAT_CHANNEL_MONSTER_EMOTE
	or channel == CHAT_CHANNEL_MONSTER_SAY
	or channel == CHAT_CHANNEL_MONSTER_WHISPER
	or channel == CHAT_CHANNEL_MONSTER_YELL) and type(namefinal) == "string" and type(Text) == "string" then
		bazgrimSubtitles.Label:SetText( namefinal..": "..Text )
		bazgrimSubtitles.Label:SetAlpha(1)
		WF_BazgrimSubtitles.gameTimeStamp = GetGameTimeMilliseconds()
	end
	--d(channel.." "..name)
end

WF_BazgrimSubtitles.SubtitleSpecial = function(Text)
	if _G["bazgrimSubtitles"] == nil then return end
	if not WF_SavedVars.BazgrimSubtitle["Settings"].Enabled then return end
	bazgrimSubtitles.Label:SetText( Text )
	bazgrimSubtitles.Label:SetAlpha(1)
	WF_BazgrimSubtitles.gameTimeStamp = GetGameTimeMilliseconds()
end

WF_BazgrimSubtitles.Update = function()
	if WF_SavedVars == nil then return end
	if WF_SavedVars.BazgrimSubtitle == nil then return end
	if not WF_SavedVars.BazgrimSubtitle["Settings"].Enabled then return end
	local duration = WF_GetOrDefault(8, WF_SavedVars.BazgrimSubtitle["Settings"].Fade) * 1000
	local key = "bazgrimSubtitles"
	local o = _G[key]
	if o == nil then return end
	local gameTime = GetGameTimeMilliseconds()
	local span = gameTime - WF_BazgrimSubtitles.gameTimeStamp
	if span < duration then bazgrimSubtitles.Label:SetAlpha( (1 - ( span / duration ) ) ) end
	if ( span >= duration ) then
		bazgrimSubtitles.Label:SetText()
		bazgrimSubtitles.Label:SetAlpha(1)
	end
end