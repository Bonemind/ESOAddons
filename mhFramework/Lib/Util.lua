local unk = "unk"
local unitTag = "PLAYER"

table_count = function( T ) if T == nil then return 0; end; local c = 0;for _ in pairs(T) do c = c + 1 end; return c; end
table_next = function( T ) if T == nil then return 0; end; return table_count( T )+1; end
table_findRemove = function( input, item )
	local i=1
	while i <= #input do
		if input[i] == item then table.remove(input, i)
		else i = i + 1 end
	end
end

function comma_value(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

string_trim = function( s ) return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'; end
string_split = function( str, delim, max )
    if max == nil then max = -1 end
    if delim == nil then delim = " " end
    local last, start, stop = 1
    local result = {}
    while max ~= 0 do
        start, stop = str:find(delim, last )
        if start == nil then break; end
        table.insert( result, str:sub( last, start-1 ) )
        last = stop+2
        max = max - 1
    end
    table.insert( result, str:sub( last ) )
    return result
end

WF_ROUND = function(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

WF_MillisecondsToHuman = function(milliseconds, includeMs)
	if milliseconds == nil and not includeMs then return "00:00:00" end
	if milliseconds == nil then return "00:00:00:00" end
	local totalseconds = math.floor(milliseconds / 1000)
	milliseconds = milliseconds % 1000
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	local hours = math.floor(minutes / 60)
	minutes = minutes % 60
	if includeMs then return string.format("%02d:%02d:%02d:%03d", hours, minutes, seconds, milliseconds) end
	return string.format("%02d:%02d:%02d", hours, minutes, seconds)
end

WF_ColorScale_RedGreenPowerMeter = function(val, maxVal, reverseMe)
	if val == nil or maxVal == nil then return 1, 1, 1; end
	local pct = WF_ROUND( val / maxVal, 2 )
	local ss, ee, bb = 255, 255, 0
	if pct == .50 then 
		return 1, 1, 1
	elseif pct >= .51 then 
		ee = 255
		ss = ss * (1 - ((pct - .50)*2))
		bb = ss
	elseif pct < .50 then 
		ss = 255 
		ee = ee * (pct*2)
		bb = ee
	end
	ss = ss / 255
	ee = ee / 255
	bb = bb / 255
	if reverseMe then return ss, ee, bb;
	else return ee, ss, bb; end
end

p = function( Text ) d( Text ); end

wykkydsFramework.Print = function( Text ) d( Text ); end

wykkydsFramework.CountOf = function(T) return table_count( T ); end
wykkydsFramework.NextOf = function(T) return table_next( T ); end

wykkydsFramework.GetDateTimeString = function()
	local ts = GetTimeStamp() 
	if not ts then return nil end
	local d = GetDateStringFromTimestamp(ts) or ""
	local t = GetTimeString() or ""
	return d.." "..t
end

WF_UTIL.NamesUsed = {}
WF_UTIL.UniqueName = function(NAME, addon)
	if not NAME then NAME = "mhFrameworkCtrl" end
	if addon ~= nil then NAME = wykkydsFramework.Addons[addon].AddonAbbrev.."_"..NAME end
	if WF_UTIL.NamesUsed[NAME] == nil and _G[NAME] == nil then
		WF_UTIL.NamesUsed[NAME] = NAME
		return NAME
	end
	for c = 1, 6000, 1 do
		if WF_UTIL.NamesUsed[NAME.."_"..c] == nil and _G[NAME.."_"..c] == nil then
			WF_UTIL.NamesUsed[NAME.."_"..c] = NAME.."_"..c
			return NAME.."_"..c
		end
	end
end
WF_UTIL.FindFrame = function(frameName) return _G[frameName] end

wykkydsFramework.DumpWindowsToChat = function(win,num)
	if not win and not num then
		wykkydsFramework.DumpWindowsToChat(GuiRoot)
		return
	end
	if not win then return end
	local nn = num or 0
	local xx = nn + 1
	wykkydsFramework.DumpWindowName(win,nn)
	local x = win:GetNumChildren()
	if x > 0 then	
		for ii = 1, x do
			wykkydsFramework.DumpWindowsToChat(win:GetChild(ii),xx)
		end
	end
end

wykkydsFramework.DumpWindowName = function(win,num)
	if win then wykkydsFramework.Print(wykkydsFramework.Indentation(num)..win:GetName()); end
end

wykkydsFramework.Indentation = function(num)
	local r = ""
	for xx = 0,num do
		r = r.."."
	end
	return r.." "
end

wykkydsFramework.DumpCommandsToChat = function() table.foreach(_G,d); end

local showMap = function() ZO_WorldMap:SetHidden(false); end
local hideMap = function() ZO_WorldMap:SetHidden(true); end

local getMapElement = function(tbl, key1, key2)
	if not tbl then tbl = {} end
	if not tbl[key1] then tbl[key1] = {} end
	local val = unk
	tbl[key1][key2] = val
	return tbl
end

local nilMapElement = function(tbl, key1, key2)
	if not tbl then tbl = {} end
	if not tbl[key1] then tbl[key1] = {} end
	tbl[key1][key2] = nil
	return tbl
end

wykkydsFramework.GetMapDetails = function(tbl)
	if not tbl then tbl = {} end
	local mapKey = "mapdetails"
	tbl[mapKey] = {}
	if not pcall(getMapElement(tbl, mapKey, "mapindex")) then nilMapElement(tbl, mapKey, "mapindex") end
	if not pcall(getMapElement(tbl, mapKey, "mapname")) then nilMapElement(tbl, mapKey, "mapindex") end
	if not pcall(getMapElement(tbl, mapKey, "maptype")) then nilMapElement(tbl, mapKey, "mapindex") end
	if not pcall(getMapElement(tbl, mapKey, "maplocation")) then nilMapElement(tbl, mapKey, "mapindex") end
	if not pcall(getMapElement(tbl, mapKey, "mapplayerposition")) then nilMapElement(tbl, mapKey, "mapindex") end
	return tbl
end

wykkydsFramework.GetQuestDetails = function(idx, tbl)
	if not tbl then tbl = {} end 
	if not idx then return tbl; end
	local key = "QuestDetails"
	tbl[key] = {}
	tbl[key]["JournalQuestName"] = GetJournalQuestName(idx)
	tbl[key]["JournalQuestType"] = GetJournalQuestType(idx)
	tbl[key]["JournalQuestLevel"] = GetJournalQuestLevel(idx)
	tbl[key]["JournalQuestRepeatType"] = GetJournalQuestRepeatType(idx)
	tbl[key]["JournalQuestInfo"] = GetJournalQuestInfo(idx)
	tbl[key]["JournalQuestIsComplete"] = GetJournalQuestIsComplete(idx)
	tbl[key]["JournalQuestIsPushed"] = GetJournalQuestIsPushed(idx)
	tbl[key]["IsQuestSharable"] = GetIsQuestSharable(idx)
	tbl[key]["JournalQuestNumSteps"] = GetJournalQuestNumSteps(idx)
	tbl[key]["JournalQuestTimerInfo"] = GetJournalQuestTimerInfo(idx)
	tbl[key]["JournalQuestTimerCaption"] = GetJournalQuestTimerCaption(idx)
	tbl[key]["QuestToolCount"] = GetQuestToolCount(idx)
	return tbl
end

local bt= {}
WF_UTIL.BufferPause = function(key, buffer) 
	if not key then return end
	local ct, buffer = GetFrameTimeMilliseconds(), buffer or 3
	if not bt[key] then bt[key] = ct end
	if (ct - bt[key]) >= buffer
	then bt[key] = ct; return true;
	else return false; end
end

WF_UTIL.GuildName = function(n) return GetGuildName(GetGuildId(n)) or "<no guild "..n..">" end

WF_UTIL.ChatFrameBackpanel = function(keystroke)
	local key, keybg = "wykkydsChatFrameBackPanel", "wykkydsChatFrameBackPanel_bg"
	local o = _G[key]
	if not o then
		if WF_SavedVars.ChatBGFrame["Shown"] or keystroke then
			local w, h = ZO_ChatWindow:GetWidth()-20, ZO_ChatWindow:GetHeight()-20
			o = WF_CHAIN(WINDOW_MANAGER:CreateTopLevelWindow(key))
			.__END
			o.bg = WF_CHAIN(WINDOW_MANAGER:CreateControl(keybg, o, CT_BACKDROP))
				:SetAnchor(TOPLEFT, ZO_ChatWindow, TOPLEFT, 20, 40)
				:SetAnchor(BOTTOMRIGHT, ZO_ChatWindow, BOTTOMRIGHT, -34, -40)
				:SetDimensions( w , h )
				:SetCenterColor(0.1,0.1,0.1,1)
				:SetEdgeColor(0,0,0,0)
				:SetEdgeTexture("", 8, 1, 0)
				:SetAlpha(.65)
				:SetHidden(false)
			.__END
			WF_SavedVars.ChatBGFrame["Shown"] = true;
			o:SetHidden(false);
			o.bg:SetHidden(false);
			return
		end
	else
		if keystroke then
			if _G[key] then
				if _G[key]:IsHidden() then 
					WF_SavedVars.ChatBGFrame["Shown"] = true; 
					_G[key]:SetHidden(false); 
					_G[keybg]:SetHidden(false); 
					return
				else 
					WF_SavedVars.ChatBGFrame["Shown"] = false; 
					_G[key]:SetHidden(true); 
					_G[keybg]:SetHidden(true);
					return
				end
			end
		end
	end
end

WF_GetOrDefault = function( defaultIfNil, value )
	if value == nil then return defaultIfNil else return value end
end

wykkydsFramework.ToggleMouse = function()
	SetGameCameraUIMode( not IsGameCameraUIModeActive() )
end

wykkydsFramework.RangeFrame = function( shouldHide, distance )
	local key = "WF_Reticle_RangeFinder"
	if _G[key] == nil then
		local shiftX = 18
		if ZO_ReticleContainer:GetScale() == 1 then shiftX = 46 end
		local oTop = WF_FRAMES.NewTopLevel(key.."_Container")
		local o = WF_FRAMES.__NewLabel(key, oTop)
			:SetAnchor(LEFT, GuiRoot, CENTER, shiftX, 0)
			:SetDimensions( 120 , 16 )
			:SetFont("ZoFontGame")
			:SetColor(224/255, 79/255, 56/255, 1)
			:SetAlpha(1)
			:SetHidden(false)
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["left"])
			:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
			:SetText( "TEST ME!" )
			:SetScale( .72 )
		.__END
		WF_Reticle_RangeFinder.LastReticleScale = ZO_ReticleContainer:GetScale()
	end
	if distance ~= nil then
		if shouldHide then
			WF_Reticle_RangeFinder:SetHidden( true )
			WF_Reticle_RangeFinder:SetText( "" )
		else
			if ZO_ReticleContainer:GetScale() ~= WF_Reticle_RangeFinder.LastReticleScale then
				WF_Reticle_RangeFinder.LastReticleScale = ZO_ReticleContainer:GetScale()
				if ZO_ReticleContainer:GetScale() == 1 then
					WF_Reticle_RangeFinder:SetAnchor(LEFT, GuiRoot, CENTER, 46, 0)
				else
					WF_Reticle_RangeFinder:SetAnchor(LEFT, GuiRoot, CENTER, 18, 0)
				end
			end
			WF_Reticle_RangeFinder:SetHidden( false )
			WF_Reticle_RangeFinder:SetText( distance )
		end
	else
		WF_Reticle_RangeFinder:SetHidden( true )
		WF_Reticle_RangeFinder:SetText( "" )
	end
end

wykkydsFramework.TargetRange = function()
	local ishidden = ZO_ReticleContainer:IsHidden()
	local inmousemode = IsGameCameraUIModeActive()
	local shouldHide, distance = true, nil
	if not ishidden and not inmousemode then
		local combattarget = (GetUnitNameHighlightedByReticle() ~= "" and IsGameCameraUnitHighlightedAttackable()) 
		if combattarget then
			shouldHide = false
			local mapWidth, mapHeight, mapDiff, contentType = GetMapNumTiles(), GetMapType(), GetMapContentType()
			local playerX, playerY, playerH = GetMapPlayerPosition("player")
			local targetX, targetY, targetH = GetMapPlayerPosition("reticleover")
			if mapDiff == 1 then mapDiff = 3 else mapDiff = 1 end
			if contentType == 2 then mapDiff = 7 end
			local dist = math.sqrt(math.pow(((playerX - targetX)/mapWidth)/mapDiff,2) + math.pow(((playerY - targetY)/mapHeight)/mapDiff,2))
			local pct = (dist*10000) / 32
			distance = WF_ROUND(20*pct, 0)
		end
	end
	wykkydsFramework.RangeFrame( shouldHide, distance )
end

