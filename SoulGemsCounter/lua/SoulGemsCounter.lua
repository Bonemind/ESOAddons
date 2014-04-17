local lam = LibStub:GetLibrary("LibAddonMenu-1.0")
local sgc = ZO_Object:Subclass()
local em = GetEventManager()
local wm = GetWindowManager()
local Initialized = false

-------------------------------------------------------

function sgc:New()
	
		sgc.AddOnName = "SoulGemsCounter"
		sgc:AddOnEventManager()
 end
 
-------------------------------------------------------
function sgc:ReInit (id, value)

	if (id == 1) then
		sgc.saved.mw_petty = not sgc.saved.mw_petty
	elseif (id == 2) then
		sgc.saved.mw_minor = not sgc.saved.mw_minor
	elseif (id == 3) then
		sgc.saved.mw_lesser = not sgc.saved.mw_lesser
	elseif (id == 4) then 
		sgc.saved.mw_common = not sgc.saved.mw_common
	elseif (id == 5) then
		sgc.saved.mw_greater = not sgc.saved.mw_greater
	elseif (id == 6) then
		sgc.saved.mw_grand = not sgc.saved.mw_grand
	elseif (id == 7) then
		sgc.saved.mw_flat = not sgc.saved.mw_flat
	elseif (id == 8) then
		if tonumber(value) ~= nil then
			sgc.saved.mw_scale = value
		else
			d ("Please enter a numeric value for the scale of the add-on Soul Gem Counter (maybe use a dot instead of a comma)")
		end
	elseif (id == 9) then
		if tonumber(value) ~= nil then
			sgc.saved.mw_alpha = value
		else
			d ("Please enter a numeric value for the Transparency of the add-on Soul Gem Counter (maybe use a dot instead of a comma)")
		end
	elseif (id == 10) then
		if tonumber(value) ~= nil then
			sgc.saved.mw_alpha_bg = value
		else
			d ("Please enter a numeric value for the Background Transparency of the add-on Soul Gem Counter (maybe use a dot instead of a comma)")
		end
	elseif (id == 11) then
		sgc.saved.mw_icon = value
	elseif (id == 12) then
		sgc.saved.mw_text = value
	end
	
	local NumberOfGemToDisplay = 0
	local NumberOfGemToDisplayMax = 0
	local FlatLayout_x, FlatLayout_y, Text_x, Text_y = 0, 0, 0, 0
		
	if (sgc.saved.mw_petty) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	if (sgc.saved.mw_minor) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	if (sgc.saved.mw_lesser) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	if (sgc.saved.mw_common) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	if (sgc.saved.mw_greater) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	if (sgc.saved.mw_grand) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	
	NumberOfGemToDisplayMax = NumberOfGemToDisplay
	
	if (sgc.saved.mw_flat) then
		FlatLayout_x = 1 
		FlatLayout_y = 0
	else
		FlatLayout_x = 0 
		FlatLayout_y = 1
	end
	
	if (sgc.saved.mw_icon) then
		Icon_x = 1
	else
		Icon_x = 0
	end
	
	if (sgc.saved.mw_text) then
		Text_x = 75
		Text_y = 0
	else
		Text_x = 0
		Text_y = 30
	end
	
	
	sgc.MW:SetDimensions((25 + Text_x) + ((25 + Text_x) * FlatLayout_x * (NumberOfGemToDisplay - 1)) + (30 * Icon_x) + (30 * Icon_x * (NumberOfGemToDisplay - 1 ) * FlatLayout_x), (30 + Text_y) + ( (30 + Text_y) * FlatLayout_y * (NumberOfGemToDisplay - 1)))
	sgc.MW:SetAlpha(sgc.saved.mw_alpha)
	sgc.MW.backdrop:SetAlpha(sgc.saved.mw_alpha_bg)
	sgc.MW:SetScale(sgc.saved.mw_scale)
	
	self:SetIcon(sgc.MW.IconPetty, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_petty)
	self:SetLabel(sgc.MW.LabelPetty, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_petty)
	self:SetLabelIcon(sgc.MW.LabelPetty1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_petty, 0)
	self:SetLabelIcon(sgc.MW.LabelPetty2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_petty, 1)
	if (sgc.saved.mw_petty) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
	
	self:SetIcon(sgc.MW.IconMinor, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_minor)
	self:SetLabel(sgc.MW.LabelMinor, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_minor)
	self:SetLabelIcon(sgc.MW.LabelMinor1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_minor, 0)
	self:SetLabelIcon(sgc.MW.LabelMinor2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_minor, 1)
	if (sgc.saved.mw_minor) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
	
	self:SetIcon(sgc.MW.IconLesser, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_lesser)
	self:SetLabel(sgc.MW.LabelLesser, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_lesser)
	self:SetLabelIcon(sgc.MW.LabelLesser1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_lesser, 0)
	self:SetLabelIcon(sgc.MW.LabelLesser2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_lesser, 1)
	if (sgc.saved.mw_lesser) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
	
	self:SetIcon(sgc.MW.IconCommon, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_common)
	self:SetLabel(sgc.MW.LabelCommon, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_common)
	self:SetLabelIcon(sgc.MW.LabelCommon1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_common, 0)
	self:SetLabelIcon(sgc.MW.LabelCommon2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_common, 1)
	if (sgc.saved.mw_common ) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
	
	self:SetIcon(sgc.MW.IconGreater, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_greater)
	self:SetLabel(sgc.MW.LabelGreater, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_greater)
	self:SetLabelIcon(sgc.MW.LabelGreater1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_greater, 0)
	self:SetLabelIcon(sgc.MW.LabelGreater2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_greater, 1)
	if (sgc.saved.mw_greater) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
	
	self:SetIcon(sgc.MW.IconGrand, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_grand)
	self:SetLabel(sgc.MW.LabelGrand, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_grand)
	self:SetLabelIcon(sgc.MW.LabelGrand1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_grand, 0)
	self:SetLabelIcon(sgc.MW.LabelGrand2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_grand, 1)
	if (sgc.saved.mw_grand) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
