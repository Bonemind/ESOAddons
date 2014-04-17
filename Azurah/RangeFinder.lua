local Azurah = _G['Azurah'] -- grab addon table from global
local LMP = LibStub('LibMediaProvider-1.0')

-- UPVALUES --
local GetMapNumTiles		= GetMapNumTiles
local GetMapType			= GetMapType
local GetMapContentType		= GetMapContentType
local GetMapPlayerPosition	= GetMapPlayerPosition
local math_sqrt				= math.sqrt
local math_pow				= math.pow
local math_max				= math.max
local strformat				= string.format

local mapWidth, mapHeight, mapType, mapContent
local pX, pY, pZ, tX, tY, tZ
local range, div

local function OnUpdate()
	mapWidth, mapHeight = GetMapNumTiles()
	mapType = GetMapType()
	mapContent = GetMapContentType()
	pX, pY, pZ = GetMapPlayerPosition('player')
	tX, tY, tZ = GetMapPlayerPosition('reticleover')

	if (mapContent == 0) then
		div = mapType == 1 and 15 or 2.5
	elseif (mapContent == 1) then
		div = mapType == 1 and 25 or 1
	elseif (mapContent == 2) then
		div = mapType == 1 and 21 or 26
	else
		div = mapType * mapWidth
	end


--	x = math_pow((pX / div) - (tX / div), 2)
--	y = math_pow((pY / div) - (tY / div), 2)
--	z = math_pow((pZ / div) - (tZ / div), 2)

	AzurahRange:SetText(strformat('%.1fm', math_max(0, (math_sqrt(
		math_pow((pX / div) - (tX / div), 2) +
		math_pow((pY / div) - (tY / div), 2)
	) * 10000) - 1)))
end

-- INITIALIZATION --
function Azurah:InitializeRangeFinder()
	AzurahRange:SetParent(ZO_ReticleContainerReticle)
	AzurahRange:SetDimensions(50, 20)
	AzurahRange:ClearAnchors()
	AzurahRange:SetAnchor(CENTER, ZO_ReticleContainerReticle, CENTER, 40, 20)
	AzurahRange:SetHorizontalAlignment(0)
	AzurahRange:SetVerticalAlignment(1)
	AzurahRange:SetHidden(true)

	self:ConfigureRangeFinder()
end

function Azurah:ConfigureRangeFinder()
	if (self.db.range.show) then
		if (not LMP:IsValid('font', self.db.range.font)) then self.db.range.font = 'Univers 67' end

		AzurahRange:SetFont(string.format('%s|%d|%s', LMP:Fetch('font', self.db.range.font), 16, 'soft-shadow-thick'))
		AzurahRange:SetColor(self.db.range.colour.r, self.db.range.colour.g, self.db.range.colour.b, self.db.range.colour.a)

		if (AzurahRange:GetHandler('OnUpdate') == nil) then
			AzurahRange:SetHandler('OnUpdate', OnUpdate)
		end
	else
		if (AzurahRange:GetHandler('OnUpdate') ~= nil) then
			AzurahRange:SetHandler('OnUpdate', nil)
		end
		AzurahRange:SetText('')
		AzurahRange:SetHidden(true)
	end
end
