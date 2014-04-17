function Harvest.importFromEsohead()
	if not EH then
		d("Please enable the Esohead addon to import data!")
		return
	end
	d("import data from Esohead")
	d("import harvest nodes")
	local profession
	local newMapName
	if not Harvest.nodes.oldData then
		Harvest.nodes.oldData = {}
	end
	for map, data in pairs(EH.savedVars["harvest"].data) do
		d("import data from "..map)
		newMapName = Harvest.GetNewMapName(map)
		if newMapName then
			for index, nodes in pairs(data) do
				profession = index
				if profession == 6 then
					profession = 5
				end
				for _, node in pairs(nodes) do
					Harvest.saveData( newMapName, node[1], node[2], profession, node[4], node[5] )
				end
			end
		end
	end
	d("import chests")
	for map, nodes in pairs(EH.savedVars["chest"].data) do
		d("import data from "..map)
		newMapName = Harvest.GetNewMapName(map)
		if newMapName then
			for _, node in pairs(nodes) do
				Harvest.saveData( newMapName, node[1], node[2], 6, "chest", nil )
			end
		end
	end
	d("finished")
	Harvest.RefreshPins()
end

SLASH_COMMANDS["/import"] = Harvest.importFromEsohead