end
 
function sgc:MenuInitialize()
	panel = lam:CreateControlPanel("SGC_ADDON_OPTIONS", "Soul Gems Counter")
	lam:AddHeader(panel,   "SGC_ADDON_HEADER_TOTRACK", "TO TRACK")
	lam:AddCheckbox(panel, "CHECKBOX_PETTY", "Petty", "To track this level of gem", function() return sgc.saved.mw_petty end, function(value) sgc:ReInit(1, value) end)
	lam:AddCheckbox(panel, "CHECKBOX_MINOR", "Minor", "To track this level of gem", function() return sgc.saved.mw_minor end, function(value) sgc:ReInit(2, value) end)
	lam:AddCheckbox(panel, "CHECKBOX_LESSER", "Lesser", "To track this level of gem", function() return sgc.saved.mw_lesser end, function(value) sgc:ReInit(3, value) end)
	lam:AddCheckbox(panel, "CHECKBOX_COMMON", "Common", "To track this level of gem", function() return sgc.saved.mw_common end, function(value) sgc:ReInit(4, value) end)
	lam:AddCheckbox(panel, "CHECKBOX_GREATER", "Greater", "To track this level of gem", function() return sgc.saved.mw_greater end, function(value) sgc:ReInit(5, value) end)
	lam:AddCheckbox(panel, "CHECKBOX_GRAND", "Grand", "To track this level of gem", function() return sgc.saved.mw_grand end, function(value) sgc:ReInit(6, value) end)
	lam:AddHeader(panel,   "SGC_ADDON_HEADER_OPTIONS", "DISPLAY OPTIONS")
	lam:AddCheckbox(panel, "CHECKBOX_FLAT", "Flat layout", "Normal or flay layout", function() return sgc.saved.mw_flat end, function(value) sgc:ReInit(7, value) end)
	lam:AddEditBox(panel,  "EDITBOX_SCALE", "Scale", "The scale of the window", false, function() return sgc.saved.mw_scale end, function(value) sgc:ReInit(8, value) end)
	lam:AddEditBox(panel,  "EDITBOX_TRANSPARENCY", "Window Transparency", "The level of transparency of the full window", false, function() return sgc.saved.mw_alpha end, function(value) sgc:ReInit(9, value) end)
	lam:AddEditBox(panel,  "EDITBOX_TRANSPARENCY_BACKGROUND", "Background transparency", "The level of transparency of the background", false, function() return sgc.saved.mw_alpha_bg end, function(value) sgc:ReInit(10, value) end)
	lam:AddCheckbox(panel, "CHECKBOX_ICON", "Display Icon", "Display an icon of each level of gem selected", function() return sgc.saved.mw_icon end, function(value) sgc:ReInit(11, value) end)
	lam:AddCheckbox(panel, "CHECKBOX_TEXT", "Display Text", "Display an label for each level of gem selected", function() return sgc.saved.mw_text end, function(value) sgc:ReInit(12, value) end)
	lam:AddDropdown(panel, "DROPDOWN_SKIN", "Skin", "Choice of the skin", {	"ZO_DefaultBackdrop",
																			"ZO_ThinBackdrop",
																			"ZO_InsetBackdrop",
																			"ZO_InsetTexture",
																			"ZO_CenterlessBackdrop"},
																			function() return sgc.saved.mw_skin end, function(value) sgc.saved.mw_skin = value, sgc:ReInit() end, true, "You need to reload the UI after changing this option")
	lam:AddDescription(panel, "DESC_BUTTON", "Clic on the lock button, drag-and-drop the add-on and then clic on unlock to save the position", "Position")
	sgc.button = lam:AddButton(panel, "BUTTON_POSITION", "UNLOCK", nil ,  function() self:MoveOnClick() end)																		

	sgc.Unlock = true
