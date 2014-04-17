WF_FRAMES.UILabel = function(parent, uniqueName, anchor, w, h, alpha, text, fontColor, cascade)
	if parent == nil then return end
	local obj = cascade or {}
	obj.Label = WF_FRAMES.__NewLabel(uniqueName.."_Label", parent)
		:SetAnchor(anchor[1], anchor[2], anchor[3], anchor[4], anchor[5])
		:SetDimensions( w , h )
		:SetFont("ZoFontGame")
		:SetColor(fontColor[1], fontColor[2], fontColor[3], fontColor[4])
		:SetAlpha(alpha)
		:SetHidden(false)
		:SetText(text)
	.__END
	return obj
end