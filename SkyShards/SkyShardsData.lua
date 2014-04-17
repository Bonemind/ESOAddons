if SkyS == nil then SkyS = {} end

--achievementIDs for skyshards: 
SkyS.achievementIDs = {
	556, -- Alik'r Desert Skyshards
	695, -- Auridon Skyshards
	405, -- Bal Foyen Skyshards
	557, -- Bangkorai Skyshards
	408, -- Betnikh Skyshards
	398, -- Bleakrock Skyshards
	686, -- Coldharbour Skyshards
	694, -- Cyrodiil Aldmeri Skyshards
	693, -- Cyrodiil Daggerfall Skyshards
	692, -- Cyrodiil Ebonheart Skyshards
	547, -- Deshaan Skyshards
	688, -- Eastmarch Skyshards
	409, -- Glenumbra Skyshards
	682, -- Grahtwood Skyshards
	683, -- Greenshade Skyshards
	431, -- Khenarthi's Roost Skyshards
	684, -- Malabal Tor Skyshards
	748, -- Mountain Skyshard
	685, -- Reaper's March Skyshards
	554, -- Rivenspire Skyshards
	687, -- Shadowfen Skyshards
	397, -- Stonefalls Skyshards
	515, -- Stormhaven Skyshards
	407, -- Stros M'Kai Skyshards
	689, -- The Rift Skyshards
}

--zones
SkyS.skyshardsData = {
	["alikr"] = {},		--Alik'r Desert
	["auridon"] = {},		--Auridon, Khenarthi's Roost
	["bangkorai"] = {},	--Bangkorai
	["coldharbor"] = {},	--Coldharbour
	["cyrodiil"] = {},	--Cyrodiil
	["deshaan"] = {},		--"Deshaan"
	["eastmarch"] = {},	--Eastmarch
	["glenumbra"] = {},	--Glenumbra, Betnikh, Stros M'Kai
	["grahtwood"] = {},	--Grahtwood
	["greenshade"] = {},	--Greenshade
	["malabaltor"] = {},	--Malabal Tor
	["reapersmarch"] = {},	--Reaper's March
	["rivenspire"] = {},	--Rivenspire
	["shadowfen"] = {},	--Shadowfen
	["stonefalls"] = {},	--Stonefalls, Bal Foyen, Bleakrock Isle
	["stormhaven"] = {},	--Stormhaven
	["therift"] = {},		--The Rift
} 


-- format: locX, locY, achievementId, criteriaIndex, [moreInfo]
--		moreInfo:
--			nil = default
--			1 = on city map
--			2 = in solo dungeon
--			3 = in public dungeon
--			4 = in cave 

--subzone
SkyS.skyshardsData["alikr"] = { 
--Alik'r Desert (Daggerfall, lvl 31-37)
	["alikr_base"] = {				--Alik'r Desert
		{ 0.21, 0.49, 556, 1, 1 }, --Sentinel
		{ 0.39, 0.65, 556, 2 },
		{ 0.19, 0.73, 556, 3 },
		{ 0.51, 0.70, 556, 4, 1 }, --Bergama
		{ 0.59, 0.50, 556, 5 },
		{ 0.57, 0.32, 556, 6 },
		{ 0.82, 0.43, 556, 7, 1 }, --Kozanset
		{ 0.78, 0.40, 556, 8 },
		{ 0.91, 0.57, 556, 9 },
		{ 0.659, 0.665, 556, 10, 2 }, --Aldunz
		{ 0.667, 0.326, 556, 11, 2 }, --Coldrock Diggings
		{ 0.382, 0.596, 556, 12, 2 }, --Divad's Chagrin Mine
		{ 0.877, 0.592, 556, 13, 2 }, --Sandblown Mine
		{ 0.178, 0.578, 556, 14, 2 }, --Santaki
		{ 0.957, 0.524, 556, 15, 2 }, --Yldzuun
		{ 0.732, 0.373, 556, 16, 3 }, --Lost City of the Na-Totambu
	},
	["sentinel_base"] = {
		{ 0.38, 0.64, 556, 1 },
	},
	["bergama_base"] = {
		{ 0.43, 0.61, 556, 4 },
	},
	["kozanset_base"] = {
		{ 0.65, 0.33, 556, 7 },
	},
	["aldunz_base"] = {              
		{ 0.20, 0.46, 556, 10 },
	},
	["coldrockdiggings_base"] = {
		{ 0.45, 0.43, 556, 11 },
	},
	["divadschagrinmine_base"] = {
		{ 0.63, 0.65, 556, 12 },
	},
	["sandblownmine_base"] = {
		{ 0.76, 0.42, 556, 13 },
	},
	["santaki_base"] = {
		{ 0.65, 0.60, 556, 14 },
	},
	["yldzuun_base"] = {
		{ 0.43, 0.48, 556, 15 },
	},
	["lostcity_base"] = {
		{ 0.47, 0.59, 556, 16 },
	},
}

