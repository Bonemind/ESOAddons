-------------------------------------------------------------------------------
-- SkyShards v0.5.3 
-------------------------------------------------------------------------------
if SkyS == nil then SkyS = {} end

local language = ""
local savedVariables
local defaults = {			-- default settings for saved variables
	compassMaxDistance = 0.05,
	pinTexture = {
		type = 1,
		size = 38,
		level = 40,
	},
	filters = {
		["SkySCompassPin_unknown"] = true,
		["SkySMapPin_unknown"] = true,
		["SkySMapPin_collected"] = true,
	},
}

-- helper functions -----------------------------------------------------------
local function MyPrint(...)
	CHAT_SYSTEM:AddMessage(...)
end

-- Pins -----------------------------------------------------------------------
local pinTexturesList = {
	"default icons (@Garkin)",
	"alternative icons (@Garkin)",
	"Esohead's icons (Mitsarugi)"	
}

local pinTextures = {
	unknown = {
		[1] = "SkyShards/Icons/Skyshard-unknown.dds", 
		[2] = "SkyShards/Icons/Skyshard-unknown-alternative.dds", 
		[3] = "SkyShards/Icons/Skyshard-unknown-Esohead.dds", 
	},
	collected = {
		[1] = "SkyShards/Icons/Skyshard-collected.dds", 
		[2] = "SkyShards/Icons/Skyshard-collected-alternative.dds",
		[3] = "SkyShards/Icons/Skyshard-collected-Esohead.dds",
	},
}

--tooltip creators
local function GetInfoFromTag(pin)
	local _, pinTag = pin:GetPinTypeAndTag()
	local name = zo_strformat(SI_ACHIEVEMENTS_CATEGORY, GetAchievementInfo(pinTag[3]))
	local description = "(" .. tostring(pinTag[4]) ..") " .. zo_strformat(SI_ACHIEVEMENT_CRITERION_FORMAT, GetAchievementCriterion(pinTag[3], pinTag[4]))

	if pinTag[5] ~= nil then
		local info = "[" .. SkyS[language].moreInfo[pinTag[5]] .. "]" 
		return name, description, info
	else
		return name, description
	end
end

local pinTooltipCreator_unknown = {
	creator = function(pin)
		local name, description, info = GetInfoFromTag(pin)
		InformationTooltip:AddLine(name, "", ZO_HIGHLIGHT_TEXT:UnpackRGB())
		InformationTooltip:AddLine(description, "", ZO_TOOLTIP_DEFAULT_COLOR:UnpackRGB())
		if info ~= nil then
			InformationTooltip:AddLine(info, "", ZO_TOOLTIP_DEFAULT_COLOR:UnpackRGB())
		end
	end,
	tooltip = InformationTooltip,
}

local pinTooltipCreator_collected = {
	creator = function(pin)
		local name, description, info = GetInfoFromTag(pin)
		InformationTooltip:AddLine(name, "", ZO_HIGHLIGHT_TEXT:UnpackRGB())
		InformationTooltip:AddLine(description, "", ZO_TOOLTIP_DEFAULT_COLOR:UnpackRGB())
		if info ~= nil then
			InformationTooltip:AddLine(info .. " / [" .. SkyS[language].collected .. "]", "", ZO_TOOLTIP_DEFAULT_COLOR:UnpackRGB())
		else
			InformationTooltip:AddLine("[" .. SkyS[language].collected .. "]", "", ZO_TOOLTIP_DEFAULT_COLOR:UnpackRGB())
		end
	end,
	tooltip = InformationTooltip,
}

--add callbacks
local function GetSkyshardsData()
	local textureName = GetMapTileTexture()

	textureName = string.lower(textureName)
	local _,_,_,zone,subzone = string.find(textureName, "(maps/)(%w+)/(%w+_%w+)")

	if SkyS.skyshardsData[zone] == nil or SkyS.skyshardsData[zone][subzone] == nil then
		return nil
	end

	local skyshards = SkyS.skyshardsData[zone][subzone]
	
	return skyshards
end

local function CreateMapPins(pinManager, pinType, completed)
	if not savedVariables.filters[pinType] then return end
	if (GetMapType() == MAPTYPE_COSMIC) then return end

	local skyshards = GetSkyshardsData()
	if skyshards == nil then return end

	for _, pinTag in pairs(skyshards) do
		local _, i = GetAchievementCriterion(pinTag[3], pinTag[4])
		if i == completed then
			pinManager:CreatePin(_G[pinType], pinTag, pinTag[1], pinTag[2])
		end
	end