end
 
  function sgc:SetLabelIcon (Icon, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, SavedVar, Down)
	Icon:SetHidden((not SavedVar) or (not sgc.saved.mw_icon) or (sgc.saved.mw_text))
	Icon:SetAnchor(TOPLEFT,sgc.MW ,TOPLEFT, 35 + ((25 + Text_x) * FlatLayout_x * (NumberOfGemToDisplayMax - NumberOfGemToDisplay)) + (30 * Icon_x * (NumberOfGemToDisplayMax - NumberOfGemToDisplay) * FlatLayout_x), (Down * 20) + ((0.5 * Text_y) +(30 + Text_y) * FlatLayout_y * (NumberOfGemToDisplayMax - NumberOfGemToDisplay)))
 end
 
 function sgc:SetIcon (Icon, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, SavedVar)
	Icon:SetAnchor(TOPLEFT,sgc.MW ,TOPLEFT, ((25 + Text_x) * FlatLayout_x * (NumberOfGemToDisplayMax - NumberOfGemToDisplay)) + (30 * Icon_x * (NumberOfGemToDisplayMax - NumberOfGemToDisplay) * FlatLayout_x), ((0.5 * Text_y) +(30 + Text_y) * FlatLayout_y * (NumberOfGemToDisplayMax - NumberOfGemToDisplay)))
	Icon:SetHidden((not SavedVar) or (not sgc.saved.mw_icon))
 end
 
  function sgc:SetLabel (Label, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, SavedVar)
	Label:SetAnchor(TOPLEFT, sgc.MW, TOPLEFT, 11 + ((25 + Text_x) * FlatLayout_x * (NumberOfGemToDisplayMax - NumberOfGemToDisplay)) + ((30 * Icon_x * (NumberOfGemToDisplayMax - NumberOfGemToDisplay) * FlatLayout_x) + (Icon_x * 30)), 7 + (30 * FlatLayout_y * (NumberOfGemToDisplayMax - NumberOfGemToDisplay)))
	Label:SetHidden((not SavedVar) or (not sgc.saved.mw_text))
 end
 
-------------------------------------------------------

