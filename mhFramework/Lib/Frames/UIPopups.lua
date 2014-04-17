local verticalScrollTexture = "/esoui/art/miscellaneous/scrollbox_elevator.dds"

WF_FRAMES.UIPopup = function( name, title, anchor, width, textLinks, closeCallback, ignoreMouseOut )
	local obj = _G[name]
	if obj == nil then 
		obj = WF_FRAMES.__NewTopLevel(name)
			:SetAnchor( anchor[1], anchor[2], anchor[3], anchor[4], anchor[5] )
			:SetHidden(false)
			:SetMovable(false)
			:SetMouseEnabled(true)
			:SetDimensions( width, 40 )
		.__END
		obj = WF_FRAMES.UIBackdrop(
			obj, 
			name, 
			{CENTER,obj,CENTER,0,0}, 
			obj:GetWidth(), 
			obj:GetHeight(), 
			{0.1,0.1,0.1,1}, 
			{0,0,0,1}, 
			{"", 8, 1, 1}, 
			1, 
			obj
		)
		if title then
			obj.Title = WF_FRAMES.UITextBlock(
				obj.Backdrop, 
				name.."_Title", 
				{ TOPLEFT, obj.Backdrop, TOPLEFT, 1, 1 }, 
				width, 
				16, 
				{0,0,0,1}, 
				{0.2,0.2,0.7,1}, 
				{"", 8, 1, 1}, 
				1, 
				title, 
				{1,1,1,1}, 
				nil, 
				0, 
				-4
			)
			obj.Title.Backdrop:SetAnchor( TOPRIGHT, obj.Backdrop, TOPRIGHT, -1, 1 )
			obj.Title.Label:SetWidth(obj.Title.Backdrop:GetWidth()*1.7)
			obj.Title.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.Title.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
			--obj.Title.Label:SetAnchor(LEFT, obj.Title.Backdrop, LEFT, 3, 0)
			obj.Title.Label:SetScale(.85)
		end
		obj.MousedOver = false
		obj.ignoreMouseOut = ignoreMouseOut
		function obj:IsMousedOver() if obj.ignoreMouseOut then return false else return self.MousedOver end end
		function obj:MouseIn() 
			obj.MousedOver = true
		end
		function obj:MouseOut() 
			obj.MousedOver = false
			obj:SetHidden( true )
			WF_Tic( name.."_hoverWatch" )
			if closeCallback ~= nil then closeCallback() end
		end
		function obj:CloseMe() 
			obj:SetHidden( true )
			WF_Tic( name.."_hoverWatch" )
		end
		function obj:ShowMe() 
			obj:SetHidden( false )
			obj.MousedOver = false
			WF_Tic( name.."_hoverWatch", function()
				if ( obj:IsMousedOver() and WINDOW_MANAGER:IsMouseOverWorld() )
				or IsUnitInCombat("player") 
				or IsPlayerMoving() then
					obj:MouseOut()
				end
			end )
		end
		obj:ShowMe()
		obj:SetHandler( "OnMouseEnter", function(self) obj:MouseIn() end )
		local startY, modY = 0, 0
		local widest, count = 0, 0
		if title == nil then modY = 6 end
		obj.Clickies = {}
		if textLinks ~= nil then
			if table_count(textLinks) > 0 then
				for i,tbl in WF_PairsByKeys(textLinks) do
					startY = 2 + modY + (count * 20)
					count = count + 1
					local btn = WF_FRAMES.UIButton(
						obj, name.."_link", 
						{TOPLEFT, obj.Backdrop, TOPLEFT, 4, startY }, 
						width or 72, 18, 
						{0,0,0,0}, 
						{0.2,0.2,0.7,0}, 
						{"", 8, 1, 0}, 
						1, tbl.name, 
						{1,1,1,1}, 
						nil, nil, -4
					)
					local ww = btn.Label:GetWidth() + 2
					if ww > widest then widest = ww end
					btn.Button:SetWidth( ww )
					btn.Button:EnableMouseButton(2,true)
					btn.Button:SetHandler("OnClicked", function(self,button) tbl.onClick(self,button,tbl.params); obj:MouseOut(); end )
					btn.Button:SetHandler("OnMouseEnter", function() btn.Label:SetColor(.5,.6,1,1) end)
					btn.Button:SetHandler("OnMouseExit", function() btn.Label:SetColor(1,1,1,1) end)
					obj.Clickies[i] = btn
				end
			end
		end
		if title then count = count + 1 end
		local offset = 6
		if title then offset = 20 end
		if widest == 0 then widest = nil end
		obj.Backdrop:ClearAnchors()
		obj:SetDimensions( widest or width, (count*22)+offset )
		obj.Backdrop:SetAnchor(TOPLEFT, obj, TOPLEFT, 0, 0)
		obj.Backdrop:SetAnchor(BOTTOMRIGHT, obj, BOTTOMRIGHT, 0, 0)
		obj:SetHidden( false )
		return obj
	end
	obj.MousedOver = false
	obj:SetHidden( false )
	obj:ClearAnchors()
	obj:SetDrawLayer(2)
	obj:SetAnchor( anchor[1], anchor[2], anchor[3], anchor[4], anchor[5] )
	obj.Backdrop:ClearAnchors()
	obj.Backdrop:SetAnchor(TOPLEFT, obj, TOPLEFT, 0, 0)
	obj.Backdrop:SetAnchor(BOTTOMRIGHT, obj, BOTTOMRIGHT, 0, 0)
	if textLinks ~= nil then
		if table_count(textLinks) > 0 then
			for i = 1, table_count(textLinks), 1 do
				obj.Clickies[i].Button:SetHandler("OnClicked", function(self,button) 
					textLinks[i].onClick(self,button,textLinks[i].params); 
					obj:MouseOut(); 
				end )
			end
		end
	end
	obj:ShowMe()
	return obj
