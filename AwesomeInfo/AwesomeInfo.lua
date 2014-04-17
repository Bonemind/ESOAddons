-- Awesome Info mod for Elder Scrolls Online
-- Author: Stormknight

AI = {}

AI.name = "AwesomeInfo"
AI.version = "1.1.0"
AI.initialised = false

-- Set-up the defaults options for saved variables.
AI.defaults = {
    locx            = 1375,
    locy            = 30,
    scaling         = 1.0,
	clockShow       = true,
	clock24         = true,
	dateShow        = false,
	skillsShow      = true,
	bagsShow        = true,
	bagsWarn        = 10,
	bagsCritical    = 5,
	duraShow        = true,
	duraWarning     = 25,       -- percentage
	duraCritical    = 10,       -- percentage
	researchShow    = true,
	horseShow       = true,
	horseWarning    = 30,       -- this is in MINUTES
}

function AI.Initialise(eventCode, addOnName)

	-- Only initialize our own addon
	if (AI.name ~= addOnName) then return end

	-- Load the saved variables
	AI.vars = ZO_SavedVars:NewAccountWide("AI_SavedVariables", 1, nil, AI.defaults)

    AI.lastOnUpdate = 0
    AI.duraLastUpdate = 8
    AI.duraFrequency = 10   -- number of seconds between re-checking durability
    
	AwesomeInfo:ClearAnchors();
	AwesomeInfo:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, AI.vars.locx, AI.vars.locy)
	--AwesomeInfo:SetAnchor(TOPLEFT, GuiRoot, TOPLEFT, 1375, 30)
    
    AwesomeInfoBG:SetAlpha(0)
    
    AwesomeInfoLabelTime:ClearAnchors();
	AwesomeInfoLabelTime:SetAnchor(TOP, AwesomeInfo, TOP, 0, 0)
    AwesomeInfoLabelTime:SetWidth( 200 )
    AwesomeInfoLabelTime:SetHeight( 25 )
        
    -- date is on hold for now, so is just being used as a spacer.
    AwesomeInfoLabelDate:ClearAnchors();
	AwesomeInfoLabelDate:SetAnchor(TOP, AwesomeInfo, TOP, 0, 25)
    AwesomeInfoLabelDate:SetWidth( 200 )
    AwesomeInfoLabelDate:SetHeight( 10 )
        
    AwesomeInfoLabelSkills:ClearAnchors();
	AwesomeInfoLabelSkills:SetAnchor(TOP, AwesomeInfoLabelDate, BOTTOM, 0, 0)
    AwesomeInfoLabelSkills:SetWidth( 200 )
    AwesomeInfoLabelSkills:SetHeight( 0 )
        
    AwesomeInfoLabelBags:ClearAnchors();
	AwesomeInfoLabelBags:SetAnchor(TOP, AwesomeInfoLabelSkills, BOTTOM, 0, 0)
    AwesomeInfoLabelBags:SetWidth( 200 )
    AwesomeInfoLabelBags:SetHeight( 0 )
    
    AwesomeInfoLabelDura:ClearAnchors();
	AwesomeInfoLabelDura:SetAnchor(TOP, AwesomeInfoLabelBags, BOTTOM, 0, 0)
    AwesomeInfoLabelDura:SetWidth( 200 )
    AwesomeInfoLabelDura:SetHeight( 0 )
    
    -- No research functionality yet. This is for a later version.
    AwesomeInfoLabelResearch:ClearAnchors();
	AwesomeInfoLabelResearch:SetAnchor(TOP, AwesomeInfoLabelDura, BOTTOM, 0, 0)
    AwesomeInfoLabelResearch:SetWidth( 200 )
    AwesomeInfoLabelResearch:SetHeight( 0 )
        
    AwesomeInfoLabelHorse:ClearAnchors();
	AwesomeInfoLabelHorse:SetAnchor(TOP, AwesomeInfoLabelResearch, BOTTOM, 0, 0)
    AwesomeInfoLabelHorse:SetWidth( 200 )
    AwesomeInfoLabelHorse:SetHeight( 0 )
    
    -- Run various events to set the correct warning flags
    AI.OnInventorySlotUpdate()
    AI.OnSkillsChange()
    
    -- Invoke config menu set-up
    AI.CreateConfigMenu()
    
    -- The rest of the event registration is here, rather than wih ADD_ON_LOADED because I don't want any of them being
    -- called until after initialisation is complete.
    EVENT_MANAGER:RegisterForEvent("AI", EVENT_RETICLE_HIDDEN_UPDATE, AI.ReticleHidden)
    EVENT_MANAGER:RegisterForEvent("AI", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, AI.OnInventorySlotUpdate)
    EVENT_MANAGER:RegisterForEvent("AI",  EVENT_ATTRIBUTE_UPGRADE_UPDATED , AI.OnSkillsChange)
    EVENT_MANAGER:RegisterForEvent("AI",  EVENT_SKILL_POINTS_CHANGED , AI.OnSkillsChange)

    AI.initialised = true