function sgc:Initialize()
	
	local NumberOfGemToDisplay = 0
	local NumberOfGemToDisplayMax = 0
	local FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y = 0, 0, 0, 0, 0
	
	self:UpdateSoulGemState()
	
	if (sgc.saved.mw_petty) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	if (sgc.saved.mw_minor) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	if (sgc.saved.mw_lesser) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	if (sgc.saved.mw_common) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	if (sgc.saved.mw_greater) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	if (sgc.saved.mw_grand) then
		NumberOfGemToDisplay = NumberOfGemToDisplay + 1
	end
	
	NumberOfGemToDisplayMax = NumberOfGemToDisplay
	
	if (sgc.saved.mw_flat) then
		FlatLayout_x = 1 
		FlatLayout_y = 0
	else
		FlatLayout_x = 0 
		FlatLayout_y = 1
	end
	
	if (sgc.saved.mw_icon) then
		Icon_x = 1
	else
		Icon_x = 0
	end
	
	if (sgc.saved.mw_text) then
		Text_x = 75
		Text_y = 0
	else
		Text_x = 0
		Text_y = 30
	end
	
	--Main Window-------------
	sgc.MW = wm:CreateTopLevelWindow(sgc.AddOnName .. "_MW")
	sgc.MW:SetDimensions((25 + Text_x) + ((25 + Text_x) * FlatLayout_x * (NumberOfGemToDisplay - 1)) + (30 * Icon_x) + (30 * Icon_x * (NumberOfGemToDisplay - 1 ) * FlatLayout_x), (30 + Text_y) + ( (30 + Text_y) * FlatLayout_y * (NumberOfGemToDisplay - 1)))
	sgc.MW:SetAnchor(CENTER, GuiRoot, TOPLEFT, sgc.saved.mw_x, sgc.saved.mw_y)
	sgc.MW:SetHidden(false)
	sgc.MW:SetClampedToScreen(true)
	sgc.MW:SetScale(sgc.saved.mw_scale)
	sgc.MW:SetHandler("OnMouseDown", function() sgc.MW:SetAlpha(0.4) end)
	sgc.MW:SetHandler("OnMouseUp", function() sgc.MW:SetAlpha(sgc.saved.mw_alpha) end)
	sgc.MW:SetAlpha(sgc.saved.mw_alpha)
	sgc.MW:SetDrawLayer(1)
	
	--Main Window Background---
	sgc.MW.backdrop = wm:CreateControlFromVirtual(sgc.AddOnName .. "_BD", sgc.MW, sgc.saved.mw_skin)
	sgc.MW.backdrop:SetAlpha(sgc.saved.mw_alpha_bg)
	
	--Icon Petty-----------
	sgc.MW.IconPetty = wm:CreateControl(sgc.AddOnName .. "_IconPetty", sgc.MW, CT_TEXTURE)
    sgc.MW.IconPetty:SetTexture("EsoUI/Art/icons/crafting_runecrafter_plug_vendor_001.dds")
    sgc.MW.IconPetty:SetDimensions(32, 32)
	self:SetIcon(sgc.MW.IconPetty, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_petty)
	
	--Label Icon Petty 1-------------
	sgc.MW.LabelPetty1 = wm:CreateControl(sgc.AddOnName .. "_LabelPetty1", sgc.MW, CT_LABEL)
	sgc.MW.LabelPetty1:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelPetty1:SetDrawLayer(2)
	sgc.MW.LabelPetty1:SetDimensions(200, 25)
	sgc.MW.LabelPetty1:SetScale(0.60)
	self:SetLabelIcon(sgc.MW.LabelPetty1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_petty, 0)
	sgc.MW.LabelPetty1:SetText(sgc.PettyEmpty)
	
	--Label Icon Petty 2-------------
	sgc.MW.LabelPetty2 = wm:CreateControl(sgc.AddOnName .. "_LabelPetty2", sgc.MW, CT_LABEL)
	sgc.MW.LabelPetty2:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelPetty2:SetDrawLayer(2)
	sgc.MW.LabelPetty2:SetDimensions(200, 25)
	sgc.MW.LabelPetty2:SetScale(0.60)
	self:SetLabelIcon(sgc.MW.LabelPetty2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_petty, 1)
	sgc.MW.LabelPetty2:SetText(sgc.PettyFull)
	
	--Label Petty-------------
	sgc.MW.LabelPetty = wm:CreateControl(sgc.AddOnName .. "_LabelPetty", sgc.MW, CT_LABEL)
	sgc.MW.LabelPetty:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelPetty:SetDrawLayer(0)
	sgc.MW.LabelPetty:SetDimensions(200, 25)
	sgc.MW.LabelPetty:SetScale(0.60)
	sgc.MW.LabelPetty:SetText("Petty: " .. sgc.PettyEmpty .. "E/" .. sgc.PettyFull .. "F" )
	self:SetLabel(sgc.MW.LabelPetty, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_petty)
	

	if (sgc.saved.mw_petty) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
	
	--Icon Minor-----------
	sgc.MW.IconMinor = wm:CreateControl(sgc.AddOnName .. "_IconMinor", sgc.MW, CT_TEXTURE)
    sgc.MW.IconMinor:SetTexture("EsoUI/Art/icons/crafting_runecrafter_plug_vendor_002.dds")
    sgc.MW.IconMinor:SetDimensions(32, 32)
    self:SetIcon(sgc.MW.IconMinor, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_minor)
	
	--Label Minor-------------
	sgc.MW.LabelMinor = wm:CreateControl(sgc.AddOnName .. "_LabelMinor", sgc.MW, CT_LABEL)
	sgc.MW.LabelMinor:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelMinor:SetDrawLayer(0)
	sgc.MW.LabelMinor:SetDimensions(200, 25)
	self:SetLabel(sgc.MW.LabelMinor, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_minor)
	sgc.MW.LabelMinor:SetScale(0.60)
	sgc.MW.LabelMinor:SetText("Minor: " .. sgc.MinorEmpty .. "E/" .. sgc.MinorFull .. "F")
	
	--Label Minor 1-------------
	sgc.MW.LabelMinor1 = wm:CreateControl(sgc.AddOnName .. "_LabelMinor1", sgc.MW, CT_LABEL)
	sgc.MW.LabelMinor1:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelMinor1:SetDrawLayer(0)
	sgc.MW.LabelMinor1:SetDimensions(200, 25)
	self:SetLabelIcon(sgc.MW.LabelMinor1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_minor, 0)
	sgc.MW.LabelMinor1:SetScale(0.60)
	sgc.MW.LabelMinor1:SetText(sgc.MinorEmpty)
	
	--Label Minor 2-------------
	sgc.MW.LabelMinor2 = wm:CreateControl(sgc.AddOnName .. "_LabelMinor2", sgc.MW, CT_LABEL)
	sgc.MW.LabelMinor2:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelMinor2:SetDrawLayer(0)
	sgc.MW.LabelMinor2:SetDimensions(200, 25)
	self:SetLabelIcon(sgc.MW.LabelMinor2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_minor, 1)
	sgc.MW.LabelMinor2:SetScale(0.60)
	sgc.MW.LabelMinor2:SetText(sgc.MinorFull)
	
	if (sgc.saved.mw_minor) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
	
	--Icon Lesser-----------
	sgc.MW.IconLesser = wm:CreateControl(sgc.AddOnName .. "_IconLesser", sgc.MW, CT_TEXTURE)
    sgc.MW.IconLesser:SetTexture("EsoUI/Art/icons/crafting_runecrafter_plug_vendor_003.dds")
    sgc.MW.IconLesser:SetDimensions(32, 32)
    self:SetIcon(sgc.MW.IconLesser, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_lesser)
	
	--Label Lesser-------------
	sgc.MW.LabelLesser = wm:CreateControl(sgc.AddOnName .. "_LabelLesser", sgc.MW, CT_LABEL)
	sgc.MW.LabelLesser:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelLesser:SetDrawLayer(0)
	sgc.MW.LabelLesser:SetDimensions(200, 25)
	self:SetLabel(sgc.MW.LabelLesser, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_lesser)
	sgc.MW.LabelLesser:SetScale(0.60)
	sgc.MW.LabelLesser:SetText("Lesser: " .. sgc.LesserEmpty .. "E/" .. sgc.LesserFull .. "F")
	
	--Label Lesser 1-------------
	sgc.MW.LabelLesser1 = wm:CreateControl(sgc.AddOnName .. "_LabelLesser1", sgc.MW, CT_LABEL)
	sgc.MW.LabelLesser1:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelLesser1:SetDrawLayer(0)
	sgc.MW.LabelLesser1:SetDimensions(200, 25)
	self:SetLabelIcon(sgc.MW.LabelLesser1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_lesser, 0)
	sgc.MW.LabelLesser1:SetScale(0.60)
	sgc.MW.LabelLesser1:SetText(sgc.LesserEmpty)
	
	--Label Lesser 2-------------
	sgc.MW.LabelLesser2 = wm:CreateControl(sgc.AddOnName .. "_LabelLesser2", sgc.MW, CT_LABEL)
	sgc.MW.LabelLesser2:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelLesser2:SetDrawLayer(0)
	sgc.MW.LabelLesser2:SetDimensions(200, 25)
	self:SetLabelIcon(sgc.MW.LabelLesser2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_lesser, 1)
	sgc.MW.LabelLesser2:SetScale(0.60)
	sgc.MW.LabelLesser2:SetText(sgc.LesserFull)
	
	if (sgc.saved.mw_lesser) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
	
	--Icon Common-----------
	sgc.MW.IconCommon = wm:CreateControl(sgc.AddOnName .. "_IconCommon", sgc.MW, CT_TEXTURE)
    sgc.MW.IconCommon:SetTexture("EsoUI/Art/icons/crafting_runecrafter_plug_vendor_004.dds")
    sgc.MW.IconCommon:SetDimensions(32, 32)
    self:SetIcon(sgc.MW.IconCommon, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_common)
	
	--Label Common-------------
	sgc.MW.LabelCommon = wm:CreateControl(sgc.AddOnName .. "_LabelCommon", sgc.MW, CT_LABEL)
	sgc.MW.LabelCommon:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelCommon:SetDrawLayer(0)
	sgc.MW.LabelCommon:SetDimensions(200, 25)
	self:SetLabel(sgc.MW.LabelCommon, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_common)
	sgc.MW.LabelCommon:SetScale(0.60)
	sgc.MW.LabelCommon:SetText("Common: " .. sgc.CommonEmpty .. "E/" .. sgc.CommonFull .. "F")
	
	--Label Common 1-------------
	sgc.MW.LabelCommon1 = wm:CreateControl(sgc.AddOnName .. "_LabelCommon1", sgc.MW, CT_LABEL)
	sgc.MW.LabelCommon1:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelCommon1:SetDrawLayer(0)
	sgc.MW.LabelCommon1:SetDimensions(200, 25)
	self:SetLabelIcon(sgc.MW.LabelCommon1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_common, 0)
	sgc.MW.LabelCommon1:SetScale(0.60)
	sgc.MW.LabelCommon1:SetText(sgc.CommonEmpty)
	
	--Label Common 2-------------
	sgc.MW.LabelCommon2 = wm:CreateControl(sgc.AddOnName .. "_LabelCommon2", sgc.MW, CT_LABEL)
	sgc.MW.LabelCommon2:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelCommon2:SetDrawLayer(0)
	sgc.MW.LabelCommon2:SetDimensions(200, 25)
	self:SetLabelIcon(sgc.MW.LabelCommon2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_common, 1)
	sgc.MW.LabelCommon2:SetScale(0.60)
	sgc.MW.LabelCommon2:SetText(sgc.CommonFull)
	
	if (sgc.saved.mw_common ) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
	
	--Icon Greater-----------
	sgc.MW.IconGreater = wm:CreateControl(sgc.AddOnName .. "_IconGreater", sgc.MW, CT_TEXTURE)
    sgc.MW.IconGreater:SetTexture("EsoUI/Art/icons/crafting_runecrafter_plug_vendor_005.dds")
    sgc.MW.IconGreater:SetDimensions(32, 32)
    self:SetIcon(sgc.MW.IconGreater, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_greater)
	
	--Label Greater-------------
	sgc.MW.LabelGreater = wm:CreateControl(sgc.AddOnName .. "_LabelGreater", sgc.MW, CT_LABEL)
	sgc.MW.LabelGreater:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelGreater:SetDrawLayer(0)
	sgc.MW.LabelGreater:SetDimensions(200, 25)
	self:SetLabel(sgc.MW.LabelGreater, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_greater)
	sgc.MW.LabelGreater:SetScale(0.60)
	sgc.MW.LabelGreater:SetText("Greater: " .. sgc.GreaterEmpty .. "E/" .. sgc.GreaterFull .. "F")
	
	--Label Greater1-------------
	sgc.MW.LabelGreater1 = wm:CreateControl(sgc.AddOnName .. "_LabelGreater1", sgc.MW, CT_LABEL)
	sgc.MW.LabelGreater1:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelGreater1:SetDrawLayer(0)
	sgc.MW.LabelGreater1:SetDimensions(200, 25)
	self:SetLabelIcon(sgc.MW.LabelGreater1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_greater, 0)
	sgc.MW.LabelGreater1:SetScale(0.60)
	sgc.MW.LabelGreater1:SetText(sgc.GreaterEmpty)
	
	--Label Greater2-------------		
	sgc.MW.LabelGreater2 = wm:CreateControl(sgc.AddOnName .. "_LabelGreater2", sgc.MW, CT_LABEL)
	sgc.MW.LabelGreater2:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelGreater2:SetDrawLayer(0)
	sgc.MW.LabelGreater2:SetDimensions(200, 25)
	self:SetLabelIcon(sgc.MW.LabelGreater2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_greater, 1)
	sgc.MW.LabelGreater2:SetScale(0.60)
	sgc.MW.LabelGreater2:SetText(sgc.GreaterFull)
	
	if (sgc.saved.mw_greater) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
	
	--Icon Grand-----------
	sgc.MW.IconGrand = wm:CreateControl(sgc.AddOnName .. "_IconGrand", sgc.MW, CT_TEXTURE)
	local a, path = GetSoulGemInfo(1, 50, false)
    sgc.MW.IconGrand:SetTexture(path)
    sgc.MW.IconGrand:SetDimensions(32, 32)
    self:SetIcon(sgc.MW.IconGrand, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_grand)
	
	--Label Grand-------------
	sgc.MW.LabelGrand = wm:CreateControl(sgc.AddOnName .. "_LabelGrand", sgc.MW, CT_LABEL)
	sgc.MW.LabelGrand:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelGrand:SetDrawLayer(0)
	sgc.MW.LabelGrand:SetDimensions(200, 25)
	self:SetLabel(sgc.MW.LabelGrand, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_grand)
	sgc.MW.LabelGrand:SetScale(0.60)
	sgc.MW.LabelGrand:SetText("Grand: " .. sgc.GrandEmpty .. "E/" .. sgc.GrandFull .. "F")
	
	--Label Grand1-------------
	sgc.MW.LabelGrand1 = wm:CreateControl(sgc.AddOnName .. "_LabelGrand1", sgc.MW, CT_LABEL)
	sgc.MW.LabelGrand1:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelGrand1:SetDrawLayer(0)
	sgc.MW.LabelGrand1:SetDimensions(200, 25)
	self:SetLabelIcon(sgc.MW.LabelGrand1, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_grand, 0)
	sgc.MW.LabelGrand1:SetScale(0.60)
	sgc.MW.LabelGrand1:SetText(sgc.GrandEmpty)
	
	--Label Grand2-------------
	sgc.MW.LabelGrand2 = wm:CreateControl(sgc.AddOnName .. "_LabelGrand2", sgc.MW, CT_LABEL)
	sgc.MW.LabelGrand2:SetFont("ZoFontAnnounceMessage")
	sgc.MW.LabelGrand2:SetDrawLayer(0)
	sgc.MW.LabelGrand1:SetDimensions(200, 25)
	self:SetLabelIcon(sgc.MW.LabelGrand2, NumberOfGemToDisplay, NumberOfGemToDisplayMax, FlatLayout_x, FlatLayout_y, Icon_x, Text_x, Text_y, sgc.saved.mw_grand, 1)
	sgc.MW.LabelGrand2:SetScale(0.60)
	sgc.MW.LabelGrand2:SetText(sgc.GrandFull)
	
	if (sgc.saved.mw_grand) then
		NumberOfGemToDisplay = NumberOfGemToDisplay - 1
	end
