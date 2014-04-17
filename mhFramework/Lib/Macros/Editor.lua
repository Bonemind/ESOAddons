--[[ TODO:
	* Make message label show a summary
	* Fix executing of macros using new saves
	* Remove artifacts (old command line functions for macros)
]]--

local ChildEditWinName = "WykkydEditMacroChild"
local ChildWin1 = ChildEditWinName.."EW1"
local ChildWin2 = ChildEditWinName.."EW2"
local ChildWin3 = ChildEditWinName.."EW3"
local ChildWin4 = ChildEditWinName.."EW4"
local ChildWin5 = ChildEditWinName.."EW5"

local closeChildWin = function( nm, compare )
	if (compare ~= nil and compare ~= nm) and _G[nm] ~= nil then 
		_G[nm]:CloseMe()
		if _G[ _G[nm].DDL.DDMName ] ~= nil then
			_G[ _G[nm].DDL.DDMName ]:CloseMe()
		end
	end
end

local editRows = {}
local _L, beenLoaded = {}, false
local bWO = (_G["WF_Outfitter"] ~= nil)
local woGearChanged = function( val )
	if bWO then
		if val ~= nil then WF_Outfitter.GearSetsChanged = val end
		return WF_Outfitter.GearSetsChanged
	else
		return false
	end
end
local woSkillsChanged = function( val )
	if bWO then
		if val ~= nil then WF_Outfitter.SkillSetsChanged = val end
		return WF_Outfitter.SkillSetsChanged
	else
		return false
	end
end

local loadListTypes = function()
	bWO = (_G["WF_Outfitter"] ~= nil)
	_L[WF_MACRO_TYPE_NIL] = {}
	_L[WF_MACRO_TYPE_NIL]["ALL"] 	 = {
		[WF_MACRO_TYPE_NIL] = "  ",
		--[WF_MACRO_TYPE_CHAT] = "Chat",
		[WF_MACRO_TYPE_EMOTE] = "Emote",
		[WF_MACRO_TYPE_ADDON] = "Addon",
		[WF_MACRO_TYPE_GEAR] = "Gear",
		[WF_MACRO_TYPE_SKILL] = "Skills"
	}
	_L[WF_MACRO_TYPE_NIL]["ENABLED"] = {
		[WF_MACRO_TYPE_NIL] = true,
		[WF_MACRO_TYPE_CHAT] = false,
		[WF_MACRO_TYPE_EMOTE] = true,
		[WF_MACRO_TYPE_ADDON] = true,
		[WF_MACRO_TYPE_GEAR] = bWO,
		[WF_MACRO_TYPE_SKILL] = bWO
	}
	_L[WF_MACRO_TYPE_NIL]["DDL"] 	 = {}
	_L[WF_MACRO_TYPE_NIL]["DDV"] 	 = {}
	for k,v in ipairs(_L[WF_MACRO_TYPE_NIL]["ENABLED"]) do 
		if v then 
			_L[WF_MACRO_TYPE_NIL]["DDL"][k] = _L[WF_MACRO_TYPE_NIL]["ALL"][k] 
			_L[WF_MACRO_TYPE_NIL]["DDV"][_L[WF_MACRO_TYPE_NIL]["ALL"][k]] = k 
		end 
	end
end

local loadListChat = function()
	local ch = WF_CONSTANTS.ChatChannels
	_L[WF_MACRO_TYPE_CHAT] = {}
	_L[WF_MACRO_TYPE_CHAT]["ALL"] = {}
	_L[WF_MACRO_TYPE_CHAT]["ENABLED"] = {}
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "  ")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Say")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Party")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Zone")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Yell")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "EM")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Guild 1")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Guild 2")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Guild 3")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Guild 4")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Guild 5")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Officer 1")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Officer 2")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Officer 3")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Officer 4")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ALL"], "Officer 5")
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], true)
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], true)
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], true)
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], true)
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], true)
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], true)
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], (GetGuildId(1) ~= 0))
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], (GetGuildId(2) ~= 0))
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], (GetGuildId(3) ~= 0))
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], (GetGuildId(4) ~= 0))
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], (GetGuildId(5) ~= 0))
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], (GetGuildId(1) ~= 0))
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], (GetGuildId(2) ~= 0))
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], (GetGuildId(3) ~= 0))
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], (GetGuildId(4) ~= 0))
	table.insert(_L[WF_MACRO_TYPE_CHAT]["ENABLED"], (GetGuildId(5) ~= 0))
	local channels = {}
	table.insert(channels, -1)
	table.insert(channels, ch.s.channel)
	table.insert(channels, ch.p.channel)
	table.insert(channels, ch.z.channel)
	table.insert(channels, ch.y.channel)
	table.insert(channels, ch.em.channel)
	table.insert(channels, ch.g1.channel)
	table.insert(channels, ch.g2.channel)
	table.insert(channels, ch.g3.channel)
	table.insert(channels, ch.g4.channel)
	table.insert(channels, ch.g5.channel)
	table.insert(channels, ch.o1.channel)
	table.insert(channels, ch.o2.channel)
	table.insert(channels, ch.o3.channel)
	table.insert(channels, ch.o4.channel)
	table.insert(channels, ch.o5.channel)
	_L[WF_MACRO_TYPE_CHAT]["DDL"] 	 = {}
	_L[WF_MACRO_TYPE_CHAT]["DDLKP"]  = {}
	_L[WF_MACRO_TYPE_CHAT]["DDV"] 	 = {}
	for k,v in ipairs(_L[WF_MACRO_TYPE_CHAT]["ENABLED"]) do 
		if v then 
			table.insert( _L[WF_MACRO_TYPE_CHAT]["DDL"], _L[WF_MACRO_TYPE_CHAT]["ALL"][k] )
			_L[WF_MACRO_TYPE_CHAT]["DDV"][_L[WF_MACRO_TYPE_CHAT]["ALL"][k]] = channels[k]
			_L[WF_MACRO_TYPE_CHAT]["DDLKP"][channels[k]] = _L[WF_MACRO_TYPE_CHAT]["ALL"][k]
		end 
	end
end

local loadListEmotes = function()
	wykkydsFramework.LoadEmotes()
	_L[WF_MACRO_TYPE_EMOTE] = {}
	_L[WF_MACRO_TYPE_EMOTE]["ALL"] 		= {}
	_L[WF_MACRO_TYPE_EMOTE]["ENABLED"]  = {}
	_L[WF_MACRO_TYPE_EMOTE]["DDL"]  	= {}
	_L[WF_MACRO_TYPE_EMOTE]["DDV"]  	= {}
	_L[WF_MACRO_TYPE_EMOTE]["DDLKP"]  	= {}
	_L[WF_MACRO_TYPE_EMOTE]["DDV"]["  "] = -1
	table.insert(_L[WF_MACRO_TYPE_EMOTE]["ALL"], "  ")
	table.insert(_L[WF_MACRO_TYPE_EMOTE]["DDL"], "  ")
	for n,tbl in ipairs(wykkydsFramework.emotesSorted) do 
		table.insert(_L[WF_MACRO_TYPE_EMOTE]["ALL"], tbl.name)
		table.insert(_L[WF_MACRO_TYPE_EMOTE]["DDL"], tbl.name)
		_L[WF_MACRO_TYPE_EMOTE]["ENABLED"][tbl.code] = true 
		_L[WF_MACRO_TYPE_EMOTE]["DDV"][tbl.name] = tbl.code
		_L[WF_MACRO_TYPE_EMOTE]["DDLKP"][tbl.code] = tbl.name
	end
end

