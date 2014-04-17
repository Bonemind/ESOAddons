wykkydsFramework.MacroHelp = function()
	d("[WF] Macro Help:")
	d("[WF] /macrowin << shows macro window")
	d("> Macros are now controlled by right clicking inside of the macro window. Set your KEYBIND for toggling the macro window and simply RIGHT CLICK on the macro button you wish to manage.")
end

wykkydsFramework.ClearMacro = function(text)
	local str = string_trim(text)
	local key = nil
	for m = 1, WF_Macros.MaxMacros, 1 do
		local ms = (m.."")
		local lm = string.len(ms)
		if string.sub(str,1,lm) == ms then key = ms end
	end
	if key == nil then
		return
	end
	if WF_SavedVars.MacroFrame["Macros"] == nil then WF_SavedVars.MacroFrame["Macros"] = {} end
	WF_SavedVars.MacroFrame["Macros"][key] = nil
	if WF_Macros.Buttons[key] ~= nil then WF_Macros.Buttons[key].Label:SetText(key) end
	d("[WF] MACRO "..key.." CLEARED")
end

local lastRename = nil
wykkydsFramework.RenameMacro = function(text, newName)
	local str = string_trim(text.."")
	local key = nil
	for m = 1, WF_Macros.MaxMacros, 1 do
		local ms = (m.."")
		local lm = string.len(ms)
		if string.sub(str,1,lm) == ms then key = ms end
	end
	if key == nil then
		return
	end
	local name = newName
	if string.len(name) <= 1 then
		d("RENAME MACRO: Macro name too short")
		return
	end
	if WF_SavedVars.MacroFrame["Macros"] == nil then WF_SavedVars.MacroFrame["Macros"] = {} end
	if WF_SavedVars.MacroFrame["Macros"][key] ~= nil and text ~= lastRename then
		lastRename = text
		WF_SavedVars.MacroFrame["Macros"][key].Name = name
		if WF_Macros.Buttons[key] ~= nil then WF_Macros.Buttons[key].Label:SetText(string.sub(name,1,6)) end
		d("[WF] RENAME MACRO: Macro "..key.." renamed to "..name)
	end
end
