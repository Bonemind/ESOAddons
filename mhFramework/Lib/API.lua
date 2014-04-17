WF_RegisterFactory = function( AddonName, AddonConfig )
	if not wykkydsFramework.Addons then wykkydsFramework.Addons = {} end
	if not wykkydsFramework.Addons[AddonName] then wykkydsFramework.Addons[AddonName] = {} end
	
	wykkydsFramework.Addons[AddonName].AddonID = AddonConfig.AddonID
	wykkydsFramework.Addons[AddonName].AddonName = AddonConfig.AddonName
	wykkydsFramework.Addons[AddonName].AddonAbbrev = AddonConfig.AddonAbbrev
	wykkydsFramework.Addons[AddonName].Author = AddonConfig.Author
	wykkydsFramework.Addons[AddonName].AddonVersion = AddonConfig.AddonVersion
	wykkydsFramework.Addons[AddonName].StartUp = AddonConfig.StartUp
	wykkydsFramework.Addons[AddonName].SavedVariables = AddonConfig.SavedVariables
	wykkydsFramework.Addons[AddonName].ExpectedFrameworkVersion = AddonConfig.ExpectedFrameworkVersion
	
	local _ready = function() return wykkydsFramework.Addons[AddonName].Ready end
	local _addonName = function() return wykkydsFramework.Addons[AddonName].AddonName end
	local _addonAbbrev = function() return wykkydsFramework.Addons[AddonName].AddonAbbrev end
	local _addonVersion = function() return wykkydsFramework.Addons[AddonName].AddonVersion end
	local _addonDescr = function() return _addonName().." v".._addonVersion() end
	
	return _ready, _addonName, _addonAbbrev, _addonVersion, _addonDescr
end

WF_SlashCommand = function( Command, Callback ) wykkydsFramework.Commands.Toggle( Command, Callback ) end

WF_Tic = function( TicName, Callback, ThrottleInSeconds )
	if TicName == nil then return end
	if Callback == nil then
		wykkydsFramework.Events.Registered_onupdatecallback[TicName] = nil
	else
		wykkydsFramework.Events.Registered_onupdatecallback[TicName] = {}
		wykkydsFramework.Events.Registered_onupdatecallback[TicName].Buffer = ThrottleInSeconds
		wykkydsFramework.Events.Registered_onupdatecallback[TicName].Callback = Callback
	end
end
WF_TicDrop = function( TicName ) WF_Tic( TicName, nil, nil ) end

local bt= {}
WF_Buffer = function( BufferName, ThrottleInSeconds ) 
	if not BufferName then return end
	local ct, ThrottleInSeconds = GetGameTimeMilliseconds(), ((ThrottleInSeconds or 3) * 1000)
	--d( "test "..ThrottleInSeconds )
	if not bt[BufferName] then bt[BufferName] = ct end
	if (ct - bt[BufferName]) >= ThrottleInSeconds
	then bt[BufferName] = ct; return true;
	else return false; end
end

local wykkydsFrameworkEventName = function( EventToWatch )
	for e,t in pairs(wykkydsFramework.Events.GameEventTable) do
		if t.DESCR == EventToWatch or t.CODE == EventToWatch
		then return t.DESCR end
	end
	return nil
end

WF_Event = function( EventToWatch, Callback, AddonID, ParamsAsTable )
	if EventToWatch == nil then return end
	local event = wykkydsFrameworkEventName( EventToWatch )
	if event == nil then return end
	local AddonID = AddonID or wykkydsFramework.AddonID
	if wykkydsFramework.Events.Registry[event] == nil then wykkydsFramework.Events.Registry[event] = {} end
	if Callback == nil and wykkydsFramework.Events.Registry[event][AddonID] ~= nil then
		wykkydsFramework.Events.Registry[event][AddonID].Unregister = true
	else
		wykkydsFramework.Events.Registry[event][AddonID] = {}
		wykkydsFramework.Events.Registry[event][AddonID].Code = wykkydsFramework.Events.GameEventTable[event].CODE
		wykkydsFramework.Events.Registry[event][AddonID].Handler = Callback
		wykkydsFramework.Events.Registry[event][AddonID].Addon = AddonID
		wykkydsFramework.Events.Registry[event][AddonID].TableParms = ParamsAsTable
	end
end