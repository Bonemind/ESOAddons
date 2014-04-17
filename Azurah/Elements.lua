local Azurah = _G['Azurah'] -- grab addon table from global
local LMP = LibStub('LibMediaProvider-1.0')
local db					-- local database reference

-- UPVALUES --
local DoesUnitExist				= DoesUnitExist
local GetUnitPower				= GetUnitPower
local GetUnitReactionColor		= GetUnitReactionColor
local GetConColor				= GetConColor
local GetUnitLevel				= GetUnitLevel
local GetUnitVeteranRank		= GetUnitVeteranRank
local IsUnitVeteran				= IsUnitVeteran
local GetUnitVeteranPoints		= GetUnitVeteranPoints
local GetUnitVeteranPointsMax	= GetUnitVeteranPointsMax
local GetUnitXP					= GetUnitXP
local GetUnitXPMax				= GetUnitXPMax
local strformat					= string.format
local math_max					= math.max

local targetLeft, targetRight, targetName, targetLevel
local playerLevel

-- OVERLAY TEXT FORMATTING --
local FormatTextPlayer, FormatTextTarget

local function Format_All(current, max, effMax)
	effMax = effMax > 0 and effMax or 1 -- ensure we don't do a divide by 0
	return strformat('%d / %d (%d%%)', current, effMax, (current / effMax) * 100)
end

local function Format_ValueMax(current, max, effMax)
	return strformat('%d / %d', current, effMax)
end

local function Format_ValuePercent(current, max, effMax)
	effMax = effMax > 0 and effMax or 1 -- ensure we don't do a divide by 0
	return strformat('%d (%d%%)', current, (current / effMax) * 100)
end

local function Format_Value(current, max, effMax)
	return strformat('%d', current)
end

local function Format_Percent(current, max, effMax)
	effMax = effMax > 0 and effMax or 1 -- ensure we don't do a divide by 0
	return strformat('%d%%', (current / effMax) * 100)
end

-- ELEMENT EVENT HANDLERS --
function Azurah.OnExpGain(code, unit, current, max)
	if (unit == 'player') then
		Azurah.overlays.exp:SetText(Format_All(current, nil, max))
	end
end

function Azurah.OnLevel(code, unit, level)
	if (unit == 'player') then
		if (IsUnitVeteran(unit)) then
			playerRank = level
		else
			playerLevel = level
		end
	end
end

function Azurah.OnPowerUpdate(code, unit, _, powerType, powerValue, powerMax, powerEffMax)
	if (unit == 'player') then
		if (powerType == POWERTYPE_HEALTH) then
			Azurah.overlays.health:SetText(FormatTextPlayer(powerValue, nil, powerEffMax))
		elseif (powerType == POWERTYPE_MAGICKA) then
			Azurah.overlays.magicka:SetText(FormatTextPlayer(powerValue, nil, powerEffMax))
		elseif (powerType == POWERTYPE_STAMINA) then
			Azurah.overlays.stamina:SetText(FormatTextPlayer(powerValue, nil, powerEffMax))
		elseif (powerType == POWERTYPE_ULTIMATE) then
			Azurah.overlays.ultimate:SetText(powerValue)
			Azurah.overlays.ultimatePer:SetText(Format_Percent(powerValue, nil, (db.overlays.ultimateRel) and math_max(1, GetSlotAbilityCost(8)) or powerEffMax))
		end
	elseif (unit == 'reticleover' and powerType == POWERTYPE_HEALTH) then
		Azurah.overlays.target:SetText(FormatTextTarget(powerValue, nil, powerEffMax))
	end
end

local rR, rG, rB, cR, cG, cB
function Azurah.OnTargetChanged()
	if (DoesUnitExist('reticleover')) then
		Azurah.overlays.target:SetText(FormatTextTarget(GetUnitPower('reticleover', POWERTYPE_HEALTH)))

		rR, rG, rB = GetUnitReactionColor('reticleover')
		cR, cG, cB = GetConColor(GetUnitLevel('reticleover'), playerLevel)

		if (db.colourByBar == 2) then -- by reaction
			targetLeft:SetGradientColors(rR * 0.64, rG * 0.64, rB * 0.64, 1, rR * 0.8, rG * 0.8, rB * 0.8, 1)
			targetRight:SetGradientColors(rR * 0.64, rG * 0.64, rB * 0.64, 1, rR * 0.8, rG * 0.8, rB * 0.8, 1)
		elseif (db.colourByBar == 3) then -- by level difference
			targetLeft:SetGradientColors(cR * 0.64, cG * 0.64, cB * 0.64, 1, cR, cG, cB, 1)
			targetRight:SetGradientColors(cR * 0.64, cG * 0.64, cB * 0.64, 1, cR, cG, cB, 1)
		end

		if (db.colourByName == 2) then -- by reaction
			targetName:SetColor(rR, rG, rB)
		elseif (db.colourByName == 3) then -- by level difference
			targetName:SetColor(cR, cG, cB)
		end

		if (db.colourByLevel) then -- by level difference
			targetLevel:SetColor(cR, cG, cB)
		end

		AzurahRange:SetHidden(false)
	else
		AzurahRange:SetHidden(true)
	end
