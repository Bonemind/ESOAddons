wykkydsFramework.Events.Register = function(EVENT, HANDLER, addonId)
	local ao = addonId or wykkydsFramework.AddonID
	EVENT_MANAGER:RegisterForEvent(ao, EVENT, HANDLER)
end
wykkydsFramework.Events.Unregister = function(EVENT, addonId)
	local ao = addonId or wykkydsFramework.AddonID
	EVENT_MANAGER:UnregisterEvent(ao, EVENT)
end

local combatUnsheathed = false

local ticScrollText = function( st )
	if st.Enabled == false then return end
	if st.gameTimeStamp == nil then 
		st.gameTimeStamp = GetGameTimeMilliseconds() 
	end
	if ( ( GetGameTimeMilliseconds() - st.gameTimeStamp ) < 3100 ) then
		st.Obj:SetHidden(false)
		st.Obj:SetAnchor( st.Anchor[1], st.Anchor[2], st.Anchor[3], st.Anchor[4], 
			-( ( GetGameTimeMilliseconds() - st.gameTimeStamp ) / 10 ) )
		st.Obj:SetText( st.Text )
		st.Obj:SetColor( st.Color[1], st.Color[2], st.Color[3], st.Color[4] )
	else
		st.Enabled = false
		st.Obj:SetHidden(true)
		st.Obj:ClearAnchors()
		st.Obj:SetText( "" )
		st.Obj:SetColor( 1, 1, 1, 1 )
		st.Obj:SetAnchor( st.Anchor[1], st.Anchor[2], st.Anchor[3], st.Anchor[4], 0 )
	end
end

wykkydsFramework.OnUpdateCallback = function( key, buffer, callback )
	if callback == nil then return end
	wykkydsFramework.Events.Registered_onupdatecallback[key] = {}
	wykkydsFramework.Events.Registered_onupdatecallback[key].Buffer = buffer
	wykkydsFramework.Events.Registered_onupdatecallback[key].Callback = callback
end

wykkydsFramework.Events.GlobalHandler = function( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11
	, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20 )
	local e = wykkydsFramework.Events.GameEventsByCode[ arg1 ]
	if e == nil then return end
	if wykkydsFramework.Events.Registry[ e.DESCR ] == nil then return end
	if table_count(wykkydsFramework.Events.Registry[ e.DESCR ]) > 0 then
		local args = {
			[1] = arg1,   [2] = arg2,   [3] = arg3,   [4] = arg4,   [5] = arg5, 
			[6] = arg6,   [7] = arg7,   [8] = arg8,   [9] = arg9,   [10] = arg10, 
			[11] = arg11, [12] = arg12, [13] = arg13, [14] = arg14, [15] = arg15, 
			[16] = arg16, [17] = arg17, [18] = arg18, [19] = arg19, [20] = arg20,
		}
		for k,a in pairs(wykkydsFramework.Events.Registry[ e.DESCR ]) do
			if a ~= nil then
				if a.Handler ~= nil then
					if a.TableParms then
						local parms = {}
						if e.PARAMS ~= nil then
							for _,parm in pairs ( e.PARAMS ) do
								parms[ parm.name ] = args[ parm.paramNum ]
							end
							a.Handler( parms )
						end
					else
						a.Handler( arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8, arg9, arg10, arg11
							, arg12, arg13, arg14, arg15, arg16, arg17, arg18, arg19, arg20 )
					end
				end
			end
		end
	end
end

wykkydsFramework.Events._RegisteredToGlobalHandler = {}
wykkydsFramework.Events._NumRegisteredToGlobalHandler = {}

local hasUnregistered = {}

