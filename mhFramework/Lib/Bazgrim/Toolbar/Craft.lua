--[[
 * Crafting timers.
 * Still to do:
 * Icons for each thing being researched.
 * Turn time yellow when 1 research slot avail, red when all research slots avail.
]]--

-- Wrapper to get the toolbar data for smithing.
WF_BazgrimToolbar.GetSmith = function()
	return WF_BazgrimToolbar.GetCraftingValue(WF_TOOLBAR_TOOL_SMITH, CRAFTING_TYPE_BLACKSMITHING, "/esoui/art/icons/servicemappins/servicepin_smithy.dds")
end


-- Wrapper to get the toolbar data for woodworking..
-- Yes, I giggled when I noticed, and left the name unchanged. I'm not proud.
WF_BazgrimToolbar.GetWood = function()
	return WF_BazgrimToolbar.GetCraftingValue(WF_TOOLBAR_TOOL_WOOD, CRAFTING_TYPE_WOODWORKING, "/esoui/art/icons/servicemappins/servicepin_woodworking.dds")
end
-- "/esoui/art/icons/servicemappins/servicepin_bank.dds"


-- Wrapper to get the toolbar data for clothier.
WF_BazgrimToolbar.GetCloth = function()
	return WF_BazgrimToolbar.GetCraftingValue(WF_TOOLBAR_TOOL_CLOTH, CRAFTING_TYPE_CLOTHIER, "/esoui/art/icons/servicemappins/servicepin_outfitter.dds") -- I couldn't find a better icon :(
end