SkyS.skyshardsData["auridon"] = {
--Auridon (Aldmeri lvl 5-15)
	["auridon_base"] = {	--Auridon
		{ 0.60, 0.89, 695, 1, 1 }, --Vulkhel Guard
		{ 0.708, 0.829, 695, 2 },
		{ 0.438, 0.774, 695, 3 },
		{ 0.69, 0.52, 695, 4, 1 }, --Skywatch
		{ 0.598, 0.401, 695, 5 },
		{ 0.476, 0.534, 695, 6 },
		{ 0.422, 0.323, 695, 7 },
		{ 0.476, 0.357, 695, 8 },
		{ 0.419, 0.136, 695, 9 },
		{ 0.439, 0.406, 695, 10, 2 }, --Bewan
		{ 0.583, 0.852, 695, 11, 2 }, --Del's Claim
		{ 0.563, 0.560, 695, 12, 2 }, --Entila's Folly
		{ 0.203, 0.217, 695, 13, 2 }, --Mehrunes' Spite
		{ 0.546, 0.698, 695, 14, 2 }, --Ondil
		{ 0.579, 0.326, 695, 15, 2 }, --Wansalen
		{ 0.423, 0.676, 695, 16, 3 }, --Toothmaul Gully
	},
	["vulkhelguard_base"] = {
		{ 0.414, 0.320, 695, 1 },
	},
	["skywatch_base"] = {
		{ 0.547, 0.555, 695, 4 },
	},
	["bewan_base"] = {
		{ 0.896, 0.364, 695, 10 },
	},
	["delsclaim_base"] = {
		{ 0.514, 0.425, 695, 11 },
	},
	["entilasfolly_base"] = {
		{ 0.682, 0.569, 695, 12 },
	},
	["mehrunesspite_base"] = {
		{ 0.56, 0.74, 695, 13 },
	},
	["ondil_base"] = {
		{ 0.809, 0.665, 695, 14 },
	},
	["wansalen_base"] = {
		{ 0.667, 0.610, 695, 15 },
	},
	["toothmaulgully_base"] = {
		{ 0.629, 0.675, 695, 16 },
	},
--Khenarthi's Roost (Aldmeri, lvl 1-5)
	["khenarthisroost_base"] = {	--Khenarthi's Roost
		{ 0.587, 0.811, 431, 1 },
		{ 0.538, 0.698, 431, 2 },
		{ 0.165, 0.557, 431, 3 },
		{ 0.685, 0.579, 431, 4 },
		{ 0.430, 0.400, 431, 5, 1 }, --Mistral
		{ 0.278, 0.365, 431, 6 },
	},
	["mistral_base"] = {
		{ 0.150, 0.345, 431, 5 },
	},
}

SkyS.skyshardsData["bangkorai"] = {
--Bangkorai (Daggerfall, lvl 37-43)
	["bangkorai_base"] = { 			--Bangkorai
		{ 0.38, 0.40, 557, 1, 1 }, --Evermore
		{ 0.58, 0.24, 557, 2 },
		{ 0.60, 0.10, 557, 3 },
		{ 0.54, 0.46, 557, 4 },
		{ 0.36, 0.45, 557, 5 },
		{ 0.55, 0.34, 557, 6 },
		{ 0.47, 0.84, 557, 7 },
		{ 0.35, 0.59, 557, 8 },
		{ 0.63, 0.72, 557, 9 },
		{ 0.454, 0.504, 557, 10, 2 }, --Crypt of the Exiles
		{ 0.557, 0.752, 557, 11, 2 }, --Klathzgar
		{ 0.332, 0.270, 557, 12, 2 }, --Torog's Spite
		{ 0.246, 0.660, 557, 13, 2 }, --Rubble Butte
		{ 0.712, 0.198, 557, 14, 2 }, --Troll's Toothpick
		{ 0.647, 0.421, 557, 15, 2 }, --Viridian Watch
		{ 0.233, 0.899, 557, 16, 3 }, --Razak's Wheel
	},
	["evermore_base"] = {
		{ 0.36, 0.68, 557, 1 },
	},
	["cryptoftheexiles_base"] = {
		{ 0.59, 0.31, 557, 10 },
	},
	["jaggerjaw_base"] = {			--Klathzgar
		{ 0.53, 0.44, 557, 11 },
	},
	["murciensclaim_base"] = {		--Torog's Spite
		{ 0.53, 0.42, 557, 12 },
	},
	["rubblebutte_base"] = {
		{ 0.44, 0.68, 557, 13 },
	},
	["trollstoothpick_base"] = {
		{ 0.37, 0.81, 557, 14 },
	},
	["viridianwatch_base"] = {
		{ 0.83, 0.46, 557, 15 },
	},
	["razakswheel_base"] = {
		{ 0.69, 0.45, 557, 16 },
	},
}

SkyS.skyshardsData["coldharbor"] = {	
--Coldharbour (all, lvl 45-50)
	["coldharbour_base"] = {		--Coldharbour
		{ 0.41, 0.62, 686, 1 },
		{ 0.46, 0.74, 686, 2 },
		{ 0.20, 0.63, 686, 3 },
		{ 0.61, 0.65, 686, 4 },
		{ 0.71, 0.64, 686, 5 },
		{ 0.67, 0.79, 686, 6 },
		{ 0.48, 0.58, 686, 7 },
		{ 0.44, 0.41, 686, 8 },
		{ 0.67, 0.40, 686, 9 },
		{ 0.413, 0.534, 686, 10, 2 }, --Aba-Loria
		{ 0.683, 0.724, 686, 11, 2 }, --The Vault of Haman Forgefire
		{ 0.422, 0.788, 686, 12, 2 }, --The Grotto of Depravity
		{ 0.454, 0.510, 686, 13, 2 }, --Mal Sorra's Tomb
		{ 0.670, 0.575, 686, 14, 2 }, --The Cave of Trophies
		{ 0.660, 0.376, 686, 15, 2 }, --The Wailing Maw
		{ 0.711, 0.635, 686, 16, 3 }, --Village of the Lost
	},
	["aba-loria_base"] = {
		{ 0.52, 0.64, 686, 10 },
	},
	["vaultofhamanforgefire_base"] = {
		{ 0.63, 0.60, 686, 11 },
	},
	["depravedgrotto_base"] = {
		{ 0.51, 0.80, 686, 12 },
	},
	["malsorrastomb_base"] = {
		{ 0.58, 0.25, 686, 13 },
	},
	["caveoftrophiesupper_base"] = { --upper map of Cave of Trophies, will it work for 2 floors? 
		{ 0.26, 0.31, 686, 14 },		--approximate coordinates because this map wont load on Esohead
	},
	["wailingmaw_base"] = {
		{ 0.62, 0.37, 686, 15 },
	},
	["villageofthelost_base"] = {
		{ 0.33, 0.51, 686, 16 },
	},
}