end

local function MapCallback_unknown(pinManager)
	CreateMapPins(pinManager, "SkySMapPin_unknown", 0)
end

local function MapCallback_collected(pinManager)
	CreateMapPins(pinManager, "SkySMapPin_collected", 1)
end

local function CreateCompassPins(pinManager, pinType, completed)
	if not savedVariables.filters[pinType] then return end
	if (GetMapType() == MAPTYPE_COSMIC) then return end

	local skyshards = GetSkyshardsData()
	if skyshards == nil then return end

	for _, pinTag in pairs(skyshards) do
		local _, i = GetAchievementCriterion(pinTag[3], pinTag[4])
		if i == completed then
			pinManager:CreatePin(pinType, pinTag, pinTag[1], pinTag[2])
		end
	end
end

local function CompassPinCallback_unknown(pinManager)
	CreateCompassPins(pinManager, "SkySCompassPin_unknown" , 0)
end

-- map filters ----------------------------------------------------------------
local checkboxControls = {
	pve = {},
	pvp = {},
}

local function AddPinFilters(pinType, filterText)
	if savedVariables.filters[pinType] == nil then
		savedVariables.filters[pinType] = true
	end 			
	
	local function SetButtonState(control, pinType)
		if savedVariables.filters[pinType] == false then
			control:SetState(0)
		else
			control:SetState(1)
		end
	end

	WORLD_MAP_FILTERS.pvePanel:AddPinFilterCheckBox(_G[pinType],
		function()
			savedVariables.filters[pinType] = not savedVariables.filters[pinType] 
			SetButtonState(checkboxControls.pve[pinType], pinType)
			ZO_WorldMap_RefreshCustomPinsOfType(_G[pinType])
		end)     
	checkboxControls.pve[pinType] = WORLD_MAP_FILTERS.pvePanel.lastControl
	checkboxControls.pve[pinType].label:SetText(filterText)
	SetButtonState(checkboxControls.pve[pinType], pinType)

	WORLD_MAP_FILTERS.pvpPanel:AddPinFilterCheckBox(_G[pinType],
		function()
			savedVariables.filters[pinType] = not savedVariables.filters[pinType] 
			SetButtonState(checkboxControls.pvp[pinType], pinType)
			ZO_WorldMap_RefreshCustomPinsOfType(_G[pinType])
		end)     
	checkboxControls.pvp[pinType] = WORLD_MAP_FILTERS.pvpPanel.lastControl
	checkboxControls.pvp[pinType].label:SetText(filterText)
	SetButtonState(checkboxControls.pvp[pinType], pinType)
end

--
local function RefreshPins(pinType)
	ZO_WorldMap_RefreshCustomPinsOfType( _G[pinType] )
end

local function AddMapPin(pinType, pinTypeAddCallback, pinTypeOnResizeCallback, pinLayoutData, pinTooltipCreator)
	ZO_WorldMap_AddCustomPin(pinType, pinTypeAddCallback, pinTypeOnResizeCallback, pinLayoutData, pinTooltipCreator)
	ZO_WorldMap_SetCustomPinEnabled(_G[pinType], true)
	ZO_WorldMap_RefreshCustomPinsOfType(_G[pinType])
end

-- slash commands -------------------------------------------------------------
local function ShowMyPosition()
--	if (SetMapToPlayerLocation() == SET_MAP_RESULT_MAP_CHANGED) then
--		CALLBACK_MANAGER:FireCallbacks("OnWorldMapChanged")
--	end
	
	local x, y = GetMapPlayerPosition("player")
	local mapname = GetMapName()

	local locX = string.format("%03d", zo_round(x*1000))
	local locY = string.format("%03d", zo_round(y*1000))

	MyPrint(mapname .. ": " .. locX .. "," .. locY)
end

