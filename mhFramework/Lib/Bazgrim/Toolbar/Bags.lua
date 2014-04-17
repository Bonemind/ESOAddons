-- "/esoui/art/mainmenu/menubar_inventory_up.dds
-- "/esoui/art/menubar/menubar_inventory_over.dds"

WF_BazgrimToolbar.GetBagDetails = function()
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS] == true then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS] = "Used / Total" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS] == nil then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS] = "Used / Total" end
	if WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS] == false then WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS] = "Off" end
	local bagSetting = WF_GetOrDefault( "Used / Total", WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_BAGS])
	local useIcon = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_icon"] )
	local useTitle = WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_title"])
	local bagLow = tonumber(WF_GetOrDefault( 10, WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_low"]))
	local bagMid = tonumber(WF_GetOrDefault( 25, WF_SavedVars.BazgrimToolbar["ToolOptions"]["bags_mid"]))
	
	local c = {}
	local icon, bagSlots = GetBagInfo(1)
	local bagSpace = 0
	for i = bagSlots, 0, -1 do bagSpace = i
		if CheckInventorySpaceSilently(bagSpace) then break end
	end
	local slots = (bagSlots-bagSpace)
	if slots > (bagSlots-bagLow) then c = {1,0,0,1}
	elseif slots > (bagSlots-bagMid) then c = {1,1,0,1}
	else c = {0,1,0,1} end
	
	local retVal = ""
	
	if useTitle then 
		retVal = retVal .. WF_BazgrimToolbar_DefaultLabelColor
		if bagSetting == "Used / Total" then retVal = retVal .. "Bags:|r " .. slots .. "|cDFDDDE".." / " .. bagSlots.."|r" end
		if bagSetting == "Used Space" then retVal = retVal .. "Used Space:|r " .. slots end
		if bagSetting == "Used %" then retVal = retVal .. "Used Space:|r " .. WF_ROUND((slots / bagSlots)*100, 0) .. "%" end
		if bagSetting == "Free Space" then retVal = retVal .. "Free Space:|r " .. (bagSlots - slots) .. " slots" end
		if bagSetting == "Free %" then retVal = retVal .. "Free Space:|r " .. WF_ROUND(((bagSlots - slots) / bagSlots)*100, 0) .. "%" end
	else
		if bagSetting == "Used / Total" then retVal = retVal .. slots .. "|cDFDDDE".." / " .. bagSlots.."|r" end
		if bagSetting == "Used Space" then retVal = retVal .. slots end
		if bagSetting == "Used %" then retVal = retVal .. WF_ROUND((slots / bagSlots)*100, 0) .. "%" end
		if bagSetting == "Free Space" then retVal = retVal .. (bagSlots - slots) .. " slots" end
		if bagSetting == "Free %" then retVal = retVal .. WF_ROUND(((bagSlots - slots) / bagSlots)*100, 0) .. "%" end
		if useIcon then
			local o = bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_BAGS].Control
			if o.Icon == nil then o.Icon = WF_BazgrimToolbar.MakeSpacerControl( o ); o.Icon:SetTexture( "/esoui/art/mainmenu/menubar_inventory_up.dds" ) end
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
			local o = bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_BAGS].Control
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
	end
	
	return retVal, c
end