SkyS.skyshardsData["cyrodiil"] = {
--Cyrodiil (all, lvl 10+)
	["ava_whole"] = {				--Cyrodiil
	--Aldmeri
		{ 0.574, 0.851, 694, 1 },
		{ 0.413, 0.842, 694, 2 },
		{ 0.311, 0.659, 694, 3 },
		{ 0.629, 0.681, 694, 4 },
		{ 0.483, 0.534, 694, 5 },
		{ 0.184, 0.458, 694, 6 },
		{ 0.259, 0.531, 694, 7 },
		{ 0.501, 0.761, 694, 8 },
		{ 0.330, 0.770, 694, 9 },
		{ 0.538, 0.810, 694, 10, 2 }, --Bloodmayne Cave
		{ 0.289, 0.485, 694, 11, 2 }, --Breakneck Cave
		{ 0.316, 0.562, 694, 12, 2 }, --Haynote Cave
		{ 0.363, 0.698, 694, 13, 2 }, --Nisin Cave
		{ 0.455, 0.725, 694, 14, 2 }, --Pothole Caverns
		{ 0.206, 0.507, 694, 15, 2 }, --Serpent Hollow Cave
	--Daggerfall
		{ 0.105, 0.267, 693, 1 },
		{ 0.153, 0.151, 693, 2 },
		{ 0.176, 0.371, 693, 3 },
		{ 0.467, 0.172, 693, 4 },
		{ 0.210, 0.397, 693, 5 },
		{ 0.375, 0.330, 693, 6 },
		{ 0.271, 0.229, 693, 7 },
		{ 0.295, 0.129, 693, 8 },
		{ 0.535, 0.224, 693, 9 },
		{ 0.422, 0.147, 693, 10, 2 }, --Capstone Cave
		{ 0.355, 0.135, 693, 11, 2 }, --Echo Cave
		{ 0.154, 0.241, 693, 12, 2 }, --Lipsand Tarn
		{ 0.583, 0.195, 693, 13, 2 }, --Red Ruby Cave
		{ 0.503, 0.215, 693, 14, 2 }, --Toadstool Hollow
		{ 0.361, 0.221, 693, 15, 2 }, --Underpall Cave
	--Ebonheart
		{ 0.810, 0.168, 692, 1 },
		{ 0.887, 0.330, 692, 2 },
		{ 0.702, 0.627, 692, 3 },
		{ 0.779, 0.388, 692, 4 },
		{ 0.724, 0.509, 692, 5 },
		{ 0.654, 0.379, 692, 6 },
		{ 0.807, 0.305, 692, 7 },
		{ 0.780, 0.208, 692, 8 },
		{ 0.679, 0.186, 692, 9 },
		{ 0.673, 0.596, 692, 10, 2 }, --Cracked Wood Cave
		{ 0.807, 0.251, 692, 11, 2 }, --Kingscrest Cavern
		{ 0.710, 0.490, 692, 12, 2 }, --Muck Valley Cavern
		{ 0.721, 0.695, 692, 13, 2 }, --Newt Cave
		{ 0.759, 0.347, 692, 14, 2 }, --Quickwater Cave
		{ 0.807, 0.461, 692, 15, 2 }, --Vahtacen
	--Mountain
		{ 0.753, 0.296, 748, 1 },
	},
	--Aldmeri
	["bloodmaynecave_base"] = { 
		{ 0.15, 0.50, 694, 10 },
	},
	["breakneckcave_base"] = {
		{ 0.48, 0.25, 694, 11 },
	},
	["haynotecave_base"] = {
		{ 0.56, 0.19, 694, 12 },
	},
	["nisincave_base"] = {
		{ 0.20, 0.70, 694, 13 },
	},
	["potholecavern_base"] = {
		{ 0.60, 0.45, 694, 14 },
	},
	["serpenthollowcave_base"] = {
		{ 0.27, 0.63, 694, 15 },
	},
	--Dagerrfall
	["capstonecave_base"] = {
		{ 0.69, 0.14, 693, 10 },
	},
	["echocave_base"] = {
		{ 0.41, 0.22, 693, 11 },
	},
	["lipsandtarn_base"] = {
		{ 0.73, 0.20, 693, 12},
	},
	["redrubycave_base"] = {
		{ 0.75, 0.29, 693, 13 },
	},
	["toadstoolhollowlower_base"] = { --Toadstool Hollow lower floor 
		{ 0.40, 0.64, 693, 14 },
	},
	["toadstoolhollow_base"] = {		--Toadstool Hollow 
		{ 0.48, 0.53, 693, 14 },
	},
	["underpallcave_base"] = {
		{ 0.76, 0.43, 693, 15 },
	},
	--Ebonheart
	["crackedwoodcave_base"] = {
		{ 0.36, 0.36, 692, 10 },
	},
	["kingscrest_base"] = {
		{ 0.70, 0.45, 692, 11 },
	},
	["muckvalleycavern_base"] = {
		{ 0.17, 0.67, 692, 12 },
	},
	["newtcave_base"] = {
		{ 0.37, 0.33, 692, 13 },
	},
	["quickwatercave_base"] = {
		{ 0.42, 0.47, 692, 14 },
	},
	["vahtacen_base"] = {
		{ 0.14, 0.78, 692, 15 },
	},
}

