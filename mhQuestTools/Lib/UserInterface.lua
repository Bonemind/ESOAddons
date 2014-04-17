WF_QuestTools.UI = {}
local key = "WF_QuestTools_Tracker"
local frameWidth = 260

-- /script WF_QuestTools.UI.QuestTracker(false,true)

WF_QuestTools.UI._registeredEvents = false

WF_QuestTools.UI._registerForEvents = function()
	WF_QuestTools.UI._registeredEvents = true
	WF_Event( EVENT_QUEST_ADDED, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_ADVANCED, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_COMPLETE_DIALOG, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_COMPLETE_EXPERIENCE, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_CONDITION_COUNTER_CHANGED, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_LIST_UPDATED, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_LOG_IS_FULL, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_OFFERED, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_OPTIONAL_STEP_ADVANCED, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_POSITION_REQUEST_COMPLETE, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_REMOVED, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_SHOW_JOURNAL_ENTRY, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_TIMER_PAUSED, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
	WF_Event( EVENT_QUEST_TIMER_UPDATED, WF_QuestTools.UI.QuestEventCallback, "wf_questtools_tracker", true )
end

WF_QuestTools.UI._unregisterForEvents = function()
	WF_QuestTools.UI._registeredEvents = false
	WF_Event( EVENT_QUEST_ADDED, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_ADVANCED, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_COMPLETE_DIALOG, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_COMPLETE_EXPERIENCE, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_CONDITION_COUNTER_CHANGED, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_LIST_UPDATED, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_LOG_IS_FULL, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_OFFERED, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_OPTIONAL_STEP_ADVANCED, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_POSITION_REQUEST_COMPLETE, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_REMOVED, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_SHOW_JOURNAL_ENTRY, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_TIMER_PAUSED, nil, "wf_questtools_tracker" )
	WF_Event( EVENT_QUEST_TIMER_UPDATED, nil, "wf_questtools_tracker" )
end

WF_QuestTools.UI.QuestEventCallback = function(tblParams, keystroke, forceShow)
	if tblParams ~= nil and not WF_Buffer( "wf_questtools_tracker_tic", .05 ) then return end
	if WF_QuestTools.UI._registeredEvents then
		WF_QuestTools.UI._unregisterForEvents()
		WF_QuestTools.UI.QuestTracker(keystroke, forceShow)
	end
	if _G["WF_QuestTools_Tracker"] == nil then
		WF_QuestTools.UI.QuestTracker(keystroke, forceShow)
	end
end

WF_QuestTools.UI.QuestTracker = function(keystroke, forceShow)
	if _G[key] == nil then WF_QuestTools.UI.Create() end
	if _G[key] == nil then return end
	if keystroke == nil then keystroke = false end
	if forceShow then keystroke = false end
	if keystroke then
		if not WF_QuestTools.UISettings["Enabled"] then
			WF_QuestTools.UISettings["Enabled"] = true
			WF_QuestTools_Tracker:SetHidden(false)
		else
			WF_QuestTools.UISettings["Enabled"] = false
			WF_QuestTools_Tracker:SetHidden(true)
		end
	else
		if forceShow then
			WF_QuestTools.UISettings["Enabled"] = true
			WF_QuestTools_Tracker:SetHidden(false)
		else
			if not WF_QuestTools.UISettings["Enabled"] then WF_QuestTools_Tracker:SetHidden(true)
			else WF_QuestTools_Tracker:SetHidden(false) end
		end
	end
	if WF_QuestTools.UISettings["Enabled"] then
		WF_QuestTools_Tracker:SetHidden(false)
		WF_QuestTools_Tracker.Backdrop:SetHidden(false)
		WF_WindowsToLeaveOff["ZO_QuestTracker"] = "WF_QuestTools"
		WF_WindowsToLeaveOff["ZO_FocusedQuestTrackerPanel"] = "WF_QuestTools"
		WF_FRAMES.Events.UIModeRegisteredWindows[WF_QuestTools_Tracker:GetName()] = WF_QuestTools_Tracker:GetName()
		WF_Tic( "wfQuestToolsHideTracker", function() _G["ZO_QuestTracker"]:SetHidden(true); _G["ZO_FocusedQuestTrackerPanel"]:SetHidden(true); end )
		WF_QuestTools_Tracker:LoadZones()
		WF_QuestTools.ZoneFontChange()
		if not WF_QuestTools.UI._registeredEvents then WF_QuestTools.UI._registerForEvents() end
	else
		WF_QuestTools_Tracker:SetHidden(true)
		WF_QuestTools_Tracker.Backdrop:SetHidden(true)
		WF_WindowsToLeaveOff["ZO_QuestTracker"] = nil
		WF_Tic( "wfQuestToolsHideTracker" )
		if WF_QuestTools.UI._registeredEvents then WF_QuestTools.UI._unregisterForEvents() end
	end
end

local wfAbandonConfirm = nil

WF_QuestTools.UI.ConfirmAbandon = function( questName, questIndex )
	if wfAbandonConfirm == nil then
		wfAbandonConfirm = WF_FRAMES.__NewBackdrop("WF_QuestTools_AbandonConfirm", WF_QuestTools_Tracker)
			:SetAnchor(CENTER, GuiRoot, CENTER, 0, 0)
			:SetDimensions( 200 , 80 )
			:SetCenterColor(0,0,0,1)
			:SetEdgeColor(0,0,0,1)
			:SetEdgeTexture("", 1, 1, 1)
			:SetAlpha(1)
			:SetHidden(false)
		.__END
		wfAbandonConfirm.Descr = WF_FRAMES.__NewLabel("WF_QuestTools_AbandonConfirm_Descr", wfAbandonConfirm)
			:SetAnchor( TOP, wfAbandonConfirm, TOP, 0, 3 )
			:SetDimensions( 180, 48 )
			:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 14, "soft-shadow-thick"))
			:SetColor(1, 1, 1, 1)
			:SetAlpha(1)
			:SetHidden(false)
			:SetText("Do you really want to abandon: \n|cEEDEA0"..questName.."|r")
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
		.__END
		wfAbandonConfirm.questIndex = questIndex
		wfAbandonConfirm.Yes = WF_FRAMES.__NewLabel("WF_QuestTools_AbandonConfirm_Yes", wfAbandonConfirm)
			:SetAnchor( BOTTOMRIGHT, wfAbandonConfirm, BOTTOM, -8, -3 )
			:SetDimensions( 48, 24 )
			:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 16, "soft-shadow-thick"))
			:SetColor(1, .65, .55, 1)
			:SetAlpha(1)
			:SetHidden(false)
			:SetText("Yes")
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
			:SetMouseEnabled( true )
			:SetHandler( "OnMouseDown", function(self)
				WF_QuestTools.Abandon( WF_QuestTools_AbandonConfirm.questIndex )
				WF_QuestTools_AbandonConfirm:SetHidden(true)
			end )
		.__END
		wfAbandonConfirm.No = WF_FRAMES.__NewLabel("WF_QuestTools_AbandonConfirm_No", wfAbandonConfirm)
			:SetAnchor( BOTTOMLEFT, wfAbandonConfirm, BOTTOM, 8, -3 )
			:SetDimensions( 48, 24 )
			:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 16, "soft-shadow-thick"))
			:SetColor(.55, 1, .65, 1)
			:SetAlpha(1)
			:SetHidden(false)
			:SetText("No")
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
			:SetMouseEnabled( true )
			:SetHandler( "OnMouseDown", function(self)
				WF_QuestTools_AbandonConfirm:SetHidden(true)
			end )
		.__END
	else
		WF_QuestTools_AbandonConfirm.questIndex = questIndex
		WF_QuestTools_AbandonConfirm.Descr = "Do you really want to abandon: \n|cEEDEA0"..questName.."|r"
		WF_QuestTools_AbandonConfirm:SetHidden(false)
	end
