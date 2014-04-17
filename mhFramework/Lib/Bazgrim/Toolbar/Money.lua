WF_BazgrimToolbar.GetMoney = function()
	local useCommas = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_comma"])
	local useIcon = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_icon"] )
	local useTitle = WF_GetOrDefault( false, WF_SavedVars.BazgrimToolbar["ToolOptions"]["gold_title"])
	local val, c, title = GetCurrentMoney(), {1,1,.76,1}, ""
	if useCommas then val = comma_value(val) end
	if useTitle then 
		title = WF_BazgrimToolbar_DefaultLabelColor .. "Gold:|r " 
	else
		if useIcon then
			local o = bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_GOLD].Control
			if o.Icon == nil then 
				o.Icon = WF_BazgrimToolbar.MakeSpacerControl( o ); 
				o.Icon:SetTexture( "/esoui/art/guild/guildhistory_indexicon_guildstore_up.dds" ) 
			end
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
			local o = bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_GOLD].Control
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
	return title .. val, c
end
-- "/esoui/art/guild/guildhistory_indexicon_guildstore_up.dds"