end -- AI.Initialise


EVENT_MANAGER:RegisterForEvent("AI", EVENT_ADD_ON_LOADED, AI.Initialise)


-- SLASH COMMAND FUNCTIONALITY
function AIslash(extra)
    d(AI.vars)
end -- AIslash
 
SLASH_COMMANDS["/ai"] = AIslash


-- If the reticle is hidden, it's because the map or menus are up, so dim the add-on
function AI.ReticleHidden(eventCode, hidden)
    if (hidden) then
        AwesomeInfo:SetAlpha(0.5)
    else
        AwesomeInfo:SetAlpha(1)
    end
end -- AI.ReticleHidden


function AI.OnUpdate()
    -- Bail if we haven't completed the initialisation routine yet.
    if (not AI.initialised) then return end
    -- Only run this update if a full second has elapsed since last time we did so.
    local curSeconds = GetSecondsSinceMidnight()
    if ( curSeconds ~= AI.lastOnUpdate ) then
        AI.lastOnUpdate = curSeconds
        -- Update the CLOCK if option is enabled
        if (AI.vars.clockShow) then
            local timeFormat = 0
            if (AI.vars.clock24) then
                timeFormat = TIME_FORMAT_PRECISION_TWENTY_FOUR_HOUR
            else
                timeFormat = TIME_FORMAT_PRECISION_TWELVE_HOUR
            end
            local formattedTime = FormatTimeSeconds(GetSecondsSinceMidnight(), TIME_FORMAT_STYLE_CLOCK_TIME, timeFormat, TIME_FORMAT_DIRECTION_NONE)
            AwesomeInfoLabelTime:SetText(formattedTime)
        end
        -- Update for MOUNTS
        AI.updateMountInfo()
        -- Update for DURABILITY
        -- Only check periodically, every duraFrequency seconds
        AI.duraLastUpdate = AI.duraLastUpdate + 1
        if (AI.duraLastUpdate > AI.duraFrequency) then
            AI.duraLastUpdate = 0
            AI:UpdateDurability()
        end
    end
end -- AI.OnUpdate


-- TODO: work out a way of reducing the amount of work done here every update, even if it is only once per second
-- TODO: What happens when the mount has been fully fed it's 50 times? Don't want to display warning.
function AI.updateMountInfo()
    if (AI.vars.horseShow) then
        local mountTimer = GetTimeUntilMountCanBeFed()
        if (mountTimer == nil) then  -- fix for characters with no mount
            AwesomeInfoLabelHorse:SetText("")
            AwesomeInfoLabelHorse:SetHeight( 0 )
            return
        end
        if (mountTimer > 0) then
            mountTimer = math.floor(mountTimer / 60000) -- we only want the time in WHOLE minutes.
            if (mountTimer < AI.vars.horseWarning) then
                local horseTimeFormatted = FormatTimeSeconds(60 * mountTimer, TIME_FORMAT_STYLE_DESCRIPTIVE_SHORT , TIME_FORMAT_PRECISION_TWENTY_FOUR_HOUR , TIME_FORMAT_DIRECTION_NONE)
                AwesomeInfoLabelHorse:SetHeight( 20 )
                AwesomeInfoLabelHorse:SetText("Feed horse in " .. horseTimeFormatted)
            else
                AwesomeInfoLabelHorse:SetText("")
                AwesomeInfoLabelHorse:SetHeight( 0 )
            end
        else
            AwesomeInfoLabelHorse:SetHeight( 20 )
            AwesomeInfoLabelHorse:SetText("|cFFFF80Horse needs feeding|r")  -- yellow
        end
    else
        AwesomeInfoLabelHorse:SetText("")
        AwesomeInfoLabelHorse:SetHeight( 0 )
    end