SkyS.skyshardsData["deshaan"] = {
--Deshaan (Ebonheart, lvl 16-23)
	["deshaan_base"] = {				--"Deshaan"
		{ 0.089, 0.472, 547, 1 },
		{ 0.18, 0.51, 547, 2, 1 }, --Narsis
		{ 0.331, 0.639, 547, 3 },
		{ 0.42, 0.48, 547, 4, 1 }, --Mournhold
		{ 0.472, 0.395, 547, 5 },
		{ 0.674, 0.652, 547, 6 },
		{ 0.779, 0.587, 547, 7 },
		{ 0.803, 0.473, 547, 8 },
		{ 0.859, 0.488, 547, 9 },
		{ 0.201, 0.448, 547, 10, 3 }, --Forgotten Crypts
		{ 0.913, 0.438, 547, 11, 2 }, --Knife Ear Grotto
		{ 0.237, 0.461, 547, 12, 2 }, --Lady Llarel's Shelter
		{ 0.305, 0.568, 547, 13, 2 }, --Lower Bthanual
		{ 0.579, 0.457, 547, 14, 2 }, --The Triple Circle Mine 
		{ 0.625, 0.611, 547, 15, 2 }, --Taleon's Crag
		{ 0.730, 0.388, 547, 16, 2 }, --The Corpse Garden
	},
	["narsis_base"] = {
		{ 0.536, 0.370, 547, 2 },
	},
	["mournhold_base"] = {
		{ 0.26, 0.40, 547, 4 },
	},
	["forgottencrypts_base"] = {
		{ 0.59, 0.31, 547, 10 },
	},
	["desolatecave_base"] = {		--Knife Ear Grotto
		{ 0.50, 0.64, 547, 11 },
	},
	["kwamacolony_base"] = {		--Lady Llarel's Shelter
		{ 0.512, 0.714, 547, 12 },
	},
	["lowerbthanuel_base"] = {
		{ 0.524, 0.188, 547, 13 },
	},
	["triplecirclemine_base"] = {
		{ 0.52, 0.36, 547, 14 },
	},
	["unexploredcrag_base"] = {	--Taleon's Crag
		{ 0.40, 0.38, 547, 15 },
	},
	["corpsegarden_base"] = {
		{ 0.58, 0.80, 547, 16 },
	},
}

SkyS.skyshardsData["eastmarch"] = {
--Eastmarch (Ebonheart, lvl 31-37)
	["eastmarch_base"] = {			--Eastmarch
		{ 0.33, 0.41, 688, 1 },
		{ 0.58, 0.35, 688, 2 },
		{ 0.61, 0.25, 688, 3 },
		{ 0.40, 0.50, 688, 4 },
		{ 0.30, 0.58, 688, 5, 1 },	--Fort Amol
		{ 0.14, 0.60, 688, 6 },
		{ 0.65, 0.51, 688, 7 },
		{ 0.63, 0.58, 688, 8 },
		{ 0.56, 0.65, 688, 9 },
		{ 0.725, 0.623, 688, 10, 2 }, --The Bastard's Tomb
		{ 0.624, 0.264, 688, 11, 2 }, --The Chill Hollow
		{ 0.176, 0.558, 688, 12, 2 }, --The Frigid Grotto
		{ 0.564, 0.432, 688, 13, 2 }, --Icehammer's Vault 
		{ 0.511, 0.618, 688, 14, 2 }, --Old Sord's Cave
		{ 0.637, 0.653, 688, 15, 2 }, --Stormcrag Crypt
		{ 0.474, 0.283, 688, 16, 3 }, --Hall of the Dead
	},
	["fortamol_base"] = {
		{ 0.74, 0.10, 688, 5 },
	},
	["thebastardstomb_base"] = {
		{ 0.52, 0.59, 688, 10 },
	},
	["thechillhollow_base"] = {
		{ 0.54, 0.58, 688, 11 },
	},
	["thefrigidgrotto_base"] = {
		{ 0.72, 0.19, 688, 12 },
	},
	["icehammersvault_base"] = {
		{ 0.77, 0.51, 688, 13 },
	},
	["oldsordscave_base"] = {
		{ 0.61, 0.66, 688, 14 },
	},
	["stormcragcrypt_base"] = {
		{ 0.59, 0.40, 688, 15 },
	},
	["hallofthedead_base"] = {
		{ 0.49, 0.52, 688, 16 },
	},
}