-- settings menu --------------------------------------------------------------
local function CreateSettingsMenu()
	local LAM = LibStub("LibAddonMenu-1.0")
	local addonMenu = LAM:CreateControlPanel("SkyShards_OptionsPanel", "SkyShards")
	
	local function SwitchFilter(pinType)
		savedVariables.filters[pinType] = not savedVariables.filters[pinType]
		if savedVariables.filters[pinType] == false then
			checkboxControls.pve[pinType]:SetState(0)
			checkboxControls.pvp[pinType]:SetState(0)
		else
			checkboxControls.pve[pinType]:SetState(1)
			checkboxControls.pvp[pinType]:SetState(1)
		end
		ZO_WorldMap_RefreshCustomPinsOfType( _G[pinType] )
	end

	--pin layout
	LAM:AddHeader(addonMenu, "SkyShards_OptionsHeader", SkyS[language].menuOptions)
	LAM:AddDropdown(addonMenu, "SkyShards_pinTexture", SkyS[language].menuPinTexture, SkyS[language].menuPinTextureDesc, pinTexturesList,
		function() return pinTexturesList[savedVariables.pinTexture.type] end,
		function(pinTextureListName)
			for index, name in pairs(pinTexturesList) do
				if name == pinTextureListName then
					savedVariables.pinTexture.type = index
					ZO_MapPin.PIN_DATA[_G["SkySMapPin_unknown"]].texture = pinTextures.unknown[index]
					ZO_MapPin.PIN_DATA[_G["SkySMapPin_collected"]].texture = pinTextures.collected[index]
					ZO_WorldMap_RefreshCustomPinsOfType(_G["SkySMapPin_unknown"])
					ZO_WorldMap_RefreshCustomPinsOfType(_G["SkySMapPin_collected"])
					COMPASS_PINS.pinLayouts["SkySCompassPin_unknown"].texture = pinTextures.unknown[index] 
					COMPASS_PINS:RefreshPins()
				end
			end
		end)
	LAM:AddSlider(addonMenu, "SkyShards_PinSize", SkyS[language].menuPinSize, SkyS[language].menuPinSizeDesc, 20, 70, 1,
		function()
			local size = savedVariables.pinTexture.size
			if size < 20 then
				size = 20
			elseif size > 70 then
				size = 70
			end  
			return size
		end,
		function(size) savedVariables.pinTexture.size = size
			ZO_MapPin.PIN_DATA[_G["SkySMapPin_unknown"]].size = size
			ZO_MapPin.PIN_DATA[_G["SkySMapPin_collected"]].size = size
			ZO_WorldMap_RefreshCustomPinsOfType(_G["SkySMapPin_unknown"])
			ZO_WorldMap_RefreshCustomPinsOfType(_G["SkySMapPin_collected"])
		end)
	LAM:AddSlider(addonMenu, "SkyShards_Layer", SkyS[language].menuPinLayer, SkyS[language].menuPinLayerDesc, 10, 200, 10, 
		function()
			local layer = savedVariables.pinTexture.level
			if layer < 10 then
				layer = 10
			elseif layer > 200 then
				layer = 200
			end  
			return layer 
		end,
		function(layer) savedVariables.pinTexture.level = layer
			ZO_MapPin.PIN_DATA[_G["SkySMapPin_unknown"]].layer = layer
			ZO_MapPin.PIN_DATA[_G["SkySMapPin_collected"]].layer = layer
			ZO_WorldMap_RefreshCustomPinsOfType(_G["SkySMapPin_unknown"])
			ZO_WorldMap_RefreshCustomPinsOfType(_G["SkySMapPin_collected"])
		end)
	--compass
	LAM:AddHeader(addonMenu, "SkyShards_CompassHeader", "")
	LAM:AddCheckbox(addonMenu, "SkyShards_showCompassUnknown", SkyS[language].menuCompassUnknown, SkyS[language].menuCompassUnknownDesc,
		function() return savedVariables.filters["SkySCompassPin_unknown"] end,
		function()
			savedVariables.filters["SkySCompassPin_unknown"] = not savedVariables.filters["SkySCompassPin_unknown"]
			COMPASS_PINS:RefreshPins()
		end)
	LAM:AddSlider(addonMenu, "SkyShards_MaxDistance", SkyS[language].menuCompassDist, SkyS[language].menuCompassDistDesc, 1, 100, 1,
		function() return savedVariables.compassMaxDistance * 1000 end,
		function(maxDistance)
			savedVariables.compassMaxDistance = maxDistance / 1000
			COMPASS_PINS.pinLayouts["SkySCompassPin_unknown"].maxDistance = maxDistance / 1000 
			COMPASS_PINS:RefreshPins()
		end)

	--filters	
	LAM:AddHeader(addonMenu, "SkyShards_FiltersHeader", "")
	LAM:AddCheckbox(addonMenu, "SkyShards_showUnknown", SkyS[language].menuUnknown, SkyS[language].menuUnknownDesc,
		function() return savedVariables.filters["SkySMapPin_unknown"] end,
		function() SwitchFilter("SkySMapPin_unknown") end)
	LAM:AddCheckbox(addonMenu, "SkyShards_showCollected", SkyS[language].menuCollected, SkyS[language].menuCollectedDesc,
		function() return savedVariables.filters["SkySMapPin_collected"] end,
		function() SwitchFilter("SkySMapPin_collected")	end)
	--reset		
	LAM:AddButton(addonMenu, "SkyShards_Reset", SkyS[language].menuReset, SkyS[language].menuResetDesc,
	function()
		savedVariables.compassMaxDistance = 0.05
		savedVariables.pinTexture.type = 1
		savedVariables.pinTexture.size = 38
		savedVariables.pinTexture.level = 40
		savedVariables.filters["SkySCompassPin_unknown"] = true
		savedVariables.filters["SkySMapPin_unknown"] = true
		savedVariables.filters["SkySMapPin_collected"] = true
		ReloadUI("ingame")
	end, true, SkyS[language].menuResetWarning)
