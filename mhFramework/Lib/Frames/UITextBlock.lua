WF_FRAMES.UITextBlock = function(parent, uniqueName, anchor, w, h, centerColor, edgeColor, edgeTexture, alpha, text, fontColor, cascade, textX, textY)
	if parent == nil then return end
	local obj = cascade or {}
	local tX = textX or 0
	local tY = textY or ((h-6)*-1)
	obj = WF_FRAMES.UIBackdrop(parent, uniqueName.."_Backdrop", anchor, w, h, centerColor, edgeColor, edgeTexture, alpha, obj)
	obj = WF_FRAMES.UILabel(obj.Backdrop, uniqueName.."_Label", {CENTER, obj.Backdrop, CENTER, tX, tY}, w-2, h-2, alpha, text, fontColor, obj)
	return obj
end