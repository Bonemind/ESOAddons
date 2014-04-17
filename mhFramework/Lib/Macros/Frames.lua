local firstButtonX, firstButtonY = 0, 2
local winWidth, winHeight = 134, 280
local ctrWidth, ctrHeight = winWidth-4, winHeight-41

local makeMacroButton = function( idx )
	local tab = 1
	local c = {.7,.7,.7,1}
	if idx > 12 then tab = 2 end
	if idx > 24 then tab = 3 end
	if idx > 36 then tab = 4 end
	if tab == 1 then c = {.4,.8,1,1} end
	local win = WF_Macros.Containers[ tab ]
	if win then
		win = win.ctr
		local anchor = {}
		local positionIndex = idx - ((tab - 1) * 12)
		if positionIndex == 1 then anchor = { TOPLEFT, win, TOPLEFT, firstButtonX, firstButtonY }
		elseif positionIndex == 2 then anchor = { TOPLEFT, WF_Macros.Buttons[ (idx - 1).."" ].Backdrop, TOPRIGHT, 2, 0 }
		else anchor = { TOPLEFT, WF_Macros.Buttons[ (idx - 2).."" ].Backdrop, BOTTOMLEFT, 0, 2 } end
		if WF_Macros.Buttons[ idx.."" ] == nil then
			WF_Macros.Buttons[ idx.."" ] = WF_FRAMES.UIButton(
				win, 
				"wykkydsMacroFrame_macro"..idx, 
				anchor, 
				64, 
				38, 
				{.1,.1,.1,.5}, 
				{0,0,0,1}, 
				{"", 8, 1, 1}, 
				.9, 
				WF_Macros.macroName(idx..""), 
				{ c[1], c[2], c[3], c[4] }, 
				nil, 
				0, 
				0
			)
		end
		WF_Macros.Buttons[ idx.."" ].Button:EnableMouseButton(2,true)
		WF_Macros.Buttons[ idx.."" ].Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
		WF_Macros.Buttons[ idx.."" ].Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
		WF_Macros.Buttons[ idx.."" ].Button:SetHandler( "OnMouseEnter", function(self) 
			WF_Macros.Buttons[ idx.."" ].Backdrop:SetCenterColor(.3,.3,.3,.5)
			wykkydsMacroFrame:MouseIn() 
		end)
		WF_Macros.Buttons[ idx.."" ].Button:SetHandler( "OnMouseExit", function(self) 
			WF_Macros.Buttons[ idx.."" ].Backdrop:SetCenterColor(.1,.1,.1,.5)
			wykkydsMacroFrame:MouseOut() 
		end)
		WF_Macros.Buttons[ idx.."" ].Button:SetHandler( "OnClicked", function(self, button) 
			if button == 1 then wykkydsFramework.MacroButton(idx); return; end
			for w = 1, WF_Macros.MaxMacros, 1 do
				local ww = _G["wykkydsMacroFrame_RenamePopup"..w]
				if ww ~= nil then ww:CloseMe() end
				ww = _G["wykkydsMacroFrame_EditPopup"..w]
				if ww ~= nil then ww:CloseMe() end
			end
			local popAnchor = WF_Macros.getPopupAnchor( idx )
			WF_FRAMES.UIPopup( 
				"wykkydsMacroFrame_popup", 
				nil, 
				popAnchor, 136, 
				{
					[1] = {
						name = "Edit Macro",
						onClick = function(self,button,index) WF_Macros.Edit(index) end,
						params = idx
					},
					[2] = {
						name = "Rename Macro",
						onClick = function(self,button,index) WF_Macros.Rename(index) end,
						params = idx
					},
					[3] = {
						name = "Clear Macro",
						onClick = function() wykkydsFramework.ClearMacro(idx.."") end,
						params = idx
					}
				} 
			)
		end)
	end
end

local macroTab = function( idx )
	local containerKey = "wykkydsMacroFrame_tab"..idx.."_container"
	local buttonKey = "wykkydsMacroFrame_tab"..idx.."_button"
	
	local anchor = {}
	if idx == 1 then anchor = { TOPLEFT, wykkydsMacroFrame.Backdrop, TOPLEFT, 2, 18 }
	else anchor = { LEFT, WF_Macros.Containers[ idx-1 ].btn.Backdrop, RIGHT, 2, 0 }
	end
	
	local ctr = _G[containerKey]
	if ctr == nil then ctr = WF_FRAMES.UIBackdrop(
			wykkydsMacroFrame.Backdrop, 
			containerKey, 
			{ TOP, wykkydsMacroFrame.Backdrop, TOP, 0, 38 }, 
			ctrWidth, ctrHeight, 
			{0,0,0,0}, 
			{0,0,0,0}, 
			{"", 8, 1, 0}, 
			1, 
			nil
		)
	end
	
	WF_Macros.Containers[ idx ] = {}
	WF_Macros.Containers[ idx ].ctr = ctr.Backdrop
	
	local btn = _G[buttonKey]
	if btn == nil then btn = WF_FRAMES.UIButton(
			wykkydsMacroFrame.Backdrop, 
			buttonKey, 
			anchor, 
			31, 
			20, 
			{0,0,.2,1}, 
			{.7,.7,.7,.5}, 
			{"", 8, 1, 1}, 
			.9, 
			(idx..""), 
			{.7,.7,.7,1}, 
			nil, 
			0, 
			0
		) 
	end
	btn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
	btn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
	btn.Label:SetScale(.85)
	btn.Label:SetAnchor( CENTER, btn.Backdrop, CENTER, 0, -2 )
	btn.Button:SetHandler( "OnMouseEnter", function(self) 
		wykkydsMacroFrame:MouseIn() 
	end)
	btn.Button:SetHandler( "OnMouseExit", function(self) 
		wykkydsMacroFrame:MouseOut() 
	end)
	
	WF_Macros.Containers[ idx ].btn = btn
