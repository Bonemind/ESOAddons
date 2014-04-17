Harvest = {}
Harvest.chestID = 6

local internalVersion = 1

function Harvest.OnLootReceived( eventCode, receivedBy, objectName, stackCount, soundCategory, lootType, lootedBySelf )
	if not Harvest.isHarvesting or not lootedBySelf then
		if Harvest.settings.debug then
			if not Harvest.isHarvesting then
			 d("Not Harvesting")
			end
			if  not lootedBySelf then
			d("Not Looted by self")
			end
		end
		return
	end
	
	local zone, x, y = Harvest.GetLocation()
	local itemId
	_, _, _, itemId = ZO_LinkHandler_ParseLink( objectName ) --name, color, type, id, +19 other attributes
	itemId = tonumber( itemId )
	local profession = Harvest.GetProfession( itemId )
	Harvest.saveData( zone, x, y, profession, Harvest.nodeName, itemID )
	
	Harvest.RefreshPins( profession )
end

function Harvest.OnLootUpdate()
	if Harvest.settings.debug then
		d("loot update")
	end
	local items = GetNumLootItems()
	local id
	for lootIndex = 1,items do
		id = GetLootItemInfo(lootIndex)
		Harvest.OnLootReceived( nil, nil, GetLootItemLink(id), nil, nil, nil, true )
	end
end

function Harvest.RefreshPins( profession )
	if not profession then
		ZO_WorldMap_RefreshCustomPinsOfType()
		COMPASS_PINS:RefreshPins()
		return
	end
	if profession >= 1 and profession <= 6 then
		ZO_WorldMap_RefreshCustomPinsOfType( _G[ Harvest.GetPinType( profession ) ] )
		COMPASS_PINS:RefreshPins( Harvest.GetPinType( profession ) )
	end
end

function Harvest.GetMap()
	local textureName = GetMapTileTexture()
	textureName = string.lower(textureName)
	textureName = string.gsub(textureName, "^.*maps/", "")
	textureName = string.gsub(textureName, "_%d+%.dds$", "")
	
	return textureName
end

function Harvest.GetLocation()
	SetMapToPlayerLocation()
	
	local zone = Harvest.GetMap()
	local x, y = GetMapPlayerPosition( "player" )
	return zone, x, y
end

function Harvest.GetProfession( itemId )
	if Harvest.settings.debug then
		d("Try to get profession id for item with id:" .. itemId)
	end
	for profession, items in pairs(Harvest.professions) do
		for _, item in pairs(items) do
			if item == itemId then
				if Harvest.settings.debug then
					d("profession id:" .. profession)
				end
				return profession
			end
		end
	end
	if Harvest.settings.debug then
		d("No profession found, instead use id:" .. itemId)
	end
	return -1
end

function Harvest.saveData( zone, x, y, profession, nodeName, itemID )
	if not profession then
		return
	end
	if Harvest.alreadyFound( zone, x, y, profession, nodeName ) then
		return
	end
	
	if not Harvest.nodes.data[zone] then
		Harvest.nodes.data[zone] = {}
	end
	
	if not Harvest.nodes.data[zone][profession] then
		Harvest.nodes.data[zone][profession] = {}
	end
	
	if Harvest.settings.debug then
		d("Save data!")
	end
	
	table.insert( Harvest.nodes.data[zone][profession], { x, y, { nodeName }, itemID } )
	
end

function Harvest.contains(table, value)
	for key, v in pairs(table) do
		if v == value then
			return v
		end
	end
	return nil
end

function Harvest.alreadyFound( zone, x, y, profession, nodeName )
	
	if not Harvest.nodes.data[zone] then
		return false
	end
	
	if not Harvest.nodes.data[zone][profession] then
		return false
	end
	
	
	local dx, dy
	for _, entry in pairs( Harvest.nodes.data[zone][profession] ) do
		--if entry[3] == nodeName then
			dx = entry[1] - x
			dy = entry[2] - y
			if dx * dx + dy * dy < Harvest.minDist then
				if profession > 0 then
					if not Harvest.contains(entry[3], nodeName) then
						table.insert(entry[3], nodeName)
					end
					if Harvest.settings.debug then
						d("Node:" .. nodeName .. " on: " .. zone .. " x:" .. x .." , y:" .. y .. " for profession " .. profession .. " already found!")
					end
					return true
				else
					if entry[3][1] == nodeName then
						if Harvest.settings.debug then
							d("Node:" .. nodeName .. " on: " .. zone .. " x:" .. x .." , y:" .. y .. " for profession " .. profession .. " already found!")
						end
						return true
					end
				end
			end
		--end
        end
	if Harvest.settings.debug then
		d("Node:" .. nodeName .. " on: " .. zone .. " x:" .. x .." , y:" .. y .. " for profession " .. profession .. " not found!")
	end
	return false
end

function Harvest.OnUpdate(time)
	local newAction, nodeName = GetGameCameraInteractableActionInfo()
	local isHarvesting = (IsPlayerInteractingWithObject() and (GetInteractionType() == INTERACTION_HARVEST))
	if not isHarvesting then
		if nodeName then
			Harvest.nodeName = nodeName
		end
		if Harvest.isHarvesting and time - Harvest.time > 1 then
			Harvest.isHarvesting = false
		end
		if newAction ~= Harvest.action then
			Harvest.action = newAction
			if Harvest.action == GetString(SI_GAMECAMERAACTIONTYPE12) then
				local zone, x, y = Harvest.GetLocation()
				Harvest.saveData( zone, x, y, Harvest.chestID, "chest" )
				Harvest.RefreshPins( Harvest.chestID )
			end
		end
	else
		Harvest.isHarvesting = true
		Harvest.time = time
	end
end

function Harvest.OnLoad(eventCode, addOnName)
	if addOnName ~= "HarvestMap" then
		return
	end
	
	Harvest.isHarvesting = false
	Harvest.minDist = 0.000025 -- 0.005^2
	Harvest.nodes = ZO_SavedVars:NewAccountWide("Harvest_SavedVars", 2, "nodes", { data = {} } )
	Harvest.settings = ZO_SavedVars:NewAccountWide("Harvest_SavedVars", 1, "settings",
		{
			filters = {
				[0] = true, [1] = true, [2] = true, [3] = true, [4] = true, [5] = true, [6] = true
			},
			mapLayouts = Harvest.defaultMapLayouts,
			compassLayouts = Harvest.defaultCompassLayouts
		}
	)
	
	if (Harvest.nodes.internalVersion or 0) < internalVersion then
		Harvest.updateNodes(Harvest.nodes.internalVersion or 0)
		Harvest.nodes.internalVersion = internalVersion
	end
	
	Harvest.InitializeMapMarkers()
	Harvest.InitializeCompassMarkers()
	Harvest.InitializeOptions()
	
	EVENT_MANAGER:RegisterForEvent("HarvestMap", EVENT_LOOT_RECEIVED, Harvest.OnLootReceived)
	EVENT_MANAGER:RegisterForEvent("HarvestMap", EVENT_LOOT_UPDATED, Harvest.OnLootUpdate)
	
end

EVENT_MANAGER:RegisterForEvent("HarvestMap", EVENT_ADD_ON_LOADED, Harvest.OnLoad)