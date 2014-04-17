WF_FRAMES.UIButton = function(parent, uniqueName, anchor, w, h, centerColor, edgeColor, edgeTexture, alpha, text, fontColor, cascade, textX, textY)
	if parent == nil then return end
	local obj = cascade or {}
	local tX = textX or 0
	local tY = textY or ((h-6)*-1)
	obj = WF_FRAMES.UIBackdrop(parent, uniqueName.."_Backdrop", anchor, w, h, centerColor, edgeColor, edgeTexture, alpha, obj)
	obj.Button = WF_FRAMES.__NewButton(uniqueName, obj.Backdrop)
		:SetAnchor(CENTER, obj.Backdrop, CENTER, 0, 0)
		:SetDimensions( w-2 , h-2 )
		:EnableMouseButton(1,true)
		:SetEnabled(true)
		:SetHidden(false)
	.__END
	obj = WF_FRAMES.UILabel(obj.Button, uniqueName.."_Label", {CENTER, obj.Button, CENTER, tX, tY}, w-4, h-4, alpha, text, fontColor, obj)
	return obj
end

WF_FRAMES.UIButton2 = function(parent, uniqueName, anchor, w, h, centerColor, edgeColor, edgeTexture, alpha, text, cascade)
	if parent == nil then return end
	local obj = cascade or {}
	local tX = textX or 0
	local tY = textY or ((h-6)*-1)
	obj = WF_FRAMES.UIBackdrop(parent, uniqueName.."_Backdrop", anchor, w, h, centerColor, edgeColor, edgeTexture, alpha, cascade)
	obj.Button = WF_FRAMES.__NewButton(uniqueName, obj.Backdrop)
		:SetAnchor(CENTER, obj.Backdrop, CENTER, 0, 0)
		:SetDimensions( w-2 , h-2 )
		:EnableMouseButton(1,true)
		:SetEnabled(true)
		:SetHidden(false)
		:SetText(text)
	.__END
	return obj
end

WF_FRAMES.UIImageButton = function(parent, uniqueName, anchor, w, h, centerColor, edgeColor, edgeTexture, alpha, imagePath, cascade)
	if parent == nil then return end
	local obj = cascade or {}
	local tX = textX or 0
	local tY = textY or ((h-6)*-1)
	obj = WF_FRAMES.UIBackdrop(parent, uniqueName.."_Backdrop", anchor, w, h, centerColor, edgeColor, edgeTexture, alpha, cascade)
	obj.Button = WF_FRAMES.__NewButton(uniqueName, obj.Backdrop)
		:SetAnchor(CENTER, obj.Backdrop, CENTER, 0, 0)
		:SetDimensions( w-2 , h-2 )
		:EnableMouseButton(1,true)
		:SetEnabled(true)
		:SetHidden(false)
	.__END
	obj.Image = WF_FRAMES.__NewImage(uniqueName.."_image", obj.Button)
		:SetAnchor(CENTER, obj.Button, CENTER, 0, 0)
		:SetDimensions(w-4, h-4)
		:SetAlpha(alpha)
		:SetTexture(imagePath)
	.__END
	return obj
end