end

-- ELEMENT CONFIGURATION --
function Azurah:ConfigureOverlays()
	if (not LMP:IsValid('font', db.overlays.font)) then db.overlays.font = 'Univers 67' end
	local fontConfig = strformat('%s|%d|%s', LMP:Fetch('font', db.overlays.font), 16, 'soft-shadow-thick')

	-- set styling
	for _, overlay in pairs(self.overlays) do
		overlay:SetFont(fontConfig)
		overlay:SetColor(db.overlays.colour.r, db.overlays.colour.g, db.overlays.colour.b, db.overlays.colour.a)
	end

	-- set formatting
	if (db.overlays.stylePlayer == 2) then		FormatTextPlayer = Format_ValueMax
	elseif (db.overlays.stylePlayer == 3) then	FormatTextPlayer = Format_ValuePercent
	elseif (db.overlays.stylePlayer == 4) then	FormatTextPlayer = Format_Value
	elseif (db.overlays.stylePlayer == 5) then	FormatTextPlayer = Format_Percent
	else FormatTextPlayer = Format_All end

	if (db.overlays.styleTarget == 2) then		FormatTextTarget = Format_ValueMax
	elseif (db.overlays.styleTarget == 3) then	FormatTextTarget = Format_ValuePercent
	elseif (db.overlays.styleTarget == 4) then	FormatTextTarget = Format_Value
	elseif (db.overlays.styleTarget == 5) then	FormatTextTarget = Format_Percent
	else FormatTextTarget = Format_All end

	local current, _, max

	-- set initial values and visibility: player
	if (db.overlays.player) then
		current, _, max = GetUnitPower('player', POWERTYPE_HEALTH)
		self.overlays.health:SetText(FormatTextPlayer(current, nil, max))
		self.overlays.health:SetHidden(false)
		current, _, max = GetUnitPower('player', POWERTYPE_MAGICKA)
		self.overlays.magicka:SetText(FormatTextPlayer(current, nil, max))
		self.overlays.magicka:SetHidden(false)
		current, _, max = GetUnitPower('player', POWERTYPE_STAMINA)
		self.overlays.stamina:SetText(FormatTextPlayer(current, nil, max))
		self.overlays.stamina:SetHidden(false)
	else
		self.overlays.health:SetHidden(true)
		self.overlays.magicka:SetHidden(true)
		self.overlays.stamina:SetHidden(true)
	end

	-- set initial values and visibility: ultimate
	if (db.overlays.ultimate) then
		current, _, max = GetUnitPower('player', POWERTYPE_ULTIMATE)
		self.overlays.ultimate:SetText(current)
		self.overlays.ultimate:SetHidden(false)
	else
		self.overlays.ultimate:SetHidden(true)
		self.overlays.ultimatePer:SetHidden(true)
	end

	if (db.overlays.ultimatePer) then
		current, _, max = GetUnitPower('player', POWERTYPE_ULTIMATE)
		self.overlays.ultimatePer:SetText(Format_Percent(current, nil, (db.overlays.ultimateRel) and math_max(1, GetSlotAbilityCost(8)) or max))
		self.overlays.ultimatePer:SetHidden(false)
	else
		self.overlays.ultimatePer:SetHidden(true)
	end

	-- set initial values and visibility: target
	if (db.overlays.target) then
		if (DoesUnitExist('reticleover')) then
			current, _, max = GetUnitPower('reticleover', POWERTYPE_HEALTH)
			self.overlays.target:SetText(FormatTextTarget(current, nil, max))
		end
		self.overlays.target:SetHidden(false)
	else
		self.overlays.target:SetHidden(true)
	end

	-- set initial values and visibility: experience
	if (db.overlays.exp) then
		if (IsUnitVeteran('player')) then
			current, max = GetUnitVeteranPoints('player'), GetUnitVeteranPointsMax('player')
		else
			current, max = GetUnitXP('player'), GetUnitXPMax('player')
		end

		self.overlays.exp:SetText(Format_All(current, nil, max))
		self.overlays.exp:SetHidden(false)
	else
		self.overlays.exp:SetHidden(true)
	end
end

-- TARGET COLOURS CONFIG --
function Azurah:ConfigureTargetColours()
	if (db.colourByBar == 1) then
		local r1, g1, b1, a1 = ZO_POWER_BAR_GRADIENT_COLORS[POWERTYPE_HEALTH][1]:UnpackRGBA()
		local r2, g2, b2, a2 = ZO_POWER_BAR_GRADIENT_COLORS[POWERTYPE_HEALTH][2]:UnpackRGBA()
		targetLeft:SetGradientColors(r1, g1, b1, a1, r2, g2, b2, a2)
		targetRight:SetGradientColors(r1, g1, b1, a1, r2, g2, b2, a2)
	end

	if (db.colourByName == 1) then
		targetName:SetColor(1, 1, 1)
	end

	if (not db.colourByLevel) then
		targetLevel:SetColor(1,1,1)
	end