end

wykkydsFramework.MacroFrame = function(keystroke)
	local key = "wykkydsMacroFrame"
	if not _G[key] then
		WF_FRAMES.UIWindow:Create( key, "Wykkyd's Macros", true, true, WF_SavedVars.MacroFrame["Settings"], winWidth, winHeight, 1 )
		
		macroTab( 1 )
		macroTab( 2 )
		macroTab( 3 )
		macroTab( 4 )
		
		for b = 1, WF_Macros.MaxMacros, 1 do makeMacroButton( b ) end
		
		local tabToShow = WF_SavedVars.MacroFrame["lastTab"] or 1
		
		local hideAllTabs = function()
			for idx = 1, 4, 1 do
				if WF_Macros.Containers[ idx ] then
					if WF_Macros.Containers[ idx ].ctr then
						WF_Macros.Containers[ idx ].ctr:SetHidden( true )
					end
					if WF_Macros.Containers[ idx ].btn then
						WF_Macros.Containers[ idx ].btn.Label:SetColor(.7,.7,.7,1)
						WF_Macros.Containers[ idx ].btn.Backdrop:SetCenterColor(.3,.3,.3,.5)
					end
				end
			end
		end
		local showTab = function( idx )
			WF_SavedVars.MacroFrame["lastTab"] = idx
			hideAllTabs()
			if WF_Macros.Containers[ idx ] then
				if WF_Macros.Containers[ idx ].ctr then
					WF_Macros.Containers[ idx ].ctr:SetHidden( false )
				end
				if WF_Macros.Containers[ idx ].btn then
					WF_Macros.Containers[ idx ].btn.Label:SetColor(.8,1,.8,1)
					WF_Macros.Containers[ idx ].btn.Backdrop:SetCenterColor(.5,.5,1,.5)
				end
			end
		end
		
		showTab( tabToShow )
		
		for idx = 1, 4, 1 do
			if WF_Macros.Containers[ idx ] then
				if WF_Macros.Containers[ idx ].btn then
					WF_Macros.Containers[ idx ].btn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
					WF_Macros.Containers[ idx ].btn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
					WF_Macros.Containers[ idx ].btn.Button:SetHandler( "OnMouseEnter", function(self) wykkydsMacroFrame:MouseIn() end)
					WF_Macros.Containers[ idx ].btn.Button:SetHandler( "OnMouseExit", function(self) wykkydsMacroFrame:MouseOut() end)
					WF_Macros.Containers[ idx ].btn.Button:SetHandler( "OnClicked", function(self) showTab( idx ) end)
				end
			end
		end
		
		if WF_SavedVars.MacroFrame["Settings"] == nil then WF_SavedVars.MacroFrame["Settings"] = {} end
		if WF_SavedVars.MacroFrame["Settings"].Hidden == nil then WF_SavedVars.MacroFrame["Settings"].Hidden = true end
		if WF_SavedVars.MacroFrame["Shown"] == nil then WF_SavedVars.MacroFrame["Shown"] = false end
			
		WF_SavedVars.MacroFrame["Settings"].Hidden = ( not WF_SavedVars.MacroFrame["Shown"] );
		wykkydsMacroFrame.Backdrop:SetHidden( not WF_SavedVars.MacroFrame["Shown"] )
		
		if keystroke then 
			if wykkydsMacroFrame.Backdrop:IsHidden() then 
				wykkydsMacroFrame:SetHidden(false); 
				wykkydsMacroFrame.Backdrop:SetHidden(false); 
				WF_SavedVars.MacroFrame["Shown"] = true; 
				WF_SavedVars.MacroFrame["Settings"].Hidden = false;
			else 
				wykkydsMacroFrame:SetHidden(true); 
				wykkydsMacroFrame.Backdrop:SetHidden(true); 
				WF_SavedVars.MacroFrame["Shown"] = false; 
				WF_SavedVars.MacroFrame["Settings"].Hidden = true;
			end
		end
	else
		if keystroke then
			if wykkydsMacroFrame.Backdrop:IsHidden() then 
				wykkydsMacroFrame:SetHidden(false); 
				wykkydsMacroFrame.Backdrop:SetHidden(false); 
				WF_SavedVars.MacroFrame["Shown"] = true; 
				WF_SavedVars.MacroFrame["Settings"].Hidden = false;
			else 
				wykkydsMacroFrame:SetHidden(true); 
				wykkydsMacroFrame.Backdrop:SetHidden(true); 
				WF_SavedVars.MacroFrame["Shown"] = false; 
				WF_SavedVars.MacroFrame["Settings"].Hidden = true;
			end
		end
	end
end