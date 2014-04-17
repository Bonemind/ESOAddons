WF_EnhancedPlayerHUD = {}

local isApplied = false
local unadjustedPad = 0

WF_EnhancedPlayerHUD.Update = function(refresh)
	if not isApplied or refresh then
		isApplied = true

		local bars = PLAYER_ATTRIBUTE_BARS
		local hp = ZO_PlayerAttributeHealth
		local mp = ZO_PlayerAttributeMagicka
		local sp = ZO_PlayerAttributeStamina
		local ww = ZO_PlayerAttributeWerewolf
		local sg = ZO_PlayerAttributeSiegeHealth
		local mt = ZO_PlayerAttributeMountStamina

		if WF_GetOrDefault( false, WF_SavedVars.EnhancedPlayerHUD["reposition"] ) then
			if unadjustedPad == 0 then
				unadjustedPad = GuiRoot:GetBottom() - hp:GetBottom()
			end

			local bottomPad = unadjustedPad + WF_GetOrDefault( 0, WF_BAZGRIM_BOTTOMPAD ) + mt:GetHeight() + 1 + sp:GetHeight() + 2

			if not WF_PLAYERHUD then
				local hud = WF_FRAMES.NewTopLevel("WF_PLAYERHUD")
			end
			WF_PLAYERHUD:SetHidden( false )
			WF_PLAYERHUD:SetAnchor( TOP, GuiRoot, BOTTOM, 0, (bottomPad + hp:GetHeight())*-1 )
			WF_PLAYERHUD:SetResizeToFitDescendents()
			WF_PLAYERHUD:SetDimensions( 1000, 400 )
			
			hp:SetParent(WF_PLAYERHUD); sp:SetParent(WF_PLAYERHUD); mp:SetParent(WF_PLAYERHUD); mt:SetParent(WF_PLAYERHUD); ww:SetParent(WF_PLAYERHUD); sg:SetParent(WF_PLAYERHUD)
			hp:ClearAnchors(); sp:ClearAnchors(); mp:ClearAnchors(); mt:ClearAnchors(); ww:ClearAnchors(); sg:ClearAnchors();
			hp:SetHidden(false); sp:SetHidden(false); mp:SetHidden(false); mt:SetHidden(false); ww:SetHidden(false); sg:SetHidden(false)
			hp:SetAnchor( TOP, WF_PLAYERHUD, TOP, 0, 0 )
			sp:SetAnchor( TOPLEFT, hp, BOTTOM, 1, 3 )
			mp:SetAnchor( TOPRIGHT, hp, BOTTOM, -1, 3 )
			mt:SetAnchor( TOPLEFT, sp, BOTTOMLEFT, 0, 2 )
			ww:SetAnchor( BOTTOM, hp, TOP, 0, -3 )
			sg:SetAnchor( BOTTOM, hp, TOP, 0, -3 )
			
			local hudPopUpOffset = (GuiRoot:GetHeight() / 4) + 100
			ZO_Death:ClearAnchors()
			ZO_Death:SetAnchor( TOP, GuiRoot, CENTER, 0, hudPopUpOffset )
			ZO_PlayerToPlayerArea:ClearAnchors()
			ZO_PlayerToPlayerArea:SetAnchor( TOP, GuiRoot, CENTER, 0, hudPopUpOffset )
		end
		
		if WF_GetOrDefault( false, WF_SavedVars.EnhancedPlayerHUD["always show"] ) then
			bars:ForceShow()
		end
	
		local getCurrMax = function( pVal, pMax )
			if pVal == nil then pVal = 0 end
			if pMax == nil then pMax = 0 end
			return pVal.." / "..pMax
		end
		local getPercent = function( pVal, pMax )
			if pVal == nil then return "unk" end
			if pMax == nil then return "unk" end
			return WF_ROUND((pVal / pMax)*100, 0).." %"
		end
		local getCurrent = function( pVal, pMax )
			if pVal == nil then pVal = 0 end
			return pVal
		end
		local getCurrPrc = function( pVal, pMax )
			if pVal == nil then return "unk" end
			if pMax == nil then return "unk" end
			return pVal.." / "..WF_ROUND((pVal / pMax)*100, 0).." %"
		end
		
		local updateNode = function( node, pVal, pMax )
			if node.Settings == "Current / Max" then node:SetText( getCurrMax( pVal, pMax ) )
			elseif node.Settings == "Percent" then node:SetText( getPercent( pVal, pMax ) )
			elseif node.Settings == "Current" then node:SetText( getCurrent( pVal, pMax ) )
			else node:SetText( getCurrPrc( pVal, pMax ) ) end
		end
	
		local updateHealth = function( powerValue, powerEffectiveMax )
			updateNode( WF_PLAYERHUD_HPINFO, powerValue, powerEffectiveMax )
		end
		local updateMagicka = function( powerValue, powerEffectiveMax )
			updateNode( WF_PLAYERHUD_MPINFO, powerValue, powerEffectiveMax )
		end
		local updateStamina = function( powerValue, powerEffectiveMax )
			updateNode( WF_PLAYERHUD_SPINFO, powerValue, powerEffectiveMax )
		end
	
		local hasRegistered = false
		local watchInfoEventTrigger = function( params )
			if params.unitTag ~= "player" then return end
			if params.powerType == POWERTYPE_HEALTH then updateHealth(  params.powerValue, params.powerEffectiveMax )
			elseif params.powerType == POWERTYPE_STAMINA then updateStamina(  params.powerValue, params.powerEffectiveMax )
			elseif params.powerType == POWERTYPE_MAGICKA then updateMagicka(  params.powerValue, params.powerEffectiveMax )
			end
		end
		
		local startPowerInfo = function( callBack, pType )
			local pVal, pStaticMax, pMax = GetUnitPower( "player", pType )
			if pVal ~= nil and pMax ~= nil then
				callBack( pVal, pMax )
			end
		end
	
		local hpSetting = WF_GetOrDefault( "Off", WF_SavedVars.EnhancedPlayerHUD["label health"] )
		if hpSetting ~= "Off" then
			if not hasRegistered then WF_Event( EVENT_POWER_UPDATE, watchInfoEventTrigger, wykkydsFramework.AddonID, true ) end
			if not WF_PLAYERHUD_HPINFO then local hpinfo = WF_FRAMES.__NewLabel("WF_PLAYERHUD_HPINFO", hp)
				:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/esocartographer-bold.otf", 16, "outline"))
				:SetColor(165/255,145/255,15/255,1)
				:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
				:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
				:SetText("")
				:SetHidden(false)
				:SetAnchor( CENTER, hp, CENTER, 0, 0 )
			.__END end
			WF_PLAYERHUD_HPINFO.Settings = hpSetting
			startPowerInfo( updateHealth, POWERTYPE_HEALTH )
		else
			if WF_PLAYERHUD_HPINFO then WF_PLAYERHUD_HPINFO:SetText("") end
		end
		
		local mpSetting = WF_GetOrDefault( "Off", WF_SavedVars.EnhancedPlayerHUD["label magicka"] )
		if mpSetting ~= "Off" then
			if not hasRegistered then WF_Event( EVENT_POWER_UPDATE, watchInfoEventTrigger, wykkydsFramework.AddonID, true ) end
			if not WF_PLAYERHUD_MPINFO then local mpinfo = WF_FRAMES.__NewLabel("WF_PLAYERHUD_MPINFO", mp)
				:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/esocartographer-bold.otf", 16, "outline"))
				:SetColor(165/255,145/255,15/255,1)
				:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
				:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
				:SetText("")
				:SetHidden(false)
				:SetAnchor( CENTER, mp, CENTER, 0, 0 )
			.__END end
			WF_PLAYERHUD_MPINFO.Settings = mpSetting
			startPowerInfo( updateMagicka, POWERTYPE_MAGICKA )
		else
			if WF_PLAYERHUD_MPINFO then WF_PLAYERHUD_MPINFO:SetText("") end
		end
		
		local spSetting = WF_GetOrDefault( "Off", WF_SavedVars.EnhancedPlayerHUD["label stamina"] )
		if spSetting ~= "Off" then
			if not hasRegistered then WF_Event( EVENT_POWER_UPDATE, watchInfoEventTrigger, wykkydsFramework.AddonID, true ) end
			if not WF_PLAYERHUD_SPINFO then local spinfo = WF_FRAMES.__NewLabel("WF_PLAYERHUD_SPINFO", sp)
				:SetFont(string.format( "%s|%d|%s", "EsoUI/Common/Fonts/esocartographer-bold.otf", 16, "outline"))
				:SetColor(165/255,145/255,15/255,1)
				:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
				:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
				:SetText("")
				:SetHidden(false)
				:SetAnchor( CENTER, sp, CENTER, 0, 0 )
			.__END end
			WF_PLAYERHUD_SPINFO.Settings = spSetting
			startPowerInfo( updateStamina, POWERTYPE_STAMINA )
		else
			if WF_PLAYERHUD_SPINFO then WF_PLAYERHUD_SPINFO:SetText("") end
		end
	end
end

-- /script WF_EnhancedPlayerHUD.Update(true)