end

local lastHeader = nil

local questHeader = function( headerIndex, headerText, count )
	local hkey = key.."_Header_"..headerIndex
	local anchor = {TOPLEFT, WF_QuestTools_Tracker.Backdrop, TOPLEFT, 4, 7}
	if lastHeader ~= nil then
		anchor = {TOPLEFT, lastHeader, BOTTOMLEFT, -6, 3}
	end
	if _G[hkey] == nil then
		local bb = WF_FRAMES.__NewLabel(hkey, WF_QuestTools_Tracker.Backdrop)
			:SetAnchor(anchor[1], anchor[2], anchor[3], anchor[4]+18, anchor[5])
			:SetDimensions( frameWidth-32, 24 )
			:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 22, "soft-shadow-thick"))
			:SetColor(.85, .85, .65, 1)
			:SetAlpha(1)
			:SetHidden(false)
			:SetText(headerText)
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["left"])
			:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
		.__END
		local cc = WF_FRAMES.__NewBackdrop(hkey.."_Container", bb)
			:SetAnchor(anchor[1], anchor[2], anchor[3], anchor[4], anchor[5]+(bb:GetHeight()+1))
			:SetCenterColor(1,0,0,0)
			:SetEdgeColor(0.2,0.2,0.7,0)
			:SetEdgeTexture("", 8, 1, 1)
			:SetAlpha(1)
			:SetHidden(false)
			:SetResizeToFitDescendents()
		.__END
		local dd = WF_FRAMES.__NewBackdrop(hkey.."_Wrapper", cc)
			:SetAnchor(TOPLEFT, cc, TOPLEFT, 0, 0)
			:SetDimensions( bb:GetWidth()-6 , 1 )
			:SetCenterColor(0,1,0,0)
			:SetEdgeColor(0.2,0.2,0.7,0)
			:SetEdgeTexture("", 8, 1, 1)
			:SetAlpha(1)
			:SetHidden(true)
		.__END
		if count == nil then count = 0 end
		local ee = WF_FRAMES.__NewLabel(hkey, bb)
			:SetAnchor( RIGHT, bb, RIGHT, 0, 0 )
			:SetDimensions( 48, 24 )
			:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 14, "soft-shadow-thick"))
			:SetColor(.35, .65, 1, 1)
			:SetAlpha(1)
			:SetHidden(false)
			:SetText(""..count.."")
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["right"])
			:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
		.__END

		bb.Icons = {}
		bb.Icons[ tostring(true) ] = {}
		bb.Icons[ tostring(true) ].Up = "/esoui/art/buttons/pointsplus_up.dds"
		bb.Icons[ tostring(true) ].Down = "/esoui/art/buttons/pointsplus_down.dds"
		bb.Icons[ tostring(true) ].Over = "/esoui/art/buttons/pointsplus_over.dds"
		bb.Icons[ tostring(false) ] = {}
		bb.Icons[ tostring(false) ].Up = "/esoui/art/buttons/pointsminus_up.dds"
		bb.Icons[ tostring(false) ].Down = "/esoui/art/buttons/pointsminus_down.dds"
		bb.Icons[ tostring(false) ].Over = "/esoui/art/buttons/pointsminus_over.dds"

		local aa = WF_FRAMES.__NewImage(hkey.."_Icon", bb)
			:SetDimensions(16, 16)
			:SetTexture( bb.Icons[ tostring(dd:IsHidden()) ].Up )
			:SetAnchor( RIGHT, bb, LEFT, -4, -1 )
			:SetMouseEnabled( true )
			:SetHandler( "OnMouseDown", function(self)
				self:SetTexture( bb.Icons[ tostring(_G[hkey.."_Wrapper"]:IsHidden()) ].Down )
			end )
			:SetHandler( "OnMouseEnter", function(self)
				WF_QuestTools_Tracker:MouseIn()
				self:SetTexture( bb.Icons[ tostring(_G[hkey.."_Wrapper"]:IsHidden()) ].Over )
			end )
			:SetHandler( "OnMouseExit", function(self)
				WF_QuestTools_Tracker:MouseOut()
				self:SetTexture( bb.Icons[ tostring(_G[hkey.."_Wrapper"]:IsHidden()) ].Up )
			end )
			:SetHandler( "OnMouseUp", function(self)
				_G[hkey.."_Wrapper"]:SetHidden( not _G[hkey.."_Wrapper"]:IsHidden() )
				if _G[hkey.."_Wrapper"]:IsHidden() then 
					_G[hkey.."_Container"]:SetHeight( 0 )
					WF_QuestTools.UISettings.CollapseState[hkey] = false
				else 
					_G[hkey.."_Container"]:SetHeight( _G[hkey.."_Wrapper"]:GetHeight() ) 
					WF_QuestTools.UISettings.CollapseState[hkey] = true
				end
				self:SetTexture( bb.Icons[ tostring(_G[hkey.."_Wrapper"]:IsHidden()) ].Over )
				--d(WF_QuestTools.UISettings.CollapseState)
			end )
		.__END

		bb:SetMouseEnabled( true )
		bb:SetHandler( "OnMouseDown", function(self)
			_G[hkey.."_Icon"]:SetTexture( self.Icons[ tostring(_G[hkey.."_Wrapper"]:IsHidden()) ].Down )
		end )
		bb:SetHandler( "OnMouseEnter", function(self)
			WF_QuestTools_Tracker:MouseIn()
			_G[hkey.."_Icon"]:SetTexture( self.Icons[ tostring(_G[hkey.."_Wrapper"]:IsHidden()) ].Over )
		end )
		bb:SetHandler( "OnMouseExit", function(self)
			WF_QuestTools_Tracker:MouseOut()
			_G[hkey.."_Icon"]:SetTexture( self.Icons[ tostring(_G[hkey.."_Wrapper"]:IsHidden()) ].Up )
		end )
		bb:SetHandler( "OnMouseUp", function(self)
			_G[hkey.."_Wrapper"]:SetHidden( not _G[hkey.."_Wrapper"]:IsHidden() )
			if _G[hkey.."_Wrapper"]:IsHidden() then 
				_G[hkey.."_Container"]:SetHeight( 0 )
				WF_QuestTools.UISettings.CollapseState[hkey] = false
			else 
				_G[hkey.."_Container"]:SetHeight( _G[hkey.."_Wrapper"]:GetHeight() ) 
				WF_QuestTools.UISettings.CollapseState[hkey] = true
			end
			_G[hkey.."_Icon"]:SetTexture( self.Icons[ tostring(_G[hkey.."_Wrapper"]:IsHidden()) ].Over )
			--d(WF_QuestTools.UISettings.CollapseState)
		end )
		lastHeader = cc
	end
	local obj = _G[hkey]
	if obj ~= nil then
		_G[hkey.."_Container"]:SetHeight( 0 )
		_G[hkey.."_Wrapper"]:SetHeight( 0 )
		if ((headerText == "Guild" or headerText == "Main Story") and WF_QuestTools.UISettings.CollapseState[hkey] == nil) or WF_QuestTools.UISettings.CollapseState[hkey] then
			_G[hkey.."_Wrapper"]:SetHidden( false )
			_G[hkey.."_Icon"]:SetTexture( obj.Icons[ tostring(false) ].Up )
			_G[hkey.."_Container"]:SetHeight( _G[hkey.."_Wrapper"]:GetHeight() ) 
		end
		obj:SetText( headerText )
		obj:SetHidden( false )
		obj:ClearAnchors()
		obj:SetAnchor(anchor[1], anchor[2], anchor[3], anchor[4]+18, anchor[5])
		_G[hkey.."_Container"]:ClearAnchors()
		_G[hkey.."_Container"]:SetAnchor(anchor[1], anchor[2], anchor[3], anchor[4]+6, anchor[5]+(obj:GetHeight()+1))
		lastHeader = _G[hkey.."_Container"]
	end
	return obj
