if not wykkydsFramework.Addons then wykkydsFramework.Addons = {} end

wykkydsFramework.AddonState = {}
wykkydsFramework.Descr = function(addOn) return addOn.AddonName.." v"..addOn.AddonVersion end
wykkydsFramework.LoadAlert = function(addOn) return d("[FrameWork] "..wykkydsFramework.Descr(addOn).." initialized") end

wykkydsFramework.AddonPrep = function(addOnName)
	if wykkydsFramework.Ready then
		if wykkydsFramework.Addons[addOnName] then
			if not wykkydsFramework.AddonState[addOnName] then wykkydsFramework.AddonState[addOnName] = {} end
			wykkydsFramework.Addons[addOnName].Ready = true
			if not wykkydsFramework.AddonState[addOnName].Started then
				if wykkydsFramework.Addons[addOnName].SavedVariables ~= nil then wykkydsFramework.Addons[addOnName].SavedVariables() end
				if wykkydsFramework.Addons[addOnName].StartUp ~= nil then wykkydsFramework.Addons[addOnName].StartUp() end
				wykkydsFramework.AddonState[addOnName].Loaded = true
				wykkydsFramework.AddonState[addOnName].Started = true
				wykkydsFramework.LoadAlert(wykkydsFramework.Addons[addOnName])
			end
		end
		for k,a in pairs(wykkydsFramework.AddonState) do
			if k ~= addOnName and wykkydsFramework.AddonState[k].Loaded == true and wykkydsFramework.AddonState[k].Started ~= true then
				wykkydsFramework.Addons[k].Ready = true
				if wykkydsFramework.Addons[k].SavedVariables ~= nil then wykkydsFramework.Addons[k].SavedVariables() end
				if wykkydsFramework.Addons[k].StartUp ~= nil then wykkydsFramework.Addons[k].StartUp() end
				wykkydsFramework.AddonState[k].Started = true
				wykkydsFramework.LoadAlert(wykkydsFramework.Addons[k])
			end
		end
	else
		if wykkydsFramework.Addons[addOnName] then
			if not wykkydsFramework.AddonState[addOnName] then wykkydsFramework.AddonState[addOnName] = {} end
			wykkydsFramework.AddonState[addOnName].Loaded = true
			wykkydsFramework.AddonState[addOnName].Started = false
		end
	end
end
