local Azurah = _G['Azurah'] -- grab addon table from global
local L = Azurah:GetLocale()
local db

-- UPVALUES --
local strformat				= string.format

local snapTo = true
local LDW, uiPanel
local defaultUIData = {}
local uiFrames = {
	['ZO_PlayerAttributeHealth']				= {1, L.Health},
	['ZO_PlayerAttributeSiegeHealth']			= {2, L.HealthSiege},
	['ZO_PlayerAttributeMagicka']				= {1, L.Magicka},
	['ZO_PlayerAttributeWerewolf']				= {2, L.Werewolf},
	['ZO_PlayerAttributeStamina']				= {1, L.Stamina},
	['ZO_PlayerAttributeMountStamina']			= {2, L.StaminaMount},
	['ZO_ExperienceBar']						= {1, L.Experience},
	['ZO_SynergyTopLevelContainer']				= {1, L.Synergy},
	['ZO_CompassFrame']							= {1, L.Compass},
	['ZO_TargetUnitFramereticleover']			= {1, L.ReticleOver},
	['ZO_ActionBar1']							= {1, L.ActionBar},
	['ZO_SmallGroupAnchorFrame']				= {1, L.Group},
	['ZO_LargeGroupAnchorFrame1']				= {1, L.Raid1},
	['ZO_LargeGroupAnchorFrame2']				= {1, L.Raid2},
	['ZO_LargeGroupAnchorFrame3']				= {1, L.Raid3},
	['ZO_LargeGroupAnchorFrame4']				= {1, L.Raid4},
	['ZO_LargeGroupAnchorFrame5']				= {1, L.Raid5},
	['ZO_LargeGroupAnchorFrame6']				= {1, L.Raid6},
	['ZO_FocusedQuestTrackerPanelContainer']	= {1, L.FocusedQuest},
	['ZO_PlayerToPlayerAreaPromptContainer']	= {1, L.PlayerPrompt}
}

-- DEFAULT FRAME DATA --
local function RecordDefaultData()
	local valid, point, rel, relPoint, x, y, data

	for frame in pairs(uiFrames) do -- record default position data
		valid, point, rel, relPoint, x, y = _G[frame]:GetAnchor()

		defaultUIData[frame] = {
			point		= point,
			rel			= rel,
			relPoint	= relPoint,
			x			= x,
			y			= y,
			scale		= _G[frame]:GetScale()
		}
	end
end

local function RestoreDefaultData() -- reset all frames to default positions
	local data

	for frame in pairs(uiFrames) do
		data = defaultUIData[frame]

		if (db.uiData[frame]) then
			db.uiData[frame] = nil -- cleanse user data
		end

		_G[frame]:ClearAnchors()
		_G[frame]:SetAnchor(data.point, data.rel, data.relPoint, data.x, data.y)
		_G[frame]:SetScale(data.scale)

		LDW:Resync(_G[frame]) -- reset attachments to new frame positions
	end

	AZ_MOVED_COMPASS = false	-- TEMP GLOBALS FOR WYKKYD
	AZ_MOVED_TARGET = false		-- TEMP GLOBALS FOR WYKKYD
end

-- USER FRAME DATA --
local function RestoreUserData()
	local data, frameObj

	for frame in pairs(db.uiData) do
		data, frameObj = db.uiData[frame], _G[frame]

		frameObj:ClearAnchors()
		frameObj:SetAnchor(data.point, GuiRoot, data.relPoint, data.x, data.y)
		frameObj:SetScale(data.scale)

		if (frame == 'ZO_CompassFrame') then
			AZ_MOVED_COMPASS = true -- TEMP GLOBALS FOR WYKKYD
		end

		if (frame == 'ZO_TargetUnitFramereticleover') then
			AZ_MOVED_TARGET = true -- TEMP GLOBALS FOR WYKKYD
		end
	end
end

function Azurah.RecordUserData(frame, point, rel, relPoint, x, y, scale)
	frameName = frame:GetName() -- get frame name from frame object

	if (not db.uiData[frameName]) then db.uiData[frameName] = {} end

	db.uiData[frameName].point		= point
	db.uiData[frameName].relPoint	= relPoint
	db.uiData[frameName].x			= x
	db.uiData[frameName].y			= y
	db.uiData[frameName].scale		= scale

	if (frameName == 'ZO_CompassframeName') then
		AZ_MOVED_COMPASS = true -- TEMP GLOBALS FOR WYKKYD
	end

	if (frameName == 'ZO_TargetUnitFramereticleover') then
		AZ_MOVED_TARGET = true -- TEMP GLOBALS FOR WYKKYD
	end
end

-- UNLOCK PANEL CONSTRUCTION --
local function CreateButton(text, anchor, yOffset)
	local btn = WINDOW_MANAGER:CreateControlFromVirtual(nil, uiPanel, 'ZO_DefaultButton')
	btn:SetAnchor(TOP, anchor, BOTTOM, 0, yOffset)
	btn:SetWidth(180)
	btn:SetHeight(24)
	btn:SetFont('ZoFontAnnounceSmall')
	btn:SetText(text)
	return btn
end

