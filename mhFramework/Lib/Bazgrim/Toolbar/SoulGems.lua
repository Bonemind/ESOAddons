WF_BazgrimToolbar.GetSoulGems = function()
	local style = WF_GetOrDefault( "Empty / Full", WF_SavedVars.BazgrimToolbar["Tools"][WF_TOOLBAR_TOOL_GEMS])
	local useIcon = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["gems_icon"] )
	localretVal, c = "", {215/255,213/255,205/255,1}
	local name, icon, icon2, stackCount = "", "", "", 0
	local myLevel, GEM_TYPE = GetUnitLevel("player"), SOUL_GEM_PETTY
	local emptyCount, fullCount = 0, 0
	if myLevel >= SOUL_GEM_GRAND then GEM_TYPE = SOUL_GEM_GRAND
	elseif myLevel >= SOUL_GEM_GREATER then GEM_TYPE = SOUL_GEM_GREATER
	elseif myLevel >= SOUL_GEM_COMMON then GEM_TYPE = SOUL_GEM_COMMON
	elseif myLevel >= SOUL_GEM_LESSER then GEM_TYPE = SOUL_GEM_LESSER
	elseif myLevel >= SOUL_GEM_MINOR then GEM_TYPE = SOUL_GEM_MINOR end
	name, icon, stackCount = GetSoulGemInfo(SOUL_GEM_TYPE_EMPTY, GEM_TYPE, SOUL_GEM_LOC_INVENTORY); emptyCount = stackCount;
	name, icon2, stackCount = GetSoulGemInfo(SOUL_GEM_TYPE_FILLED, GEM_TYPE, SOUL_GEM_LOC_INVENTORY); fullCount = stackCount;
	if style == "Empty / Full" then retVal = emptyCount .. " / ".. "|c00FF00"..fullCount.."|r"
	elseif style == "Empty" then retVal = emptyCount
	elseif style == "Full" then retVal = "|c00FF00"..fullCount.."|r" end
	if (icon2 ~= "" and icon2 ~= nil) and icon2 ~= "/esoui/art/icons/icon_missing.dds" then icon = icon2 end
	if useIcon then
		local o = bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_GEMS].Control
		if o.Icon == nil then o.Icon = WF_BazgrimToolbar.MakeSpacerControl( o ); end
		o.Icon:SetTexture( icon )
		o.IconSize = 16
		o.BufferSize = 24
		if not o.UseIcon then
			o.Icon:SetDimensions( o.IconSize, o.IconSize )
			o.Icon:ClearAnchors()
			o.Icon:SetAnchor( RIGHT, o, LEFT, -8, 0 )
			o.Icon:SetHidden(false)
			local aBool, aPoint, aTarget, aTargetPoint, aX, aY = o:GetAnchor()
			o.PreviousAnchor = {aPoint, aTarget, aTargetPoint, aX, aY}
			o:ClearAnchors()
			o:SetAnchor( aPoint, aTarget, aTargetPoint, aX + o.BufferSize + 4, aY )
		end
		o.UseIcon = true
	else
		local o = bazgrimToolbar.Tools[WF_TOOLBAR_TOOL_GEMS].Control
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