end

WF_FRAMES.UIDropDown = function( name, title, anchor, width, textLinks, closeCallback, ignoreMouseOut, color )
	local obj = WF_FRAMES.UIPopup( name, title, anchor, width, textLinks, closeCallback, ignoreMouseOut )
	if table_count(color) == 4 then obj.Backdrop:SetCenterColor( color[1], color[2], color[3], color[4] ) end
	if table_count(obj.Clickies) > 5 then
		local cheight = obj.Clickies[1].Backdrop:GetHeight()
		obj.LastScrolledTo = 1
		obj:SetHeight( 8+(cheight*5)+(2*5) )
		obj.Backdrop:SetHeight( 8+(cheight*5)+(2*5) )
		obj.Backdrop:SetMouseEnabled(true)
		for c,o in pairs(obj.Clickies) do
			obj.Clickies[c].Backdrop:SetAlpha(0)
			obj.Clickies[c].Backdrop:ClearAnchors()
			obj.Clickies[c].Backdrop:SetAnchor( BOTTOM, GuiRoot, TOP, 0, -10000 )
		end
		if obj.slider == nil then obj.slider = WF_FRAMES.__NewSlider( name.."_Slider", obj )
				:SetDimensions( 12, obj.Backdrop:GetHeight() )
				:SetMouseEnabled( true )
				:SetThumbTexture( verticalScrollTexture, verticalScrollTexture, verticalScrollTexture, 20, 24, 0, 0, 1, 1 )
				:SetValue( 1 )
				:SetValueStep( 1 )
				:SetMinMax( 1, table_count(obj.Clickies)-4 )
				:SetAnchor( LEFT, obj, RIGHT, -2, 0 )
				:SetHandler("OnValueChanged",function( self, value, eventReason) 
					for x = obj.LastScrolledTo, obj.LastScrolledTo+4, 1 do
						obj.Clickies[x].Backdrop:SetAlpha(0)
						obj.Clickies[x].Backdrop:ClearAnchors()
						obj.Clickies[x].Backdrop:SetAnchor( BOTTOM, GuiRoot, TOP, 0, -10000 )
					end
					obj.LastScrolledTo = value
					local cc = 0
					for x = value, value+4, 1 do
						obj.Clickies[x].Backdrop:SetAlpha(1)
						obj.Clickies[x].Backdrop:ClearAnchors()
						obj.Clickies[x].Backdrop:SetAnchor( TOPLEFT, obj.Backdrop, TOPLEFT, 4, 6+(2*cc)+(cc * cheight) )
						cc = cc + 1
					end
				end)
			.__END
		end
		obj:SetDrawLayer(3)
		obj.Backdrop:SetHandler( "OnMouseWheel", function(self, delta, ctrl, alt, shift) obj.slider:SetValue( obj.slider:GetValue()+(delta*-1) ) end )
		local cc = 0
		obj.LastScrolledTo = obj.slider:GetValue()
		for x = obj.LastScrolledTo, obj.LastScrolledTo+4, 1 do
			obj.Clickies[x].Backdrop:SetAlpha(1)
			obj.Clickies[x].Backdrop:ClearAnchors()
			obj.Clickies[x].Backdrop:SetAnchor( TOPLEFT, obj.Backdrop, TOPLEFT, 4, 6+(2*cc)+(cc * cheight) )
			cc = cc + 1
		end
	end
	return obj
end

WF_FRAMES.UIAlert = function()

end

WF_FRAMES.UIOkCancel = function()

end