end
 
 -------------------------------------------------------
 
 function sgc:UpdateSoulGemState()
	a, b, sgc.PettyEmpty = GetSoulGemInfo(0, 1, false)
	a, b, sgc.PettyFull = GetSoulGemInfo(1, 1, false)
	a, b, sgc.MinorEmpty = GetSoulGemInfo(0, 11, false)
	a, b, sgc.MinorFull = GetSoulGemInfo(1, 11, false)
	a, b, sgc.LesserEmpty = GetSoulGemInfo(0, 21, false)
	a, b, sgc.LesserFull = GetSoulGemInfo(1, 21, false)
	a, b, sgc.CommonEmpty = GetSoulGemInfo(0, 31, false)
	a, b, sgc.CommonFull = GetSoulGemInfo(1, 31, false)
	a, b, sgc.GreaterEmpty = GetSoulGemInfo(0, 41, false)
	a, b, sgc.GreaterFull = GetSoulGemInfo(1, 41, false)
	a, b, sgc.GrandEmpty = GetSoulGemInfo(0, 50, false)
	a, b, sgc.GrandFull = GetSoulGemInfo(1, 50, false)
 end
 
 -------------------------------------------------------
 
 function sgc:OnSoulGemChanged(eventId, bagId, slotId)
	if (IsItemSoulGem(0, bagId, slotId) or IsItemSoulGem(1, bagId, slotId)) then
		self:UpdateSoulGemState()
		sgc.MW.LabelPetty:SetText("Petty: " .. sgc.PettyEmpty .. "E/" .. sgc.PettyFull .. "F" )
		sgc.MW.LabelPetty1:SetText(sgc.PettyEmpty)
		sgc.MW.LabelPetty2:SetText(sgc.PettyFull)
		
		sgc.MW.LabelMinor:SetText("Minor: " .. sgc.MinorEmpty .. "E/" .. sgc.MinorFull .. "F")
		sgc.MW.LabelMinor1:SetText(sgc.MinorEmpty)
		sgc.MW.LabelMinor2:SetText(sgc.MinorFull)
		
		sgc.MW.LabelLesser:SetText("Lesser: " .. sgc.LesserEmpty .. "E/" .. sgc.LesserFull .. "F")
		sgc.MW.LabelLesser1:SetText(sgc.LesserEmpty)
		sgc.MW.LabelLesser2:SetText(sgc.LesserFull)
		
		sgc.MW.LabelCommon:SetText("Common: " .. sgc.CommonEmpty .. "E/" .. sgc.CommonFull .. "F")
		sgc.MW.LabelCommon1:SetText(sgc.CommonEmpty)
		sgc.MW.LabelCommon2:SetText(sgc.CommonFull)
		
		sgc.MW.LabelGreater:SetText("Greater: " .. sgc.GreaterEmpty .. "E/" .. sgc.GreaterFull .. "F")
		sgc.MW.LabelGreater1:SetText(sgc.GreaterEmpty)
		sgc.MW.LabelGreater2:SetText(sgc.GreaterFull)
		
		sgc.MW.LabelGrand:SetText("Grand: " .. sgc.GrandEmpty .. "E/" .. sgc.GrandFull .. "F")
		sgc.MW.LabelGrand1:SetText(sgc.GrandEmpty)
		sgc.MW.LabelGrand2:SetText(sgc.GrandFull)
	end
