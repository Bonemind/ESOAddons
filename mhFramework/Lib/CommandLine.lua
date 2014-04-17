wykkydsFramework.Commands = {}
wykkydsFramework.Commands.Callbacks = {}

wykkydsFramework.Commands.Toggle = function( Command, Callback )
	if not Command then return end
	local COMMAND = Command
	if not string.find(COMMAND, "/") then COMMAND = "/"..COMMAND end
	local UCOMMAND, LCOMMAND = string.upper(COMMAND), string.lower(COMMAND)
	if Callback then 
		SLASH_COMMANDS[COMMAND]  = Callback
		SLASH_COMMANDS[UCOMMAND] = Callback
		SLASH_COMMANDS[LCOMMAND] = Callback
		wykkydsFramework.Commands.Callbacks[COMMAND] = {}
		wykkydsFramework.Commands.Callbacks[COMMAND].Command = COMMAND
		wykkydsFramework.Commands.Callbacks[COMMAND].Callback = Callback
		wykkydsFramework.Commands.Callbacks[UCOMMAND] = {}
		wykkydsFramework.Commands.Callbacks[UCOMMAND].Command = UCOMMAND
		wykkydsFramework.Commands.Callbacks[UCOMMAND].Callback = Callback
		wykkydsFramework.Commands.Callbacks[LCOMMAND] = {}
		wykkydsFramework.Commands.Callbacks[LCOMMAND].Command = LCOMMAND
		wykkydsFramework.Commands.Callbacks[LCOMMAND].Callback = Callback
	else 
		SLASH_COMMANDS[COMMAND]  = nil
		SLASH_COMMANDS[UCOMMAND] = nil
		SLASH_COMMANDS[LCOMMAND] = nil
		wykkydsFramework.Commands.Callbacks[COMMAND] = nil
		wykkydsFramework.Commands.Callbacks[UCOMMAND] = nil
		wykkydsFramework.Commands.Callbacks[LCOMMAND] = nil
	end
end

wykkydsFramework.Commands.Add = function( COMMAND, HANDLER ) wykkydsFramework.Commands.Toggle( COMMAND, HANDLER ) end
wykkydsFramework.Commands.Remove = function( COMMAND ) wykkydsFramework.Commands.Toggle( COMMAND ) end

wykkydsFramework.CommandLine = function(text)
	if not text or text == "" or text == "help" then
		d(wykkydsFramework.AddonName.." accepted commands:")
		d("> /"..wykkydsFramework.AddonAbbrev.."")
		d("> /"..wykkydsFramework.AddonAbbrev.." help")
		d("> /wf ivhelp")
		d("> /"..wykkydsFramework.AddonAbbrev.." parseglobal")
		d("> /"..wykkydsFramework.AddonAbbrev.." parsewin")
		d("> /macrohelp")
		return
	end
	
	if text == "helm" then
		local before = GetSetting( SETTING_TYPE_IN_WORLD, IN_WORLD_UI_SETTING_HIDE_HELM )
		if before == "1" then
			SetSetting( SETTING_TYPE_IN_WORLD, IN_WORLD_UI_SETTING_HIDE_HELM, "0", 1 )
		else
			SetSetting( SETTING_TYPE_IN_WORLD, IN_WORLD_UI_SETTING_HIDE_HELM, "1", 1 )
		end
	end
	
	if text == "ivhelp" then
		d("[WF] /iv shows/hides the window")
		d("> Scrolling over the image scales it up/down")
		d("> Scrolling over 'Image Viewer' or the '>>' or '<<' buttons changes images")
		d("> Left Clicking a '<<' or '>>' button changes images")
		d("> Right Clicking a '<<' or '>>' button scales it up/down")
		d("> The title of the image can be copied out of the box")
	end
	
	if text == "parseglobal" then
		wykkydsFramework.DumpCommandsToChat()
		return
	end

	if text == "parsewin" then
		wykkydsFramework.DumpWindowsToChat()
		return
	end
end

local trim = function(s) return s:match'^()%s*$' and '' or s:match'^%s*(.*%S)'; end
local split = function( str, delim, max )
    if max == nil then max = -1 end
    if delim == nil then delim = " " end
    local last, start, stop = 1
    local result = {}
    while max ~= 0 do
        start, stop = str:find(delim, last )
        if start == nil then break; end
        table.insert( result, str:sub( last, start-1 ) )
        last = stop+2
        max = max - 1
    end
    table.insert( result, str:sub( last ) )
    return result
end

wykkydsFramework.SetAutoSheath = function(text)
	if WF_SavedVars.AutoSheath["Enabled"] then	
		WF_SavedVars.AutoSheath["Enabled"] = false
		EVENT_MANAGER:UnregisterForEvent(wykkydsFramework.AddonID, EVENT_PLAYER_COMBAT_STATE)
		d("AutoSheath DISABLED")
	else 
		WF_SavedVars.AutoSheath["Enabled"] = true 
		EVENT_MANAGER:RegisterForEvent(wykkydsFramework.AddonID, EVENT_PLAYER_COMBAT_STATE, wykkydsFramework.ToggleWield)
		d("AutoSheath ENABLED")
		d("Will now attempt to sheath your weapon after you leave combat")
	end
end
