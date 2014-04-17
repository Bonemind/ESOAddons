WF_Macros = {}
WF_Macros.Buttons = {}
WF_Macros.Containers = {}

WF_Macros.MaxMacros = 48

WF_Macros.getPopupAnchor = function( idx, forceTop )
	local anchor = { CENTER, GuiRoot, CENTER, 0, 0 }
	if wykkydsMacroFrame == nil then return anchor end
	if wykkydsMacroFrame.Backdrop == nil then return anchor end
	if WF_Macros.Buttons[ idx.."" ] == nil then return anchor end
	if WF_Macros.Buttons[ idx.."" ].Backdrop == nil then return anchor end
	local addOnX, addOnY = wykkydsMacroFrame.Backdrop:GetCenter()
	local guiRootX, guiRootY = GuiRoot:GetCenter()
	local offsetY = WF_Macros.Buttons[ idx.."" ].Backdrop:GetTop() - wykkydsMacroFrame.Backdrop:GetTop()
	if forceTop then offsetY = 0 end
	if addOnX <= guiRootX then anchor = { TOPLEFT, wykkydsMacroFrame.Backdrop, TOPRIGHT, 2, offsetY }
	else anchor = { TOPRIGHT, wykkydsMacroFrame.Backdrop, TOPLEFT, -2, offsetY } end
	return anchor
end

WF_Macros.macroName = function(text)
	local key = string_trim(text)
	local alt = string.sub(text,1,6)
	local goodMacroNum = false
	for m = 1, WF_Macros.MaxMacros, 1 do
		if key == (m.."") then goodMacroNum = true end
	end
	if not goodMacroNum then return alt end
	if WF_SavedVars.MacroFrame["Macros"] == nil then return alt end
	if WF_SavedVars.MacroFrame["Macros"][key] == nil then return alt end
	if WF_SavedVars.MacroFrame["Macros"][key].Name == nil then return alt end
	return string.sub(WF_SavedVars.MacroFrame["Macros"][key].Name,1,6)
end

WF_Macros.Load = function( idx )
	local settings = {}
	local key = idx..""
	local goodMacroNum = false
	for m = 1, WF_Macros.MaxMacros, 1 do
		if key == (m.."") then goodMacroNum = true end
	end
	if WF_SavedVars.MacroFrame["Macros"] == nil then WF_SavedVars.MacroFrame["Macros"] = {}; return; end
	if goodMacroNum then
		local cmd = WF_SavedVars.MacroFrame["Macros"][key]
		if cmd ~= nil then
			if cmd.Name ~= nil then settings.Name = cmd.Name end
			if cmd.Commands ~= nil then settings.Commands = cmd.Commands end
		end
	end
	return settings
end

WF_Macros.Save = function( idx, settings )
	local key = idx..""
	local goodMacroNum = false
	for m = 1, WF_Macros.MaxMacros, 1 do
		if key == (m.."") then goodMacroNum = true end
	end
	if WF_SavedVars.MacroFrame["Macros"] == nil then WF_SavedVars.MacroFrame["Macros"] = {}; return; end
	if goodMacroNum then
		WF_SavedVars.MacroFrame["Macros"][key] = {}
		WF_SavedVars.MacroFrame["Macros"][key].Name = settings.Name
		WF_SavedVars.MacroFrame["Macros"][key].Commands = {}
		if settings.Commands ~= nil then
			for cc = 1, 5, 1 do
				if settings.Commands[cc] ~= nil then
					if settings.Commands[cc].Type ~= 0 and settings.Commands[cc].Type ~= nil then
						table.insert( WF_SavedVars.MacroFrame["Macros"][key].Commands, settings.Commands[cc] )
					end
				end
			end
		end
		if WF_Macros.Buttons[ idx.."" ] ~= nil then
			WF_Macros.Buttons[ idx.."" ].Label:SetText( WF_Macros.macroName(idx.."") )
		end
		d("[WF] Macro Saved.")
	end
end

wykkydsFramework.MacroButton = function(num)
	local key = num..""
	local goodMacroNum = false
	for m = 1, WF_Macros.MaxMacros, 1 do
		if key == (m.."") then goodMacroNum = true end
	end
	if WF_SavedVars.MacroFrame["Macros"] == nil then WF_SavedVars.MacroFrame["Macros"] = {}; return; end
	if goodMacroNum then
		local cmd = WF_SavedVars.MacroFrame["Macros"][key]
		if cmd ~= nil then
			if cmd.Name ~= nil and cmd.Name ~= nil and cmd.Commands ~= nil then
				for _,c in ipairs(cmd.Commands) do
					if c.Type == WF_MACRO_TYPE_NIL then
					--elseif c.Type == WF_MACRO_TYPE_CHAT then SendChatMessage(c.Param2, c.Param1, nil)
					elseif c.Type == WF_MACRO_TYPE_EMOTE then PlayEmote(c.Param1)
					elseif c.Type == WF_MACRO_TYPE_ADDON then wykkydsFramework.Commands.Callbacks[c.Param1].Callback(c.Param2)
					elseif c.Type == WF_MACRO_TYPE_GEAR then WF_Outfitter.GC.LoadCommands(c.Param1)
					elseif c.Type == WF_MACRO_TYPE_SKILL then WF_Outfitter.ABT.loadSet(c.Param1)
					end
				end
			end
		end
	end
end