SkyS.skyshardsData["glenumbra"] = {
--Glenumbra (Daggerfall, lvl 5-15)
	["glenumbra_base"] = {			--Glenumbra
		{ 0.318, 0.754, 409, 1, 1 }, --Dagerfall
		{ 0.454, 0.540, 409, 2 },
		{ 0.275, 0.628, 409, 3 },
		{ 0.386, 0.418, 409, 4 },
		{ 0.458, 0.485, 409, 5 },
		{ 0.676, 0.442, 409, 6 },
		{ 0.695, 0.191, 409, 7 },
		{ 0.781, 0.308, 409, 8 },
		{ 0.78, 0.12, 409, 9, 1 }, --Crosswych
		{ 0.350, 0.727, 409, 10, 2 }, --Ilessan Tower
		{ 0.272, 0.678, 409, 11, 2 }, --Silumm
		{ 0.698, 0.530, 409, 12, 2 }, --Mines of Khuras
		{ 0.343, 0.333, 409, 13, 2 }, --Enduum
		{ 0.608, 0.185, 409, 14, 2 }, --Ebon Crypt
		{ 0.766, 0.138, 409, 15, 2 }, --Cryptwatch Fort
		{ 0.200, 0.739, 409, 16, 3 }, --Bad Man's Hallows
	},
	["daggerfall_base"] = {
		{ 0.69, 0.45, 409, 1 },
	},
	["crosswych_base"] = {
		{ 0.384, 0.325, 409, 9 },
	},
	["ilessantower_base"] = {
		{ 0.30, 0.41, 409, 10 },
	},
	["silumm_base"] = {
		{ 0.78, 0.26, 409, 11 },
	},
	["minesofkhuras_base"] = {
		{ 0.33, 0.50, 409, 12 },
	},
	["enduum_base"] = {
		{ 0.19, 0.31, 409, 13 },
	},
	["eboncrypt_base"] = {
		{ 0.57, 0.48, 409, 14 },
	},
	["cryptwatchfort_base"] = {
		{ 0.69, 0.45, 409, 15 },
	},
	["badmanscave_base"] = {
		{ 0.42, 0.65, 409, 16 },
	},
--Betnikh (Daggerfall, lvl 1-5)
	["betnihk_base"] = {	
		{ 0.407, 0.271, 408, 1 },
		{ 0.621, 0.605, 408, 2 },
		{ 0.370, 0.594, 408, 3 },
	},
--Stros M'Kai (Daggerfall, lvl 1-5)
	["strosmkai_base"] = {
		{ 0.423, 0.515, 407, 1 },
		{ 0.644, 0.400, 407, 2 },
		{ 0.542, 0.809, 407, 3 },
	},
	["porthunding_base"] = {
		{ 0.64, 0.18, 407, 2 },
	},
}

SkyS.skyshardsData["grahtwood"] = {
--Grahtwood (Aldmeri, lvl 16-23)
	["grahtwood_base"] = {			--Grahtwood
		{ 0.74, 0.68, 682, 1, 1 }, --Haven
		{ 0.446, 0.723, 682, 2 },
		{ 0.65, 0.67, 682, 3 }, 
		{ 0.621, 0.526, 682, 4, 1 }, --Elden Root
		{ 0.65, 0.37, 682, 5 },
		{ 0.59, 0.32, 682, 6 },
		{ 0.289, 0.225, 682, 7 },
		{ 0.32, 0.60, 682, 8 },
		{ 0.474, 0.537, 682, 9 },
		{ 0.562, 0.665, 682, 10, 2 }, --Ne Salas
		{ 0.806, 0.509, 682, 11, 2 }, --The Scuttle Pit
		{ 0.484, 0.445, 682, 12, 2 }, --Burroot Kwama Mine
		{ 0.722, 0.362, 682, 13, 2 }, --Vinedeath Cave
		{ 0.185, 0.145, 682, 14, 2 }, --Wormroot Depths
		{ 0.523, 0.598, 682, 15, 2 }, --Mobar Mine
		{ 0.653, 0.599, 682, 16, 3 }, --Root Sunder Ruins
	},
	["haven_base"] = {
		{ 0.39, 0.24, 682, 1 },
	},
	["eldenrootgroundfloor_base"] = {
		{ 0.754, 0.626, 682, 4 },
	},
	["nesalas_base"] = {
		{ 0.58, 0.57, 682, 10 },
	},
	["dessicatedcave_base"] = {	--The Scuttle Pit
		{ 0.62, 0.47, 682, 11 },
	},
	["burrootkwamamine_base"] = {
		{ 0.77, 0.44, 682, 12 },
	},
	["vindeathcave_base"] = {
		{ 0.74, 0.74, 682, 13 },
	},
	["wormrootdepths_base"] = {
		{ 0.18, 0.70, 682, 14 },
	},
	["mobarmine_base"] = {
		{ 0.40, 0.47, 682, 15 },
	},
	["rootsunder_base"] = {
		{ 0.27, 0.67, 682, 16 },
	},
}

SkyS.skyshardsData["greenshade"] = {
--Greenshade (Aldmeri lvl 25-30)
	["greenshade_base"] = {			--Greenshade
		{ 0.63, 0.80, 683, 1 },
		{ 0.53, 0.65, 683, 2 },
		{ 0.68, 0.49, 683, 3, 1 }, --Marbruk
		{ 0.16, 0.70, 683, 4, 1 }, --Woodheart
		{ 0.35, 0.74, 683, 5 },
		{ 0.30, 0.57, 683, 6 },
		{ 0.30, 0.16, 683, 7 },
		{ 0.56, 0.47, 683, 8 },
		{ 0.61, 0.40, 683, 9 },
		{ 0.742, 0.613, 683, 10, 2 }, --Gurzag's Mine
		{ 0.579, 0.895, 683, 11, 2 }, --Carac Dena
		{ 0.369, 0.684, 683, 12, 2 }, --Naril Nagaia
		{ 0.308, 0.399, 683, 13, 2 }, --The Underroot
		{ 0.630, 0.450, 683, 14, 2 }, --Harridan's Lair
		{ 0.294, 0.152, 683, 15, 2 }, --Barrow Trench
		{ 0.388, 0.449, 683, 16, 3 }, --Rulanyil's Fall
	},
	["marbruk_base"] = {
		{ 0.33, 0.29, 683, 3 },
	},
	["woodhearth_base"] = {
		{ 0.49, 0.74, 683, 4 },
	},
	["gurzagsmine_base"] = {
		{ 0.63, 0.57, 683, 10 },
	},
	["caracdena_base"] = {
		{ 0.54, 0.50, 683, 11 },
	},
	["narilnagaia_base"] = {
		{ 0.26, 0.73, 683, 12 },
	},
	["theunderroot_base"] = {
		{ 0.47, 0.24, 683, 13 },
	},
	["harridanslair_base"] = {
		{ 0.74, 0.74, 683, 14 },
	},
	["barrowtrench_base"] = {
		{ 0.55, 0.56, 683, 15 },
	},
	["rulanyilsfall_base"] = {
		{ 0.68, 0.41, 683, 16 },
	},
}

