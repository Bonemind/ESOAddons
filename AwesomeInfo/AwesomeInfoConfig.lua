local LAM = LibStub:GetLibrary("LibAddonMenu-1.0")

function AI.CreateConfigMenu()
	AI.configPanel = LAM:CreateControlPanel(AI.name.."Config", "|c8080FFAwesome Info|r")
	
	LAM:AddHeader(AI.configPanel, "AI.HeadingGeneral", "|c45D7F7General Options|r")

	LAM:AddCheckbox(AI.configPanel, "AI.clock24", "Clock format - 24 hour", "Display the clock in 24-hour/military format or in 12-hour AM/PM.",
			function() return AI.vars.clock24 end,
			function(newValue) AI.vars.clock24 = newValue end)

	LAM:AddCheckbox(AI.configPanel, "AI.skillsShow", "Alert for unspent skill points", "Display a warning when you have unspent attributes or skill points.",
			function() return AI.vars.skillsShow end,
			function(newValue) AI.vars.skillsShow = newValue; AI.OnSkillsChange() end,
			true, "Future versions of this add-on will include the ability to dismiss/snooze the alerts for attribute/skill points.")

	LAM:AddSlider(AI.configPanel, "AI.scaling", "UI scale", "If remaining bag space is this many or less, you will see a warning", 6, 14, 1,
			function() return 10 * AI.vars.scaling end,
			function(newValue) AI.vars.scaling = newValue / 10; AwesomeInfo:SetScale(AI.vars.scaling) end)

    -- BAGS SECTION
    
    LAM:AddHeader(AI.configPanel, "AI.HeadingBags", "|c45D7F7Low Bag Space Warnings|r")

	LAM:AddCheckbox(AI.configPanel, "AI.bagsShow", "Show warning for low bag space", "Display a warning when your bag space falls below the warning and critical values set below.",
			function() return AI.vars.bagsShow end,
			function(newValue) AI.vars.bagsShow = newValue end)

	LAM:AddSlider(AI.configPanel, "AI.bagsWarn", "Bag space |cFFFF60warning|r", "If remaining bag space is this many or less, you will see a warning", 2, 20, 1,
			function() return AI.vars.bagsWarn end,
			function(newValue) AI.vars.bagsWarn = newValue; AI.OnInventorySlotUpdate() end)

	LAM:AddSlider(AI.configPanel, "AI.bagsCritical", "Bag space |cFF6060critical warning|r", "If remaining bag space is this many or less, you will see a critical warning", 1, 10, 1,
			function() return AI.vars.bagsCritical end,
			function(newValue) AI.vars.bagsCritical = newValue; AI.OnInventorySlotUpdate() end)
	
	-- DURABILITY SECTION

    LAM:AddHeader(AI.configPanel, "AI.HeadingDura", "|c45D7F7Low Durability Warnings|r")

	LAM:AddCheckbox(AI.configPanel, "AI.duraShow", "Show warning for low durability", "Display a warning when your armour durability falls below the warning and critical values set below.",
			function() return AI.vars.duraShow end,
			function(newValue) AI.vars.duraShow = newValue end)

	LAM:AddSlider(AI.configPanel, "AI.duraWarning", "Durability |cFFFF60warning|r %", "If durability of one of your equipped items is this many or less, you will see a warning", 2, 60, 1,
			function() return AI.vars.duraWarning end,
			function(newValue) AI.vars.duraWarning = newValue; AI:UpdateDurability() end)

	LAM:AddSlider(AI.configPanel, "AI.duraCritical", "Durability |cFF6060critical warning|r %", "If durability of one of your equipped items is this many or less, you will see a critical warning", 1, 40, 1,
			function() return AI.vars.duraCritical end,
			function(newValue) AI.vars.duraCritical = newValue; AI:UpdateDurability() end)

    -- HORSE FEEDING

    LAM:AddHeader(AI.configPanel, "AI.HeadingMount", "|c45D7F7Mount Feeding Timer|r")

	LAM:AddCheckbox(AI.configPanel, "AI.horseShow", "Show timer for horse feeding", "Display a countdown timer when you are near to being able to feed your horse. Adjust the threshold below.",
			function() return AI.vars.horseShow end,
			function(newValue) AI.vars.horseShow = newValue end)

	LAM:AddSlider(AI.configPanel, "AI.horseWarning", "Start feed timer (minutes)", "Will show the countdown timer if mount can be fed within the number of minutes below", 1, 240, 1,
			function() return AI.vars.horseWarning end,
			function(newValue) AI.vars.horseWarning = newValue end)
			
    LAM:AddHeader(AI.configPanel, "AI.bottomHeader", "")

	local statsText = "\nVersion |c60FF60" .. AI.version .. "|r by Stormknight/LCAmethyst\nAll rights reserved."
	LAM:AddDescription(AI.configPanel, "AI.StatsBlock", statsText)
end -- AI.CreateConfigMenu

