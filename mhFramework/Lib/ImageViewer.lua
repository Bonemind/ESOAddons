local function makeImageViewer()
	WF_ImageViewer = WF_FRAMES.__NewTopLevel("WF_ImageViewer")
		:SetAnchor( CENTER, GuiRoot, CENTER, 0, 0 )
		:SetResizeToFitDescendents( true )
		:SetMouseEnabled( true )
	.__END
	
	WF_ImageViewer.CurrentPosition = 1
	WF_ImageViewer.MaxPosition = table_count(WF_CONSTANTS.GameImages)
	WF_ImageViewer.MinScale = 8
	WF_ImageViewer.CurrentScale = 64
	WF_ImageViewer.MaxScale = 512
	
	WF_ImageViewerBackdrop = WF_FRAMES.__NewBackdrop( "WF_ImageViewerBackdrop", WF_ImageViewer )
		:SetAnchor( BOTTOM, WF_ImageViewer, BOTTOM, 0, 0 )
		:SetDimensions( 300, 32 )
		:SetCenterColor( 0.05, 0.05, 0.05, .85 )
		:SetEdgeColor( 0, 0, 0, .90 )
		:SetEdgeTexture( "", 8, 1, 1 )
		:SetAlpha( 1 )
		:SetHidden( false )
		:SetMouseEnabled( true )
		:SetHandler( "OnMouseWheel", function(self, delta, ctrl, alt, shift) 
				if delta > 0 then
					if WF_ImageViewer.CurrentPosition < WF_ImageViewer.MaxPosition then
						WF_ImageViewer.CurrentPosition = WF_ImageViewer.CurrentPosition + 1
						WF_ImageViewerLabelCurr:SetText( WF_ImageViewer.CurrentPosition )
						WF_ImageViewerImage:SetTexture( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
						WF_ImageViewerEdit:SetText( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
					end
				else
					if WF_ImageViewer.CurrentPosition > 1 then
						WF_ImageViewer.CurrentPosition = WF_ImageViewer.CurrentPosition - 1
						WF_ImageViewerLabelCurr:SetText( WF_ImageViewer.CurrentPosition )
						WF_ImageViewerImage:SetTexture( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
						WF_ImageViewerEdit:SetText( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
					end
				end
			end )
	.__END	
	
	WF_ImageViewerLabel = WF_CHAIN( WINDOW_MANAGER:CreateControl( "WF_ImageViewerLabel", WF_ImageViewer, CT_LABEL ) )
		:SetDimensions( 150, 26 )
		:SetAnchor( CENTER, WF_ImageViewerBackdrop, CENTER, 0, 0 )
		:SetFont( "ZoFontWinH4" )
		:SetText( "Image Viewer" )
		:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
		:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
		:SetColor( .5, .65, .9, 1 )
		:SetMouseEnabled( true )
		:SetHandler( "OnMouseWheel", function(self, delta, ctrl, alt, shift) 
			if delta > 0 then
				if WF_ImageViewer.CurrentPosition < WF_ImageViewer.MaxPosition then
					WF_ImageViewer.CurrentPosition = WF_ImageViewer.CurrentPosition + 1
					WF_ImageViewerLabelCurr:SetText( WF_ImageViewer.CurrentPosition )
					WF_ImageViewerImage:SetTexture( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
					WF_ImageViewerEdit:SetText( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
				end
			else
				if WF_ImageViewer.CurrentPosition > 1 then
					WF_ImageViewer.CurrentPosition = WF_ImageViewer.CurrentPosition - 1
					WF_ImageViewerLabelCurr:SetText( WF_ImageViewer.CurrentPosition )
					WF_ImageViewerImage:SetTexture( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
					WF_ImageViewerEdit:SetText( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
				end
			end
		end )
	.__END
	
	WF_ImageViewerLabelCurr = WF_CHAIN( WINDOW_MANAGER:CreateControl( "WF_ImageViewerLabelCurr", WF_ImageViewer, CT_LABEL ) )
		:SetDimensions( 150, 26 )
		:SetAnchor( TOPRIGHT, WF_ImageViewerBackdrop, BOTTOM, -6, 4 )
		:SetFont( "ZoFontWinH4" )
		:SetText( WF_ImageViewer.CurrentPosition )
		:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["right"])
		:SetColor( .5, .65, .9, 1 )
		:SetScale( .8 )
	.__END
	
	WF_ImageViewerLabelMax = WF_CHAIN( WINDOW_MANAGER:CreateControl( "WF_ImageViewerLabelMax", WF_ImageViewer, CT_LABEL ) )
		:SetDimensions( 150, 26 )
		:SetAnchor( TOPLEFT, WF_ImageViewerBackdrop, BOTTOM, -2, 4 )
		:SetFont( "ZoFontWinH4" )
		:SetText( "/ "..WF_ImageViewer.MaxPosition )
		:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["left"])
		:SetColor( .5, .65, .9, 1 )
		:SetScale( .8 )
	.__END
	
	WF_ImageViewerEditBackdrop = WF_FRAMES.__NewBackdrop( "WF_ImageViewerEditBackdrop", WF_ImageViewer )
		:SetAnchor( BOTTOM, WF_ImageViewerBackdrop, TOP, 0, -4 )
		:SetDimensions( 500, 32 )
		:SetCenterColor( 0.05, 0.05, 0.05, .85 )
		:SetEdgeColor( 0, 0, 0, .90 )
		:SetEdgeTexture( "", 8, 1, 1 )
		:SetAlpha( 1 )
		:SetHidden( false )
	.__END
	
	WF_ImageViewerEdit = WF_CHAIN(WINDOW_MANAGER:CreateControlFromVirtual( "WF_ImageViewerEdit", WF_ImageViewer, false and "ZO_DefaultEditMultiLineForBackdrop" or "ZO_DefaultEditForBackdrop" ) )
		:SetDimensions( 490, 24 )
		:ClearAnchors()
		:SetAnchor( CENTER, WF_ImageViewerEditBackdrop, CENTER, 0, 0 )
		:SetText( WF_CONSTANTS.GameImages[1] )
	.__END
	
	WF_ImageViewerImageBackdrop = WF_FRAMES.__NewBackdrop( "WF_ImageViewerImageBackdrop", WF_ImageViewer )
		:SetAnchor( BOTTOM, WF_ImageViewerEdit, TOP, 0, -8 )
		:SetDimensions( WF_ImageViewer.CurrentScale+8, WF_ImageViewer.CurrentScale+8 )
		:SetCenterColor( 0.05, 0.05, 0.05, .5 )
		:SetEdgeColor( 0, 0, 0, .55 )
		:SetEdgeTexture( "", 8, 1, 1 )
		:SetAlpha( 1 )
		:SetHidden( false )
	.__END
	
	WF_ImageViewerImage = WF_FRAMES.__NewImage( "WF_ImageViewerImage", WF_ImageViewer )
		:SetAnchor( CENTER, WF_ImageViewerImageBackdrop, CENTER, 0, 0 )
		:SetDimensions( WF_ImageViewer.CurrentScale, WF_ImageViewer.CurrentScale )
		:SetHidden( false )
		:SetMouseEnabled( true )
		:SetTexture( WF_CONSTANTS.GameImages[1] )
		:SetHandler( "OnMouseWheel", function(self, delta, ctrl, alt, shift) 
			if delta > 0 then
				if WF_ImageViewer.CurrentScale < WF_ImageViewer.MaxScale then
					WF_ImageViewer.CurrentScale = WF_ImageViewer.CurrentScale + 4
					WF_ImageViewerImageBackdrop:SetDimensions( WF_ImageViewer.CurrentScale+8, WF_ImageViewer.CurrentScale+8 )
					WF_ImageViewerImage:SetDimensions( WF_ImageViewer.CurrentScale, WF_ImageViewer.CurrentScale )
				end
			else
				if WF_ImageViewer.CurrentScale < WF_ImageViewer.MinScale then
					WF_ImageViewer.CurrentScale = WF_ImageViewer.CurrentScale - 4
					WF_ImageViewerImageBackdrop:SetDimensions( WF_ImageViewer.CurrentScale+8, WF_ImageViewer.CurrentScale+8 )
					WF_ImageViewerImage:SetDimensions( WF_ImageViewer.CurrentScale, WF_ImageViewer.CurrentScale )
				end
			end
		end )
	.__END
	
	WF_ImageViewerNext = WF_FRAMES.UIButton(
		WF_ImageViewer, "WF_ImageViewerNext", { RIGHT, WF_ImageViewerBackdrop, RIGHT, -10, 0 }, 32, 24,  {0,0,0,0}, 
		{0.2,0.2,0.7,0}, {"", 8, 1, 0}, 1, ">>", {.75, .75, .3, 1 }, nil, nil, -4
	)
	WF_ImageViewerNext.Button:SetMouseEnabled( true )
	WF_ImageViewerNext.Button:SetHandler( "OnMouseWheel", function(self, delta, ctrl, alt, shift) 
			if delta > 0 then
				if WF_ImageViewer.CurrentPosition < WF_ImageViewer.MaxPosition then
					WF_ImageViewer.CurrentPosition = WF_ImageViewer.CurrentPosition + 1
					WF_ImageViewerLabelCurr:SetText( WF_ImageViewer.CurrentPosition )
					WF_ImageViewerImage:SetTexture( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
					WF_ImageViewerEdit:SetText( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
				end
			else
				if WF_ImageViewer.CurrentPosition > 1 then
					WF_ImageViewer.CurrentPosition = WF_ImageViewer.CurrentPosition - 1
					WF_ImageViewerLabelCurr:SetText( WF_ImageViewer.CurrentPosition )
					WF_ImageViewerImage:SetTexture( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
					WF_ImageViewerEdit:SetText( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
				end
			end
		end )
	WF_ImageViewerNext.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
	WF_ImageViewerNext.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
	WF_ImageViewerNext.Button:EnableMouseButton(2,true)
	WF_ImageViewerNext.Button:SetHandler("OnClicked", function(self,button) 
		if button == 1 then
			if WF_ImageViewer.CurrentPosition < WF_ImageViewer.MaxPosition then
				WF_ImageViewer.CurrentPosition = WF_ImageViewer.CurrentPosition + 1
				WF_ImageViewerLabelCurr:SetText( WF_ImageViewer.CurrentPosition )
				WF_ImageViewerImage:SetTexture( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
				WF_ImageViewerEdit:SetText( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
			end
		else
			if WF_ImageViewer.CurrentScale < WF_ImageViewer.MaxScale then
				WF_ImageViewer.CurrentScale = WF_ImageViewer.CurrentScale + 4
				WF_ImageViewerImageBackdrop:SetDimensions( WF_ImageViewer.CurrentScale+8, WF_ImageViewer.CurrentScale+8 )
				WF_ImageViewerImage:SetDimensions( WF_ImageViewer.CurrentScale, WF_ImageViewer.CurrentScale )
			end
		end
	end )
	WF_ImageViewerNext.Button:SetHandler("OnMouseEnter", function() WF_ImageViewerNext.Label:SetColor( .5, .65, .9, 1 ) end)
	WF_ImageViewerNext.Button:SetHandler("OnMouseExit", function() WF_ImageViewerNext.Label:SetColor( .75, .75, .3, 1 ) end)
	
	WF_ImageViewerPrev = WF_FRAMES.UIButton(
		WF_ImageViewer, "WF_ImageViewerPrev", { LEFT, WF_ImageViewerBackdrop, LEFT, 10, 0 }, 32, 24,  {0,0,0,0}, 
		{0.2,0.2,0.7,0}, {"", 8, 1, 0}, 1, "<<", {.75, .75, .3, 1 }, nil, nil, -4
	)
	WF_ImageViewerPrev.Button:SetMouseEnabled( true )
	WF_ImageViewerPrev.Button:SetHandler( "OnMouseWheel", function(self, delta, ctrl, alt, shift) 
			if delta > 0 then
				if WF_ImageViewer.CurrentPosition < WF_ImageViewer.MaxPosition then
					WF_ImageViewer.CurrentPosition = WF_ImageViewer.CurrentPosition + 1
					WF_ImageViewerLabelCurr:SetText( WF_ImageViewer.CurrentPosition )
					WF_ImageViewerImage:SetTexture( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
					WF_ImageViewerEdit:SetText( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
				end
			else
				if WF_ImageViewer.CurrentPosition > 1 then
					WF_ImageViewer.CurrentPosition = WF_ImageViewer.CurrentPosition - 1
					WF_ImageViewerLabelCurr:SetText( WF_ImageViewer.CurrentPosition )
					WF_ImageViewerImage:SetTexture( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
					WF_ImageViewerEdit:SetText( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
				end
			end
		end )
	WF_ImageViewerPrev.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
	WF_ImageViewerPrev.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
	WF_ImageViewerPrev.Button:EnableMouseButton(2,true)
	WF_ImageViewerPrev.Button:SetHandler("OnClicked", function(self,button) 
		if button == 1 then
			if WF_ImageViewer.CurrentPosition > 1 then
				WF_ImageViewer.CurrentPosition = WF_ImageViewer.CurrentPosition - 1
				WF_ImageViewerLabelCurr:SetText( WF_ImageViewer.CurrentPosition )
				WF_ImageViewerImage:SetTexture( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
				WF_ImageViewerEdit:SetText( WF_CONSTANTS.GameImages[WF_ImageViewer.CurrentPosition] )
			end
		else
			if WF_ImageViewer.CurrentScale > WF_ImageViewer.MinScale then
				WF_ImageViewer.CurrentScale = WF_ImageViewer.CurrentScale - 4
				WF_ImageViewerImageBackdrop:SetDimensions( WF_ImageViewer.CurrentScale+8, WF_ImageViewer.CurrentScale+8 )
				WF_ImageViewerImage:SetDimensions( WF_ImageViewer.CurrentScale, WF_ImageViewer.CurrentScale )
			end
		end
	end )
	WF_ImageViewerPrev.Button:SetHandler("OnMouseEnter", function() WF_ImageViewerPrev.Label:SetColor( .5, .65, .9, 1 ) end)
	WF_ImageViewerPrev.Button:SetHandler("OnMouseExit", function() WF_ImageViewerPrev.Label:SetColor( .75, .75, .3, 1 ) end)
end

function WF_ImageViewerWindow()
	if _G["WF_ImageViewer"] == nil then makeImageViewer(); return; end
	if _G["WF_ImageViewer"]:IsHidden() then _G["WF_ImageViewer"]:SetHidden(false); return; end
	_G["WF_ImageViewer"]:SetHidden(true)
end