end -- AI.updateMountInfo

function AI.OnInventorySlotUpdate (eventCode,bagId,slotId,isNewItem,itemSoundCategory,updateReason)
    if (AI.vars.bagsShow) then
        local curInv,maxInv =PLAYER_INVENTORY:GetNumSlots(INVENTORY_BACKPACK)
        local freeInv = maxInv - curInv
        -- d("Free slots: " .. freeInv .. " - Warn: " .. AI.vars.bagsWarn .. " - Crit: " ..AI.vars.bagsCritical)
        if (freeInv <= AI.vars.bagsWarn) then
            AwesomeInfoLabelBags:SetHeight( 20 )
            AwesomeInfoLabelBags:SetText("Bag space: " .. freeInv)
            if (freeInv <= AI.vars.bagsCritical) then
                AwesomeInfoLabelBags:SetColor(255,0,0,1)    -- red
            else
                AwesomeInfoLabelBags:SetColor(255,255,0,1)  -- yellow
            end
        else
            AwesomeInfoLabelBags:SetText("")
            AwesomeInfoLabelBags:SetHeight( 0 )
        end
    else
        AwesomeInfoLabelBags:SetText("")
        AwesomeInfoLabelBags:SetHeight( 0 )
    end
end -- AI.OnInventorySlotUpdate

function AI.OnSkillsChange(...)
    if (AI.vars.skillsShow) then
    	local attributePoints = GetAttributeUnspentPoints()
    	local skillPoints = GetAvailableSkillPoints()
    	if (attributePoints + skillPoints > 0) then
            AwesomeInfoLabelSkills:SetHeight( 20 )
    	    local displaytext = ""
    	    if (attributePoints > 0) then
    	        displaytext = " |cFFFF60 Attributes:|r " .. attributePoints .. " "  -- faded yellow
    	    end
    	    if (skillPoints > 0) then
    	        displaytext = displaytext .. " |c60FF60 Skills:|r " .. skillPoints .. " "   -- faded green
    	    end
            AwesomeInfoLabelSkills:SetText(displaytext)
    	else
            AwesomeInfoLabelSkills:SetText("")
            AwesomeInfoLabelSkills:SetHeight( 0 )
    	end
    else
        AwesomeInfoLabelSkills:SetText("")
        AwesomeInfoLabelSkills:SetHeight( 0 )
	end
end -- AI.OnSkillsChange

function AI.UpdateDurability()
    if (AI.vars.duraShow) then
        local minDura = 100
        for i=0,16,1 do
            if (DoesItemHaveDurability(BAG_WORN,i)) then
                minDura = math.min(minDura,GetItemCondition(BAG_WORN,i))
            end
        end
        if (minDura <= AI.vars.duraWarning) then
    	    local displayText = "Durability: "
            AwesomeInfoLabelDura:SetHeight( 20 )
            if (minDura <= AI.vars.duraCritical) then
                displayText = displayText .. "|cFF6060" .. minDura .. "%|r  "   -- faded red
            else
                displayText = displayText .. "|cFFFF60" .. minDura .. "%|r  "   -- faded yellow
            end
            displayText = displayText .. "(" .. GetRepairAllCost() .. "g)"
            AwesomeInfoLabelDura:SetText(displayText)
        else
            AwesomeInfoLabelDura:SetText("")
            AwesomeInfoLabelDura:SetHeight( 0 )
        end
    else
        AwesomeInfoLabelDura:SetText("")
        AwesomeInfoLabelDura:SetHeight( 0 )
    end
end -- UpdateDurability

function AI.MoveStart()
    AwesomeInfoBG:SetAlpha(0.5)
end -- AI.ShowBackdrop

function AI.MoveStop()
    AwesomeInfoBG:SetAlpha(0)
    AI.vars.locx = math.floor(AwesomeInfo:GetLeft())
    AI.vars.locy = math.floor(AwesomeInfo:GetTop())
end -- AI.HideBackdrop

-- EOF