local loadListAddons = function()
	_L[WF_MACRO_TYPE_ADDON] = {}
	_L[WF_MACRO_TYPE_ADDON]["ALL"] 		 = {}
	_L[WF_MACRO_TYPE_ADDON]["ENABLED"]   = {}
	_L[WF_MACRO_TYPE_ADDON]["DDL"]  	 = {}
	_L[WF_MACRO_TYPE_ADDON]["DDV"]  	 = {}
	_L[WF_MACRO_TYPE_ADDON]["DDV"]["  "] = -1
	_L[WF_MACRO_TYPE_ADDON]["ENABLED"]["  "] = true
	table.insert(_L[WF_MACRO_TYPE_ADDON]["ALL"], "  ")
	for k,t in WF_PairsByKeys(wykkydsFramework.Commands.Callbacks) do
		if t ~= nil then
			if t.Callback ~= nil then
				if k == string.lower(t.Command) and k ~= "/loadbar" and k ~= "/loadset" 
				and k ~= "/wo" and k ~= "/savebar" and k ~= "/saveset" and k ~= "/delbar" 
				and k ~= "/clearset" then
					table.insert(_L[WF_MACRO_TYPE_ADDON]["ALL"], k)
					_L[WF_MACRO_TYPE_ADDON]["DDV"][k] 	  = k
					_L[WF_MACRO_TYPE_ADDON]["ENABLED"][k] = true
				end
			end
		end
	end
	for k,v in ipairs(_L[WF_MACRO_TYPE_ADDON]["ALL"]) do
		table.insert(_L[WF_MACRO_TYPE_ADDON]["DDL"], v)
	end
end

local loadListGear = function()
	local ret = false
	if woGearChanged or _L[WF_MACRO_TYPE_GEAR] ==  nil then
		ret = true
		_L[WF_MACRO_TYPE_GEAR] = {}
		_L[WF_MACRO_TYPE_GEAR]["ALL"] 	  = {}
		_L[WF_MACRO_TYPE_GEAR]["ENABLED"] = {}
		_L[WF_MACRO_TYPE_GEAR]["DDL"]  	  = {}
		_L[WF_MACRO_TYPE_GEAR]["DDV"]  	  = {}
		_L[WF_MACRO_TYPE_GEAR]["DDV"]["  "] = -1
		_L[WF_MACRO_TYPE_GEAR]["ENABLED"]["  "] = true
		table.insert(_L[WF_MACRO_TYPE_GEAR]["ALL"], "  ")
		if bWO then
			if WF_Outfitter.GearSets["sets"]["keys"] == nil then WF_Outfitter.GearSets["sets"]["keys"] = {} end
			for k,t in pairs(WF_Outfitter.GearSets["sets"]["keys"]) do
				if t ~= nil and t ~= WF_Outfitter.GC.NekkidKey then
					table.insert(_L[WF_MACRO_TYPE_GEAR]["ALL"], t)
					_L[WF_MACRO_TYPE_GEAR]["DDV"][t] 	 = t
					_L[WF_MACRO_TYPE_GEAR]["ENABLED"][t] = true
				end
			end
			for k,v in ipairs(_L[WF_MACRO_TYPE_GEAR]["ALL"]) do
				table.insert(_L[WF_MACRO_TYPE_GEAR]["DDL"], v)
			end
		end
		woGearChanged(false)
	end
	return ret
end

local loadListSkills = function()
	local ret = false
	if woSkillsChanged or _L[WF_MACRO_TYPE_SKILL] ==  nil then
		ret = true
		_L[WF_MACRO_TYPE_SKILL] = {}
		_L[WF_MACRO_TYPE_SKILL]["ALL"] 		= {}
		_L[WF_MACRO_TYPE_SKILL]["ENABLED"]  = {}
		_L[WF_MACRO_TYPE_SKILL]["DDL"]  	= {}
		_L[WF_MACRO_TYPE_SKILL]["DDV"]  	= {}
		_L[WF_MACRO_TYPE_SKILL]["DDV"]["  "] = -1
		_L[WF_MACRO_TYPE_SKILL]["ENABLED"]["  "] = true
		table.insert(_L[WF_MACRO_TYPE_SKILL]["ALL"], "  ")
		if bWO then
			if WF_Outfitter.SkillSets["sets"]["keys"] == nil then WF_Outfitter.SkillSets["sets"]["keys"] = {} end
			for k,t in pairs(WF_Outfitter.SkillSets["sets"]["keys"]) do
				if t ~= nil then
					table.insert(_L[WF_MACRO_TYPE_SKILL]["ALL"], t)
					_L[WF_MACRO_TYPE_SKILL]["DDV"][t] 	  = t
					_L[WF_MACRO_TYPE_SKILL]["ENABLED"][t] = true
				end
			end
			for k,v in ipairs(_L[WF_MACRO_TYPE_SKILL]["ALL"]) do
				table.insert(_L[WF_MACRO_TYPE_SKILL]["DDL"], v)
			end
		end
	end
	return ret
end

local loadLists = function()
	if beenLoaded then return end
	beenLoaded = true
	bWO = (_G["WF_Outfitter"] ~= nil)
	
	loadListTypes()
	loadListChat()
	loadListEmotes()
	loadListAddons()
	loadListGear()
	loadListSkills()
end

local DDL = function(parent, name, anchor, validChoices, getFunc, setFunc, width)
	local obj = _G[name.."Frame"]
	if obj == nil then obj = WF_FRAMES.__NewTopLevel(name.."Frame")
			:SetParent(parent)
			:SetAnchor(anchor[1], anchor[2], anchor[3], anchor[4], anchor[5])
			:SetDimensions( width or 72, 32 )
			:SetMouseEnabled(true)
		.__END
	
		obj.text = getFunc()
		obj.valid = validChoices
	
		obj.ComboBox_Left = WF_FRAMES.__NewImage( name.."CBoxLeft", obj )
			:SetAnchor( LEFT, obj, LEFT, 0, 0 )
			:SetTexture( "/esoui/art/miscellaneous/dropdown_inset_left.dds" )
			:SetDimensions( 4, 32 )
			:SetHidden(false)
		.__END
		obj.ComboBox_Center = WF_FRAMES.__NewImage( name.."CBoxLeft", obj )
			:SetAnchor( LEFT, obj.ComboBox_Left, RIGHT, 0, 0 )
			:SetTexture( "/esoui/art/miscellaneous/dropdown_inset_center.dds" )
			:SetDimensions( (width or 72) - 8, 32 )
			:SetHidden(false)
		.__END
		obj.ComboBox_Right = WF_FRAMES.__NewImage( name.."CBoxLeft", obj )
			:SetAnchor( LEFT, obj.ComboBox_Center, RIGHT, 0, 0 )
			:SetTexture( "/esoui/art/miscellaneous/dropdown_inset_right.dds" )
			:SetDimensions( 4, 32 )
			:SetHidden(false)
		.__END
		obj.ComboArrowOver = false
		obj.ComboBox_Arrow = WF_FRAMES.__NewImage( name.."CBoxArrow", obj )
			:SetAnchor( CENTER, obj.ComboBox_Center, RIGHT, -7, -2 )
			:SetTexture( "/esoui/art/buttons/dropbox_arrow_normal.dds" )
			:SetDimensions( 16, 16 )
			:SetHidden( false )
			:SetMouseEnabled( true )
			:SetHandler( "OnMouseEnter", function() 
				obj.ComboArrowOver = true; 
				obj.ComboBox_Arrow:SetTexture( "/esoui/art/buttons/dropbox_arrow_mouseover.dds" ) 
			end )
			:SetHandler( "OnMouseExit", function() 
				obj.ComboArrowOver = false; 
				obj.ComboBox_Arrow:SetTexture( "/esoui/art/buttons/dropbox_arrow_normal.dds" ) 
			end )
		.__END
		obj.ComboText = WF_FRAMES.__NewLabel( name.."CBoxText", obj )
			:SetText( getFunc() )
			:SetColor( .5, .7, 1, 1 )
			:SetAnchor( LEFT, obj, LEFT, 4, -3 )
			:SetHidden(false)
			:SetFont("ZoFontGame")
			:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["left"])
			:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["center"])
		.__END
		
		obj.selectedvalue = getFunc()
		obj.SetSelectedValue = function( value )
			obj.selectedvalue = value or "  "
			obj.ComboText:SetText( value or "  " )
		end
		
		local ii = 0
		obj.lstChoices = {}
		for _,v in pairs(validChoices) do
			ii = ii + 1
			obj.lstChoices[ii] = {
				name = v,
				onClick = function(self, button, val) 
					obj.SetSelectedValue( val )
					setFunc( val ) 
				end,
				params = v
			}
		end
		obj.ComboBox_Arrow:SetHandler( "OnMouseDown", function(self,button) 
			local ddParent = self:GetParent()
			if ddParent.DDL == nil then 
				ddParent.DDL = WF_FRAMES.UIDropDown( ddParent:GetName().."DDL", nil, { TOP, ddParent, CENTER, 0, 4 }, width or 72, ddParent.lstChoices, nil, nil, { .25, .25, .25, 1 } )
				ddParent.DDL:SetDrawTier( DT_HIGH )
				ddParent.DDL:SetDrawLevel( 1 )
			else
				if not ddParent.DDL:IsHidden() then ddParent.DDL:SetHidden(true) 
				else ddParent.DDL:SetHidden(false) end
			end
			obj.ComboBox_Arrow:SetTexture( "/esoui/art/buttons/dropbox_arrow_mousedown.dds" ) 
		end )
		obj.ComboBox_Arrow:SetHandler( "OnMouseUp", function() 
				if obj.ComboArrowOver then obj.ComboBox_Arrow:SetTexture( "/esoui/art/buttons/dropbox_arrow_mouseover.dds" ) 
				else obj.ComboBox_Arrow:SetTexture( "/esoui/art/buttons/dropbox_arrow_normal.dds" ) end
			end )
		obj.ReloadOptions = function( list, doParse )
			if doParse then
				local ii = 0
				obj.lstChoices = {}
				for _,v in pairs( _L[list]["DDL"]) do
					ii = ii + 1
					obj.lstChoices[ii] = {
						name = v,
						onClick = function(self, button, val) 
							obj.SetSelectedValue( val )
							setFunc( val ) 
						end,
						params = v
					}
				end
			end
		end
	end
	obj:SetHidden(false)
	return obj
