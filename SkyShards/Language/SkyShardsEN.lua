----------------------------------------
-- English localization for SkyShards --
----------------------------------------
if SkyS == nil then SkyS = {} end

-- English localization
SkyS.en = {
	--tooltips
	moreInfo = { 
		[1] = "town",
		[2] = "solo dungeon",
		[3] = "public dungeon",
		[4] = "cave", --used for Hozzin’s Folly on Bleakrock Isle
	},
	collected = "collected",

	--settings menu header
	menuOptions = "Options",

	--appearance
	menuPinTexture = "Select map pin icons",
	menuPinTextureDesc = "Select map pin icons.",
	menuPinSize = "Pin size",
	menuPinSizeDesc = "Set the size of the map pins.",
	menuPinLayer = "Pin layer",
	menuPinLayerDesc = "Set the layer of the map pins",

	--compass
	menuCompassUnknown = "Show skyshards on the compass.",
	menuCompassUnknownDesc = "Show/hide icons for uncollected skyshards on the compass.",
	menuCompassDist = "Max pin distance",
	menuCompassDistDesc = "The maximum distance for pins to appear on the compass.", 

	--filters
	menuUnknown = "Show unknown skyshards",
	menuUnknownDesc = "Show/hide icons for unknown skyshards on the map.",
	menuCollected = "Show already collected skyshards",
	menuCollectedDesc = "Show/hide icons for already collected skyshards on the map.",

	--reset
	menuReset = "Reset to default",
	menuResetDesc = "Load default values.",
  	menuResetWarning = "Reloads UI",

	--worldmap filters
	filterCollected = "Collected skyshards",
	filterUnknown = "Unknown skyshards",
}