end

local questListItem = function( headerIndex, questIndex, questData )
	local hkey = key.."_Quest_"..questIndex
	local ownerKey = key.."_Header_"..headerIndex.."_Wrapper"
	local owner = _G[ownerKey]
	local anchor = {TOPLEFT, owner, TOPLEFT, 18, 0}
	if owner.lastQuest ~= nil then
		anchor = {TOPLEFT, owner.lastQuest, BOTTOMLEFT, -12, 2}
	end
	if _G[hkey] == nil then
		local bb = WF_FRAMES.__NewLabel(hkey, owner)
			:SetAnchor(anchor[1], anchor[2], anchor[3], anchor[4], anchor[5])
			:SetDimensions( frameWidth, 24 )
			:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 16, "soft-shadow-thick"))
			:SetColor(1, 1, 1, 1)
			:SetAlpha(1)
			:SetHidden(false)
			:SetText("["..questData.level.."] "..questData.name)
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["left"])
			:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
			:SetMouseEnabled( true )
			:SetHandler( "OnMouseEnter", function(self)
				WF_QuestTools_Tracker:MouseIn()
			end )
			:SetHandler( "OnMouseExit", function(self)
				WF_QuestTools_Tracker:MouseOut()
			end )
		.__END
		bb.questIndex = questIndex
		bb.questName = questData.name
		bb:SetWrapMode( bb:GetWidth() - 28 )

		bb:SetHandler( "OnMouseDown", function(self,button)
			if button == 1 then WF_QuestTools.UI._unregisterForEvents(); WF_QuestTools.Track( self.questIndex ); WF_QuestTools.UI.QuestTracker();
			elseif button == 2 then WF_QuestTools.Share( self.questIndex );
			elseif button == 3 then WF_QuestTools.UI.ConfirmAbandon( self.questName, self.questIndex )
			end
		end )
		local aa = WF_FRAMES.__NewImage(hkey.."_Icon", bb)
			:SetDimensions(24, 24)
			:SetTexture( "" )
			:SetAnchor( RIGHT, bb, LEFT, -4, 0 )
			:SetAlpha( 0 )
		.__END
		bb.Icon = aa
		local cc = WF_FRAMES.__NewLabel(hkey.."_Details", bb)
			:SetAnchor(TOPLEFT, bb, BOTTOMLEFT, 12, 1)
			:SetResizeToFitDescendents()
			:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/univers57.otf", 13, "soft-shadow-thick"))
			:SetColor(1, 1, 1, 1)
			:SetAlpha(1)
			:SetHidden(false)
			:SetText("")
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["left"])
			:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
			:SetWidth( frameWidth - 26 )
			:SetWrapMode( TEXT_WRAP_MODE_TRUNCATE )
		.__END
		bb.Details = cc
		owner.lastQuest = bb.Details
	end
	local obj = _G[hkey]
	if obj ~= nil then
		obj:SetHidden(false)
		obj.questIndex = questIndex
		obj.questName = questData.name
		local charLevel = GetUnitLevel( "player" )

		-- if WF_GetOrDefault( false, WF_QuestTools.UISettings.SingleQuest ) then
			-- obj:SetHeight( 0.001 )
		-- end

		if WF_QuestTools.Filter.Override then
			local red = charLevel + 4
			local orange = charLevel + 2
			local yellow = charLevel - 2
			local green = charLevel - 4
			local level = questData.level
			local c = WF_QuestTools.Filter.Worthless
			if level >= yellow and level < charLevel then
				c = WF_QuestTools.Filter.Easy
			elseif level >= charLevel and level < orange then
				c = WF_QuestTools.Filter.Par
			elseif level >= orange and level < red then
				c = WF_QuestTools.Filter.Difficult
			elseif level >= red then
				c = WF_QuestTools.Filter.Hard
			end
			obj:SetColor(c.r, c.g, c.b, 1)
		else
			local charLevel = GetUnitLevel( "player" )
			local yellowMax = charLevel + 4
			local yellowMin = charLevel - 4
			local greenMin = charLevel - 5
			if questData.level >= yellowMax then obj:SetColor(1, .65, .65, 1)
			elseif questData.level >= yellowMin and questData.level <= yellowMax then obj:SetColor(.8, .8, .35, 1)
			elseif questData.level < yellowMin and questData.level >= greenMin then obj:SetColor(.65, 1, .65, 1)
			else obj:SetColor(.65, .65, .65, 1) end
		end
		obj:SetText("["..questData.level.."] "..questData.name)
		obj:SetParent( owner )
		obj:ClearAnchors()
		obj:SetAnchor(anchor[1], anchor[2], anchor[3], anchor[4], anchor[5])
		local isTracked = false
		if questIndex == QUEST_JOURNAL:GetSelectedQuestIndex() then
			if WF_QuestTools.UISettings.CollapseState[key.."_Header_"..headerIndex] == nil then
				_G[key.."_Header_"..headerIndex.."_Wrapper"]:SetHidden(false)
			end
			obj.Icon:SetTexture( "/esoui/art/compass/quest_icon_assisted.dds" )
			obj.Icon:SetAlpha( 1 )
			isTracked = true
		else
			obj.Icon:SetAlpha( 0 )
		end
		if isTracked or WF_GetOrDefault( false, WF_QuestTools.UISettings.ShowAllDetails ) then
			local text = WF_QuestTools.GetQuestDetails( questIndex )
			--obj.Details:SetFont(string.format( "%s|%d|%s", WF_QuestTools._fontList[WF_QuestTools.Body.Font], WF_QuestTools.Body.Size, WF_QuestTools.Body.Style))
			--obj.Details:SetColor(WF_QuestTools.Body.Color.r, WF_QuestTools.Body.Color.g, WF_QuestTools.Body.Color.b, 1)
			obj.Details:SetText( text )
			-- could set color here?
			for x = 1, 25, 1 do
				if x ~= questIndex then
					-- if _G[key.."_Quest_"..x.."_Details"] ~= nil then
						-- _G[key.."_Quest_"..x.."_Details"]:SetText( "" )
					-- end
					if _G[key.."_Quest_"..x] ~= nil and IsValidQuestIndex(x) == false then
						_G[key.."_Quest_"..x]:SetHidden(true)
					end
				end
			end
		else
			obj.Details:SetText( "" )
		end
		owner:SetHeight( owner:GetHeight() + obj:GetHeight() + obj.Details:GetHeight() + 3 )
		if not _G[key.."_Header_"..headerIndex.."_Wrapper"]:IsHidden() then
			_G[key.."_Header_"..headerIndex.."_Icon"]:SetTexture( _G[key.."_Header_"..headerIndex].Icons[ tostring(false) ].Up )
			_G[key.."_Header_"..headerIndex.."_Container"]:SetHeight( _G[key.."_Header_"..headerIndex.."_Wrapper"]:GetHeight() )
		end
		owner.lastQuest = obj.Details
	end
	return obj