end

local EBox = function(parent, name, text, isMultiLine, getFunc, setFunc, width)
	width = width or 160
	if text == nil then width = width / 2 end
	local editbox = WF_FRAMES.__NewTopLevel(name)
		:SetParent(parent)
		:SetAnchor(TOP, parent, BOTTOM, 0, 4)
		:SetResizeToFitDescendents(true)
		:SetWidth(width)
		:SetMouseEnabled(true)
		:SetHandler("OnMouseEnter", ZO_Options_OnMouseEnter)
		:SetHandler("OnMouseExit", ZO_Options_OnMouseExit)
	.__END
	editbox.Value = getFunc()
	
	if text ~= nil then
		editbox.label = WF_CHAIN(WINDOW_MANAGER:CreateControl(name.."Label", editbox, CT_LABEL))
			:SetDimensions(width/2, 26)
			:SetAnchor(TOPLEFT)
			:SetFont("ZoFontWinH4")
			:SetWrapMode(TEXT_WRAP_MODE_ELLIPSIS)
			:SetText(text)
		.__END
	end
	
	editbox.bg = WF_CHAIN(WINDOW_MANAGER:CreateControlFromVirtual(name.."BG", editbox, "ZO_EditBackdrop"))
		:SetDimensions(width/2,isMultiLine and 100 or 24)
		:SetAnchor(RIGHT)
	.__END
	if text == nil then editbox.bg:SetAnchor(LEFT) end
	
	editbox.edit = WF_CHAIN(WINDOW_MANAGER:CreateControlFromVirtual(name.."Edit", editbox.bg, isMultiLine and "ZO_DefaultEditMultiLineForBackdrop" or "ZO_DefaultEditForBackdrop"))
		:SetText(editbox.Value)
		:SetHandler("OnFocusLost", function(self) editbox.Value = self:GetText(); end)
	.__END
	
	editbox.SetValue = function( val )
		editbox.Value =  val or ""
		editbox.edit:SetText( val or "" )
	end
	editbox.GetValue = function()
		return editbox.Value
	end
	
	editbox.panel = parent
	editbox.tooltipText = nil
	return editbox
end

local childEditWinOne = function( parent, vars, prep )
	if vars == nil then vars = {} end
	if _G[ChildWin1] == nil then
		WF_FRAMES.UIPopup( 
			ChildWin1, "Edit Chat Message", 
			{TOPLEFT, parent, TOPRIGHT, 7, 0}, 210, 
			nil, function()
				if _G[ChildWin1] ~= nil then
					if _G[ _G[ChildWin1].DDL.DDMName ] ~= nil then
						_G[ _G[ChildWin1].DDL.DDMName ]:SetHidden(true)
					end
				end
			end, true
		)
		local obj = _G[ChildWin1]
		
		obj.ChildCallback = parent.ChildCallBack
		
		obj.Type = WF_MACRO_TYPE_CHAT
		obj.Param1 = vars.Param1 or -1
		obj.Param2 = vars.Param2
		if vars.Type ~= obj.Type then obj.Param1 = nil; obj.Param2 = nil; end

		obj.DDL = WF_CHAIN(
			DDL(
				obj, ChildWin1.."DDL", 
				{ TOP, obj, TOP, 0, 28 }, _L[obj.Type]["DDL"], 
				function() return _L[obj.Type]["DDLKP"][ obj.Param1 or -1 ]; end, 
				function(val) obj.Param1 = _L[obj.Type]["DDV"][ val ]; end,
				obj:GetWidth()/2
			))
		.__END
		
		obj.Message = EBox(obj, ChildWin1.."Message", nil, false, 
			function() return obj.Param2 or ""; end, 
			function(val) obj.Param2 = val; end,
			(obj:GetWidth()*2)-24 )

		obj.Message:SetAnchor( TOP, obj, TOP, 0, 55 )
		obj:SetHeight( 110 )
		
		obj.Param1Hold = ""
		obj.Param2Hold = ""
		
		obj.SetValues = function( param1, param2 )
			obj.Param1 = param1 or -1
			obj.Param2 = param2 or ""
			obj.Param1Hold = obj.Param1
			obj.Param2Hold = obj.Param2
			
			obj.DDL.SetSelectedValue( _L[obj.Type]["DDLKP"][ obj.Param1 or -1 ] )
			obj.Message.SetValue( obj.Param2 or "" )
		end
		obj.GetValues = function()
			return obj.Param1, obj.Message.GetValue() or ""
		end
		
		if obj.setBtn == nil then obj.setBtn = WF_FRAMES.UIButton(
				obj, ChildWin1.."setBtn", 
				{ BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, 0 }, 
				80, 14, 
				{0,0,0,0}, 
				{0.2,0.2,0.7,0}, 
				{"", 8, 1, 0}, 
				1, "[Set]", 
				{1,1,1,1}, 
				nil, nil, nil
			)
			obj.setBtn.Backdrop:ClearAnchors()
			obj.setBtn.Backdrop:SetAnchor( BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, -6 )
			obj.setBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.setBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
			obj.setBtn.Button:SetHandler("OnClicked", function(self,button) 
				obj.Param2 = obj.Message.GetValue() or ""
				obj.ChildCallback( ChildWin1 )
				obj:MouseOut()
			end )
			obj.setBtn.Button:SetHandler("OnMouseEnter", function() obj.setBtn.Label:SetColor(.5,.6,1,1) end)
			obj.setBtn.Button:SetHandler("OnMouseExit", function() obj.setBtn.Label:SetColor(1,1,1,1) end)
		end
		
		if obj.cancelBtn == nil then obj.cancelBtn = WF_FRAMES.UIButton(
				obj, ChildWin1.."cancelBtn", 
				{ BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, 0 }, 
				80, 14, 
				{0,0,0,0}, 
				{0.2,0.2,0.7,0}, 
				{"", 8, 1, 0}, 
				1, "[Cancel]", 
				{1,1,1,1}, 
				nil, nil, nil
			)
			obj.cancelBtn.Backdrop:ClearAnchors()
			obj.cancelBtn.Backdrop:SetAnchor( BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, -6 )
			obj.cancelBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.cancelBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
			obj.cancelBtn.Button:SetHandler("OnClicked", function(self,button) 
				obj.Param1 = obj.Param1Hold
				obj.Param2 = obj.Param2Hold
				obj:MouseOut()
			end )
			obj.cancelBtn.Button:SetHandler("OnMouseEnter", function() obj.cancelBtn.Label:SetColor(.5,.6,1,1) end)
			obj.cancelBtn.Button:SetHandler("OnMouseExit", function() obj.cancelBtn.Label:SetColor(1,1,1,1) end)
		end
		
		if prep then obj:SetHidden(true) end
	else
		if not prep then
			local obj = _G[ChildWin1]
			if vars ~= nil then
				if table_count(vars) > 0 then
					obj.SetValues( vars.Param1, vars.Param2 )
				end
			end
			obj:SetHidden(false)
		end
	end
	if prep then _G[ChildWin1]:SetHidden(true) end