local function BuildUnlockPanel()
	-- base frame setup
	uiPanel = WINDOW_MANAGER:CreateControl(nil, GuiRoot, CT_TOPLEVELCONTROL)
	uiPanel:SetDimensions(180, 130)
	uiPanel:SetAnchor(CENTER)
	uiPanel:SetMouseEnabled(true)
	uiPanel:SetMovable(true)
	uiPanel:SetClampedToScreen(true)
	-- background
	uiPanel.bg = WINDOW_MANAGER:CreateControl(nil, uiPanel, CT_BACKDROP)
	uiPanel.bg:SetAnchorFill(uiPanel)
	uiPanel.bg:SetCenterColor(0, 0, 0, 0.5)
	uiPanel.bg:SetEdgeColor(0,0,0,1)
	uiPanel.bg:SetEdgeTexture('', 8, 8, 1, 0)
	uiPanel.bg:SetInsets(3,3,-3,-3)
	-- header
	uiPanel.header = WINDOW_MANAGER:CreateControl(nil, uiPanel, CT_LABEL)
	uiPanel.header:SetAnchor(TOP, uiPanel, TOP, 0, 4)
	uiPanel.header:SetFont('ZoFontWinH4')
	uiPanel.header:SetText(L.Azurah .. ' - ' .. L.Unlocked)
	-- snap button
	uiPanel.snap = CreateButton(L.GridSnapDisable, uiPanel.header, 2)
	uiPanel.snap:SetHandler('OnClicked', function()
		snapTo = not snapTo
		LDW:SnapToGrid(snapTo)
		uiPanel.snap:SetText(snapTo and L.GridSnapDisable or L.GridSnapEnable)
	end)
	-- lock button
	uiPanel.lock = CreateButton(L.LockButton, uiPanel.snap, 6)
	uiPanel.lock:SetHandler('OnClicked', function()
		Azurah:LockUI()
	end)
	-- reset to defaults button
	uiPanel.reset = CreateButton(L.ResetToDefaults, uiPanel.lock, 16)
	uiPanel.reset:SetHandler('OnClicked', function()
		uiPanel.confirm:SetHidden(false)
		uiPanel.reset:SetHidden(true)
	end)
	-- reset to defaults confirm button
	uiPanel.confirm = CreateButton(L.ResetToDefaultsConfirm, uiPanel.lock, 16)
	uiPanel.confirm:SetHandler('OnClicked', function()
		RestoreDefaultData()
		uiPanel.reset:SetHidden(false)
		uiPanel.confirm:SetHidden(true)
	end)
	uiPanel.confirm:SetHidden(true)

	-- handlers
	uiPanel:SetHandler('OnShow', function()
		uiPanel.confirm:SetHidden(true)
		uiPanel.reset:SetHidden(false)
		LDW:ShowAll()
	end)
	uiPanel:SetHandler('OnHide', function()
		LDW:HideAll()
	end)
	uiPanel:SetHandler('OnMouseUp', function()
		uiPanel:StopMovingOrResizing()
	end)

	Azurah.uiPanel = uiPanel
end

-- LOCK / UNLOCK --
function Azurah:LockUI()
	if (uiPanel) then
		uiPanel:SetHidden(true)
	end
end

function Azurah:UnlockUI()
	if (not uiPanel) then -- first time using the overlays, register!
		BuildUnlockPanel() -- build ui panel to

		local attach

		for frame, data in pairs(uiFrames) do
			if (frame == 'ZO_PlayerToPlayerAreaPromptContainer') then -- special case, flat has no height
				ZO_PlayerToPlayerAreaPromptContainer:SetHeight(100)
			end

			attach = LDW:Attach(_G[frame], data[2])

			if (data[1] == 2) then -- anchored frame, show but don't allow drag
				attach:SetMouseEnabled(false)
				attach:GetOverlay():SetCenterColor(0.6, 0.6, 0.6, 0.32)
				attach:GetOverlay():SetEdgeColor(0.6, 0.6, 0.6, 1)
				attach:GetLabel():SetColor(0.6, 0.6, 0.6, 1)
			end
		end
	end

	uiPanel:SetHidden(false)
end

function Azurah:InitializeUnlock()
	db = self.db

	LDW = LibStub('LibDragWin-1.0'):Register(self.name, Azurah.RecordUserData)

	RecordDefaultData()
	RestoreUserData()

	ZO_PreHookHandler(ZO_ActionBar1, 'OnShow', function()
		if (db.uiData['ZO_ActionBar1']) then -- user has moved the action bar
			if (ZO_Skills:IsHidden()) then -- restore to user location on skill window close
				local data = db.uiData['ZO_ActionBar1']
				ZO_ActionBar1:ClearAnchors()
				ZO_ActionBar1:SetAnchor(data.point, GuiRoot, data.relPoint, data.x, data.y)
				ZO_ActionBar1:SetScale(data.scale)
			else -- skill window is open, restore default scale (window is moved by stock code)
				ZO_ActionBar1:SetScale(1)
			end
		end
	end)

	if (self.db.compassPinScale ~= 1) then
		ZO_Compass:SetScale(self.db.compassPinScale)
	end
end
