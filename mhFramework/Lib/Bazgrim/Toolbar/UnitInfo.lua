WF_BazgrimToolbar.GetUnit_Name = function() 
	return "|cC0A27F"..GetUnitName("player").."|r", {215/255,213/255,205/255,.85} 
end

WF_BazgrimToolbar.GetUnit_Race = function() 
	return "|cC0A27F"..GetUnitRace("player").."|r", {215/255,213/255,205/255,.85} 
end

WF_BazgrimToolbar.GetUnit_Class = function() 
	return "|cC0A27F"..GetUnitClass("player").."|r", {215/255,213/255,205/255,.85} 
end

WF_BazgrimToolbar.GetUnit_Level = function() 
	local useTitle, title = WF_GetOrDefault( true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["level_title"]), WF_BazgrimToolbar_DefaultLabelColor .. "Level:|r "
	if not useTitle then title = "" end
	local lvl, vet, c = GetUnitLevel("player"), GetUnitVeteranRank("player"), {215/255,213/255,205/255,.85}
	if lvl == 50 then lvl = "|cC9BC0Fv|r"..vet; c = {1,1,.76,.85} end
	return title..lvl, c
end