end
 
-------------------------------------------------------

function sgc:OnAddOnLoaded(eventCode, addOnName)
	if(addOnName == sgc.AddOnName) then	
		Defaults = 
		{
			["mw_x"] = 0,
			["mw_y"] = 0,
			["mw_scale"] = 0.80,
			["mw_skin"] = "ZO_DefaultBackdrop",
			["mw_alpha"] = 0.9,
			["mw_alpha_bg"] = 0.9,
			["mw_petty"] = true,
			["mw_minor"] = true,
			["mw_lesser"] = true,
			["mw_common"] = true,
			["mw_greater"] = true,
			["mw_grand"] = true,
			["mw_flat"] = true,
			["mw_icon"] = true,
			["mw_text"] = true
		}
		if (sgc.saved == nil) then
			sgc.saved = ZO_SavedVars:New("SoulGemsCounterSave", 1, nil, Defaults, nil)
		end
		sgc:MenuInitialize()
		sgc:Initialize()
		Initialize = true
	end
end

-------------------------------------------------------

function sgc:MenuOpened()
	if (Initialize) then
		local checkReticle = IsReticleHidden()
		if (checkReticle == false) then
			sgc.MW:SetAlpha(sgc.saved.mw_alpha)
		else
			sgc.MW:SetAlpha(0.2)		
		end
	end