wykkydsFramework.Events.Update = function()
	if table_count(wykkydsFramework.Events.Registry) > 0 then
		for e,v in pairs(wykkydsFramework.Events.Registry) do
			if wykkydsFramework.Events._NumRegisteredToGlobalHandler[e] == nil then wykkydsFramework.Events._NumRegisteredToGlobalHandler[e] = 0 end
			if wykkydsFramework.Events._RegisteredToGlobalHandler[e] == nil then wykkydsFramework.Events._RegisteredToGlobalHandler[e] = false end
			for a,t in pairs(v) do
				if t.Unregister and not t.Unregistered then
					wykkydsFramework.Events._NumRegisteredToGlobalHandler[e] = wykkydsFramework.Events._NumRegisteredToGlobalHandler[e] - 1
					--EVENT_MANAGER:UnregisterEvent(wykkydsFramework.AddonID, t.Code)
					t.Unregistered = true
				elseif not t.Registered and not t.Unregister then
					wykkydsFramework.Events._NumRegisteredToGlobalHandler[e] = wykkydsFramework.Events._NumRegisteredToGlobalHandler[e] + 1
					--EVENT_MANAGER:RegisterForEvent(wykkydsFramework.AddonID, t.Code, wykkydsFramework.Events.GlobalHandler)
					t.Registered = true
				end
			end
			if wykkydsFramework.Events._NumRegisteredToGlobalHandler[e] > 0 then
				if not wykkydsFramework.Events._RegisteredToGlobalHandler[e] then
					EVENT_MANAGER:RegisterForEvent(wykkydsFramework.AddonID, wykkydsFramework.Events.GameEventTable[e].CODE, wykkydsFramework.Events.GlobalHandler)
					wykkydsFramework.Events._RegisteredToGlobalHandler[e] = true
				end
			else
				if wykkydsFramework.Events._RegisteredToGlobalHandler[e] then
					if hasUnregistered[wykkydsFramework.Events.GameEventTable[e].CODE] ~= nil then
						if hasUnregistered[wykkydsFramework.Events.GameEventTable[e].CODE][wykkydsFramework.AddonID] == nil then
							EVENT_MANAGER:UnregisterEvent(wykkydsFramework.AddonID, wykkydsFramework.Events.GameEventTable[e].CODE)
							hasUnregistered[wykkydsFramework.Events.GameEventTable[e].CODE][wykkydsFramework.AddonID] = true
						end
					end
				end
			end
		end
	end
	if WF_SavedVars ~= nil then
		if WF_SavedVars.BazgrimToolbar ~= nil then
			if WF_SavedVars.BazgrimToolbar["Settings"] ~= nil then
				if WF_SavedVars.BazgrimToolbar["Settings"].ScrollingExp then
					if ( ( GetGameTimeMilliseconds() - WF_ScrollControls.gameTimeStamp ) < 3000 ) then
						bazgrimToolbar.ScrollingText:SetHidden(false)
						bazgrimToolbar.ScrollingText:SetAnchor( BOTTOMLEFT, bazgrimToolbar.ScrollingWindow, BOTTOMLEFT, -200, 
							-( ( GetGameTimeMilliseconds() - WF_ScrollControls.gameTimeStamp ) / 10 ) )
					else
						if _G["bazgrimToolbar"] ~= nil then
							bazgrimToolbar.ScrollingText:SetHidden(true)
							bazgrimToolbar.ScrollingText:SetAnchor( BOTTOMLEFT, bazgrimToolbar.ScrollingWindow, BOTTOMLEFT, -200, 0 )
						end
					end
				end
			end
		end
	end
	
	if wykkydsFramework.ScrollFrames ~= nil then
		if wykkydsFramework.ScrollFrames.ScrollText ~= nil then
			if wykkydsFramework.ScrollFrames.ScrollText.Left ~= nil then ticScrollText(wykkydsFramework.ScrollFrames.ScrollText.Left) end
			if wykkydsFramework.ScrollFrames.ScrollText.Center ~= nil then ticScrollText(wykkydsFramework.ScrollFrames.ScrollText.Center) end
			if wykkydsFramework.ScrollFrames.ScrollText.Right ~= nil then ticScrollText(wykkydsFramework.ScrollFrames.ScrollText.Right) end
		end
	end
	
	for k,t in pairs(wykkydsFramework.Events.Registered_onupdatecallback) do
		if t.Buffer ~= nil then
			if WF_Buffer(k, t.Buffer) then t.Callback() end
			
		else t.Callback() end
	end
	WF_BazgrimSubtitles.Update()
	
	if not WF_UTIL.BufferPause("wykkydsFramework_frames_update", .1) then return end
	--[[ REGISTER UPDATE METHODS HERE ]]--
	WF_FRAMES.Events.ToggleUIFrames()
	if not WF_SavedVars then WF_SavedVars = {} end
	if not WF_SavedVars.ChatBGFrame then WF_SavedVars.ChatBGFrame = {} end
	if WF_SavedVars.ChatBGFrame["Shown"] == nil then WF_SavedVars.ChatBGFrame["Shown"] = false end
	if WF_SavedVars.ChatBGFrame["Shown"] then
		local chatbg = _G["wykkydsChatFrameBackPanel"]
		if chatbg == nil then
			WF_UTIL.ChatFrameBackpanel()
			chatbg = _G["wykkydsChatFrameBackPanel"]
		end
		if chatbg ~= nil then
			chatbg:SetHidden(false)
			chatbg.bg:SetHidden(false)
		end
	end
	if WF_SavedVars ~= nil then
		if WF_SavedVars.BazgrimToolbar ~= nil then
			if WF_SavedVars.BazgrimToolbar["Settings"] ~= nil then
				if WF_SavedVars.BazgrimToolbar["Settings"].Enabled then
					if _G["bazgrimToolbar"] ~= nil then _G["bazgrimToolbar"].UpdateAll() 
					else WF_BazgrimToolbar.Create(); end
				end
			end
		end
	end
end

EVENT_MANAGER:RegisterForEvent(wykkydsFramework.AddonID, EVENT_ADD_ON_LOADED, wykkydsFramework.Startup)

wykkydsFramework.ToggleWield = function(eventCode, isInCombat)
	if not isInCombat then
		TogglePlayerWield()
	end
end