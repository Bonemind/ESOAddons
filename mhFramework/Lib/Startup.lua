wykkydsFramework.Money = 0

wykkydsFramework.Startup = function(eventCode, addOnName)
	if addOnName == wykkydsFramework.AddonID then
		wykkydsFramework.Ready = true
		wykkydsFramework.Commands.Add(wykkydsFramework.AddonAbbrev, wykkydsFramework.CommandLine)
		wykkydsFramework.Commands.Add("macrohelp", wykkydsFramework.MacroHelp)
		wykkydsFramework.Commands.Add("macrowin", wykkydsFramework.MacroFrame)
		wykkydsFramework.Commands.Add("setmacro", wykkydsFramework.SetMacro)
		wykkydsFramework.Commands.Add("clearmacro", wykkydsFramework.ClearMacro)
		wykkydsFramework.Commands.Add("showmacro", wykkydsFramework.ShowMacro)
		wykkydsFramework.Commands.Add("renamemacro", wykkydsFramework.RenameMacro)
		wykkydsFramework.Commands.Add("autosheath", wykkydsFramework.SetAutoSheath)
		wykkydsFramework.Commands.Add("iv", WF_ImageViewerWindow)
		wykkydsFramework.LoadSavedVariables()
		wykkydsFramework.AddonPrep("")
		WF_FRAMES.PrepareBaseFrames()
		WF_SettingsMenu.StartUp()
		
		WF_UTIL.ChatFrameBackpanel()
		wykkydsFramework.MacroFrame(WF_SavedVars.MacroFrame["Shown"])
		WF_BazgrimToolbar.Create()
		WF_BazgrimSubtitles.Draw()
		
		wykkydsFramework.Money = GetCurrentMoney()
		
		if WF_GetOrDefault( false, WF_SavedVars.EnhancedPlayerHUD["Enabled"] ) then WF_EnhancedPlayerHUD.Update() end
		
		if WF_SavedVars.AutoSheath["Enabled"] then
			EVENT_MANAGER:RegisterForEvent(wykkydsFramework.AddonID, EVENT_PLAYER_COMBAT_STATE, wykkydsFramework.ToggleWield)
		end
		EVENT_MANAGER:RegisterForEvent(wykkydsFramework.AddonID, EVENT_LOOT_RECEIVED, function(numID, lootedBy, itemName, quantity, itemSound, lootType, self)
			if WF_SavedVars.LootNotice["Enabled"] then
				if self then
					d( "|c32DF41Loot Received: [ |r" .. itemName:gsub("%^%a+","") .. "|c32DF41 ] x " .. quantity .."|r" )
				end
			end
		end)
		EVENT_MANAGER:RegisterForEvent(wykkydsFramework.AddonID, EVENT_MONEY_UPDATE, function()
			if WF_SavedVars.GoldNotice["Enabled"] then
				local nowMoney = GetCurrentMoney()
				if WF_SavedVars.GoldNotice["Scroll"] then
					if nowMoney > wykkydsFramework.Money then
						wykkydsFramework.ScrollFrames.Add( "+ " .. (nowMoney - wykkydsFramework.Money) .. " gold", "CENTER", {.5, 1, .5, 1} )
					elseif wykkydsFramework.Money > nowMoney then
						wykkydsFramework.ScrollFrames.Add( "- " .. (wykkydsFramework.Money - nowMoney) .. " gold", "CENTER", {1, .5, .5, 1} )
					end
				else
					if nowMoney > wykkydsFramework.Money then
						d( "|c32DF41Received Gold: " .. (nowMoney - wykkydsFramework.Money) .."|r" )
					elseif wykkydsFramework.Money > nowMoney then
						d( "|cDF3241Spent Gold: " .. (wykkydsFramework.Money - nowMoney) .."|r" )
					end
				end
			end
			wykkydsFramework.Money = GetCurrentMoney()
		end)
		
		if WF_SavedVars.MultiScreen["Enabled"] then
			if WF_SavedVars.MultiScreen["Screens"] == "2" or WF_SavedVars.MultiScreen["Screens"] == "3" or WF_SavedVars.MultiScreen["Screens"] == "4" or WF_SavedVars.MultiScreen["Screens"] == "5" then
				if _G["WF_GuiRoot"] == nil then
					local newGuiRoot = WF_FRAMES.__NewTopLevel( "WF_GuiRoot" )
						:SetDimensions( GuiRoot:GetWidth(), GuiRoot:GetHeight() )
					.__END
				end
				GuiRoot:SetParent( WF_GuiRoot )
				GuiRoot:ClearAnchors()
				local size = tonumber(WF_GetOrDefault( "2", WF_SavedVars.MultiScreen["Screens"] ))
				local screen = tonumber(WF_GetOrDefault( "2", WF_SavedVars.MultiScreen["Target"] ))
				local width = ( GuiRoot:GetWidth() / size )
				GuiRoot:SetWidth( width )
				local targetLeft = width * ( screen - 1 )
				GuiRoot:SetAnchor( LEFT, WF_GuiRoot, LEFT, targetLeft, 0 )
			end
		end
		
		registerSwizzyChatFade = function()
			if _G["ZO_ChatWindow"] ~= nil then
				if ZO_ChatWindow.container ~= nil then
					if ZO_ChatWindow.container.currentBuffer ~= nil then
						WF_Tic( "swizzyrockedupintehjoint" )
						WF_Tic( "swizzyrockedupintehjoint", function() ZO_ChatWindow.container.currentBuffer:ShowFadedLines(); end )
					end
				end
			end
		end
		
		if WF_GetOrDefault( false, WF_SavedVars.SwizzyChatFade["Enabled"] ) then WF_Tic( "swizzyrockedupintehjoint", function() registerSwizzyChatFade(); end ) end
		
		if WF_GetOrDefault( false, WF_SavedVars.ReticleRangefinder["Enabled"] ) then WF_Tic( "WF_Reticle_RangeFinder_Tic", wykkydsFramework.TargetRange, .25 ) end
		
		d(wykkydsFramework.AddonDescr.." loaded")
	else
		wykkydsFramework.AddonPrep(addOnName)
	end
end

