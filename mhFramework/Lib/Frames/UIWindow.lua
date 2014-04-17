WF_FRAMES.UIWindow = {}

local closeButtonUp = "/esoui/art/buttons/clearslot_up.dds"
local closeButtonDown = "/esoui/art/buttons/clearslot_down.dds"
local unlockedButtonUp = "/esoui/art/quest/quest_untrack_up.dds"
local unlockedButtonDown = "/esoui/art/quest/quest_untrack_down.dds"
local lockedButtonUp = "/esoui/art/quest/quest_track_up.dds"
local lockedButtonDown = "/esoui/art/quest/quest_track_down.dds"

function WF_FRAMES.UIWindow:Create(baseName, title, useMover, useCloser, Settings, width, height, overAlpha)
	local obj = WF_UTIL.FindFrame(baseName)
	if obj ~= nil then return end
	
	local moverText = lockedButtonUp
	if Settings.Moveable then moverText = unlockedButtonUp end
	
	local minW = 40 + 2
	local minH = 50
	
	if useMover then minW = minW + 15 end
	if useCloser then minW = minW + 15 end
	
	local w = width or minW
	local h = height or minH
	
	if w < minW then w = minW end
	if h < minH then h = minH end
	
	local titleWminus = 2
	if useMover then titleWminus = titleWminus + 15 end
	if useCloser then titleWminus = titleWminus + 15 end
	
	local a = overAlpha or .85
		
	obj = WF_FRAMES.__NewTopLevel(baseName)
		:SetAnchor(CENTER, GuiRoot, CENTER, Settings.ShiftX, Settings.ShiftY)
		:SetDimensions(w,h)
		:SetHidden(Settings.Hidden)
		:SetMovable(Settings.Moveable)
		:SetMouseEnabled(true)
	.__END
	
	obj.OutAlpha = .5
	obj.InAlpha = overAlpha or .85
	
	obj = WF_FRAMES.UIBackdrop(
		obj, 
		baseName, 
		{CENTER,obj,CENTER,0,0}, 
		obj:GetWidth(), 
		obj:GetHeight(), 
		{0.1,0.1,0.1,1}, 
		{0,0,0,1}, 
		{"", 8, 1, 1}, 
		obj.OutAlpha, 
		obj
	)
	
	obj.Title = WF_FRAMES.UITextBlock(
		obj.Backdrop, 
		baseName.."_Title", 
		{TOPLEFT,obj.Backdrop,TOPLEFT,1,1}, 
		(obj:GetWidth()-titleWminus), 
		16, 
		{0,0,0,1}, 
		{0.2,0.2,0.7,1}, 
		{"", 8, 1, 1}, 
		1, 
		title, 
		{1,1,1,1}, 
		nil, 
		0, 
		0
	)
	obj.Title.Label:SetWidth(obj.Title.Backdrop:GetWidth()*1.7)
	obj.Title.Label:SetAnchor(LEFT, obj.Title.Backdrop, LEFT, 3, -2)
	obj.Title.Label:SetScale(.65)
	
	obj.MousedOver = false
	function obj.IsMousedOver(self) return self.MousedOver end
	
	function obj.MouseIn(self) 
		obj.MousedOver = true
		obj.Backdrop:SetAlpha(obj.InAlpha)
	end
	function obj.MouseOut(self) 
		obj.MousedOver = false
		obj.Backdrop:SetAlpha(obj.OutAlpha)
	end
	
	if useCloser then
		obj.CloseButton = WF_FRAMES.__NewImage(baseName.."_CloseButton", obj.Backdrop)
			:SetDimensions(16, 16)
			:SetTexture( closeButtonUp )
			:SetAnchor( TOPRIGHT, obj.Backdrop, TOPRIGHT, -1, 1 )
			:SetMouseEnabled( true )
			:SetHandler( "OnMouseDown", function(self) self:SetTexture( closeButtonDown ) end )
			:SetHandler( "OnMouseUp", function(self) obj:Hide(); self:SetTexture( closeButtonUp ) end )
		.__END
	end
	
	if useMover then
		local moveShiftX = -1
		if useCloser then moveShiftX = -18 end
		
		function obj.ClickMove(self, forceMoveable)
			if Settings.Moveable and not forceMoveable then self:Lock()
			else self:Move() end
		end
		function obj.Move(self)
			Settings.Moveable = true
			self.MoveButton:SetTexture( unlockedButtonUp )
			self:SetMovable(Settings.Moveable)
		end
		function obj.Lock(self)
			Settings.Moveable = false
			self.MoveButton:SetTexture( lockedButtonUp )
			self:SetMovable(Settings.Moveable)
		end
		
		obj.MoveButton = WF_FRAMES.__NewImage(baseName.."_MoveButton", obj.Backdrop)
			:SetDimensions(16, 16)
			:SetTexture( moverText )
			:SetAnchor( TOPRIGHT, obj.Backdrop, TOPRIGHT, moveShiftX, 1 )
			:SetMouseEnabled( true )
			:SetHandler( "OnMouseDown", function(self) 
				if Settings.Moveable then self:SetTexture( unlockedButtonDown )
				else self:SetTexture( lockedButtonDown ) end
			end )
			:SetHandler( "OnMouseUp", function(self) obj:ClickMove() end )
		.__END
	end
	
	if not Settings.Hidden then WF_FRAMES.Events.UIModeRegisteredWindows[obj:GetName()] = obj:GetName() end
	
	function obj.SetOutAlpha(self, a) self.OutAlpha = a end
	function obj.SetInAlpha(self, a) self.InAlpha = a end
	
	function obj.Show(self)
		if WF_FRAMES.UIShouldBeHidden() then return end
		WF_FRAMES.Events.UIModeRegisteredWindows[self:GetName()] = self:GetName()
		Settings.Hidden = false
		self:SetHidden(Settings.Hidden)
	end
	function obj.Hide(self, temporary)
		if temporary == nil then temporary = false end
		if temporary then
			WF_FRAMES.Events.UIModeRegisteredWindows[self:GetName()] = self:GetName()
		else
			WF_FRAMES.Events.UIModeRegisteredWindows[self:GetName()] = nil
		end
		Settings.Hidden = true
		self:SetHidden(Settings.Hidden)
	end
	function obj.Toggle(self)
		if self:IsHidden() 
		then self:Show()
		else self:Hide(false) end
	end
	function obj.SetFrameCoords(self)
		local addOnX, addOnY = self:GetCenter()
		local guiRootX, guiRootY = GuiRoot:GetCenter()
		local x = addOnX - guiRootX
		local y = addOnY - guiRootY
		Settings.ShiftX = x
		Settings.ShiftY = y
	end
	obj.CanMove = Settings.Moveable
	if useMover then
		function obj.SetMoveState(self, bool)
			self.CanMove = bool
			Settings.Moveable = bool
			self:SetMovable(bool)
			self:ClickMove(bool)
		end
	else
		function obj.SetMoveState(self, bool)
			self.CanMove = bool
			Settings.Moveable = bool
			self:SetMovable(bool)
		end
	end
	
	obj:SetHandler("OnMoveStop", function(self) obj:SetFrameCoords() end)
	obj:SetHandler("OnMouseEnter", function(self) obj:MouseIn() end)
	obj:SetHandler("OnMouseExit", function(self) obj:MouseOut() end)
	if useMover then
		obj.MoveButton:SetHandler("OnMouseEnter", function(self) obj:MouseIn() end)
		obj.MoveButton:SetHandler("OnMouseExit", function(self) obj:MouseOut() end)
	end
	if useCloser then
		obj.CloseButton:SetHandler("OnMouseEnter", function(self) obj:MouseIn() end)
		obj.CloseButton:SetHandler("OnMouseExit", function(self) obj:MouseOut() end)
	end
	
	return obj
end

