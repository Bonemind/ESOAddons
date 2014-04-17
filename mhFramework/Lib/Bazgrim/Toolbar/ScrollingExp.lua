WF_BazgrimToolbar.ScrollingExp = {}
WF_BazgrimToolbar.ScrollingExp.Registered = false

WF_BazgrimToolbar.ScrollingExp.Update = function()
	if WF_SavedVars.BazgrimToolbar["Settings"].ScrollingExp then
		WF_BazgrimToolbar.ScrollingExp.Registered = true
		EVENT_MANAGER:RegisterForEvent( "bazgrimScrollingKillExp", EVENT_EXPERIENCE_UPDATE, WF_BazgrimToolbar.ScrollingExp.FromKill )
		EVENT_MANAGER:RegisterForEvent( "bazgrimScrollingQuestExp", EVENT_QUEST_COMPLETE_EXPERIENCE, WF_BazgrimToolbar.ScrollingExp.FromQuest )
		EVENT_MANAGER:RegisterForEvent( "bazgrimScrollingDiscExp", EVENT_EXPERIENCE_GAIN_DISCOVERY, WF_BazgrimToolbar.ScrollingExp.FromDiscovery )
		bazgrimToolbar.ScrollingWindow:SetHidden(false)
		bazgrimToolbar.ScrollingText:SetHidden(false)
	else
		if WF_BazgrimToolbar.ScrollingExp.Registered then
			EVENT_MANAGER:UnregisterForEvent( "bazgrimScrollingKillExp", EVENT_EXPERIENCE_UPDATE )
			EVENT_MANAGER:UnregisterForEvent( "bazgrimScrollingQuestExp", EVENT_QUEST_COMPLETE_EXPERIENCE )
			EVENT_MANAGER:UnregisterForEvent( "bazgrimScrollingDiscExp", EVENT_EXPERIENCE_GAIN_DISCOVERY )
			bazgrimToolbar.ScrollingWindow:SetHidden(true)
			bazgrimToolbar.ScrollingText:SetHidden(true)
		end
	end
end

local baseXP = GetUnitXP("player")

WF_BazgrimToolbar.ScrollingExp.FromKill = function(eventCode, unitTag, minXP, maxXP, reason)
	if not unitTag == "player" then return end
	if WF_SavedVars.BazgrimToolbar["Settings"].ScrollingExp and reason == 0 then
		bazgrimToolbar.ScrollingText:SetText("+"..(minXP - baseXP).." XP")
		bazgrimToolbar.ScrollingText:SetColor(1,.5,.5,1)
		WF_ScrollControls.gameTimeStamp = GetGameTimeMilliseconds()
		baseXP = GetUnitXP("player")
	end
end

WF_BazgrimToolbar.ScrollingExp.FromQuest = function(eventCode, questName, xpGained)
	if WF_SavedVars.BazgrimToolbar["Settings"].ScrollingExp then
		bazgrimToolbar.ScrollingText:SetText("+"..xpGained.." XP")
		bazgrimToolbar.ScrollingText:SetColor(.5,1,.5,1)
		WF_ScrollControls.gameTimeStamp = GetGameTimeMilliseconds()
	end
	baseXP = GetUnitXP("player")
end

WF_BazgrimToolbar.ScrollingExp.FromDiscovery = function(eventCode, areaName, value)
	if WF_SavedVars.BazgrimToolbar["Settings"].ScrollingExp then
		bazgrimToolbar.ScrollingText:SetText("+"..value.." XP")
		bazgrimToolbar.ScrollingText:SetColor(.5,.5,1,1)
		WF_ScrollControls.gameTimeStamp = GetGameTimeMilliseconds()
	end
	baseXP = GetUnitXP("player")
end