end

local childEditWinTwo = function( parent, vars, prep )
	if vars == nil then vars = {} end
	if _G[ChildWin2] == nil then
		WF_FRAMES.UIPopup( 
			ChildWin2, "Select an Emote", 
			{TOPLEFT, parent, TOPRIGHT, 7, 0}, 210, 
			nil, function()
				if _G[ChildWin2] ~= nil then
					if _G[ _G[ChildWin2].DDL.DDMName ] ~= nil then
						_G[ _G[ChildWin2].DDL.DDMName ]:SetHidden(true)
					end
				end
			end, true
		)
		local obj = _G[ChildWin2]
		
		obj.ChildCallback = parent.ChildCallBack
		
		obj.Type = WF_MACRO_TYPE_EMOTE
		obj.Param1 = vars.Param1
		obj.Param2 = nil
		if vars.Type ~= obj.Type then obj.Param1 = nil; obj.Param2 = nil; end
		
		obj.DDL = WF_CHAIN(
			DDL(
				obj, ChildWin2.."DDL", 
				{ TOP, obj, TOP, 0, 28 }, _L[obj.Type]["DDL"], 
				function() return _L[obj.Type]["DDLKP"][ obj.Param1 or -1 ]; end, 
				function(val) obj.Param1 = _L[obj.Type]["DDV"][ val ]; end,
				(obj:GetWidth()*.72)-4
			))
		.__END
		
		obj:SetHeight( 80 )
		
		obj.Param1Hold = ""
		obj.Param2Hold = ""
		
		obj.SetValues = function( param1, param2 )
			obj.Param1 = param1 or -1
			obj.Param2 = nil
			obj.Param1Hold = obj.Param1
			obj.Param2Hold = nil
			
			obj.DDL.SetSelectedValue( _L[obj.Type]["DDLKP"][ obj.Param1 or -1 ] )
		end
		obj.GetValues = function()
			return obj.Param1, nil
		end
		
		if obj.setBtn == nil then obj.setBtn = WF_FRAMES.UIButton(
				obj, ChildWin2.."setBtn", 
				{ BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, 0 }, 
				80, 14, 
				{0,0,0,0}, 
				{0.2,0.2,0.7,0}, 
				{"", 8, 1, 0}, 
				1, "[Set]", 
				{1,1,1,1}, 
				nil, nil, nil
			)
			obj.setBtn.Backdrop:ClearAnchors()
			obj.setBtn.Backdrop:SetAnchor( BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, -6 )
			obj.setBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.setBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
			obj.setBtn.Button:SetHandler("OnClicked", function(self,button) 
				obj.ChildCallback( ChildWin2 )
				obj:MouseOut()
			end )
			obj.setBtn.Button:SetHandler("OnMouseEnter", function() obj.setBtn.Label:SetColor(.5,.6,1,1) end)
			obj.setBtn.Button:SetHandler("OnMouseExit", function() obj.setBtn.Label:SetColor(1,1,1,1) end)
		end
		
		if obj.cancelBtn == nil then obj.cancelBtn = WF_FRAMES.UIButton(
				obj, ChildWin2.."cancelBtn", 
				{ BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, 0 }, 
				80, 14, 
				{0,0,0,0}, 
				{0.2,0.2,0.7,0}, 
				{"", 8, 1, 0}, 
				1, "[Cancel]", 
				{1,1,1,1}, 
				nil, nil, nil
			)
			obj.cancelBtn.Backdrop:ClearAnchors()
			obj.cancelBtn.Backdrop:SetAnchor( BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, -6 )
			obj.cancelBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.cancelBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
			obj.cancelBtn.Button:SetHandler("OnClicked", function(self,button) 
				obj.Param1 = obj.Param1Hold
				obj.Param2 = obj.Param2Hold
				obj:MouseOut()
			end )
			obj.cancelBtn.Button:SetHandler("OnMouseEnter", function() obj.cancelBtn.Label:SetColor(.5,.6,1,1) end)
			obj.cancelBtn.Button:SetHandler("OnMouseExit", function() obj.cancelBtn.Label:SetColor(1,1,1,1) end)
		end
		
		if prep then obj:SetHidden(true) end
	else
		if not prep then
			local obj = _G[ChildWin2]
			if vars ~= nil then
				if table_count(vars) > 0 then
					obj.SetValues( vars.Param1, nil )
				end
			end
			obj:SetHidden(false)
		end
	end
	if prep then _G[ChildWin2]:SetHidden(true) end
end

local childEditWinThree = function( parent, vars, prep )
	if vars == nil then vars = {} end
	if _G[ChildWin3] == nil then
		WF_FRAMES.UIPopup( 
			ChildWin3, "Select a Slash Command", 
			{TOPLEFT, parent, TOPRIGHT, 7, 0}, 210, 
			nil, function()
				if _G[ChildWin3] ~= nil then
					if _G[ _G[ChildWin3].DDL.DDMName ] ~= nil then
						_G[ _G[ChildWin3].DDL.DDMName ]:SetHidden(true)
					end
				end
			end, true
		)
		local obj = _G[ChildWin3]
		
		obj.ChildCallback = parent.ChildCallBack
		
		obj.Type = WF_MACRO_TYPE_ADDON
		obj.Param1 = vars.Param1
		obj.Param2 = vars.Param2
		if vars.Type ~= obj.Type then obj.Param1 = nil; obj.Param2 = nil; end

		obj.DDL = WF_CHAIN(
			DDL(
				obj, ChildWin3, 
				{ TOP, obj, TOP, 0, 28 }, _L[obj.Type]["DDL"], 
				function() return obj.Param1; end, 
				function(val) obj.Param1 = val; end,
				(obj:GetWidth()*.85)-4
			))
		.__END
		
		obj.Message = EBox(obj, ChildWin3.."Message", nil, false, 
			function() return obj.Param2 or ""; end, 
			function(val) obj.Param2 = val; end,
			(obj:GetWidth()*2)-24 )

		obj.Message:SetAnchor( TOP, obj, TOP, 0, 55 )
		obj:SetHeight( 110 )
		
		obj.Param1Hold = ""
		obj.Param2Hold = ""
		
		obj.SetValues = function( param1, param2 )
			obj.Param1 = param1 or -1
			obj.Param2 = param2 or ""
			obj.Param1Hold = obj.Param1
			obj.Param2Hold = obj.Param2
			
			obj.DDL.SetSelectedValue( _L[obj.Type]["DDL"][ obj.Param1 or -1 ] )
			obj.Message.SetValue( obj.Param2 )
		end
		obj.GetValues = function()
			return obj.Param1, obj.Param2
		end
		
		if obj.setBtn == nil then obj.setBtn = WF_FRAMES.UIButton(
				obj, ChildWin3.."setBtn", 
				{ BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, 0 }, 
				80, 14, 
				{0,0,0,0}, 
				{0.2,0.2,0.7,0}, 
				{"", 8, 1, 0}, 
				1, "[Set]", 
				{1,1,1,1}, 
				nil, nil, nil
			)
			obj.setBtn.Backdrop:ClearAnchors()
			obj.setBtn.Backdrop:SetAnchor( BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, -6 )
			obj.setBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.setBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
			obj.setBtn.Button:SetHandler("OnClicked", function(self,button) 
				obj.ChildCallback( ChildWin3 )
				obj:MouseOut()
			end )
			obj.setBtn.Button:SetHandler("OnMouseEnter", function() obj.setBtn.Label:SetColor(.5,.6,1,1) end)
			obj.setBtn.Button:SetHandler("OnMouseExit", function() obj.setBtn.Label:SetColor(1,1,1,1) end)
		end
		
		if obj.cancelBtn == nil then obj.cancelBtn = WF_FRAMES.UIButton(
				obj, ChildWin3.."cancelBtn", 
				{ BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, 0 }, 
				80, 14, 
				{0,0,0,0}, 
				{0.2,0.2,0.7,0}, 
				{"", 8, 1, 0}, 
				1, "[Cancel]", 
				{1,1,1,1}, 
				nil, nil, nil
			)
			obj.cancelBtn.Backdrop:ClearAnchors()
			obj.cancelBtn.Backdrop:SetAnchor( BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, -6 )
			obj.cancelBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.cancelBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
			obj.cancelBtn.Button:SetHandler("OnClicked", function(self,button) 
				obj.Param1 = obj.Param1Hold
				obj.Param2 = obj.Param2Hold
				obj:MouseOut()
			end )
			obj.cancelBtn.Button:SetHandler("OnMouseEnter", function() obj.cancelBtn.Label:SetColor(.5,.6,1,1) end)
			obj.cancelBtn.Button:SetHandler("OnMouseExit", function() obj.cancelBtn.Label:SetColor(1,1,1,1) end)
		end
		
		if prep then obj:SetHidden(true) end
	else
		if not prep then
			local obj = _G[ChildWin3]
			if vars ~= nil then
				if table_count(vars) > 0 then
					obj.SetValues( vars.Param1, vars.Param2 )
				end
			end
			obj:SetHidden(false)
		end
	end
	if prep then _G[ChildWin3]:SetHidden(true) end
