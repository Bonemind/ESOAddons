WF_BazgrimToolbar.GetXPBar = function()
	local xp, xplvl, title =  GetUnitXP('player'), GetUnitXPMax('player'), WF_BazgrimToolbar_DefaultLabelColor .. "XP:|r "
	if tonumber(xplvl) == 0 then
		xp, xplvl, title = GetUnitVeteranPoints("player"), GetUnitVeteranPointsMax("player"), WF_BazgrimToolbar_DefaultLabelColor .. "VP:|r "
	end
	if tonumber(xplvl) == 0 then return 1; end
	return WF_ROUND((xp / xplvl),2);
end