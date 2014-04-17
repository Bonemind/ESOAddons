----------------------------------------------------------------------------
-- LibDragWin - provides an interface for dragging and scaling of UI windows
--
-- Copyright (c) 2014, Kith (Kithayri)
-- All rights reserved.
--
-- Redistribution and use in source and binary forms, with or without
-- modification, are permitted provided that the following conditions are met:
--
-- 1. Redistributions of source code must retain the above copyright notice,
-- this list of conditions and the following disclaimer.
--
-- 2. Redistributions in binary form must reproduce the above copyright notice,
-- this list of conditions and the following disclaimer in the documentation
-- and/or other materials provided with the distribution.

-- THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
-- AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
-- IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
-- ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
-- LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
-- CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
-- SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
-- INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
-- CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
-- ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
-- THE POSSIBILITY OF SUCH DAMAGE.
--
-- @author		Kithayri
-- @copyright	2014 Kith (Kithayri)
----------------------------------------------------------------------------
-- API ---------------------------------------------------------------------
----------------------------------------------------------------------------
-- LibDragWin:Register(addonName, callback)
-- LibDragWin:Retrieve(addonName)
-- LibDragWin:Attach(targetFrame, [label])
-- LibDragWin:Resync(targetFrame)
-- LibDragWin:GetAttachments()
-- LibDragWin:ShowAll()
-- LibDragWin:HideAll()
-- LibDragWin:SnapToGrid(snap, [gridSize])
-- LibDragWin:AllowScaling(allow)
--
-- Attach:Show()
-- Attach:Hide()
-- Attach:GetOverlay()
-- Attach:GetLabel()
-- Attach:GetTarget()
-- Attach:SetLabelText(text)
-- ------------
-- Callback Function
-- @return targetFrame, point, rel, relPoint, x, y, scale
-------------------------------------------------------------------------
local MAJOR, MINOR = 'LibDragWin-1.0', 2
local lib, oldminor = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end	-- no upgrade needed

local Attach		= {}
lib.addons			= lib.addons or {}	-- list of registered addons
lib.targets			= lib.targets or {}	-- list of all frames targeted by a handler

local rootWidth, rootHeight
local OnUpdate

-- UPVALUES --
local WM			= GetWindowManager()
local round			= zo_round
local GuiRoot		= GuiRoot
local unpack		= unpack
local abs			= math.abs

-- Anchor frame to target based on offset from GuiRoot center
local function AnchorFrameToTarget(frame, target)
	local x, y = target:GetLeft() + (target:GetWidth() / 2), target:GetTop() + (target:GetHeight() / 2)
	x, y = x - (GuiRoot:GetWidth() / 2), y - (GuiRoot:GetHeight() / 2)
	frame:ClearAnchors()
	frame:SetAnchor(CENTER, GuiRoot, CENTER, x, y)
end

-- Get the anchor of the frame relative to nearest GuiRoot edge
local function GetAnchorRelativeToScreen(frame)
	local left, top		= frame:GetLeft(), frame:GetTop()
	local right, bottom	= frame:GetRight(), frame:GetBottom()
	local rootW, rootH	= GuiRoot:GetWidth(), GuiRoot:GetHeight()
	local point			= 0
	local x, y

	if (left < (rootW - right) and left < math.abs((left + right) / 2 - rootW / 2)) then
		x, point = left, 2 -- 'LEFT'
	elseif ((rootW - right) < math.abs((left + right) / 2 - rootW / 2)) then
		x, point = right - rootW, 8 -- 'RIGHT'
	else
		x, point = (left + right) / 2 - rootW / 2, 0
	end

	if (bottom < (rootH - top) and bottom < math.abs((bottom + top) / 2 - rootH / 2)) then
		y, point = top, point + 1 -- 'TOP|TOPLEFT|TOPRIGHT'
	elseif ((rootH - top) < math.abs((bottom + top) / 2 - rootH / 2)) then
		y, point = bottom - rootH, point + 4 -- 'BOTTOM|BOTTOMLEFT|BOTTOMRIGHT'
	else
		y = (bottom + top) / 2 - rootH / 2
	end

	point = (point == 0) and 128 or point -- 'CENTER'

	return point, x, y
end

local function OnMouseEnter(self)
	self.label:SetText(self.labelText)
end

local function OnMouseExit(self)
	self.label:SetText(self.labelText)
end