end

local childEditWinFour = function( parent, vars, prep )
	if vars == nil then vars = {} end
	if _G[ChildWin4] == nil then
		WF_FRAMES.UIPopup( 
			ChildWin4, "Select a Gear Set", 
			{TOPLEFT, parent, TOPRIGHT, 7, 0}, 210, 
			nil, function()
				if _G[ChildWin4] ~= nil then
					if _G[ _G[ChildWin4].DDL.DDMName ] ~= nil then
						_G[ _G[ChildWin4].DDL.DDMName ]:SetHidden(true)
					end
				end
			end, true
		)
		local obj = _G[ChildWin4]
		
		obj.ChildCallback = parent.ChildCallBack
		
		obj.Type = WF_MACRO_TYPE_GEAR
		obj.Param1 = vars.Param1
		obj.Param2 = nil
		if vars.Type ~= obj.Type then obj.Param1 = nil; obj.Param2 = nil; end
		
		obj.DDL = WF_CHAIN(
			DDL(
				obj, ChildWin4, 
				{ TOP, obj, TOP, 0, 28 }, _L[obj.Type]["DDL"], 
				function() return obj.Param1; end, 
				function(val) obj.Param1 = val; end,
				(obj:GetWidth()*.85)-4
			))
		.__END
		
		obj:SetHeight( 80 )
		
		obj.Param1Hold = ""
		obj.Param2Hold = ""
		
		obj.SetValues = function( param1, param2 )
			obj.DDL.ReloadOptions( obj.Type, loadListGear() )
			obj.Param1 = param1 or -1
			obj.Param2 = nil
			obj.Param1Hold = obj.Param1
			obj.Param2Hold = nil
			
			obj.DDL.SetSelectedValue( _L[obj.Type]["DDL"][ obj.Param1 or -1 ] )
		end
		obj.GetValues = function()
			return obj.Param1, obj.Param2
		end
		
		if obj.setBtn == nil then obj.setBtn = WF_FRAMES.UIButton(
				obj, ChildWin4.."setBtn", 
				{ BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, 0 }, 
				80, 14, 
				{0,0,0,0}, 
				{0.2,0.2,0.7,0}, 
				{"", 8, 1, 0}, 
				1, "[Set]", 
				{1,1,1,1}, 
				nil, nil, nil
			)
			obj.setBtn.Backdrop:ClearAnchors()
			obj.setBtn.Backdrop:SetAnchor( BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, -6 )
			obj.setBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.setBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
			obj.setBtn.Button:SetHandler("OnClicked", function(self,button) 
				obj.ChildCallback( ChildWin4 )
				obj:MouseOut()
			end )
			obj.setBtn.Button:SetHandler("OnMouseEnter", function() obj.setBtn.Label:SetColor(.5,.6,1,1) end)
			obj.setBtn.Button:SetHandler("OnMouseExit", function() obj.setBtn.Label:SetColor(1,1,1,1) end)
		end
		
		if obj.cancelBtn == nil then obj.cancelBtn = WF_FRAMES.UIButton(
				obj, ChildWin4.."cancelBtn", 
				{ BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, 0 }, 
				80, 14, 
				{0,0,0,0}, 
				{0.2,0.2,0.7,0}, 
				{"", 8, 1, 0}, 
				1, "[Cancel]", 
				{1,1,1,1}, 
				nil, nil, nil
			)
			obj.cancelBtn.Backdrop:ClearAnchors()
			obj.cancelBtn.Backdrop:SetAnchor( BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, -6 )
			obj.cancelBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.cancelBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
			obj.cancelBtn.Button:SetHandler("OnClicked", function(self,button) 
				obj.Param1 = obj.Param1Hold
				obj.Param2 = obj.Param2Hold
				obj:MouseOut()
			end )
			obj.cancelBtn.Button:SetHandler("OnMouseEnter", function() obj.cancelBtn.Label:SetColor(.5,.6,1,1) end)
			obj.cancelBtn.Button:SetHandler("OnMouseExit", function() obj.cancelBtn.Label:SetColor(1,1,1,1) end)
		end
		
		if prep then obj:SetHidden(true) end
	else
		if not prep then
			local obj = _G[ChildWin4]
			if vars ~= nil then
				if table_count(vars) > 0 then
					obj.SetValues( vars.Param1, nil )
				end
			end
			obj:SetHidden(false)
		end
	end
	if prep then _G[ChildWin4]:SetHidden(true) end
end

