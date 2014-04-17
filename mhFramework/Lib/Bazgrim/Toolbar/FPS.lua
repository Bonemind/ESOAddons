WF_BazgrimToolbar.GetFramesPerSecond = function()
	local onOff = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_FPS])
	local fpsLow = tonumber(WF_GetOrDefault( 15, WF_SavedVars.BazgrimToolbar["ToolOptions"]["fps_low"]))
	local fpsMid = tonumber(WF_GetOrDefault( 22, WF_SavedVars.BazgrimToolbar["ToolOptions"]["fps_mid"]))
	local c = {215/255,213/255,205/255,1}
	local framerate = GetFramerate()
	if framerate <= fpsMid and framerate > fpsLow then c = {1,1,0,1}
	elseif framerate <= fpsLow then c = {1,.5,0,1} end
	return WF_BazgrimToolbar_DefaultLabelColor .. "FPS:|r "..math.floor(framerate), c
end