end

local questListItemDetails = function( headerIndex, questIndex, questDetails )
	--[[
		* GetJournalQuestNumRewards(*luaindex* _journalQuestIndex_)
		** _Returns:_ *integer* _count_

		* GetJournalQuestRewardInfo(*luaindex* _journalQuestIndex_, *luaindex* _rewardIndex_)
		** _Returns:_ *integer* _type_, *string* _name_, *integer* _amount_, *string* _iconFile_, *bool* _meetsUsageRequirement_, *integer* _itemQuality_

		* GetQuestRewardItemLink(*luaindex* _rewardIndex_, *[LinkStyle|#LinkStyle]* _linkStyle_)
		** _Returns:_ *string* _link_
	]]--
end

WF_QuestTools.UI.Create = function()
	WF_FRAMES.UIWindow:Create(key, nil, false, false, WF_QuestTools.UISettings, frameWidth, 8, 1)

	WF_QuestTools_Tracker.IsMoving = false
	WF_QuestTools_Tracker:SetHandler("OnMoveStart", function(self) self.IsMoving = true; end)
	WF_QuestTools_Tracker:SetHandler("OnMoveStop", function(self) self:SetFrameCoords(); self.IsMoving = false; end)
	WF_Tic( "quest_tracker_position_rescue", function()
		if WF_GetOrDefault( false, WF_QuestTools.UISettings["LetOutsideGui"] ) ~= true and not WF_QuestTools_Tracker.IsMoving then
			local centerX, centerY = WF_QuestTools_Tracker:GetCenter()
			local gCenterX, gCenterY = GuiRoot:GetCenter()
			if gCenterX ~= nil and gCenterY ~= nil then
				if WF_QuestTools_Tracker:GetTop() < 0 then
					WF_QuestTools_Tracker:ClearAnchors()
					WF_QuestTools_Tracker:SetAnchor( TOP, GuiRoot, TOP, centerX-gCenterX, 0 )
					WF_QuestTools_Tracker:SetFrameCoords()
				elseif WF_QuestTools_Tracker.UnderlayBackdrop:GetBottom() > GuiRoot:GetBottom() then
					WF_QuestTools_Tracker:ClearAnchors()
					WF_QuestTools_Tracker:SetAnchor( BOTTOM, GuiRoot, BOTTOM, centerX-gCenterX, 0 )
					WF_QuestTools_Tracker:SetFrameCoords()
				elseif WF_QuestTools_Tracker:GetLeft() < GuiRoot:GetLeft() then
					WF_QuestTools_Tracker:ClearAnchors()
					WF_QuestTools_Tracker:SetAnchor( LEFT, GuiRoot, LEFT, 0, centerY-gCenterY )
					WF_QuestTools_Tracker:SetFrameCoords()
				elseif WF_QuestTools_Tracker:GetRight() > GuiRoot:GetRight() then
					WF_QuestTools_Tracker:ClearAnchors()
					WF_QuestTools_Tracker:SetAnchor( RIGHT, GuiRoot, RIGHT, 0, centerY-gCenterY )
					WF_QuestTools_Tracker:SetFrameCoords()
				end
			end
		end
	end)

	WF_QuestTools_Tracker:SetHidden(false)
	WF_QuestTools_Tracker.OutAlpha = WF_QuestTools_Tracker.Backdrop:GetAlpha()
	WF_QuestTools_Tracker:SetMouseEnabled(true)
	WF_QuestTools_Tracker:SetMovable( true )
	WF_QuestTools_Tracker:SetHandler( "OnMouseEnter", function(self)
		WF_QuestTools_Tracker:MouseIn()
	end )
	WF_QuestTools_Tracker:SetHandler( "OnMouseExit", function(self)
		WF_QuestTools_Tracker:MouseOut()
	end )

	local barColor = { r = 0.25, g = 0.25, b = 0.25, a = .65 }
	barColor = WF_GetOrDefault(barColor, WF_QuestTools.UISettings.barColor)
	
	WF_QuestTools_Tracker.Title.Backdrop:SetHeight( 6 )
	WF_QuestTools_Tracker.Title.Backdrop:SetCenterColor( barColor.r, barColor.g, barColor.b, barColor.a )
	WF_QuestTools_Tracker.Title.Backdrop:SetEdgeColor( 0, 0, 0, 0 )
	--WF_QuestTools_Tracker.Backdrop:SetWidth( frameWidth )
	WF_QuestTools_Tracker.Backdrop:SetCenterColor( 0, 0, 0, 0 )
	WF_QuestTools_Tracker.Backdrop:SetEdgeColor( 0, 0, 0, 0 )
	--WF_QuestTools_Tracker.Backdrop:SetHeight( 6 )

	local bgColor = { r = 0, g = 0, b = 0, a = .55 }
	bgColor = WF_GetOrDefault(bgColor, WF_QuestTools.UISettings.bgColor)
	WF_QuestTools_Tracker.UnderlayBackdrop = WF_FRAMES.__NewBackdrop(key.."_Backdrop2", WF_QuestTools_Tracker.Backdrop)
		:SetAnchor( TOPLEFT, WF_QuestTools_Tracker.Title.Backdrop, TOPLEFT, 0, 6)
		:SetDimensions( frameWidth, 6 )
		:SetCenterColor( bgColor.r, bgColor.g, bgColor.b, bgColor.a )
		:SetEdgeColor( 0, 0, 0, 0 )
		:SetEdgeTexture( "", 1, 1, 1 )
		:SetHidden(false)
		:SetAlpha( 1 )
		:SetResizeToFitDescendents()
		:SetMouseEnabled(true)
		:SetHandler( "OnMouseEnter", function(self)
			WF_QuestTools_Tracker:MouseIn()
		end )
		:SetHandler( "OnMouseExit", function(self)
			WF_QuestTools_Tracker:MouseOut()
		end )
	.__END

	WF_QuestTools_Tracker.SettingsLoaded = false
	WF_QuestTools_Tracker.CurrentZone = ""
	WF_QuestTools_Tracker.Sections = nil

	WF_QuestTools_Tracker.LoadTempSettings = function(self, tmp)
		tmp = {}
		tmp.bgState = true
		tmp.barState = WF_GetOrDefault( true, WF_QuestTools.UISettings["barState"] )
		tmp.ShiftX = WF_GetOrDefault( 350, WF_QuestTools.UISettings.ShiftX )
		tmp.ShiftY = WF_GetOrDefault( 0, WF_QuestTools.UISettings.ShiftY )
		tmp.Hidden = WF_GetOrDefault( true, WF_QuestTools.UISettings["Enabled"] )
		tmp.Moveable = WF_GetOrDefault( true, WF_QuestTools.UISettings.Moveable )
	end

	WF_QuestTools_Tracker.LoadCoreSettings = function(self)
		local tmp = {}
		self:LoadTempSettings(tmp)
		WF_QuestTools_Tracker.bgState = tmp.bgState
		WF_QuestTools_Tracker.barState = tmp.barState
		WF_QuestTools_Tracker.ShiftX = tmp.ShiftX
		WF_QuestTools_Tracker.ShiftY = tmp.ShiftY
		WF_QuestTools_Tracker.Hidden = tmp.Hidden
		WF_QuestTools_Tracker.Moveable = tmp.Moveable
	end

	WF_QuestTools_Tracker._collapseZone = function( self, zoneName )
		-- collapse it here
	end

	WF_QuestTools_Tracker._expandZone = function( self, zoneName )
		-- expand it here
		-- local zoneQuests = WF_QuestTools.GetLocalZoneForUI( zoneName )

	end

	WF_QuestTools_Tracker.SetZone = function( self, zoneName )
		if self.CurrentZone == zoneName then return end
		self:_collapseZone(self.CurrentZone)
		self.CurrentZone = zoneName
		self:_expandZone(zoneName)
	end

	WF_QuestTools_Tracker.LoadSettings = function(self)
		if WF_QuestTools_Tracker.SettingsLoaded then
			local tmp = {}
			self:LoadTempSettings(tmp)
			self:LoadCoreSettings()
			-- compare to locals, shift states of those things that changed
		else
			WF_QuestTools_Tracker.SettingsLoaded = true
			self:LoadCoreSettings()
		end
	end

	WF_QuestTools_Tracker.LoadZones = function(self)
		if GetNumJournalQuests() == 0 then return end
		local quests = WF_QuestTools.GetAllForUI()
		if WF_QuestTools_Tracker.Sections ~= nil then
			for _, sec in pairs(WF_QuestTools_Tracker.Sections) do
				if sec.Header ~= nil then
					sec.Header:SetHidden(true)
				end
			end
			WF_QuestTools_Tracker.Sections = nil
			lastHeader = nil
		end
		if quests ~= nil then
			WF_QuestTools_Tracker.Sections = {}
			local lastHeaderIndex = 0
			for si, section in ipairs(quests) do
				lastHeaderIndex = si
				WF_QuestTools_Tracker.Sections[section.sectionName] = {}
				WF_QuestTools_Tracker.Sections[section.sectionName].Header = questHeader( si, section.sectionName, table_count(section.sectionQuests) )
				_G[key.."_Header_"..si.."_Wrapper"].lastQuest = nil
				WF_QuestTools_Tracker.Sections[section.sectionName].Quests = {}

				questSort = section.sectionQuests
				
				if WF_QuestTools.UISettings.Joviex then
					if WF_QuestTools.Filter.Sort == true then
						levels = {}
						hash = {}
						-- get unique "levels" first
						for _, questData in ipairs(section.sectionQuests) do
							v = questData.level
							if (not hash[v]) then
								levels[#levels+1] = v
								hash[v] = true
							end
						end

						questSort = {}
						table.sort(levels)
						for i=1, #levels do
							for b, questData in ipairs(section.sectionQuests) do
								if questData.level == levels[i] then
									table.insert(questSort, questData)
								end
							end
						end
					end
				end

				for qi, questData in ipairs(questSort) do
					WF_QuestTools_Tracker.Sections[section.sectionName].Quests[questData.questIndex] = questListItem( si, questData.questIndex, questData )
				end
			end
			if _G[key.."_Header_"..lastHeaderIndex.."_Wrapper"].lastQuest ~= nil then
				WF_QuestTools_Tracker.UnderlayBackdrop:ClearAnchors()
				WF_QuestTools_Tracker.UnderlayBackdrop:SetAnchor( TOPLEFT, WF_QuestTools_Tracker.Title.Backdrop, TOPLEFT, 0, 6)
				WF_QuestTools_Tracker.UnderlayBackdrop:SetAnchor( BOTTOMRIGHT, lastHeader, BOTTOMRIGHT, WF_QuestTools_Tracker.Title.Backdrop:GetWidth()-9, 3 )
			else
				WF_QuestTools_Tracker.Title.Backdrop:SetCenterColor( 1, 0.25, 0.25, .65 )
			end
		else
			-- clear quests from window
		end
	end

	WF_QuestTools_Tracker:LoadSettings()
	WF_QuestTools_Tracker:LoadZones()
	WF_QuestTools_Tracker:SetZone( "Rivenspire" )
end
