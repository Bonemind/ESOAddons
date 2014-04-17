WF_BazgrimToolbar.GetHorse = function() 
	local style = WF_GetOrDefault( "Fancy", WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_HORSE])
	local useIcon = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["horse_icon"] )
	local TimeTilMountFeed, TotalTime = GetTimeUntilMountCanBeFed()
	local r, g, b = WF_ColorScale_RedGreenPowerMeter(TimeTilMountFeed, TotalTime, true)
	local retVal, c = "", { r, g, b, 1 }
	local TimeForHuman = WF_MillisecondsToHuman(TimeTilMountFeed, false)
	if TimeTilMountFeed == nil or TotalTime == nil then return retVal, c; end
	local hh, mm, ss = TimeForHuman:match("([^:]+):([^:]+):([^:]+)")
	local hn, mn, sn = tonumber(hh), tonumber(mm), tonumber(ss)
	if style == "Fancy" then
		if hn == 19 then retVal = "Bloated"
		elseif hn >= 18 then retVal = "Stuffed"
		elseif hn >= 16 then retVal = "Full"
		elseif hn >= 12 then retVal = "Pleased"
		elseif hn >= 8 then retVal = "Content"
		elseif hn >= 4 then retVal = "Unsettled"
		elseif hn >= 2 then retVal = "Snackish"
		elseif hn == 1 then retVal = "Expecting"
		else
			if mn >= 30 then retVal = "Hungry"
			elseif mn >= 15 then retVal = "Starving"
			elseif mn >= 1 then retVal = "Ravenous"
			else
				if sn >= 30 then retVal = "Ravenous"
				elseif sn >= 15 then retVal = "Malnutrition!"
				else
					retVal = "FEED ME!"	
				end
			end
		end
	elseif style == "Descriptive" then
		if hn > 0 then retVal = hh .. " Hours" else
			if mn > 0 then retVal = mm .. " Minutes" else
				if sn > 0 then retVal = ss .. " Seconds" else
					retVal = "FEED ME!"	
				end
			end
		end
	elseif style == "Countdown" then
		retVal = TimeForHuman
	end
	if useIcon then
		local o = bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_HORSE].Control
		if o.Icon == nil then o.Icon = WF_BazgrimToolbar.MakeSpacerControl( o ); o.Icon:SetTexture( "/esoui/art/mounts/tabicon_mounts_up.dds" ) end
		o.IconSize = 24
		o.BufferSize = 24
		if not o.UseIcon then
			o.Icon:SetDimensions( o.IconSize, o.IconSize )
			o.Icon:ClearAnchors()
			o.Icon:SetAnchor( RIGHT, o, LEFT, -4, 0 )
			o.Icon:SetHidden(false)
			local aBool, aPoint, aTarget, aTargetPoint, aX, aY = o:GetAnchor()
			o.PreviousAnchor = {aPoint, aTarget, aTargetPoint, aX, aY}
			o:ClearAnchors()
			o:SetAnchor( aPoint, aTarget, aTargetPoint, aX + o.BufferSize + 4, aY )
		end
		o.UseIcon = true
	else
		local o = bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_HORSE].Control
		if o.UseIcon == true then
			o.Icon:SetDimensions( o.IconSize, o.IconSize )
			o.Icon:ClearAnchors()
			o.Icon:SetAnchor( RIGHT, o, LEFT, -4, 0 )
			o.Icon:SetHidden(true)
			if o.PreviousAnchor ~= nil then
				o:ClearAnchors()
				o:SetAnchor( o.PreviousAnchor[1], o.PreviousAnchor[2], o.PreviousAnchor[3], o.PreviousAnchor[4], o.PreviousAnchor[5] )
			end
			o.PreviousAnchor = nil
		end
		o.UseIcon = false
	end
	return retVal, c
end
