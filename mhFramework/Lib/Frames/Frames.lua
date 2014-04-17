WF_CHAIN = function( object )
	local T = {}
	setmetatable( T , { __index = function( self , func )
		if func == "__END" then	return object end
		return function( self , ... )
			assert( object[func] , func .. " missing in object" )
			object[func]( object , ... )
			return self
		end
	end })
	return T
end

WF_FRAMES.__NewTopLevel = function(str) 
	local object = WF_FRAMES.NewTopLevel(str)
	local T = {}
	setmetatable( T , { __index = function( self , func )
		if func == "__END" then	return object end
		return function( self , ... )
			assert( object[func] , func .. " missing in object" )
			object[func]( object , ... )
			return self
		end 
	end })
	return T
end
WF_FRAMES.NewTopLevel = function(str)
	local nm = WF_UTIL.UniqueName(str)
	local obj = WF_CHAIN(WINDOW_MANAGER:CreateTopLevelWindow(nm))
	.__END
	return obj
end

WF_FRAMES.__NewBackdrop = function(str, pappy) 
	local object = WF_FRAMES.NewBackdrop(str, pappy)
	local T = {}
	setmetatable( T , { __index = function( self , func )
		if func == "__END" then	return object end
		return function( self , ... )
			assert( object[func] , func .. " missing in object" )
			object[func]( object , ... )
			return self
		end
	end })
	return T
end
WF_FRAMES.NewBackdrop = function(str, pappy)
	local nm = WF_UTIL.UniqueName(str)
	local obj = WF_CHAIN(WINDOW_MANAGER:CreateControl(nm, pappy or GuiRoot, CT_BACKDROP))
	.__END
	return obj
end

WF_FRAMES.__NewImage = function(str, pappy) 
	local object = WF_FRAMES.NewImage(str, pappy)
	local T = {}
	setmetatable( T , { __index = function( self , func )
		if func == "__END" then	return object end
		return function( self , ... )
			assert( object[func] , func .. " missing in object" )
			object[func]( object , ... )
			return self
		end
	end })
	return T
end
WF_FRAMES.NewImage = function(str, pappy)
	local nm = WF_UTIL.UniqueName(str)
	local obj = WF_CHAIN(WINDOW_MANAGER:CreateControl(nm, pappy or GuiRoot, CT_TEXTURE))
	.__END
	return obj
end

WF_FRAMES.__NewLabel = function(str, pappy) 
	local object = WF_FRAMES.NewLabel(str, pappy)
	local T = {}
	setmetatable( T , { __index = function( self , func )
		if func == "__END" then	return object end
		return function( self , ... )
			assert( object[func] , func .. " missing in object" )
			object[func]( object , ... )
			return self
		end
	end })
	return T
end
WF_FRAMES.NewLabel = function(str, pappy)
	local nm = WF_UTIL.UniqueName(str)
	local obj = WF_CHAIN(WINDOW_MANAGER:CreateControl(nm, pappy or GuiRoot, CT_LABEL))
	.__END
	return obj
end

WF_FRAMES.__NewButton = function(str, pappy) 
	local object = WF_FRAMES.NewButton(str, pappy)
	local T = {}
	setmetatable( T , { __index = function( self , func )
		if func == "__END" then	return object end
		return function( self , ... )
			assert( object[func] , func .. " missing in object" )
			object[func]( object , ... )
			return self
		end
	end })
	return T
end
WF_FRAMES.NewButton = function(str, pappy)
	local nm = WF_UTIL.UniqueName(str)
	local obj = WF_CHAIN(WINDOW_MANAGER:CreateControl(nm, pappy or GuiRoot, CT_BUTTON))
	.__END
	return obj
end

WF_FRAMES.__NewSlider = function(str, pappy) 
	local object = WF_FRAMES.NewSlider(str, pappy)
	local T = {}
	setmetatable( T , { __index = function( self , func )
		if func == "__END" then	return object end
		return function( self , ... )
			assert( object[func] , func .. " missing in object" )
			object[func]( object , ... )
			return self
		end
	end })
	return T
end
WF_FRAMES.NewSlider = function(str, pappy)
	local nm = WF_UTIL.UniqueName(str)
	local obj = WF_CHAIN(WINDOW_MANAGER:CreateControl(nm, pappy or GuiRoot, CT_SLIDER))
	.__END
	return obj
end

WF_FRAMES.__NewEditBox = function(str, pappy) 
	local object = WF_FRAMES.NewEditBox(str, pappy)
	local T = {}
	setmetatable( T , { __index = function( self , func )
		if func == "__END" then	return object end
		return function( self , ... )
			assert( object[func] , func .. " missing in object" )
			object[func]( object , ... )
			return self
		end
	end })
	return T
end
WF_FRAMES.NewEditBox = function(str, pappy)
	local nm = WF_UTIL.UniqueName(str)
	local obj = WF_CHAIN(WINDOW_MANAGER:CreateControl(nm, pappy or GuiRoot, CT_EDITBOX))
	.__END
	return obj
