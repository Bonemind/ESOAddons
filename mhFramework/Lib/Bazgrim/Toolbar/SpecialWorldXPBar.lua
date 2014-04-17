WF_BazgrimToolbar.GetSpecialWorldXPBar = function()
	if GetNumSkillLines( SKILL_TYPE_WORLD ) == 1 then return 0, WF_BazgrimToolbar_DefaultLabelColor .. "Human:|r ", 1; end
	local name, rank = GetSkillLineInfo( SKILL_TYPE_WORLD, 2 )
	local oldxp, xplvl, xp = GetSkillLineXPInfo( SKILL_TYPE_WORLD, 2 )
	if xp == nil or xplvl == nil or oldxp == nil then return 0, WF_BazgrimToolbar_DefaultLabelColor .. "Human:|r ", 1; end
	xp = xp - oldxp
	xplvl = xplvl - oldxp
	local title = WF_BazgrimToolbar_DefaultLabelColor .. name .. ":|r "
	if tonumber(xplvl) == 0 then return 1, title, rank; end
	return WF_ROUND((xp / xplvl),2), title, rank;
end

--[[

GetNumSkillLines( SKILL_TYPE_WORLD )

* GetNumSkillLines(*[SkillType|#SkillType]* _skillType_)
** _Returns:_ *integer* _numSkillLines_

* GetSkillLineInfo(*[SkillType|#SkillType]* _skillType_, *luaindex* _skillIndex_)
** _Returns:_ *string* _name_, *luaindex* _rank_

* GetSkillLineXPInfo(*[SkillType|#SkillType]* _skillType_, *luaindex* _skillIndex_)
** _Returns:_ *integer* _lastRankXp_, *integer* _nextRankXP_, *integer* _currentXP_

]]--