local function OnMouseWheel(self, delta)
	if (self.allowScaling) then
		self.target:SetScale(self.target:GetScale() + (delta > 0 and 0.01 or -0.01))
		self:SetDimensions(self.target:GetWidth(), self.target:GetHeight())
		self.label:SetText('(' .. round(self.target:GetScale() * 100) .. '%)')

		local point, x, y = GetAnchorRelativeToScreen(self.target) -- get screen relative anchor for callback
		self.addon.callback(self.target, point, GuiRoot, point, x, y, self.target:GetScale())
	end
end

local function OnMouseDown(self)
	self.label:SetText(self.labelText) -- ensure the overlay label shows the name and not scaling percent
	self:SetDimensions(self.target:GetWidth(), self.target:GetHeight()) -- ensure overlay size is consistant with target (scaling outside of lib)
	-- Register GuiRoot current dimensions (saves having to constantly monitor for scaling changes)
	rootWidth, rootHeight = GuiRoot:GetWidth(), GuiRoot:GetHeight()
	self:SetHandler('OnUpdate', OnUpdate)
end

local function OnMouseUp(self)
	self.label:SetText(self.labelText) -- ensure the overlay label shows the name and not scaling percent
	self:SetHandler('OnUpdate', nil)
	self:StopMovingOrResizing()
	self.target:StopMovingOrResizing()
	-- Set target to new screen relative anchors.
	local point, x, y = GetAnchorRelativeToScreen(self.target)
	self.target:ClearAnchors()
	self.target:SetAnchor(point, GuiRoot, point, x, y)
	-- Callback to addon for position saving
	self.addon.callback(self.target, point, GuiRoot, point, x, y, self.target:GetScale())
	AnchorFrameToTarget(self, self.target) -- ensure Handler is placed relative to target
end

do
	local width, height, offsetHorz, offsetVert, gridSize

	OnUpdate = function(self)
		self.target:ClearAnchors()
		-- get relative offset from the CENTER of GuiRoot to the CENTER of self
		width, height = self:GetWidth(), self:GetHeight()
		offsetHorz = (self:GetLeft() + (width / 2)) - (rootWidth / 2)
		offsetVert = (self:GetTop() + (height / 2)) - (rootHeight / 2)

		if (self.snapToGrid) then -- update offset to snapped values if enabled
			gridSize	= self.gridSize
			offsetHorz	= round(offsetHorz / gridSize) * gridSize
			offsetVert	= round(offsetVert / gridSize) * gridSize

			nearLR, nearTB = 0, 0

			if (self:GetLeft() - gridSize < 0) then
				nearLR = -1 -- near left edge
			elseif (self:GetRight() + gridSize > rootWidth) then
				nearLR = 1 -- near right edge
			end

			if (self:GetTop() - gridSize < 0) then
				nearTB = -1 -- near top edge
			elseif (self:GetBottom() + gridSize > rootHeight) then
				nearTB = 1 -- near bottom edge
			end

			self.target:SetAnchor(CENTER, GuiRoot, CENTER,
				(nearLR == 0) and offsetHorz or nearLR * ((rootWidth / 2) - (width / 2)),
				(nearTB == 0) and offsetVert or nearTB * ((rootHeight / 2) - (height / 2))
			)
		else
			self.target:SetAnchor(CENTER, GuiRoot, CENTER, offsetHorz, offsetVert)
		end
	end
end

-- PRIVATE: Create new attachment frame
-- @param	addon		LibDragWin	parent LibDragWin object
-- @param	target		frame		target frame to attach to
-- @param	labelText	string		default label text to display on overlay when not scaling
-- @return				Attach		new Attach object
function Attach:New(addon, target, labelText)
	self.addon			= addon
	self.target			= target
	self.labelText		= (labelText) and labelText or ''
	self.allowScaling	= addon.allowScaling
	self.snapToGrid		= addon.snapToGrid
	self.gridSize		= addon.gridSize

	self:SetDimensions(target:GetWidth(), target:GetHeight())
	self:SetDrawLayer(4)
	self.overlay = WM:CreateControl(nil, self, CT_BACKDROP)
	self.overlay:SetDrawLevel(2)
	self.overlay:SetAnchorFill(target)
	self.overlay:SetCenterColor(0, 0.5, 0.7, 0.32)
	self.overlay:SetEdgeColor(0, 0.5, 0.7, 1)
	self.overlay:SetEdgeTexture('', 8, 1, 0)
	self.label = WM:CreateControl(nil, self, CT_LABEL)
	self.label:SetDrawLevel(3)
	self.label:SetAnchorFill(target)
	self.label:SetFont('ZoFontWinH5')
	self.label:SetColor(1, 0.82, 0, 0.9)
	self.label:SetHorizontalAlignment(1)
	self.label:SetVerticalAlignment(1)
	self.label:SetText(self.labelText)

	self:SetParent(GuiRoot)
	self:SetMouseEnabled(true)
	self:SetMovable(true)
	self:SetClampedToScreen(true)
	self:SetHandler('OnMouseEnter', OnMouseEnter)
	self:SetHandler('OnMouseExit', OnMouseExit)
	self:SetHandler('OnMouseWheel', OnMouseWheel)
	self:SetHandler('OnMouseDown', OnMouseDown)
	self:SetHandler('OnMouseUp', OnMouseUp)

	AnchorFrameToTarget(self, target)

	return self
