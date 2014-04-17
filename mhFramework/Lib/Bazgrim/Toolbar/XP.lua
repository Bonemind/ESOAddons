WF_BazgrimToolbar.GetXP = function()
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP] == true then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP] = "Earned / Total" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP] = "Earned / Total" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP] == false then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP] = "Off" end
	local setting = WF_GetOrDefault( "Earned / Total", WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_XP])
	local useTitle = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["xp_title"] )
	local useCommas = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["xp_comma"] )
	local c = {1,1,1,1}
	local xp, xplvl, title =  GetUnitXP('player'), GetUnitXPMax('player'), WF_BazgrimToolbar_DefaultLabelColor .. "XP:|r "
	if tonumber(xplvl) == 0 then
		xp, xplvl, title = GetUnitVeteranPoints("player"), GetUnitVeteranPointsMax("player"), WF_BazgrimToolbar_DefaultLabelColor .. "VP:|r "
	end
	if tonumber(xplvl) == 0 then return WF_BazgrimToolbar_DefaultLabelColor .. "Max Level|r", c; end
	if not useTitle then title = "" end
	if setting == "Earned / Total" then 
		if useCommas then return title ..comma_value(xp).."|cA0A0CF / |r".."|cA0A0CF"..comma_value(xplvl).."|r", c; 
		else return title ..xp.."|cA0A0CF / |r".."|cA0A0CF"..xplvl.."|r", c; end
	end
	if setting == "Earned" then
		if useCommas then return title ..comma_value(xp), c; 
		else return title ..xp, c; end
	end
	if setting == "Earned % / Total" then
		if useCommas then return title ..WF_ROUND((xp/xplvl)*100,0).."%|cA0A0CF / |r".."|cA0A0CF"..comma_value(xplvl).."|r", c; 
		else return title ..WF_ROUND((xp/xplvl)*100,0).."%|cA0A0CF / |r".."|cA0A0CF"..xplvl.."|r", c; end
	end
	if setting == "Earned %" 			then return title ..WF_ROUND((xp/xplvl)*100,0).."%", c; end
	if setting == "Needed" then
		if useCommas then return title ..comma_value(xplvl - xp), c; 
		else return title ..xplvl - xp, c; end
	end
	if setting == "Needed %" 			then return title ..WF_ROUND(((xplvl - xp)/xplvl)*100,0).."%", c; end
	return "", c
end
		-- "Earned / Needed",
		-- "Earned",
		-- "Earned % / Needed %",
		-- "Earned %",
		-- "Needed",
		-- "Needed %",