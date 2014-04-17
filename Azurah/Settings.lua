local Azurah = _G['Azurah'] -- grab addon table from global
local LAM = LibStub('LibAddonMenu-1.0')
local LMP = LibStub('LibMediaProvider-1.0')
local L = Azurah:GetLocale()

local dropStyle			= {L.DropStyle1, L.DropStyle2, L.DropStyle3}
local dropStyleRef		= {[L.DropStyle1] = 1, [L.DropStyle2] = 2, [L.DropStyle3] = 3}
local dropOverlay		= {L.DropOverlay1, L.DropOverlay2, L.DropOverlay3, L.DropOverlay4, L.DropOverlay5}
local dropOverlayRef	= {[L.DropOverlay1] = 1, [L.DropOverlay2] = 2, [L.DropOverlay3] = 3, [L.DropOverlay4] = 4, [L.DropOverlay5] = 5}
local dropColourBy		= {L.DropColourBy1, L.DropColourBy2, L.DropColourBy3}
local dropColourByRef	= {[L.DropColourBy1] = 1, [L.DropColourBy2] = 2, [L.DropColourBy3] = 3}

function Azurah:InitializeSettingsMenu()
	local opt = LAM:CreateControlPanel('Azurah_SettingsMenu', L.Azurah)

	-- UNLOCK MODE --
	LAM:AddHeader(opt,		'Azurah.Unlock.Header',			L.UnlockHeader)
	LAM:AddDescription(opt,	'Azurah.Unlock.Desc',			L.UnlockDesc)
	LAM:AddButton(opt,		'Azurah.Unlock.Button',			L.UnlockButton, nil, function() self:UnlockUI() end)

	-- ATTRIBUTE VISIBILITY --
	LAM:AddHeader(opt,		'Azurah.Visibility.Header',		L.VisibilityHeader)
	LAM:AddDropdown(opt,	'Azurah.Visibility.Style',		L.VisibilityStyle, L.VisibilityStyleTip, dropStyle,
		function() return dropStyle[self.db.fadeStyle] end,
		function(arg)
			self.db.fadeStyle = dropStyleRef[arg]
			self:ConfigureAttributeFadeStyle()
		end)
	LAM:AddSlider(opt,		'Azurah.Visibility.Fade',		L.VisibilityAlpha, L.VisibilityAlphaTip, 5, 95, 5,
		function() return self.db.fadeMinAlpha * 100 end,
		function(arg)
			self.db.fadeMinAlpha = arg / 100
			self:ConfigureAttributeFadeStyle()
		end)

	-- OVERLAYS --
	LAM:AddHeader(opt,		'Azurah.Overlays.Header',		L.OverlaysHeader)
	LAM:AddCheckbox(opt,	'Azurah.Overlays.Player',		L.OverlaysPlayer, L.OverlaysPlayerTip,
		function() return self.db.overlays.player end,
		function()
			self.db.overlays.player = not self.db.overlays.player
			self:ConfigureOverlays()
		end)
	LAM:AddCheckbox(opt, 	'Azurah.Overlays.Ultimate', 	L.OverlaysUltimate, L.OverlaysUltimateTip,
		function() return self.db.overlays.ultimate end,
		function()
			self.db.overlays.ultimate = not self.db.overlays.ultimate
			self:ConfigureOverlays()
		end)

	LAM:AddCheckbox(opt, 	'Azurah.Overlays.UltimatePer',	L.OverlaysUltimatePer, L.OverlaysUltimatePerTip,
		function() return self.db.overlays.ultimatePer end,
		function()
			self.db.overlays.ultimatePer = not self.db.overlays.ultimatePer
			self:ConfigureOverlays()
		end)
	LAM:AddCheckbox(opt,	'Azurah.Overlays.UltimateRel',	L.OverlaysUltimateRel, L.OverlaysUltimateRelTip,
		function() return self.db.overlays.ultimateRel end,
		function()
			self.db.overlays.ultimateRel = not self.db.overlays.ultimateRel
			self:ConfigureOverlays()
		end)
	LAM:AddCheckbox(opt,	'Azurah.Overlays.Target',		L.OverlaysTarget, L.OverlaysTargetTip,
		function() return self.db.overlays.target end,
		function()
			self.db.overlays.target = not self.db.overlays.target
			self:ConfigureOverlays()
		end)
	LAM:AddCheckbox(opt,	'Azurah.Overlays.Exp',			L.OverlaysExp, L.OverlaysExpTip,
		function() return self.db.overlays.exp end,
		function()
			self.db.overlays.exp = not self.db.overlays.exp
			self:ConfigureOverlays()
		end)
	LAM:AddDropdown(opt,	'Azurah.Overlays.StylePlayer',	L.OverlaysStylePlayer, L.OverlaysStylePlayerTip, dropOverlay,
		function() return dropOverlay[self.db.overlays.stylePlayer] end,
		function(arg)
			self.db.overlays.stylePlayer = dropOverlayRef[arg]
			self:ConfigureOverlays()
		end)
	LAM:AddDropdown(opt,	'Azurah.Overlays.StyleTarget',	L.OverlaysStyleTarget, L.OverlaysStyleTargetTip, dropOverlay,
		function() return dropOverlay[self.db.overlays.styleTarget] end,
		function(arg)
			self.db.overlays.styleTarget = dropOverlayRef[arg]
			self:ConfigureOverlays()
		end)
	LAM:AddDropdown(opt,	'Azurah.Overlays.Font',			L.OverlaysFont, L.OverlaysFontTip, LMP:List('font'),
		function() return self.db.overlays.font end,
		function(font)
			self.db.overlays.font = font
			self:ConfigureOverlays()
		end)
	LAM:AddColorPicker(opt,	'Azurah.Overlays.Colour',		L.OverlaysColour, L.OverlaysColourTip,
		function()
			return self.db.overlays.colour.r, self.db.overlays.colour.g, self.db.overlays.colour.b, self.db.overlays.colour.a
		end,
		function(r, g, b, a)
			self.db.overlays.colour.r = r
			self.db.overlays.colour.g = g
			self.db.overlays.colour.b = b
			self.db.overlays.colour.a = a
			self:ConfigureOverlays()
		end)

	-- TARGET COLOURING --
	LAM:AddHeader(opt,		'Azurah.Target.Header',			L.TargetHeader)
	LAM:AddDropdown(opt,	'Azurah.Target.ColourByBar',	L.TargetColourByBar, L.TargetColourByBarTip, dropColourBy,
		function() return dropColourBy[self.db.colourByBar] end,
		function(arg)
			self.db.colourByBar = dropColourByRef[arg]
			self:ConfigureTargetColours()
		end)

	LAM:AddDropdown(opt,	'Azurah.Target.ColourByName',	L.TargetColourByName, L.TargetColourByNameTip, dropColourBy,
		function() return dropColourBy[self.db.colourByName] end,
		function(arg)
			self.db.colourByName = dropColourByRef[arg]
			self:ConfigureTargetColours()
		end)
	LAM:AddCheckbox(opt,	'Azurah.Target.ColourByLevel',	L.TargetColourByLevel, L.TargetColourByLevelTip,
		function() return self.db.colourByLevel end,
		function()
			self.db.colourByLevel = not self.db.colourByLevel
			self:ConfigureTargetColours()
		end)

	-- RANGE FINDER --
	LAM:AddHeader(opt,		'Azurah.Range.Header',			L.RangeHeader)
	LAM:AddCheckbox(opt,	'Azurah.Range.Show',			L.RangeShow, L.RangeShowTip,
		function() return self.db.range.show end,
		function()
			self.db.range.show = not self.db.range.show
			self:ConfigureRangeFinder()
		end)
	LAM:AddDropdown(opt,	'Azurah.Range.Font',			L.RangeFont, L.RangeFontTip, LMP:List('font'),
		function() return self.db.range.font end,
		function(font)
			self.db.range.font = font
			self:ConfigureRangeFinder()
		end)
	LAM:AddColorPicker(opt,	'Azurah.Range.Colour',		L.RangeColour, L.RangeColourTip,
		function()
			return self.db.range.colour.r, self.db.range.colour.g, self.db.range.colour.b, self.db.range.colour.a
		end,
		function(r, g, b, a)
			self.db.range.colour.r = r
			self.db.range.colour.g = g
			self.db.range.colour.b = b
			self.db.range.colour.a = a
			self:ConfigureRangeFinder()
		end)

	-- EXTRAS --
	LAM:AddHeader(opt,		'Azurah.Extras.Header',			L.ExtrasHeader)
	LAM:AddCheckbox(opt,	'Azurah.Extras.ExpShow',		L.ExpAlwaysShow, L.ExpAlwaysShowTip,
		function() return self.db.expAlwaysShow end,
		function()
			self.db.expAlwaysShow = not self.db.expAlwaysShow
			self:ConfigureExperienceBar()
		end)


			if (self.db.compassPinScale ~= 1) then
				ZO_Compass:SetScale(self.db.compassPinScale)
	end
	LAM:AddSlider(opt,		'Azurah.Extras.PinScale',		L.PinScale, L.PinScaleTip, 60, 110, 1,
		function() return self.db.compassPinScale * 100 end,
		function(arg)
			self.db.compassPinScale = arg / 100
			ZO_Compass:SetScale(self.db.compassPinScale)
		end)
end