end

-- event handlers -------------------------------------------------------------
local function OnAchievementUpdate(eventCode, achievementId)
	local ids = SkyS.achievementIDs

	for i = 1, #ids do
		if (ids[i] == achievementId) then
			ZO_WorldMap_RefreshCustomPinsOfType(_G["SkySMapPin_unknown"])
			ZO_WorldMap_RefreshCustomPinsOfType(_G["SkySMapPin_collected"])
			COMPASS_PINS:RefreshPins()
			break
		end
	end
end

local function OnLoad(eventCode, name)
	if name ~= "SkyShards" then return end

	savedVariables = ZO_SavedVars:New("SkyS_SavedVariables", 4, nil, defaults)

	language = GetCVar("language.2") or "en"
	if not (language == "en" or language == "de" or language == "fr") then
		MyPrint("Language \"" .. language .. "\" is not supported. SkyShars will use default english localizaton.")
		language = "en"
	end

	--get pin layout from saved variables
	local pinTextureType = savedVariables.pinTexture.type or 1
	local pinTextureLevel = savedVariables.pinTexture.level or 40
	local pinTextureSize = savedVariables.pinTexture.size or 38
	local compassMaxDistance = savedVariables.compassMaxDistance or 0.05

	local pinLayout_unknown = { 
		level = pinTextureLevel,
		texture = pinTextures.unknown[pinTextureType],
		size = pinTextureSize,
	}
	local pinLayout_collected = {
		level = pinTextureLevel,
		texture = pinTextures.collected[pinTextureType],
		size = pinTextureSize,
	}
	local pinLayout_compassunknown = { 
		maxDistance = compassMaxDistance,
		texture = pinTextures.unknown[pinTextureType],
	}

	--initialize map pins
	AddMapPin("SkySMapPin_unknown", MapCallback_unknown, nil, pinLayout_unknown, pinTooltipCreator_unknown)
	AddMapPin("SkySMapPin_collected", MapCallback_collected, nil, pinLayout_collected, pinTooltipCreator_collected)

	--add filter check boxex
	AddPinFilters("SkySMapPin_unknown", SkyS[language].filterUnknown)
	AddPinFilters("SkySMapPin_collected", SkyS[language].filterCollected)
			
	--initialize compass pins
	COMPASS_PINS:AddCustomPin("SkySCompassPin_unknown", CompassPinCallback_unknown, pinLayout_compassunknown)
	COMPASS_PINS:RefreshPins()

	-- addon menu
	CreateSettingsMenu()

	-- slash commands
	SLASH_COMMANDS["/mypos"] = ShowMyPosition
	SLASH_COMMANDS["/myposition"] = ShowMyPosition
	SLASH_COMMANDS["/myloc"] = ShowMyPosition
	SLASH_COMMANDS["/mylocation"] = ShowMyPosition


	EVENT_MANAGER:UnregisterForEvent("SkyShards", EVENT_ADD_ON_LOADED)
end

EVENT_MANAGER:RegisterForEvent("SkyShards_OnLoad", EVENT_ADD_ON_LOADED, OnLoad)
EVENT_MANAGER:RegisterForEvent("SkyShards_OnAchievementUpdate",  EVENT_ACHIEVEMENT_UPDATED, OnAchievementUpdate)