end

WF_FRAMES.__NewLine = function(str, pappy) 
	local object = WF_FRAMES.NewLine(str, pappy)
	local T = {}
	setmetatable( T , { __index = function( self , func )
		if func == "__END" then	return object end
		return function( self , ... )
			assert( object[func] , func .. " missing in object" )
			object[func]( object , ... )
			return self
		end
	end })
	return T
end
WF_FRAMES.NewLine = function(str, pappy)
	local nm = WF_UTIL.UniqueName(str)
	local obj = WF_CHAIN(WINDOW_MANAGER:CreateControl(nm, pappy or GuiRoot, CT_LINE))
	.__END
	return obj
end

WF_FRAMES.PrepareBaseFrames = function()
	if WF_FRAMES.PrepareBase then return end
	
	WF_UITOP = WF_FRAMES.__NewTopLevel("WF_UITOP")
		:SetAnchor(TOP,GuiRoot,TOP,0,0)
		:SetDimensions(1000,1)
		:SetHidden(false)
	.__END
	WF_UIRIGHT = WF_FRAMES.__NewTopLevel("WF_UIRIGHT")
		:SetAnchor(RIGHT,GuiRoot,RIGHT,0,0)
		:SetDimensions(1,744)
		:SetHidden(false)
	.__END
	WF_UICENTER = WF_FRAMES.__NewTopLevel("WF_UICENTER")
		:SetAnchor(CENTER,GuiRoot,CENTER,0,0)
		:SetDimensions(1000,744)
		:SetHidden(false)
	.__END
	WF_UIBOTTOM = WF_FRAMES.__NewTopLevel("WF_UIBOTTOM")
		:SetAnchor(BOTTOM,GuiRoot,BOTTOM,0,0)
		:SetDimensions(1000,1)
		:SetHidden(false)
	.__END
	WF_UILEFT = WF_FRAMES.__NewTopLevel("WF_UILEFT")
		:SetAnchor(LEFT,GuiRoot,LEFT,0,0)
		:SetDimensions(1,744)
		:SetHidden(false)
	.__END
	
	WF_FRAMES.PrepareBase = true
end

WF_FRAMES.Events = {}
WF_FRAMES.Events.UIModeRegisteredWindows = {}

WF_FRAMES.Events.ToggleUIFrames = function(eventCode)
	if table_count(WF_FRAMES.Events.UIModeRegisteredWindows) == 0 then return end
	local shouldBeOff = WF_FRAMES.UIShouldBeHidden()
	
	for nm,st in pairs(WF_FRAMES.Events.UIModeRegisteredWindows) do
		local obj = _G[nm]
		if obj and st ~= nil then 
			if shouldBeOff then obj:Hide(true) end
			if not shouldBeOff then obj:Show() end
		end
	end
end

WF_FRAMES.UIShouldBeHidden = function()
	if not ZO_MainMenuCategoryBar:IsHidden() then return true end
	if not ZO_OptionsWindow:IsHidden() then return true end
	if not ZO_SharedTreeUnderlay:IsHidden() then return true end
	if not ZO_ChatterOption1:IsHidden() then return true end
	if not STORE_WINDOW["container"]:IsHidden() then return true end
	if not STABLE["control"]:IsHidden() then return true end
	if not SMITHING["control"]:IsHidden() then return true end
	if not LOCK_PICK["control"]:IsHidden() then return true end
	if not KEYBIND_STRIP["control"]:IsHidden() then return true end
	return false
end

WF_FRAMES.CalculateRelativeAnchor = function()
	local left, top		= frame:GetLeft(), frame:GetTop()
	local right, bottom	= frame:GetRight(), frame:GetBottom()
	local rootW, rootH	= GuiRoot:GetWidth(), GuiRoot:GetHeight()
	local point			= 0
	local x, y

	if (left < (rootW - right) and left < math.abs((left + right) / 2 - rootW / 2)) then
		x, point = left, 2 -- 'LEFT'
	elseif ((rootW - right) < math.abs((left + right) / 2 - rootW / 2)) then
		x, point = right - rootW, 8 -- 'RIGHT'
	else
		x, point = (left + right) / 2 - rootW / 2, 0
	end

	if (bottom < (rootH - top) and bottom < math.abs((bottom + top) / 2 - rootH / 2)) then
		y, point = top, point + 1 -- 'TOP|TOPLEFT|TOPRIGHT'
	elseif ((rootH - top) < math.abs((bottom + top) / 2 - rootH / 2)) then
		y, point = bottom - rootH, point + 4 -- 'BOTTOM|BOTTOMLEFT|BOTTOMRIGHT'
	else
		y = (bottom + top) / 2 - rootH / 2
	end

	point = (point == 0) and 128 or point -- 'CENTER'

	return point, x, y
end