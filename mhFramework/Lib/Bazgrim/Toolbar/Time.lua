WF_BazgrimToolbar.GetTime = function()
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME] = "12 hour" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME] == true then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME] = "12 hour" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME] == false then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME] = "Off" end
	local timeKind = WF_GetOrDefault( "12 hour", WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_TIME])
	local useTitle = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["time_title"])
	local useAmPm = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["time_ampm"])
	local retVal, val, c = "", GetTimeString(), {215/255,213/255,205/255,1}
	local hh, mm, ss = val:match("([^:]+):([^:]+):([^:]+)")
	local ampm, del = " am", "|cA0A0CF:|r"
	ss = "|cAAAAAA"..ss.."|r"
	
	if string.lower(timeKind) == "24 hour" then
		val = hh ..del.. mm ..del.. ss
		if useTitle then retVal = WF_BazgrimToolbar_DefaultLabelColor .. "Time:|r " .. val
		else retVal = val end
	elseif string.lower(timeKind) == "12 hour" then
		if tonumber(hh) > 12 then hh = hh - 12; ampm = " pm"; end
		if tonumber(hh) == 12 then ampm = " pm"; end
		if tonumber(hh) == 0 then hh = 12; end
		if useAmPm then val = hh ..del.. mm ..del.. ss .. WF_BazgrimToolbar_DefaultLabelColor..ampm.."|r"
		else val = hh ..del.. mm ..del.. ss end
		if useTitle then retVal = WF_BazgrimToolbar_DefaultLabelColor .. "Time:|r " .. val
		else retVal = val end
	end
	
	return retVal, c
end