local childEditWinFive = function( parent, vars, prep )
	if vars == nil then vars = {} end
	if _G[ChildWin5] == nil then
		WF_FRAMES.UIPopup( 
			ChildWin5, "Select a Skill Set", 
			{TOPLEFT, parent, TOPRIGHT, 7, 0}, 210, 
			nil, function()
				if _G[ChildWin5] ~= nil then
					if _G[ _G[ChildWin5].DDL.DDMName ] ~= nil then
						_G[ _G[ChildWin5].DDL.DDMName ]:SetHidden(true)
					end
				end
			end, true
		)
		local obj = _G[ChildWin5]
		
		obj.ChildCallback = parent.ChildCallBack
		
		obj.Type = WF_MACRO_TYPE_SKILL
		obj.Param1 = vars.Param1
		obj.Param2 = nil
		if vars.Type ~= obj.Type then obj.Param1 = nil; obj.Param2 = nil; end

		obj.DDL = WF_CHAIN(
			DDL(
				obj, ChildWin5, 
				{ TOP, obj, TOP, 0, 28 }, _L[obj.Type]["DDL"], 
				function() return obj.Param1; end, 
				function(val) obj.Param1 = val; end,
				(obj:GetWidth()*.85)-4
			))
		.__END
		
		obj:SetHeight( 80 )
		
		obj.Param1Hold = ""
		obj.Param2Hold = ""
		
		obj.SetValues = function( param1, param2 )
			obj.DDL.ReloadOptions( obj.Type, loadListSkills() )
			obj.Param1 = param1 or -1
			obj.Param2 = nil
			obj.Param1Hold = obj.Param1
			obj.Param2Hold = nil
			
			obj.DDL.SetSelectedValue( _L[obj.Type]["DDL"][ obj.Param1 or -1 ] )
		end
		obj.GetValues = function()
			return obj.Param1, obj.Param2
		end
		
		if obj.setBtn == nil then obj.setBtn = WF_FRAMES.UIButton(
				obj, ChildWin5.."setBtn", 
				{ BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, 0 }, 
				80, 14, 
				{0,0,0,0}, 
				{0.2,0.2,0.7,0}, 
				{"", 8, 1, 0}, 
				1, "[Set]", 
				{1,1,1,1}, 
				nil, nil, nil
			)
			obj.setBtn.Backdrop:ClearAnchors()
			obj.setBtn.Backdrop:SetAnchor( BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, -6 )
			obj.setBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.setBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
			obj.setBtn.Button:SetHandler("OnClicked", function(self,button) 
				obj.ChildCallback( ChildWin5 )
				obj:MouseOut()
			end )
			obj.setBtn.Button:SetHandler("OnMouseEnter", function() obj.setBtn.Label:SetColor(.5,.6,1,1) end)
			obj.setBtn.Button:SetHandler("OnMouseExit", function() obj.setBtn.Label:SetColor(1,1,1,1) end)
		end
		
		if obj.cancelBtn == nil then obj.cancelBtn = WF_FRAMES.UIButton(
				obj, ChildWin5.."cancelBtn", 
				{ BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, 0 }, 
				80, 14, 
				{0,0,0,0}, 
				{0.2,0.2,0.7,0}, 
				{"", 8, 1, 0}, 
				1, "[Cancel]", 
				{1,1,1,1}, 
				nil, nil, nil
			)
			obj.cancelBtn.Backdrop:ClearAnchors()
			obj.cancelBtn.Backdrop:SetAnchor( BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, -6 )
			obj.cancelBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
			obj.cancelBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
			obj.cancelBtn.Button:SetHandler("OnClicked", function(self,button) 
				obj.Param1 = obj.Param1Hold
				obj.Param2 = obj.Param2Hold
				obj:MouseOut()
			end )
			obj.cancelBtn.Button:SetHandler("OnMouseEnter", function() obj.cancelBtn.Label:SetColor(.5,.6,1,1) end)
			obj.cancelBtn.Button:SetHandler("OnMouseExit", function() obj.cancelBtn.Label:SetColor(1,1,1,1) end)
		end
		
		if prep then obj:SetHidden(true) end
	else
		if not prep then
			local obj = _G[ChildWin5]
			if vars ~= nil then
				if table_count(vars) > 0 then
					obj.SetValues( vars.Param1, nil )
				end
			end
			obj:SetHidden(false)
		end
	end
	if prep then _G[ChildWin5]:SetHidden(true) end
end