-- Generic function for all crafting to generate the toolbar data.
WF_BazgrimToolbar.GetCraftingValue = function(toolId, craftType, craftIconPath)
	local result = ""

	-- Read in user settings.
	local doShow = WF_GetOrDefault(true, WF_SavedVars.BazgrimToolbar["Tools"][toolId])
	local craftIcons = WF_GetOrDefault(true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_icon"])
	local traitIcons = WF_GetOrDefault(true, WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_research_icons"])
	local timerStyles = WF_GetOrDefault(WF_TOOLBAR_STR_FANCY_STUDY, WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_timers"])
	local timerTarget = WF_GetOrDefault(WF_TOOLBAR_STR_TIME_TO_NEXT_FREE, WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_timer_target"])
	local slotDisplay = WF_GetOrDefault(WF_TOOLBAR_STR_SLOTS_FREE_TOTAL, WF_SavedVars.BazgrimToolbar["ToolOptions"]["craft_slots"])
	local secsMinLeft, secsMinTotal, secsMaxLeft, secsMaxTotal, numSlots, numFreeSlots, icons = WF_BazgrimToolbar.GetCraftingData(craftType)

	-- Get timer settings depending on our target.
	local secsLeft = secsMaxLeft
	local secsTotal = secsMaxTotal
	if WF_TOOLBAR_STR_TIME_TO_NEXT_FREE == timerTarget then
		secsLeft = secsMinLeft
		secsTotal = secsMinTotal
	end
	
	-- Get percentage done.
	local percentDone = 100
	if secsTotal > 0 then   -- Avoid div by zero.
		percentDone = math.floor(100 * (secsLeft/secsTotal))
	end

	-- Our return color.
	local r, g, b = WF_ColorScale_RedGreenPowerMeter(secsLeft, secsTotal, true)
	local c = { r, g, b, 1 }

	-- Sanity check our values. Should do this earlier really.
	if not doShow then 
		return result, c;
	end
	if secsLeft == nil or secsTotal == nil then
		return result, c;
	end

	-- Parse time values.
	local timeForHuman = WF_MillisecondsToHuman(secsLeft * 1000, false)
	local hh, mm, ss = timeForHuman:match("([^:]+):([^:]+):([^:]+)")
	local hn, mn, sn = tonumber(hh), tonumber(mm), tonumber(ss)

	-- Create display value for toolbar, depending on users chosen style
	if timerStyles == WF_TOOLBAR_STR_FANCY_STUDY then
		-- As study times change, unlike horse feeding, we go off percentage instead of time.
		if     percentDone < 1  then result = WF_TOOLBAR_STR_STUDY_1
		elseif percentDone < 10 then result = WF_TOOLBAR_STR_STUDY_2
		elseif percentDone < 20 then result = WF_TOOLBAR_STR_STUDY_3
		elseif percentDone < 30 then result = WF_TOOLBAR_STR_STUDY_4
		elseif percentDone < 40 then result = WF_TOOLBAR_STR_STUDY_5
		elseif percentDone < 50 then result = WF_TOOLBAR_STR_STUDY_6
		elseif percentDone == 50 then result = WF_TOOLBAR_STR_STUDY_HALF
		elseif percentDone < 60 then result = WF_TOOLBAR_STR_STUDY_7
		elseif percentDone < 70 then result = WF_TOOLBAR_STR_STUDY_8
		elseif percentDone < 80 then result = WF_TOOLBAR_STR_STUDY_9
		elseif percentDone < 90 then result = WF_TOOLBAR_STR_STUDY_10
		elseif percentDone < 95 then result = WF_TOOLBAR_STR_STUDY_11
		elseif percentDone < 97 then result = WF_TOOLBAR_STR_STUDY_12
		elseif percentDone < 98 then result = WF_TOOLBAR_STR_STUDY_13
		elseif percentDone < 99 then result = WF_TOOLBAR_STR_STUDY_14
		else                         result = WF_TOOLBAR_STR_STUDY_DONE
		end
	elseif timerStyles == WF_TOOLBAR_STR_PERCENTAGE_DONE then
		result = percentDone .. '%'
	elseif timerStyles == WF_TOOLBAR_STR_PERCENTAGE_LEFT then
		result = (100 - percentDone) .. '%'
	elseif timerStyles == WF_TOOLBAR_STR_ADAPTIVE then
		if     hn > 0 then result = hh .. ":" .. mm
		elseif mn > 0 then result = mm .. ":" .. ss
		end
	elseif timerStyles == WF_TOOLBAR_STR_DESCRIPTIVE then
		if     hn > 0 then result = hh .. " " .. WF_TOOLBAR_STR_HOURS
		elseif mn > 0 then result = mm .. " " .. WF_TOOLBAR_STR_MINUTES
		elseif sn > 0 then result = ss .. " " .. WF_TOOLBAR_STR_SECONDS
		else               result = WF_TOOLBAR_STR_STUDY_DONE	
		end
	elseif timerStyles == WF_TOOLBAR_STR_COUNTDOWN then
		result = timeForHuman
	end

	-- Generate slot display.
	if slotDisplay     == WF_TOOLBAR_STR_SLOTS_TOTAL      then  result = WF_BazgrimToolbar_DefaultLabelColor .. numSlots .. "|r " .. result
	elseif slotDisplay == WF_TOOLBAR_STR_SLOTS_USED       then  result = WF_BazgrimToolbar_DefaultLabelColor .. (numSlots-numFreeSlots) .. "|r " .. result
	elseif slotDisplay == WF_TOOLBAR_STR_SLOTS_FREE       then  result = WF_BazgrimToolbar_DefaultLabelColor .. numFreeSlots .. "|r " .. result
	elseif slotDisplay == WF_TOOLBAR_STR_SLOTS_USED_TOTAL then  result = WF_BazgrimToolbar_DefaultLabelColor .. (numSlots-numFreeSlots) .. "/" .. numSlots .. "|r " .. result
	elseif slotDisplay == WF_TOOLBAR_STR_SLOTS_FREE_TOTAL then  result = WF_BazgrimToolbar_DefaultLabelColor .. numFreeSlots .. "/" .. numSlots .. "|r " .. result
	end

	-- Add the crafting icon for this crafting class.
	if craftIcons then
		local o = bazgrimToolbar.Tools[toolId].Control
		if o.Icon == nil then
			o.Icon = WF_BazgrimToolbar.MakeSpacerControl(o);
			o.Icon:SetTexture(craftIconPath)
		end
		o.IconSize = 16
		o.BufferSize = 16
		if not o.UseIcon then
			o.Icon:SetDimensions(o.IconSize, o.IconSize)
			o.Icon:ClearAnchors()
			o.Icon:SetAnchor(RIGHT, o, LEFT, -4, 0)
			o.Icon:SetHidden(false)
			local aBool, aPoint, aTarget, aTargetPoint, aX, aY = o:GetAnchor()
			o.PreviousAnchor = {aPoint, aTarget, aTargetPoint, aX, aY}
			o:ClearAnchors()
			o:SetAnchor(aPoint, aTarget, aTargetPoint, aX + o.BufferSize + 4, aY)
		end
		o.UseIcon = true
	else
		local o = bazgrimToolbar.Tools[toolId].Control
		if o.UseIcon == true then
			o.Icon:SetDimensions(o.IconSize, o.IconSize)
			o.Icon:ClearAnchors()
			o.Icon:SetAnchor(RIGHT, o, LEFT, -4, 0)
			o.Icon:SetHidden(true)
			if o.PreviousAnchor ~= nil then
				o:ClearAnchors()
				o:SetAnchor(o.PreviousAnchor[1], o.PreviousAnchor[2], o.PreviousAnchor[3], o.PreviousAnchor[4], o.PreviousAnchor[5])
			end
			o.PreviousAnchor = nil
		end
		o.UseIcon = false
	end

--[[ Almost works. Loads, but all icons display over each other.
	if traitIcons then
		local o = bazgrimToolbar.Tools[toolId].Control
		if o.Icons == nil then 
			o.Icons = {}
		end
		for key,iconPath in pairs(icons) do
			if o.Icons[key] == nil then o.Icons[key] = WF_BazgrimToolbar.MakeSpacerControl(o); o.Icons[key]:SetTexture(iconPath) end
			o.IconSize = 24
			o.BufferSize = 24
			if not o.UseIcons then
				o.Icons[key]:SetDimensions(o.IconSize, o.IconSize)
				o.Icons[key]:ClearAnchors()
				o.Icons[key]:SetAnchor(RIGHT, o, LEFT, -4, 0)
				o.Icons[key]:SetHidden(false)
				local aBool, aPoint, aTarget, aTargetPoint, aX, aY = o:GetAnchor()
				o.PreviousAnchor = {aPoint, aTarget, aTargetPoint, aX, aY}
				o:ClearAnchors()
				o:SetAnchor(aPoint, aTarget, aTargetPoint, aX + o.BufferSize + 4, aY)
			end
		end
		o.UseIcons = true
	end
]]--

	return result, c
end


-- Function to get blacksmithing time
-- returns table: secs left to next free slot; total secs to next free; secs left for all; total secs for all; num slots; num free slots; research icons table
WF_BazgrimToolbar.GetCraftingData = function(craftClass)
	local icons = {}
	-- Vars for next free slot.
	local secsMinLeft = 0
	local secsMinTotal = 0
	-- Vars for total time remaining.
	local secsMaxLeft = 0
	local secsMaxTotal = 0

	local numSlots = GetMaxSimultaneousSmithingResearch(craftClass)
	local numResearchLines = GetNumSmithingResearchLines(craftClass)
	local numFreeSlots = numSlots
	for researchLine = 1, numResearchLines do
		local name, icon, numTraits, researchTimeSecs = GetSmithingResearchLineInfo(craftClass, researchLine)
		-- Loop over all researchable traits.
		for researchTrait = 1, numTraits do
			totalTimeSecs, timeLeftSecs = GetSmithingResearchLineTraitTimes(craftClass, researchLine, researchTrait) 		
			-- If this is the one we're researching, parse it.
			if ((totalTimeSecs ~= nil) and (timeLeftSecs ~= nil)) then
				table.insert(icons, icon)
				numFreeSlots = numFreeSlots - 1
				-- Set max time if necessary
				if timeLeftSecs > secsMaxLeft then
					secsMaxLeft = timeLeftSecs
					secsMaxTotal = totalTimeSecs
				end
				-- Set min time if necessary
				if (timeLeftSecs < secsMinLeft) or (secsMinLeft == 0) then
					secsMinLeft = timeLeftSecs
					secsMinTotal = totalTimeSecs
				end
			end
		end
	end
	return secsMinLeft, secsMinTotal, secsMaxLeft, secsMaxTotal, numSlots, numFreeSlots, icons
end