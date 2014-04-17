WF_FRAMES.UIFrame = function(parent, uniqueName, anchor, w, h, centerColor, edgeColor, edgeTexture, alpha, cascade)
	if parent == nil then return end
	local obj = cascade or {}
	obj.Frame = WF_FRAMES.__NewTopLevel( uniqueName )
		:SetAnchor( anchor[1], anchor[2], anchor[3], anchor[4], anchor[5] )
		:SetDimensions( w, h )
		:SetHidden( false )
	.__END
	obj.Backdrop = WF_FRAMES.__NewBackdrop( uniqueName.."_Backdrop", obj.Frame )
		:SetAnchor(CENTER, obj.Frame, CENTER, 0, 0)
		:SetDimensions( w , h )
		:SetCenterColor(centerColor[1], centerColor[2], centerColor[3], centerColor[4])
		:SetEdgeColor(edgeColor[1], edgeColor[2], edgeColor[3], edgeColor[4])
		:SetEdgeTexture(edgeTexture[1], edgeTexture[2], edgeTexture[3], edgeTexture[4])
		:SetAlpha(alpha)
		:SetHidden(false)
	.__END
	return obj
end