end

-- ATTRIBUTE FADE STYLE CONFIG --
function Azurah:ConfigureAttributeFadeStyle()
	local style, alpha = db.fadeStyle, db.fadeMinAlpha

	ZO_PlayerAttributeHealth.playerAttributeBarObject.timeline:GetAnimation():SetStartAlpha(style == 2 and alpha or style == 3 and 1 or 0)
	ZO_PlayerAttributeHealth:SetAlpha(style == 2 and alpha or style == 3 and 1 or 0)
	ZO_PlayerAttributeStamina.playerAttributeBarObject.timeline:GetAnimation():SetStartAlpha(style == 2 and alpha or style == 3 and 1 or 0)
	ZO_PlayerAttributeStamina:SetAlpha(style == 2 and alpha or style == 3 and 1 or 0)
	ZO_PlayerAttributeMagicka.playerAttributeBarObject.timeline:GetAnimation():SetStartAlpha(style == 2 and alpha or style == 3 and 1 or 0)
	ZO_PlayerAttributeMagicka:SetAlpha(style == 2 and alpha or style == 3 and 1 or 0)
end

-- EXPERIENCE BAR --
local function ExperienceBarOnHide()
	if (db.expAlwaysShow and ZO_WorldMap:IsHidden()) then
		ZO_ExperienceBar:SetHidden(false)
	end
end

local function ExperienceBarWorldMapHide()
	if (db.expAlwaysShow) then
		ZO_ExperienceBar:SetHidden(false)
	end
end

local function ExperienceBarWorldMapShow()
	if (db.expAlwaysShow) then
		ZO_ExperienceBar:SetHidden(true)
	end
end

function Azurah:ConfigureExperienceBar()
	ZO_ExperienceBar.owner.fadeTimeline:GetFirstAnimation():SetStartAlpha(db.expAlwaysShow and 1.0 or 0)
	ZO_ExperienceBar.owner.fadeTimeline:GetLastAnimation():SetEndAlpha(db.expAlwaysShow and 1.0 or 0)
	ZO_ExperienceBar:SetHidden(not db.expAlwaysShow)
end

-- INITIALIZATION --
local function BuildOverlay(parent, rel, relPoint, x, y, width, height, vAlign, hAlign)
	local o = WINDOW_MANAGER:CreateControl(nil, parent, CT_LABEL)
	o:SetDimensions(width or parent:GetWidth(), height or 20)
	o:SetAnchor(rel, parent, relPoint, x, y)
	o:SetColor(0.9, 0.9, 0.9, 1)
	o:SetHorizontalAlignment(hAlign or 1)
	o:SetVerticalAlignment(vAlign or 1)
	o:SetHidden(true)
	return o
end

function Azurah:InitializeElements()
	db = self.db

	-- overlay init
	self.overlays.health		= BuildOverlay(ZO_PlayerAttributeHealth, CENTER, CENTER, 0, 0)
	self.overlays.magicka		= BuildOverlay(ZO_PlayerAttributeMagicka, CENTER, CENTER, 0, 0)
	self.overlays.stamina		= BuildOverlay(ZO_PlayerAttributeStamina, CENTER, CENTER, 0, 0)
	self.overlays.ultimate		= BuildOverlay(ActionButton8, BOTTOM, TOP, -1, 0)
	self.overlays.ultimatePer	= BuildOverlay(ActionButton8, BOTTOM, BOTTOM, 0, -2)
	self.overlays.target		= BuildOverlay(ZO_TargetUnitFramereticleover, CENTER, CENTER, 0, -1)
	self.overlays.exp			= BuildOverlay(ZO_ExperienceBarBar, LEFT, LEFT, 4, -1, nil, nil, nil, 0)

	-- reaction colours init
	playerLevel	= GetUnitLevel('player')
	playerRank	= IsUnitVeteran('player') and GetUnitVeteranRank('player') or 0
	targetLeft	= ZO_TargetUnitFramereticleoverBarLeft
	targetRight	= ZO_TargetUnitFramereticleoverBarRight
	targetName	= ZO_TargetUnitFramereticleoverName
	targetLevel	= ZO_TargetUnitFramereticleoverLevel

	-- experience bar init
	ZO_PreHookHandler(ZO_ExperienceBar, 'OnHide', ExperienceBarOnHide)
	ZO_PreHookHandler(ZO_WorldMap, 'OnShow', ExperienceBarWorldMapShow)
	ZO_PreHookHandler(ZO_WorldMap, 'OnHide', ExperienceBarWorldMapHide)

	self:ConfigureOverlays()
	self:ConfigureAttributeFadeStyle()
	self:ConfigureExperienceBar()
end