end

-------------------------------------------------------

function sgc:MoveOnClick()
	if (sgc.MW ~= nil) then
		if (sgc.Unlock == true) then
			sgc.MW:SetMovable(true)
			sgc.MW:SetMouseEnabled(true)
			sgc.button.btn:SetText("LOCK")
			sgc.Unlock = false
		else
			sgc.MW:SetMovable(false)
			sgc.MW:SetMouseEnabled(false)
			sgc.button.btn:SetText("UNLOCK")
			sgc.Unlock = true
			var_x, var_y = sgc.MW:GetCenter()
			sgc.saved.mw_x = math.floor (var_x)
			sgc.saved.mw_y = math.floor (var_y)	
		end
	end
end

-------------------------------------------------------
 
function sgc:AddOnEventManager()
	em:RegisterForEvent(sgc.AddOnName .. "_AddOnLoaded", EVENT_ADD_ON_LOADED, function(...) self:OnAddOnLoaded(...) end)
	em:RegisterForEvent(sgc.AddOnName .. "_OnInventorySingleSlotUpdate", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, function(...) self:OnSoulGemChanged (...) end)
	em:RegisterForEvent(sgc.AddOnName .. "_ReticleHiddenUpdate", EVENT_RETICLE_HIDDEN_UPDATE, function() self:MenuOpened() end) 
end 

-----------------------------------------------------------------------

sgc:New()