SkyS.skyshardsData["malabaltor"] = {
--Malabal Tor (Aldmeri, lvl 31-37)
	["malabaltor_base"] = {	--Malabal Tor
		{ 0.18, 0.50, 684, 1 },
		{ 0.21, 0.45, 684, 2 },
		{ 0.34, 0.59, 684, 3 },
		{ 0.51, 0.58, 684, 4 },
		{ 0.54, 0.45, 684, 5, 1 }, --Vulkwasten?
		{ 0.49, 0.67, 684, 6 },
		{ 0.79, 0.57, 684, 7 },
		{ 0.77, 0.34, 684, 8 },
		{ 0.65, 0.24, 684, 9 },
		{ 0.788, 0.298, 684, 10, 2 }, --Black Vine Ruins
		{ 0.349, 0.412, 684, 11, 2 }, --Dead Man's Drop
		{ 0.473, 0.563, 684, 12, 2 }, --Hoarvor Pit
		{ 0.708, 0.492, 684, 13, 2 }, --Roots of Silvenar
		{ 0.623, 0.829, 684, 14, 2 }, --Shael Ruins
		{ 0.380, 0.623, 684, 15, 2 }, --Tomb of the Apostates
		{ 0.385, 0.406, 684, 16, 3 }, --Crimson Cove
	},
	["vulkwasten_base"] = {
		{ 0.45, 0.24, 684, 5 }
	},
	["blackvineruins_base"] = {
		{ 0.26, 0.75, 684, 10 },
	},
	["deadmansdrop_base"] = {
		{ 0.61, 0.56, 684, 11 },
	},
	["hoarvorpit_base"] = {
		{ 0.66, 0.40, 684, 12 },
	},
	["rootsofsilvenar_base"] = {
		{ 0.32, 0.59, 684, 13 },
	},
	["shaelruins_base"] = {
		{ 0.16, 0.28, 684, 14 },
	},
	["tomboftheapostates_base"] = {
		{ 0.77, 0.37, 684, 15 },
	},
	["crimsoncove_base"] = {
		{ 0.83, 0.46, 684, 16 },
	},
}

SkyS.skyshardsData["reapersmarch"] = {							
--Reaper's March (Aldmeri, lvl 37-43)
	["reapersmarch_base"] = {		--Reaper's March
		{ 0.38, 0.20, 685, 1 },
		{ 0.43, 0.33, 685, 2 },
		{ 0.34, 0.15, 685, 3 },
		{ 0.33, 0.54, 685, 4 },
		{ 0.28, 0.63, 685, 5 },
		{ 0.40, 0.64, 685, 6 },
		{ 0.78, 0.35, 685, 7, 1 }, --Dune
		{ 0.77, 0.17, 685, 8 },
		{ 0.51, 0.36, 685, 9 },
		{ 0.541, 0.301, 685, 10, 2 }, --Kuna's Delve
		{ 0.361, 0.409, 685, 11, 2 }, --Thibaut's Cairn
		{ 0.505, 0.755, 685, 12, 2 }, --Weeping Wind Cave
		{ 0.239, 0.607, 685, 13, 2 }, --Claw's Strike
		{ 0.753, 0.128, 685, 14, 2 }, --Fardir's Folly
		{ 0.633, 0.395, 685, 15, 2 }, --Jode's Light
		{ 0.282, 0.163, 685, 16, 3 }, --The Vile Manse
	},
	["dune_base"] = {
		{ 0.59, 0.34, 685, 7 },
	},
	["kunasdelve_base"] = {
		{ 0.47, 0.30, 685, 10 },
	},
	["thibautscairn_base"] = {
		{ 0.30, 0.32, 685, 11 },
	},
	["weepingwindcave_base"] = {
		{ 0.61, 0.28, 685, 12 },
	},
	["clawsstrike_base"] = {
		{ 0.26, 0.56, 685, 13 },
	},
	["fardirsfolly_base"] = {
		{ 0.45, 0.53, 685, 14 },
	},
	["jodeslight_base"] = {
		{ 0.70, 0.87, 685, 15 },
	},
	["thevilemansefirstfloor_base"] = {	--first floor  
		{ 0.40, 0.42, 685, 16 },
	},
	["thevilemansesecondfloor_base"] = {	--second floor  
		{ 0.65, 0.33, 685, 16 },
	},
}