local eRow = function( idx, parent, values )
	if values == nil then values = {} end
	if parent == nil then return end
	local key = parent:GetName()
	if editRows[key] == nil then editRows[key] = {} end
	local anchor = { TOPLEFT, editRows[key][idx-1], BOTTOMLEFT, 0, 4 }
	if idx == 1 then anchor = { LEFT, parent, TOPLEFT, 6, 70 } end
	if editRows[key][idx] == nil then 
		local baseName = key.."_row"..idx
		editRows[key][idx] = WF_FRAMES.__NewTopLevel( baseName )
			:SetParent(parent)
			:SetAnchor(anchor[1], anchor[2], anchor[3], anchor[4], anchor[5])
			:SetWidth(parent:GetWidth()-12)
			:SetHeight(32)
			:SetMouseEnabled(true)
		.__END
		editRows[key][idx].ChildWinInteracted = false
		
		editRows[key][idx].label = WF_CHAIN( WINDOW_MANAGER:CreateControl( baseName.."Label", editRows[key][idx], CT_LABEL ) )
			:SetDimensions(14, 26)
			:SetAnchor(LEFT, editRows[key][idx], LEFT, 0, 0)
			:SetFont("ZoFontWinH4")
			:SetWrapMode(TEXT_WRAP_MODE_ELLIPSIS)
			:SetText(idx)
		.__END
		
		editRows[key][idx].Settings = {}
		editRows[key][idx].Settings.Type = _L[WF_MACRO_TYPE_NIL]["DDL"][ values.Type or 1 ] or WF_MACRO_TYPE_NIL
		editRows[key][idx].Settings.Param1 = values.Param1 or -1
		editRows[key][idx].Settings.Param2 = values.Param2 or ""
		
		editRows[key][idx].Type = WF_CHAIN(
			DDL(
				editRows[key][idx], 
				baseName.."Type", 
				{ LEFT, editRows[key][idx].label, RIGHT, 4, 0 }, _L[WF_MACRO_TYPE_NIL]["DDL"], 
				function() return _L[WF_MACRO_TYPE_NIL]["DDL"][ editRows[key][idx].Settings.Type ]; end, 
				function(val) 
					if editRows[key][idx].Settings.Type ~= _L[WF_MACRO_TYPE_NIL]["DDV"][ val ] then
						editRows[key][idx].Settings.Type   = _L[WF_MACRO_TYPE_NIL]["DDV"][ val ]
						editRows[key][idx].Settings.Param1 = 0
						editRows[key][idx].Settings.Param2 = nil
					end
				end, 80
			))
		.__END
		
		editRows[key][idx].configOver = false
		editRows[key][idx].ConfigButton = WF_FRAMES.__NewImage( baseName.."ConfigButton", editRows[key][idx] )
			:SetAnchor( LEFT, editRows[key][idx].Type, RIGHT, 0, -4 )
			:SetTexture( "/esoui/art/buttons/edit_up.dds" )
			:SetDimensions( 32, 32 )
			:SetMouseEnabled(true)
			:SetHandler( "OnMouseEnter", function(self) 
				editRows[key][idx].configOver = true
				self:SetTexture( "/esoui/art/buttons/edit_over.dds" ) 
			end )
			:SetHandler( "OnMouseExit", function(self) 
				editRows[key][idx].configOver = false
				self:SetTexture( "/esoui/art/buttons/edit_up.dds" ) 
			end )
			:SetHandler( "OnMouseDown", function(self) self:SetTexture( "/esoui/art/buttons/edit_down.dds" ) end )
			:SetHandler( "OnMouseUp", function(self) 
				if editRows[key][idx].configOver then
					self:SetTexture( "/esoui/art/buttons/edit_over.dds" ) 
					local nm, parms = "", { Param1 = editRows[key][idx].Settings.Param1, Param2 = editRows[key][idx].Settings.Param2 }
					if editRows[key][idx].Settings.Type == WF_MACRO_TYPE_CHAT then nm = ChildWin1
						if _G[nm] == nil then childEditWinOne( editRows[key][idx], parms, true ) end
					elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_EMOTE then nm = ChildWin2
						if _G[nm] == nil then childEditWinTwo( editRows[key][idx], parms, true ) end
					elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_ADDON then nm = ChildWin3
						if _G[nm] == nil then childEditWinThree( editRows[key][idx], parms, true ) end
					elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_GEAR and _G["WF_Outfitter"] ~= nil then nm = ChildWin4
						if _G[nm] == nil then childEditWinFour( editRows[key][idx], parms, true ) end
					elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_SKILL and _G["WF_Outfitter"] ~= nil then nm = ChildWin5
						if _G[nm] == nil then childEditWinFive( editRows[key][idx], parms, true ) end
					end
					
					closeChildWin(ChildWin1, nm)
					closeChildWin(ChildWin2, nm)
					closeChildWin(ChildWin3, nm)
					closeChildWin(ChildWin4, nm)
					closeChildWin(ChildWin5, nm)
					
					if _G[nm] ~= nil then
						if _G[nm]:IsHidden() then 
							_G[nm]:ShowMe()
							_G[nm]:ClearAnchors()
							_G[nm]:SetAnchor( TOPLEFT, editRows[key][idx], TOPRIGHT, 8, 0 )
							_G[nm].SetValues(editRows[key][idx].Settings.Param1, editRows[key][idx].Settings.Param2)
							_G[nm].ChildCallback = editRows[key][idx].ChildCallback
						else _G[nm]:CloseMe()  end
					end
				else
					self:SetTexture( "/esoui/art/buttons/edit_up.dds" ) 
				end
			end )
			:SetHidden(false)
		.__END
		
		editRows[key][idx].MessageBG = WF_FRAMES.UIBackdrop( 
			editRows[key][idx], key.."_row"..idx.."MessageBG", 
			{ LEFT, editRows[key][idx].Type, RIGHT, 36, -3 }, 
			160, 24, {0,0,0,1}, {0,0,0,1}, {"", 8, 1, 1}, 
			.7, nil
		)
		editRows[key][idx].MessageBG = editRows[key][idx].MessageBG.Backdrop
		editRows[key][idx].Message = WF_FRAMES.UILabel(editRows[key][idx], key.."_row"..idx.."Message", 
			{LEFT, editRows[key][idx].MessageBG, LEFT, 3, 0}, 150, 22, 1, "undefined", {.65,.65,.65,.65}, nil)
		editRows[key][idx].Message = editRows[key][idx].Message.Label
		editRows[key][idx].Message:SetWrapMode( TEXT_WRAP_MODE_ELLIPSIS )
		
		editRows[key][idx].SetValues = function( Type, Param1, Param2 )
			local nm = ""
			if Type == WF_MACRO_TYPE_CHAT then nm = ChildWin1
			elseif Type == WF_MACRO_TYPE_EMOTE then nm = ChildWin2
			elseif Type == WF_MACRO_TYPE_ADDON then nm = ChildWin3
			elseif Type == WF_MACRO_TYPE_GEAR and _G["WF_Outfitter"] ~= nil then nm = ChildWin4
			elseif Type == WF_MACRO_TYPE_SKILL and _G["WF_Outfitter"] ~= nil then nm = ChildWin5
			end

			if nm ~= ChildWin1 and _G[ChildWin1] ~= nil then _G[ChildWin1].SetValues(0, nil) end
			if nm ~= ChildWin2 and _G[ChildWin2] ~= nil then _G[ChildWin2].SetValues(0, nil) end
			if nm ~= ChildWin3 and _G[ChildWin3] ~= nil then _G[ChildWin3].SetValues(0, nil) end
			if nm ~= ChildWin4 and _G[ChildWin4] ~= nil then _G[ChildWin4].SetValues(0, nil) end
			if nm ~= ChildWin5 and _G[ChildWin5] ~= nil then _G[ChildWin5].SetValues(0, nil) end
			
			editRows[key][idx].Type.SetSelectedValue( _L[WF_MACRO_TYPE_NIL]["DDL"][ Type or 1 ] )
			
			if _G[nm] ~= nil then _G[nm].SetValues(Param1, Param2) end
			editRows[key][idx].Settings.Type = Type or 1
			editRows[key][idx].Settings.Param1 = Param1 or -1
			editRows[key][idx].Settings.Param2 = Param2
			
			if editRows[key][idx].Settings.Param1 ~= -1 then
				if editRows[key][idx].Settings.Type == WF_MACRO_TYPE_NIL then 
					editRows[key][idx].Message:SetText("undefined")
					editRows[key][idx].Message:SetColor(.65,.65,.65,.65)
				elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_CHAT then 
					editRows[key][idx].Message:SetText( (_L[WF_MACRO_TYPE_CHAT]["DDLKP"][ editRows[key][idx].Settings.Param1 ] or "  " ).. ": " .. editRows[key][idx].Settings.Param2)
					editRows[key][idx].Message:SetColor(.65,.65,1,1)
				elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_EMOTE then 
					editRows[key][idx].Message:SetText( _L[WF_MACRO_TYPE_EMOTE]["DDLKP"][ editRows[key][idx].Settings.Param1 ] )
					editRows[key][idx].Message:SetColor(.65,.65,1,1)
				elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_ADDON then 
					editRows[key][idx].Message:SetText( editRows[key][idx].Settings.Param1 .. " " .. editRows[key][idx].Settings.Param2 )
					editRows[key][idx].Message:SetColor(.65,.65,1,1)
				elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_GEAR then 
					editRows[key][idx].Message:SetText( "Set: "..editRows[key][idx].Settings.Param1 )
					editRows[key][idx].Message:SetColor(.65,.65,1,1)
				elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_SKILL then 
					editRows[key][idx].Message:SetText( "Set: "..editRows[key][idx].Settings.Param1 )
					editRows[key][idx].Message:SetColor(.65,.65,1,1)
				end
			end
		end
		editRows[key][idx].GetValues = function()
			local ret = {}
			ret.Type = editRows[key][idx].Settings.Type
			if editRows[key][idx].ChildWinInteracted then
				if ret.Type == WF_MACRO_TYPE_NIL then ret.Param1, ret.Param2 = nil, nil
				elseif ret.Type == WF_MACRO_TYPE_CHAT then ret.Param1, ret.Param2 = _G[ChildWin1].GetValues()
				elseif ret.Type == WF_MACRO_TYPE_EMOTE then ret.Param1, ret.Param2 = _G[ChildWin2].GetValues()
				elseif ret.Type == WF_MACRO_TYPE_ADDON then ret.Param1, ret.Param2 = _G[ChildWin3].GetValues()
				elseif ret.Type == WF_MACRO_TYPE_GEAR then ret.Param1, ret.Param2 = _G[ChildWin4].GetValues()
				elseif ret.Type == WF_MACRO_TYPE_SKILL then ret.Param1, ret.Param2 = _G[ChildWin5].GetValues()
				end
			else
				ret.Param1, ret.Param2 = editRows[key][idx].Settings.Param1, editRows[key][idx].Settings.Param2
			end
			return ret
		end
		editRows[key][idx].ChildCallback = function( nm )
			local a, b = _G[nm].GetValues()
			editRows[key][idx].ChildWinInteracted = true
			editRows[key][idx].Settings.Param1 = a or -1
			editRows[key][idx].Settings.Param2 = b or ""
			
			if editRows[key][idx].Settings.Param1 ~= -1 then
				if editRows[key][idx].Settings.Type == WF_MACRO_TYPE_NIL then 
					editRows[key][idx].Message:SetText("undefined")
					editRows[key][idx].Message:SetColor(.65,.65,.65,.65)
				elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_CHAT then 
					editRows[key][idx].Message:SetText( (_L[WF_MACRO_TYPE_CHAT]["DDLKP"][ editRows[key][idx].Settings.Param1 ] or "  ") .. ": " .. editRows[key][idx].Settings.Param2)
					editRows[key][idx].Message:SetColor(.65,.65,1,1)
				elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_EMOTE then 
					editRows[key][idx].Message:SetText( _L[WF_MACRO_TYPE_EMOTE]["DDLKP"][ editRows[key][idx].Settings.Param1 ] )
					editRows[key][idx].Message:SetColor(.65,.65,1,1)
				elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_ADDON then 
					editRows[key][idx].Message:SetText( editRows[key][idx].Settings.Param1 .. " " .. editRows[key][idx].Settings.Param2 )
					editRows[key][idx].Message:SetColor(.65,.65,1,1)
				elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_GEAR then 
					editRows[key][idx].Message:SetText( "Set: "..editRows[key][idx].Settings.Param1 )
					editRows[key][idx].Message:SetColor(.65,.65,1,1)
				elseif editRows[key][idx].Settings.Type == WF_MACRO_TYPE_SKILL then 
					editRows[key][idx].Message:SetText( "Set: "..editRows[key][idx].Settings.Param1 )
					editRows[key][idx].Message:SetColor(.65,.65,1,1)
				end
			end
		end
		
		local parms = {}
		parms[1] = nil
		parms[2] = nil
		parms[3] = nil
		parms[4] = nil
		parms[5] = nil
		parms[6] = nil
		parms[editRows[key][idx].Settings.Type] = { Param1 = editRows[key][idx].Settings.Param1, Param2 = editRows[key][idx].Settings.Param2 }
		
		childEditWinOne(   editRows[key][idx], parms[2], true )
		childEditWinTwo(   editRows[key][idx], parms[3], true )
		childEditWinThree( editRows[key][idx], parms[4], true )
		childEditWinFour(  editRows[key][idx], parms[5], true )
		childEditWinFive(  editRows[key][idx], parms[6], true )
	end
	
	if values ~= nil then
		editRows[key][idx].SetValues( values.Type or 1, values.Param1 or -1, values.Param2 )
	end
end

