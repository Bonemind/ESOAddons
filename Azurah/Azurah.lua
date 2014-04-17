--[[----------------------------------------------------------
	Azurah - Interface Enhanced
	----------------------------------------------------------
	* An addon designed to allow for user customization of the
	* stock interface with optional components to provide
	* additional information while maintaining the stock feel.
	*
	* Version 1.31
	* Kithayri
]]--
local Azurah = _G['Azurah'] -- grab addon table from global

Azurah.name			= 'Azurah'
Azurah.slash		= '/azurah'
Azurah.version		= 1.31
Azurah.versionDB	= 1

Azurah.overlays		= {}

AZ_MOVED_TARGET = false		-- TEMP GLOBALS FOR WYKKYD
AZ_MOVED_COMPASS = false	-- TEMP GLOBALS FOR WYKKYD

local defaults = {
	uiData = {},
	fadeStyle = 1,
	fadeMinAlpha = 0.4,
	overlays = {
		font = 'Univers 67',
		colour = {r = 0.9, g = 0.9, b = 0.9, a = 1.0},
		stylePlayer = 1,
		styleTarget = 1,
		-- actual overlays
		player = true,
		target = true,
		ultimate = true,
		ultimatePer = true,
		ultimateRel = false,
		exp = true
	},
	colourByBar = 2,
	colourByName = 1,
	colourByLevel = true,
	expAlwaysShow = false,
	compassPinScale = 1.0,
	range = {
		show = false,
		font = 'Univers 67',
		colour = {r = 0.9, g = 0.9, b = 0.9, a = 1.0},
	}
}

function Azurah:OnInitialize(code, addon)
	if (addon ~= self.name) then return end

	EVENT_MANAGER:UnregisterForEvent(self.name, EVENT_ADD_ON_LOADED) -- unregister now we're loaded
	SLASH_COMMANDS[self.slash] = self.SlashCommand

	self.db = ZO_SavedVars:New('AzurahDB', self.versionDB, nil, defaults)

	self:InitializeElements()
	self:InitializeRangeFinder()
	self:InitializeUnlock()
	self:InitializeSettingsMenu()


	EVENT_MANAGER:RegisterForEvent('Azurah', EVENT_POWER_UPDATE,			self.OnPowerUpdate)
	EVENT_MANAGER:RegisterForEvent('Azurah', EVENT_RETICLE_TARGET_CHANGED,	self.OnTargetChanged)
	EVENT_MANAGER:RegisterForEvent('Azurah', EVENT_MOUSEOVER_CHANGED,		self.OnTargetChanged)
	EVENT_MANAGER:RegisterForEvent('Azurah', EVENT_DISPOSITION_UPDATE,		self.OnTargetChanged)
	EVENT_MANAGER:RegisterForEvent('Azurah', EVENT_LEVEL_UPDATE,			self.OnLevel)
	EVENT_MANAGER:RegisterForEvent('Azurah', EVENT_VETERAN_RANK_UPDATE,		self.OnLevel)
	EVENT_MANAGER:RegisterForEvent('Azurah', EVENT_EXPERIENCE_UPDATE,		self.OnExpGain)
	EVENT_MANAGER:RegisterForEvent('Azurah', EVENT_VETERAN_POINTS_UPDATE,	self.OnExpGain)
--	EVENT_MANAGER:RegisterForEvent('Azurah', EVENT_ALLIANCE_POINT_UPDATE,	self.OnExpGain)
end

function Azurah.SlashCommand(text)
	if (text == 'lock') then
		Azurah:LockUI()
	elseif (text == 'unlock') then
		Azurah:UnlockUI()
	else
		CHAT_SYSTEM:AddMessage(Azurah:GetLocale().Usage)
	end
end

EVENT_MANAGER:RegisterForEvent('Azurah', EVENT_ADD_ON_LOADED, function(...) Azurah:OnInitialize(...) end)