end

-- PUBLIC: Show this Attach frame
function Attach:Show()
	self:SetHidden(false)
end

-- PUBLIC: Hide this Attach frame
function Attach:Hide()
	self:SetHidden(true)
end

-- PUBLIC: Return reference to the overlay of this Attach frame
-- @return				control		reference to Attach frames overlay
function Attach:GetOverlay()
	return self.overlay
end

-- PUBLIC: Return reference to the label of this Attach frame
-- @return				control		reference to Attach frames label
function Attach:GetLabel()
	return self.label
end

-- PUBLIC: Return reference to the target of this Attach frame
-- @return				frame		reference to Attach frames target
function Attach:GetTarget()
	return self.target
end

-- PUBLIC: Set the label text for this Attach frame
-- @param	text		string		the text to display on the label while not scaling
function Attach:SetLabelText(text)
	self.labelText = (text) and text or ''
	self.label:SetText((text) and text or '')
end

-- PUBLIC: Register a new addon with the library
-- @param	addonName	string		unique reference name for new addon
-- @param	callback	function	function reference for position and scaling
-- @return				LibDragWin	new LibDragWin object
function lib:Register(addonName, callback)
	if (lib.addons[addonName]) then	return lib.addons[addonName] end

	local new = setmetatable({}, lib)
	getmetatable(new).__index = lib

	new.attachments	= {}
	new.callback	= callback

	-- Set defaults
	new.snapToGrid		= true
	new.gridSize		= 10
	new.allowScaling	= true

	lib.addons[addonName] = new

	return new
end

-- PUBLIC: Retrieve an existing addon's library object
-- @param	addonName	string		reference name to retrieve
-- @return				LibDragWin	existing LibDragWin object
function lib:Retrieve(addonName)
	if (lib.addons[addonName]) then
		return lib.addons[addonName]
	end
end

-- PUBLIC: Get list of Attach objects parented to this library object
-- @return				table		table of parented Attach objects
function lib:GetAttachments()
	return self.attachments
end

-- PUBLIC: Show all Attach frames
function lib:ShowAll()
	for attach in pairs(self.attachments) do
		attach:Show()
	end
end

-- PUBLIC: Hide all Attach frames
function lib:HideAll()
	for attach in pairs(self.attachments) do
		attach:Hide()
	end
end

-- PUBLIC: Set whether frames should snap to grid on move
-- @param	snap		boolean		setting for whether to snap
-- @param	gridSize	number		size of grid for snapTo (OPTIONAL)
function lib:SnapToGrid(snap, gridSize)
	self.snapToGrid = snap
	self.gridSize = (gridSize and gridSize >= 2) and gridSize or 10

	for attach in pairs(self.attachments) do
		attach.snapToGrid = self.snapToGrid
		attach.gridSize = self.gridSize
	end
end

-- PUBLIC: Set whether to allow mousewheel scaling of frames
-- @param	allow		boolean		setting for whether to allow scaling
function lib:AllowScaling(allow)
	self.allowScaling = allow

	for attach in pairs(self.attachments) do
		attach.allowScaling = allow
	end
end

-- PUBLIC: Attach to a target frame for dragging and scaling
-- @param	target		frame		target frame to attach to
-- @param	label		string		text to display when not scaling
function lib:Attach(target, label)
	if (lib.targets[target]) then
		d(MAJOR .. ': Targeted frame (' .. label .. ') already has an attached handler.')
		return
	end

	local new = WM:CreateControlFromVirtual(nil, GuiRoot, 'LibDragWinHandler')

	for k,v in pairs(Attach) do
		new[k] = v -- embed Attach functions into new control
	end

	self.attachments[new] = true

	lib.targets[target] = new

	return new:New(self, target, label)
end

-- PUBLIC: Resync Attach location to target frame. Used after outside movement.
-- @param	target		frame		target frame to resync to
function lib:Resync(target)
	if (not lib.targets[target]) then return end

	AnchorFrameToTarget(lib.targets[target], target)
end