WF_Macros.Edit = function(idx)
	loadLists()
	
	WF_FRAMES.UIPopup( 
		"wykkydsMacroFrame_EditPopup"..idx, 
		"Edit Macro", 
		WF_Macros.getPopupAnchor( idx, true ), 310, 
		nil, function()
			closeChildWin(ChildWin1)
			closeChildWin(ChildWin2)
			closeChildWin(ChildWin3)
			closeChildWin(ChildWin4)
			closeChildWin(ChildWin5)
		end, true
	)
	local obj = _G[ "wykkydsMacroFrame_EditPopup"..idx ]

	obj:SetHeight(254)
	
	obj.Title.Label:SetText("Edit Macro "..idx)
	obj.MacroName = WF_Macros.macroName( idx.."" )
	obj.Commands = WF_Macros.Load( idx )
	obj.Commands = obj.Commands.Commands
	
	if obj.nameBox == nil then obj.nameBox = EBox(
		obj.Title.Backdrop, 
		"wykkydsMacroFrame_EditPopup_namebox"..idx, "Name", false, 
		function() return WF_Macros.macroName( obj.MacroName ) end,
		function(val) obj.MacroName = val; end,
		nil
	) end
	obj.nameBox.edit:SetText( obj.MacroName )
	
	local erKey = obj:GetName()

	if editRows[erKey] == nil then editRows[erKey] = {} end
	for x = 1, 5, 1 do
		if editRows[erKey][x] == nil then 
			eRow( x, obj, nil, idx )
			if editRows[erKey][x] ~= nil then
				if obj.Commands ~= nil then
					if obj.Commands[x] ~= nil then
						editRows[erKey][x].SetValues( obj.Commands[x].Type, obj.Commands[x].Param1, obj.Commands[x].Param2 )
					else
						editRows[erKey][x].SetValues( 0, 0, nil )
					end
				else
					editRows[erKey][x].SetValues( 0, 0, nil )
				end
			end
		else
			if obj.Commands ~= nil then
				if obj.Commands[x] ~= nil then
					editRows[erKey][x].SetValues( obj.Commands[x].Type, obj.Commands[x].Param1, obj.Commands[x].Param2 )
				else
					editRows[erKey][x].SetValues( 0, 0, nil )
				end
			else
				editRows[erKey][x].SetValues( 0, 0, nil )
			end
		end
	end
	
	obj.SaveMacro = function()
		local settings = {}
		settings.Name = obj.nameBox.GetValue()
		settings.Commands = {}
		for x = 1, 5, 1 do settings.Commands[x] = editRows[erKey][x].GetValues() end
		WF_Macros.Save( idx, settings )
	end
	
	if obj.saveBtn == nil then obj.saveBtn = WF_FRAMES.UIButton(
			obj, "wykkydsMacroFrame_EditPopup_save", 
			{ BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, 0 }, 
			80, 14, 
			{0,0,0,0}, 
			{0.2,0.2,0.7,0}, 
			{"", 8, 1, 0}, 
			1, "[Save]", 
			{1,1,1,1}, 
			nil, nil, nil
		)
		obj.saveBtn.Backdrop:ClearAnchors()
		obj.saveBtn.Backdrop:SetAnchor( BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, -6 )
		obj.saveBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
		obj.saveBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
		obj.saveBtn.Button:SetHandler("OnClicked", function(self,button) 
			obj.SaveMacro()
			obj:MouseOut()
		end )
		obj.saveBtn.Button:SetHandler("OnMouseEnter", function() obj.saveBtn.Label:SetColor(.5,.6,1,1) end)
		obj.saveBtn.Button:SetHandler("OnMouseExit", function() obj.saveBtn.Label:SetColor(1,1,1,1) end)
	end
	if obj.closeBtn == nil then obj.closeBtn = WF_FRAMES.UIButton(
			obj, "wykkydsMacroFrame_EditPopup_close", 
			{ BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, 0 }, 
			80, 14, 
			{0,0,0,0}, 
			{0.2,0.2,0.7,0}, 
			{"", 8, 1, 0}, 
			1, "[Cancel]", 
			{1,1,1,1}, 
			nil, nil, nil
		)
		obj.closeBtn.Backdrop:ClearAnchors()
		obj.closeBtn.Backdrop:SetAnchor( BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, -6 )
		obj.closeBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
		obj.closeBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
		obj.closeBtn.Button:SetHandler("OnClicked", function(self,button) 
			obj:MouseOut()
		end )
		obj.closeBtn.Button:SetHandler("OnMouseEnter", function() obj.closeBtn.Label:SetColor(.5,.6,1,1) end)
		obj.closeBtn.Button:SetHandler("OnMouseExit", function() obj.closeBtn.Label:SetColor(1,1,1,1) end)
	end
	
	obj:SetHidden(false)
end

WF_Macros.Rename = function( idx )
	WF_FRAMES.UIPopup( 
		"wykkydsMacroFrame_RenamePopup"..idx, 
		"Rename Macro "..idx, 
		WF_Macros.getPopupAnchor( idx ), 188, 
		nil, function()
		end, true
	)
	local obj = _G["wykkydsMacroFrame_RenamePopup"..idx]

	obj:SetHeight(88)
	obj.MacroName = WF_Macros.macroName(idx.."")
	if obj.ebx == nil then obj.ebx = EBox(
		obj.Title.Backdrop, 
		"wykkydsMacroFrame_RenamePopup_editbox"..idx, "Name", false, 
		function() return obj.MacroName; end,
		function(val) obj.MacroName = val; end,
		nil
	) end
	
	if obj.saveBtn == nil then obj.saveBtn = WF_FRAMES.UIButton(
			obj, "wykkydsMacroFrame_RenamePopup_save"..idx, 
			{ BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, 0 }, 
			80, 14, 
			{0,0,0,0}, 
			{0.2,0.2,0.7,0}, 
			{"", 8, 1, 0}, 
			1, "[Save]", 
			{1,1,1,1}, 
			nil, nil, nil
		)
		obj.saveBtn.Backdrop:ClearAnchors()
		obj.saveBtn.Backdrop:SetAnchor( BOTTOMRIGHT, obj.Backdrop, BOTTOM, -3, -6 )
		obj.saveBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
		obj.saveBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
		obj.saveBtn.Button:SetHandler("OnClicked", function(self,button) 
			local val = obj.ebx.GetValue()
			if val ~= nil then wykkydsFramework.RenameMacro(idx, val) end
			obj:MouseOut()
		end )
		obj.saveBtn.Button:SetHandler("OnMouseEnter", function() obj.saveBtn.Label:SetColor(.5,.6,1,1) end)
		obj.saveBtn.Button:SetHandler("OnMouseExit", function() obj.saveBtn.Label:SetColor(1,1,1,1) end)
	end
	if obj.closeBtn == nil then obj.closeBtn = WF_FRAMES.UIButton(
			obj, "wykkydsMacroFrame_RenamePopup_close"..idx, 
			{ BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, 0 }, 
			80, 14, 
			{0,0,0,0}, 
			{0.2,0.2,0.7,0}, 
			{"", 8, 1, 0}, 
			1, "[Cancel]", 
			{1,1,1,1}, 
			nil, nil, nil
		)
		obj.closeBtn.Backdrop:ClearAnchors()
		obj.closeBtn.Backdrop:SetAnchor( BOTTOMLEFT, obj.Backdrop, BOTTOM, 3, -6 )
		obj.closeBtn.Label:SetHorizontalAlignment(WF_UTIL.TextAlign["h"]["center"])
		obj.closeBtn.Label:SetVerticalAlignment(WF_UTIL.TextAlign["v"]["top"])
		obj.closeBtn.Button:SetHandler("OnClicked", function(self,button) 
			obj:MouseOut()
		end )
		obj.closeBtn.Button:SetHandler("OnMouseEnter", function() obj.closeBtn.Label:SetColor(.5,.6,1,1) end)
		obj.closeBtn.Button:SetHandler("OnMouseExit", function() obj.closeBtn.Label:SetColor(1,1,1,1) end)
	end
	
	local a = WF_Macros.getPopupAnchor( idx )
	obj:ClearAnchors()
	obj:SetAnchor(a[1], a[2], a[3], a[4], a[5])
	obj:SetHidden(false)
end