SkyS.skyshardsData["rivenspire"] = {
--Rivenspire (Daggerfall, lvl 25-30)
	["rivenspire_base"] = {			--Rivenspire
		{ 0.44, 0.60, 554, 1, 1 }, -- Stornhelm
		{ 0.16, 0.57, 554, 2 },
		{ 0.30, 0.50, 554, 3 },
		{ 0.59, 0.54, 554, 4 },
		{ 0.64, 0.55, 554, 5 },
		{ 0.83, 0.17, 554, 6, 1 }, --Northpoint
		{ 0.38, 0.37, 554, 7 },
		{ 0.70, 0.13, 554, 8 },
		{ 0.59, 0.44, 554, 9 },
		{ 0.357, 0.490, 554, 10, 2 }, --Crestshade Mine
		{ 0.400, 0.311, 554, 11, 2 }, --Erokii Ruins
		{ 0.145, 0.592, 554, 12, 2 }, --Flyleaf Catacombs
		{ 0.699, 0.184, 554, 13, 2 }, --Hildune's Secret Refuge
		{ 0.809, 0.351, 554, 14, 2 }, --Orc's Finger Ruins
		{ 0.670, 0.604, 554, 15, 2 }, --Tribulation Crypt 
		{ 0.556, 0.456, 554, 16, 3 }, --Obsidian Scar
	},
	["shornhelm_base"] = {
		{ 0.62, 0.81, 554, 1 },
	},
	["northpoint_base"] = {
		{ 0.73, 0.21, 554, 6 },
	},
	["crestshademine_base"] = {
		{ 0.53, 0.44, 554, 10 },
	},
	["erokii_base"] = {
		{ 0.53, 0.88, 554, 11 },
	},
	["flyleafcatacombs_base"] = {
		{ 0.61, 0.35, 554, 12 },
	},
	["hildunessecretrefuge_base"] = {
		{ 0.58, 0.51, 554, 13 },
	},
	["orcsfingerruins_base"] = {
		{ 0.17, 0.35, 554, 14 },
	},
	["tribulationcrypt_base"] = {
		{ 0.33, 0.77, 554, 15 },
	},
	["obsidianscar_base"] = {
		{ 0.84, 0.59, 554, 16 },
	},
}			

SkyS.skyshardsData["shadowfen"] = {
--Shadowfen (Ebonheart, lvl 25-30)
	["shadowfen_base"] = {			--Shadowfen
		{ 0.44, 0.27, 687, 1, 1 }, --Stormhold
		{ 0.23, 0.28, 687, 2 },
		{ 0.57, 0.41, 687, 3 },
		{ 0.66, 0.59, 687, 4, 1 }, --Alten Corimont
		{ 0.79, 0.71, 687, 5 },
		{ 0.57, 0.80, 687, 6 },
		{ 0.37, 0.72, 687, 7 },
		{ 0.13, 0.78, 687, 8 },
		{ 0.25, 0.55, 687, 9 },
		{ 0.850, 0.596, 687, 10, 2 }, --Atanaz Ruins
		{ 0.826, 0.377, 687, 11, 2 }, --Broken Tusk
		{ 0.254, 0.796, 687, 12, 2 }, --Chid-Moska Ruins
		{ 0.448, 0.621, 687, 13, 2 }, --Gandranen Ruins
		{ 0.668, 0.769, 687, 14, 2 }, --Onkobra Kwama Mine
		{ 0.290, 0.169, 687, 15, 2 }, --Shrine of the Black Maw
		{ 0.651, 0.272, 687, 16, 3 }, --Sanguine's Demesne
	},
	["stormhold_base"] = {
		{ 0.44, 0.49, 687, 1 },
	},
	["altencorimont_base"] = {
		{ 0.36, 0.52, 687, 1 },
	},
	["atanazruins_base"] = {
		{ 0.36, 0.73, 687, 10 },
	},
	["brokentuskcave_base"] = {
		{ 0.35, 0.32, 687, 11 },
	},
	["chidmoskaruins_base"] = {
		{ 0.70, 0.70, 687, 12 },
	},
	["gandranen_base"] = {
		{ 0.77, 0.31, 687, 13 },
	},
	["onkobrakwamamine_base"] = {
		{ 0.73, 0.52, 687, 14 },
	},
	["shrineofblackworm_base"] = {
		{ 0.86, 0.71, 687, 15 },
	},
	["sanguinesdemesne_base"] = {
		{ 0.64, 0.60, 687, 16 },
	},
}

SkyS.skyshardsData["stonefalls"] = {
--Stonefalls (Ebonheart, lvl 5-15)
	["stonefalls_base"] = {			--Stonefalls
		{ 0.776, 0.346, 397, 1, 1 }, --Davon's Watch
		{ 0.943, 0.471, 397, 2 },
		{ 0.613, 0.610, 397, 3 },
		{ 0.390, 0.468, 397, 4 },
		{ 0.255, 0.411, 397, 5 },
		{ 0.467, 0.603, 397, 6 },
		{ 0.337, 0.682, 397, 7 },
		{ 0.087, 0.444, 397, 8 },
		{ 0.130, 0.609, 397, 9 },
		{ 0.717, 0.393, 397, 10, 2 }, --Inner Sea Armature
		{ 0.643, 0.592, 397, 11, 2 }, --Emberflint Mine
		{ 0.583, 0.594, 397, 12, 2 }, --Mephala's Nest
		{ 0.290, 0.558, 397, 13, 2 }, --Softloam Cavern
		{ 0.358, 0.449, 397, 14, 2 }, --Hightide Hollows
		{ 0.211, 0.541, 397, 15, 2 }, --Sheogorath's Tongue
		{ 0.933, 0.361, 397, 16, 3 }, --Crow's Wood
	},
	["davonswatch_base"] = {
		{ 0.09, 0.51, 397, 1 },
		{ 0.87, 0.57, 397, 16, 3 }, --Crow's Wood (I'm not sure about this pin)
	},
	["innerseaarmature_base"] = {
		{ 0.39, 0.43, 397, 10 },
	},
	["emberflintmine_base"] = {
		{ 0.25, 0.60, 397, 11 },
	},
	["mephalasnest_base"] = {
		{ 0.52, 0.48, 397, 12 },
	},
	["hightidehollow_base"] = { --Softloam Cavern (according to Esohead there are switched textures, need to check)
		{ 0.72, 0.80, 397, 13 }
	},
	["softloamcavern_base"] = { --Hightide Hollows
		{ 0.51, 0.19, 397, 14 },
	},
	["sheogorathstongue_base"] = {
		{ 0.39, 0.26, 397, 15 },
	},
	["crowswood_base"] = {
		{ 0.24, 0.96, 397, 16 },
	},
