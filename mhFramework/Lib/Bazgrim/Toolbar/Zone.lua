WF_BazgrimToolbar.GetZone = function()
	local useTitle, title = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["zone_title"]), WF_BazgrimToolbar_DefaultLabelColor .. "Zone:|r "
	if not useTitle then title = "" end
	if bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_ZONE].Control:GetText() == nil 
	or bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_ZONE].Control:GetText() == "" 
	then 
		bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_ZONE].Control.Title = title
		return title..ZO_WorldMapTitle:GetText(), {215/255,213/255,205/255,1}
	else 
		if bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_ZONE].Control.Title ~= title then
			bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_ZONE].Control.Title = title
			return title..ZO_WorldMapTitle:GetText(), {215/255,213/255,205/255,1}
		else
			return bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_ZONE].Control:GetText(), {215/255,213/255,205/255,1}
		end
	end
end
WF_BazgrimToolbar.zoneUpdate = function(id, zoneName, subZoneName, newSubzone)
	local useTitle, title = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["zone_title"]), WF_BazgrimToolbar_DefaultLabelColor .. "Zone:|r "
	if not useTitle then title = "" end
	if (subZoneName ~= "") then bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_ZONE].Control:SetText(title..subZoneName)
	else bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_ZONE].Control:SetText(title..ZO_WorldMapTitle:GetText()) end
end