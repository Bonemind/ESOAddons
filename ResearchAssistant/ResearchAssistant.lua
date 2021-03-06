------------------------------------------------------------------
--ResearchAssistant.lua
--Author: ingeniousclown, with modifications by tejón
--v0.6.1c
--[[
Shows you when you can sell an item instead of saving it for
research.
]]
------------------------------------------------------------------

local BACKPACK = ZO_PlayerInventoryBackpack
local BANK = ZO_PlayerBankBackpack
local GUILD_BANK = ZO_GuildBankBackpack
local DECONSTRUCTION = ZO_SmithingTopLevelDeconstructionPanelInventoryBackpack

local ORNATE_TEXTURE = [[/esoui/art/tradinghouse/tradinghouse_sell_tabicon_disabled.dds]]
local INTRICATE_TEXTURE = [[/esoui/art/progression/progression_indexicon_guilds_up.dds]]

local RASettings = nil
local RAScanner = nil

local function SetToOrnate( indicatorControl )
	indicatorControl:SetTexture(ORNATE_TEXTURE)
	indicatorControl:SetColor(unpack(RASettings:GetOrnateColor()))
	indicatorControl:SetDimensions(35, 35)
	indicatorControl:SetHidden(false)
end

local function SetToIntricate( indicatorControl )
	indicatorControl:SetTexture(INTRICATE_TEXTURE)
	indicatorControl:SetColor(unpack(RASettings:GetIntricateColor()))
	indicatorControl:SetDimensions(40, 40)
	indicatorControl:SetHidden(false)
end

local function SetToNormal( indicatorControl )
	indicatorControl:SetTexture(RASettings:GetTexturePath())
	indicatorControl:SetDimensions(RASettings:GetTextureSize(), RASettings:GetTextureSize())
	indicatorControl:SetHidden(true)
end

local function CreateIndicatorControl(parent)
	local control = WINDOW_MANAGER:CreateControl(parent:GetName() .. "Research", parent, CT_TEXTURE)
	control:SetAnchor(CENTER, parent, CENTER, 100)
	SetToNormal(control)

	return control
end

local function AddResearchIndicatorToSlot(control)
	local bagId = control.dataEntry.data.bagId
	local slotIndex = control.dataEntry.data.slotIndex
	
	--get indicator control, or create one if it doesnt exist
	local indicatorControl = control:GetNamedChild("Research")
	if(not indicatorControl) then
		indicatorControl = CreateIndicatorControl(control)
	end

	--hide the control for non-weapons and armor
	local magicTrait = RAScanner:CheckIsItemResearchable(bagId, slotIndex)
	if(magicTrait and magicTrait < 0) then
		indicatorControl:SetHidden(true)
		return
	end

	local craftingSkill = RAScanner:GetItemCraftingSkill(bagId, slotIndex)
	if(magicTrait and magicTrait == 9) then
		SetToOrnate(indicatorControl)
		if(craftingSkill and not RASettings:IsCraftingSkillEnabled(craftingSkill) and not RASettings:ShowUntrackedOrnate()) then
			indicatorControl:SetHidden(true)
		end
		return
	elseif(magicTrait and magicTrait == 10) then
		SetToIntricate(indicatorControl)
		if(craftingSkill and not RASettings:IsCraftingSkillEnabled(craftingSkill) and not RASettings:ShowUntrackedIntricate()) then
			indicatorControl:SetHidden(true)
		end
		return
	else
		SetToNormal(indicatorControl)
		if(craftingSkill and not RASettings:IsCraftingSkillEnabled(craftingSkill)) then
			return
		end
	end

	if(magicTrait and magicTrait >= 0) then
		local thisValue = RAScanner:CreateItemPreferenceValue(bagId, slotIndex)
		if(RAScanner:GetTrait(magicTrait) and thisValue > RAScanner:GetTrait(magicTrait)) then
			indicatorControl:SetColor(unpack(RASettings:GetDuplicateUnresearchedColor()))
		else
			indicatorControl:SetColor(unpack(RASettings:GetCanResearchColor()))
		end
	else
		indicatorControl:SetColor(unpack(RASettings:GetAlreadyResearchedColor()))
	end

	indicatorControl:SetHidden(false)
end

local function AddResearchIndicators(self)
	for _,v in pairs(self.activeControls) do
		AddResearchIndicatorToSlot(v)
	end
end

local function CheckNow(self)
	if(#self.activeControls > 0 and not self.isGrid and not self:IsHidden()) then
        AddResearchIndicators(self)
    end
end

local function AreAllHidden()
	return BANK:IsHidden() and BACKPACK:IsHidden() and GUILD_BANK:IsHidden() and DECONSTRUCTION:IsHidden()
end

local bufferTime = 50 --ms
local elapsedTime = 0
local function RA_OnUpdate()
	elapsedTime = elapsedTime + GetFrameDeltaTimeMilliseconds()
	if(RAScanner:IsScanning() or elapsedTime < bufferTime) then return end
	elapsedTime = 0

	if(AreAllHidden()) then return end

	CheckNow(BANK)
	CheckNow(BACKPACK)
	CheckNow(GUILD_BANK)
	CheckNow(DECONSTRUCTION)
end

local function RA_InvUpdate( ... )
	RAScanner:RescanBags()
	if(RASettings:IsActivated() and not AreAllHidden()) then
		RA_Controller:SetHandler("OnUpdate", RA_OnUpdate)
	end
end

local function ResearchAssistant_Loaded(eventCode, addOnName)
	if(addOnName ~= "ResearchAssistant") then
        return
    end

	RASettings = ResearchAssistantSettings:New()
	RAScanner = ResearchAssistantScanner:New()

	EVENT_MANAGER:RegisterForEvent("RA_INV_SLOT_UPDATE", EVENT_INVENTORY_SINGLE_SLOT_UPDATE, RA_InvUpdate)
	RA_Controller:SetHandler("OnUpdate", RA_OnUpdate)
end

local function ResearchAssistant_Initialized()
	EVENT_MANAGER:RegisterForEvent("ResearchAssistantLoaded", EVENT_ADD_ON_LOADED, ResearchAssistant_Loaded)
end

ResearchAssistant_Initialized()