--Bal Foyen (Ebonheart lvl 1-5)
	["balfoyen_base"] = {		--Bal Foyen
		{ 0.55, 0.56, 405, 1, 1 }, --Dhalmora
		{ 0.24, 0.74, 405, 2 },
		{ 0.38, 0.32, 405, 3 },
	},
	["dhalmora_base"] = {
		{ 0.335, 0.438, 405, 1 },
	},
--Bleakrock Isle (Ebonheart, lvl 1-5)
	["bleakrock_base"] = {	--Bleakrock Isle
		{ 0.772, 0.439, 398, 1 },
		{ 0.499, 0.228, 398, 2 },
		{ 0.26, 0.40, 398, 3, 4 }, --Hozzin's Folly entrance	
	--	{ 0.192, 0.421, 398, 3, 4 }, --exact location underground
	},
	["hozzinsfolley_base"] = {
		{ 0.32, 0.83, 398, 3 },
	},
}

SkyS.skyshardsData["stormhaven"] = {
--Stormhaven (Daggerfall, lvl 16-23)
	["stormhaven_base"] = {			--Stormhaven
		{ 0.150, 0.347, 515, 1 },
		{ 0.220, 0.203, 515, 2 },
		{ 0.224, 0.466, 515, 3 },
		{ 0.64, 0.38, 515, 4 },
		{ 0.68, 0.49, 515, 5 },
		{ 0.39, 0.64, 515, 6 },
		{ 0.77, 0.41, 515, 7 },
		{ 0.824, 0.422, 515, 8 },
		{ 0.87, 0.47, 515, 9 },
		{ 0.786, 0.433, 515, 10, 2 }, --Bearclaw Mine
		{ 0.389, 0.653, 515, 11, 2 }, --Farangel's Delve
		{ 0.237, 0.494, 515, 12, 2 }, --Koeglin Mine
		{ 0.605, 0.367, 515, 13, 2 }, --Norvulk Ruins
		{ 0.458, 0.430, 515, 14, 2 }, --Pariah Catacombs
		{ 0.308, 0.323, 515, 15, 2 }, --Portdun Watch
		{ 0.317, 0.496, 515, 16, 3 }, --Bonesnap Ruins
	},
	["bearclawmine_base"] = {
		{ 0.18, 0.48, 515, 10 },
	},
	["farangelsdelve_base"] = {
		{ 0.75, 0.09, 515, 11 },
	},
	["koeglinmine_base"] = {
		{ 0.40, 0.12, 515, 12 },
	},
	["norvulkruins_base"] = {
		{ 0.35, 0.53, 515, 13 },
	},
	["pariahcatacombs_base"] = {
		{ 0.76, 0.31, 515, 14 },
	},
	["portdunwatch_base"] = {
		{ 0.70, 0.45, 515, 15 },
	},
	["bonesnapruinssecret_base"] = {
		{ 0.25, 0.73, 515, 16 },
	},
	["bonesnapruins_base"] = {
		{ 0.25, 0.64, 515, 16 },
	},
}

SkyS.skyshardsData["therift"] = {
--The Rift (Ebonheart, lvl 37-43)
	["therift_base"] = {				--The Rift
		{ 0.43, 0.27, 689, 1 },
		{ 0.64, 0.29, 689, 2 }, --Shor's Stone (you can't go there from city, so no "city" label on tooltip)
		{ 0.32, 0.38, 689, 3 },
		{ 0.33, 0.51, 689, 4 },
		{ 0.39, 0.55, 689, 5 },
		{ 0.11, 0.44, 689, 6 },
		{ 0.84, 0.51, 689, 7 },
		{ 0.79, 0.62, 689, 8 },
		{ 0.72, 0.45, 689, 9 },
		{ 0.385, 0.574, 689, 10, 2 }, --Avanchnzel
		{ 0.828, 0.588, 689, 11, 2 }, --Broken Helm Hollow entrance (skyshard is on the world map cca 0.83,0.61)
		{ 0.498, 0.472, 689, 12, 2 }, --Faldar's Tooth
		{ 0.718, 0.404, 689, 13, 2 }, --Fort Greenwall
		{ 0.134, 0.294, 689, 14, 2 }, --Shroud Hearth Barrow
		{ 0.317, 0.234, 689, 15, 2 }, --Snapleg Cave
		{ 0.059, 0.427, 689, 16, 3 }, --The Lion's Den
	},
	["shorsstone_base"] = {
		{ 0.29, 0.44, 689, 2 },
	},
	["avancheznel_base"] = {
		{ 0.51, 0.14, 689, 10 },
	},
	["ebonmeretower_base"] = {		--Faldar's Tooth
		{ 0.27, 0.33, 689, 12 },
	},
	["fortgreenwall_base"] = {
		{ 0.85, 0.73, 689, 13 },
	},
	["shroudhearth_base"] = {
		{ 0.55, 0.46, 689, 14 },
	},
	["snaplegcave_base"] = {
		{ 0.84, 0.50, 689, 15 },
	},
	["thelionsden_base"] = {		--142
		{ 0.64, 0.39, 689, 16 },
	},
}
