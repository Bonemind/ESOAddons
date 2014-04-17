wykkydsFramework.ScrollFrames = {}
wykkydsFramework.ScrollFrames.ScrollText = {}
wykkydsFramework.ScrollFrames.ScrollText.Left = nil
wykkydsFramework.ScrollFrames.ScrollText.Center = nil
wykkydsFramework.ScrollFrames.ScrollText.Right = nil

wykkydsFramework.ScrollFrames.Prep = function()
	local key = "WF_ScrollFrame"
	
	if _G[key] ~= nil then wykkydsFramework.ScrollFrames.Window = _G[key]
	else wykkydsFramework.ScrollFrames.Window = WF_FRAMES.__NewTopLevel(key)
		:SetDimensions(320,260)
		:SetHidden(false)
		:SetAnchor(CENTER,GuiRoot,CENTER,0,0)
	.__END
	-- wykkydsFramework.ScrollFrames.Window.bg = WF_FRAMES.__NewBackdrop(key.."BG", wykkydsFramework.ScrollFrames.Window)
		-- :SetAnchor(TOPLEFT, wykkydsFramework.ScrollFrames.Window, TOPLEFT, -2, -2)
		-- :SetAnchor(BOTTOMRIGHT, wykkydsFramework.ScrollFrames.Window, BOTTOMRIGHT, 2, 2)
		-- :SetCenterColor(0.1,0.1,0.1,.5)
		-- :SetEdgeColor(0,0,0,1)
		-- :SetEdgeTexture("", 8, 1, 1)
		-- :SetHidden(false)
	-- .__END
	end
	
	if _G[key.."_left"] ~= nil then wykkydsFramework.ScrollFrames.Window = _G[key.."_left"]
	else wykkydsFramework.ScrollFrames.Left = WF_FRAMES.__NewLabel(key.."_left", wykkydsFramework.ScrollFrames.Window)
		:SetFont("ZoFontGame")
		:SetColor(1,1,1,1)
		:SetText("")
		:SetAnchor(BOTTOMLEFT,wykkydsFramework.ScrollFrames.Window,BOTTOMLEFT,-200,0)
		:SetHidden(false)
	.__END end
	
	if _G[key.."_center"] ~= nil then wykkydsFramework.ScrollFrames.Window = _G[key.."_center"]
	else wykkydsFramework.ScrollFrames.Center = WF_FRAMES.__NewLabel(key.."_center", wykkydsFramework.ScrollFrames.Window)
		:SetFont("ZoFontGame")
		:SetColor(1,1,1,1)
		:SetText("")
		:SetAnchor(BOTTOM,wykkydsFramework.ScrollFrames.Window,BOTTOM,0,0)
		:SetHidden(false)
	.__END end
	
	if _G[key.."_right"] ~= nil then wykkydsFramework.ScrollFrames.Window = _G[key.."_right"]
	else wykkydsFramework.ScrollFrames.Right = WF_FRAMES.__NewLabel(key.."_right", wykkydsFramework.ScrollFrames.Window)
		:SetFont("ZoFontGame")
		:SetColor(1,1,1,1)
		:SetText("")
		:SetAnchor(BOTTOMRIGHT,wykkydsFramework.ScrollFrames.Window,BOTTOMRIGHT,200,0)
		:SetHidden(false)
	.__END end
end

wykkydsFramework.ScrollFrames.Add = function( text, side, color)
	local sct = {}
	if _G["WF_ScrollFrame"] == nil then wykkydsFramework.ScrollFrames.Prep() end
	side = string.upper(side)
	wykkydsFramework.ScrollFrames.Window:SetAnchor(CENTER,GuiRoot,CENTER,0,0)
	sct.Color = color
	sct.Text = text
	sct.Enabled = true
	sct.gameTimeStamp = GetGameTimeMilliseconds()
	if side == "CENTER" then 
		sct.Obj = wykkydsFramework.ScrollFrames.Center
		sct.Anchor = {BOTTOM,wykkydsFramework.ScrollFrames.Window,BOTTOM,0,0}
		wykkydsFramework.ScrollFrames.Center:ClearAnchors()
		wykkydsFramework.ScrollFrames.Center:SetAnchor(BOTTOM,wykkydsFramework.ScrollFrames.Window,BOTTOM,0,0)
		wykkydsFramework.ScrollFrames.ScrollText.Center = sct
	elseif side == "LEFT" then 
		sct.Obj = wykkydsFramework.ScrollFrames.Left
		sct.Anchor = {BOTTOMLEFT,wykkydsFramework.ScrollFrames.Window,BOTTOMLEFT,-200,0}
		wykkydsFramework.ScrollFrames.Left:ClearAnchors()
		wykkydsFramework.ScrollFrames.Left:SetAnchor(BOTTOMLEFT,wykkydsFramework.ScrollFrames.Window,BOTTOMLEFT,-200,0)
		wykkydsFramework.ScrollFrames.ScrollText.Left = sct
	elseif side == "RIGHT" then 
		sct.Obj = wykkydsFramework.ScrollFrames.Right
		sct.Anchor = {BOTTOMRIGHT,wykkydsFramework.ScrollFrames.Window,BOTTOMRIGHT,200,0}
		wykkydsFramework.ScrollFrames.Right:ClearAnchors()
		wykkydsFramework.ScrollFrames.Right:SetAnchor(BOTTOMRIGHT,wykkydsFramework.ScrollFrames.Window,BOTTOMRIGHT,200,0)
		wykkydsFramework.ScrollFrames.ScrollText.Right = sct
	end
end
