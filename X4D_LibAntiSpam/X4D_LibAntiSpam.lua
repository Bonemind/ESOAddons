local X4D_LibAntiSpam = LibStub:NewLibrary('LibAntiSpam', 1.24);
if (not X4D_LibAntiSpam) then
	return;
end

X4D_LibAntiSpam.NAME = 'X4D_LibAntiSpam';
X4D_LibAntiSpam.VERSION = 1.24;

X4D_LibAntiSpam.Settings = {};
X4D_LibAntiSpam.Settings.SavedVars = {};
X4D_LibAntiSpam.Settings.Defaults = {
	NotifyWhenDetected = true,
	FloodTime = 30,
	ShowNormalizations = false,
	Patterns = {},
};
X4D_LibAntiSpam.PatternDiff = {
	['h.?a.?n.?%a.?w.?o.?r.?k'] = 'add',
	['i.?i.?i.?i.?i.*c.?o.?[mn]+'] = 'remove',
	['i.?i.?i.?i.?i.?c.?o.?[mn]+'] = 'add',
	['%w*.?g.?o.?l.?d.?%w*.*c.?o.?[mn]+'] = 'remove',
	['%w*.?g.?o.?l.?d.?%w*%.*c.?o.?[mn]+'] = 'remove',
	['%w?%w?%w?%w?%w?.?g.?o.?l.?d.?%w?%w?%w?%w?%w?%.?c.?o.?[mn]+'] = 'add',
	['pvp.*bank.*c[op][mn]+'] = 'add',
	['pvp.*bank.*co[mn]+'] = 'remove',
	['p.*v.*p.*b.*a.*n.*k.*c.*o.*[mn]+'] = 'remove',
	['p.?v.?p.?b.?a.?n.?k.*c.?o.?[mn]+'] = 'remove',
	['p.?v.?p.?b.?a.?n.?k.*c.?[op].?[mn]+'] = 'add',
	['o.?k.?a.?y.?g.?o.?o.?d.?s.*c.?o.?[mn]+'] = 'remove',
	['o.?k.?a.?y.?g.?o.?o.?d.?s.?c.?o.?[mn]+'] = 'remove',
	['o.?k.?a.?y.?g.?o.?o.?d.?s.?c.?[op].?[mn]+'] = 'add',
	['e.?z.?o.?o.?[mn]+.*c.?o.?[mn]+'] = 'remove',
	['e.?z.?o.?o.?[mn]+.?c.?o.?[mn]+'] = 'remove',
	['e.?z.?o.?o.?[mn]+.?c.?[op].?[mn]+'] = 'add',
	['g.?g.?a.?t.?m.*c.?o.?[mn]+'] = 'remove',
	['g.?g.?a.?t.?m.?c.?o.?[mn]+'] = 'remove',
	['g.?g.?a.?t.?m.?c.?[op].?[mn]+'] = 'add',
	['m.?m.?o.?w.?i.?n.*c.?o.?[mn]+'] = 'remove',
	['m.?m.?o.?w.?i.?n.?c.?o.?[mn]+'] = 'remove',
	['m.?m.?o.?w.?i.?n.?c.?[op].?[mn]+'] = 'add',
	['g.?4.?e.?z.*c.?o.?[mn]+'] = 'remove',
	['g.?4.?e.?z.?c.?o.?[mn]+'] = 'remove',
	['g.?4.?e.?z.?c.?[op].?[mn]+'] = 'add',
	['g.?a.?m.?e.?c.?b.?o.*c.?o[mn]+'] = 'remove',
	['g.?a.?m.?e.?c.?b.?o.?c.?o[mn]+'] = 'remove',
	['g.?a.?m.?e.?c.?b.?o.?c.?[op].?[mn]+'] = 'add',
	['w.?o.?w.?g.?l.*c.?o.?[mn]+'] = 'remove',
	['w.?o.?w.?g.?l.?c.?o.?[mn]+'] = 'remove',
	['w.?o.?w.?g.?l.?c.?[op].?[mn]+'] = 'add',
	['g.?a.?m.?e.?i.?m.*c.?o.?[mn]+'] = 'remove',
	['g.?a.?m.?e.?i.?m.?c.?o.?[mn]+'] = 'remove',
	['g.?a.?m.?e.?i.?m.?c.?[op].?[mn]+'] = 'add',
	['u.?t.?m.?m.?o.?c.?o.?[mn]+'] = 'remove',
	['u.?t.?m.?m.?o.?c.?[op].?[mn]+'] = 'add',
	['g.?g.?a.?t.?m'] = 'add',
	['g.?o.?l.?d.?a.?h'] = 'add',
	['ggatm'] = 'remove',
	['goldah'] = 'remove',
	['s[ea].eandfast'] = 'remove',
	['s[ea][fl]eandfast'] = 'add',
	['cheap.*gold.*usd'] = 'add',
	['cheap.*fast.*safe'] = 'add',
	['l.?f.?d.?p.?s.?c.?o.?[mn]+'] = 'remove',
	['l.?f.?d.?p.?s.?c.?[op].?[mn]+'] = 'add',
};

X4D_LibAntiSpam.CharMap = {};

local L_charMap = {
	['À'] = 'A', ['Á'] = 'A', ['Â'] = 'A', ['Ã'] = 'A', ['Ä'] = 'A', ['Å'] = 'A', ['Æ'] = 'AE', 
	['Ç'] = 'C', ['È'] = 'E', ['É'] = 'E', ['Ê'] = 'E', ['Ë'] = 'E', ['Ì'] = 'I', ['Í'] = 'I', 
	['Î'] = 'I', ['Ï'] = 'I', ['Ð'] = 'D', ['Ñ'] = 'N', ['Ò'] = 'O', ['Ó'] = 'O', ['Ô'] = 'O', 
	['Õ'] = 'O', ['Ö'] = 'O', ['×'] = 'x', ['Ø'] = 'O', ['Ù'] = 'U', ['Ú'] = 'U', ['Û'] = 'U', 
	['Ü'] = 'U', ['Ý'] = 'Y', ['Þ'] = 'b', ['¥'] = 'Y', ['¢'] = 'c', ['¡'] = 'i', ['£'] = 'L', 
	['ß'] = 'B', ['à'] = 'a', ['á'] = 'a', ['â'] = 'a', ['ã'] = 'a', ['ä'] = 'a', ['å'] = 'a', 
	['ç'] = 'c', ['è'] = 'e', ['é'] = 'e', ['ê'] = 'e', ['ë'] = 'e', ['ì'] = 'i', ['æ'] = 'ae', 
	['í'] = 'i', ['î'] = 'i', ['ï'] = 'i', ['ð'] = 'o', ['ñ'] = 'n', ['ò'] = 'o', ['ó'] = 'o', 
	['ô'] = 'o', ['õ'] = 'o', ['ö'] = 'o', ['÷'] = 't', ['ø'] = 'o', ['ù'] = 'u', ['ú'] = 'u', 
	['û'] = 'u', ['ü'] = 'u', ['ý'] = 'y', ['þ'] = 'b', ['ÿ'] = 'y', ['®'] = 'r', ['@'] = 'a',
	['1'] = 'l', ['3'] = 'e', ['4'] = 'a', ['7'] = 'T', ['0'] = 'O', ['('] = '.', ['2'] = 'R',
	[')'] = 'o', ['·'] = '.', ['°'] = '.', ['¸'] = '.', ['¯'] = '-', [','] = '.', ['*'] = '.',
	['$'] = 'S', ['/'] = 'm', ['¿'] = '?', ['5'] = 'S', ['9'] = 'g', ['\\'] = 'v', ['ß'] = 'b',
};

for inp,v in pairs(L_charMap) do
	local b1, b2, res = inp:byte(1, 2);
	if (b2) then
		X4D_LibAntiSpam.CharMap[string.format('%x%x', b1, b2)] = v;
	elseif (b1) then
		X4D_LibAntiSpam.CharMap[string.format('%x', b1)] = v;
	end
	X4D_LibAntiSpam.CharMap[inp] = v;
end

local function StringSplit(s, delimiter)
    local result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
		local s = tostring(match);
		if (s:len() > 0) then
			table.insert(result, match);
		end
    end
    return result;
end

local function StringEndsWith(s,v)
   return v=='' or string.sub(s,-string.len(v))==v
end

local function StringPivot(s, delimiter, sk)
	if (delimiter == nil) then
		delimiter = ' ';
	end
	if (sk == nil) then
		sk = 0;
	end
	local t = StringSplit(s, delimiter);
	local r = '';
	for j=1,1000 do
		local b = false;
		for _,l in pairs(t) do
			sk = sk - 1;
			if (sk <= 0) then
				if (l:len() > j) then
					b = true;
					r = r .. l:sub(j, j);
				end
			end
		end
		if (not b) then			
			break;
		end
	end
	return r;
end

local function IsSelf(fromName)
	return (fromName == GetDisplayName());
end

local function IsInGroup(fromName)
	return IsPlayerInGroup(fromName);
end

local function IsInFriends(fromName)
	return IsFriend(fromName);
end

local function IsInGuild(fromName)
	fromName = fromName:gsub('%^.*', '');
	for guildIndex = 1,GetNumGuilds() do
		local guildId = GetGuildId(guildIndex);
		if (guildId ~= nil) then
			for memberIndex = 1,GetNumGuildMembers(guildId) do
				local name, note, rankIndex, playerStatus, secsSinceLogoff = GetGuildMemberInfo(guildId, memberIndex)				
				if (name == fromName) then
					return true;
				end
				local hasCharacter, characterName, zoneName, classType, alliance, level, veteranRank = GetGuildMemberCharacterInfo(guildId, memberIndex)
				characterName = characterName:gsub('%^.*', '');
				if (characterName == fromName) then
					return true;
				end
			end
		end			
	end
	return false;
end

local function ShouldWhitelistPlayer(fromName)
	return IsSelf(fromName) or IsInGroup(fromName) or IsInFriends(fromName) or IsInGuild(fromName);
end

X4D_LibAntiSpam.Players = {};

local function GetPlayer(fromName)
	fromName = fromName:gsub('%^.*', '');
	return X4D_LibAntiSpam.Players[fromName];
end

local function AddPlayer(fromName)
	fromName = fromName:gsub('%^.*', '');
	X4D_LibAntiSpam.Players[fromName] = {
		Time = GetGameTimeMilliseconds(),
		From = fromName,
		IsWhitelist = ShouldWhitelistPlayer(fromName),
		IsSpam = false,
		IsFlood = false,
		TextTable = { },
		TextCount = 0,		
		TextLatest = '',
		GetTextAggregate = function(self)
			local r = '';
			for _,v in pairs(self.TextTable) do
				r = r .. ' ' .. v;
			end			
			return r .. StringPivot(r, ' ', 0);
		end,
		AddText = function(self, normalized)
			self.TextLatest = normalized;
			table.insert(self.TextTable, normalized);
			self.TextCount = self.TextCount + 1;
			if (self.TextCount > 5) then
				table.remove(self.TextTable, 1);
				self.TextCount = self.TextCount - 1;
			end
		end,
	};
	return GetPlayer(fromName);
end

local function UpdateFloodState(player, normalized)
	if (player.IsWhitelist) then
		player.IsFlood = false;
		return;
	end
	if (player.Time >= (GetGameTimeMilliseconds() - (X4D_LibAntiSpam.Settings.SavedVars.FloodTime * 1000))) then
		if (player.TextLatest == normalized) then
			player.IsFlood = true;
			player.Time = GetGameTimeMilliseconds();
			if (X4D_LibAntiSpam.Settings.SavedVars.ShowNormalizations) then
				d('[LibAntiSpam] Detected Chat Flood from: |cFFAE19' .. player.From);
			end
		end
	else
		player.IsFlood = false;
	end
end

local function CheckPatterns(player, normalized, patterns)
	for i = 1, #patterns do
		if (player.IsSpam) then
			break;
		end
		if (not pcall(function() 
		if (normalized:find(patterns[i])) then
			player.IsSpam = true;
			player.Time = GetGameTimeMilliseconds();
			if (X4D_LibAntiSpam.Settings.SavedVars.ShowNormalizations) then
				d('[LibAntiSpam] pattern matched: |cFFAE19' .. patterns[i]);
			end
		end
		end)) then
			d('[LibAntiSpam] Bad Pattern: |cFF7777' .. patterns[i]);
		end
	end
end

local function UpdateSpamState(player, normalized)
	if (player.IsWhitelist) then
		player.IsSpam = false;
		return;
	end
	if (not player.IsSpam) then
		CheckPatterns(player, normalized, X4D_LibAntiSpam.Settings.SavedVars.Patterns);		
		return player.IsSpam; -- new spammer detected
	end
	return false;
end

function X4D_LibAntiSpam.OnChatMessageReceived(messageType, fromName, text)
    local ChannelInfo = ZO_ChatSystem_GetChannelInfo()	
    local channelInfo = ChannelInfo[messageType]
	local isSpam, isFlood = X4D_LibAntiSpam:Check(text, fromName);
	if (isSpam or isFlood) then
		return;
	end
    if (channelInfo and channelInfo.format) then
		local channelLink = nil;
		if (channelInfo.channelLinkable) then
			local channelName = GetChannelName(channelInfo.id);
			channelLink = ZO_LinkHandler_CreateChannelLink(channelName);
		end
        local fromLink = fromName;
		if (channelInfo.playerLinkable) then
			fromLink = ZO_LinkHandler_CreatePlayerLink(fromName);
		end
        if (channelLink) then
			local channelName = nil;
            result = zo_strformat(channelInfo.format, channelLink, fromLink, text);
        else
			result = zo_strformat(channelInfo.format, fromLink, text);
		end
		return result, channelInfo.saveTarget;
    end	
end

local function FromCharMap(inp)
	local res = nil;
	if (inp) then
		local b1, b2 = inp:byte(1, 2);
		if (b2) then
			res = X4D_LibAntiSpam.CharMap[string.format('%x%x', b1, b2)];
		elseif (b1) then
			res = X4D_LibAntiSpam.CharMap[string.format('%x', b1)];
		end
	end
	if (not res) then
		res = X4D_LibAntiSpam.CharMap[inp];
	end		
	return res or inp; 
end
		
local function ToASCII(input)
	local output = input;
	if (output ~= nil) then
		output = output:utf8replace(utf8_scrub1);
		output = output:utf8replace(utf8_scrub2);
		output = output:gsub('(\194.)', FromCharMap):gsub('(.)', FromCharMap);
	end
	return output;
end

local function Strip(input)
	local output = input:gsub('%|', '!');
	output = output:gsub('%!c%x%x%x%x%x%x', '');
	output = output:gsub('%!H[^!]*!h%[?([^%]!]*)%]?!h', '%[%1%]');
	output = output:gsub('[%[%]]*', '');
	return output;
end

local function Scrub(input)
	return input:gsub('[%{%}%|%-~%s\1-\44\58-\63\91-\96\123-\255]', '');
end

local function Condense(input)
	local output = input:gsub('%.+', '.'):lower();
	while (output ~= input) do
		input = output;
		output = input:gsub('%.+', '.');
	end
	return output;
end

local function Normalize(input)
	local output = Strip(input);
	output = ToASCII(output);
	return Condense(Scrub(output)), Condense(Scrub(StringPivot(output)));
end

function X4D_LibAntiSpam.Check(self, text, fromName)
	local normalized, pivot = Normalize(text);	
	local player = GetPlayer(fromName);
	if (not player) then
		player = AddPlayer(fromName);
		player:AddText(normalized);
	else
		UpdateFloodState(player, normalized);
		player:AddText(normalized);
		normalized = player:GetTextAggregate();
	end
	normalized = normalized .. pivot;
	if (X4D_LibAntiSpam.Settings.SavedVars.ShowNormalizations) then
		d('[LibAntiSpam] |c993333' .. normalized .. ' |cFFFF00 ' .. (fromName or ''));
	end	
	if (UpdateSpamState(player, normalized)) then
		if (X4D_LibAntiSpam.Settings.SavedVars.NotifyWhenDetected) then
			local fromLink = ZO_LinkHandler_CreatePlayerLink(fromName);
			d('[LibAntiSpam] Detected Chat Spam from |cFFAE19' .. (fromLink or fromName or ''));
		end	
	end
	return player.IsSpam, player.IsFlood;
end	

_G['X4D_spamCheck'] = function(text, fromName)
	local las = LibStub('LibAntiSpam');
	if (las) then
		las:Check(text, fromName or '@test2');
	end
end

local function SetCheckboxValue(controlName, value)
	local checkbox = _G[controlName]:GetNamedChild('Checkbox');
	checkbox:SetState(value and 1 or 0);
	checkbox:toggleFunction(value);
end

local function SetSliderValue(controlName, value, minValue, maxValue)
	local range = maxValue - minValue
	local slider = _G[controlName];
	local slidercontrol = slider:GetNamedChild("Slider");
	local slidervalue = slider:GetNamedChild("ValueLabel");
	slidercontrol:SetValue((value - minValue)/range);
	slidervalue:SetText(tostring(value));
end

local function SetEditBoxValue(controlName, value, maxInputChars)
	if (maxInputChars and maxInputChars > 0) then
		_G[controlName]['edit']:SetMaxInputChars(maxInputChars);
	end
	_G[controlName]['edit']:SetText(value);
end

local function SetPatternsEditBoxText()
	local patterns = table.concat(X4D_LibAntiSpam.Settings.SavedVars.Patterns, '\n');
	SetEditBoxValue('X4D_LIBANTISPAM_EDIT_PATTERNS', patterns, 4096);
	return patterns;
end

local function MergePatterns()
	local merged = {};
	for _,pattern in pairs(X4D_LibAntiSpam.Settings.SavedVars.Patterns) do
		local diff = X4D_LibAntiSpam.PatternDiff[pattern];
		if (not diff or diff == 'add') then
			table.insert(merged, pattern);
		end		
	end
	for pattern,k in pairs(X4D_LibAntiSpam.PatternDiff) do
		if (k == 'add') then
			local exists = false;
			for L_k,L_pattern in pairs(merged) do
				if (L_pattern == pattern) then
					exists = true;
					break;
				end
			end
			if (not exists) then
				d('[LibAntiSpam] New Pattern: |cFFAE19' .. pattern);
				table.insert(merged, pattern);
			end
		end
	end
	return merged;
end

function X4D_LibAntiSpam.OnAddOnLoaded(event, addonName)
	if (addonName ~= X4D_LibAntiSpam.NAME) then
		return;
	end

	X4D_LibAntiSpam.Settings.SavedVars = ZO_SavedVars:NewAccountWide(X4D_LibAntiSpam.NAME .. '_SV', 1.14, nil, X4D_LibAntiSpam.Settings.Defaults);

	local LAM = LibStub('LibAddonMenu-1.0');
	local cplId = LAM:CreateControlPanel('X4D_LibAntiSpam_CPL', 'X4D |cFFAE19AntiSpam');	
	LAM:AddHeader(cplId, 
		'X4D_LIBANTISPAM_HEADER_SETTINGS', 'Settings');
	LAM:AddCheckbox(cplId, 
		'X4D_LIBANTISPAM_CHECK_NOTIFY_DETECTED', 'Notify when detected Spam?', 
		'When enabled,  Names are logged to the chat frame when spam is detected.', 
		function() return X4D_LibAntiSpam.Settings.SavedVars.NotifyWhenDetected end,
		function() X4D_LibAntiSpam.Settings.SavedVars.NotifyWhenDetected = not X4D_LibAntiSpam.Settings.SavedVars.NotifyWhenDetected end);
	LAM:AddSlider(cplId,
		'X4D_LIBANTISPAM_SLIDER_FLOODTIME', 'Max Flood Time',
		'This determines mininum amount of time, in seconds, before repeated text is not considered Flooding. Flooding is when a user types the same thing into chat over and over.',
		5, 300, 5,
		function () return X4D_LibAntiSpam.Settings.SavedVars.FloodTime end,
		function (v) X4D_LibAntiSpam.Settings.SavedVars.FloodTime = tonumber(tostring(v)) end);
	LAM:AddEditBox(cplId, 
		'X4D_LIBANTISPAM_EDIT_PATTERNS', 'Spam Patterns', 
		'Line-delimited list of Spammer Patterns, each one should be on a new line.', 
		true,
		SetPatternsEditBoxText,
		function()
			local v = _G['X4D_LIBANTISPAM_EDIT_PATTERNS']['edit']:GetText();
			local result = StringSplit(v, '\n');
			-- NOTE: this is a hack to deal with the fact that the LUA parser in ESO bugs out processing escaped strings in SavedVars :(
			for _,x in pairs(result) do
				if (StringEndsWith(x, ']')) then
					result[_] = x .. '+';
				end
			end
			X4D_LibAntiSpam.Settings.SavedVars.Patterns = result;
		end);
	SetPatternsEditBoxText();
	LAM:AddCheckbox(cplId, 
		'X4D_LIBANTISPAM_CHECK_SHOW_NORMALIZATIONS', '[DEV] Show normalized text.', 
		'When enabled, all normalized text is dumped to the chat frame to aid in creating new patterns.', 
		function() return X4D_LibAntiSpam.Settings.SavedVars.ShowNormalizations end,
		function() X4D_LibAntiSpam.Settings.SavedVars.ShowNormalizations = not X4D_LibAntiSpam.Settings.SavedVars.ShowNormalizations end);
		
	ZO_PreHook("ZO_OptionsWindow_ChangePanels", function(panel)
			if (panel == cplId) then				
				ZO_OptionsWindowResetToDefaultButton:SetCallback(function ()
					if (ZO_OptionsWindowResetToDefaultButton:GetParent()['currentPanel'] == cplId) then

						SetCheckboxValue('X4D_LIBANTISPAM_CHECK_NOTIFY_DETECTED', X4D_LibAntiSpam.Settings.Defaults.NotifyWhenDetected);
						X4D_LibAntiSpam.Settings.SavedVars.NotifyWhenDetected = X4D_LibAntiSpam.Settings.Defaults.NotifyWhenDetected;
						
						SetSliderValue('X4D_LIBANTISPAM_SLIDER_FLOODTIME', X4D_LibAntiSpam.Settings.Defaults.FloodTime, 5, 300);
						X4D_LibAntiSpam.Settings.SavedVars.FloodTime = X4D_LibAntiSpam.Settings.Defaults.FloodTime;
						
						SetCheckboxValue('X4D_LIBANTISPAM_CHECK_SHOW_NORMALIZATIONS', X4D_LibAntiSpam.Settings.Defaults.ShowNormalizations);						
						X4D_LibAntiSpam.Settings.SavedVars.ShowNormalizations = X4D_LibAntiSpam.Settings.Defaults.ShowNormalizations;
												
						local merged = MergePatterns();
						SetEditBoxValue('X4D_LIBANTISPAM_EDIT_PATTERNS', table.concat(merged, '\n'), 4096);
						X4D_LibAntiSpam.Settings.SavedVars.Patterns = merged;

					end
				end);
			end
		end);		
		
	X4D_LibAntiSpam.Register();
end

local function RejectSpammerGuildInvites()
	for i=1,GetNumGuildInvites() do
		local guildId, guildName, guildAlliance, fromName, note = GetGuildInviteInfo(i);		
		if (guildId and guildId ~= 0) then
			local L_note = nil;
			local text = guildName;
			L_note = GetGuildDescription(guildId);
			if (L_note) then
				text = text .. L_note;
			end	
			L_note = GetGuildMotD(guildId);
			if (L_note) then
				text = text .. L_note;
			end
			local isSpam, isFlood = X4D_LibAntiSpam:Check(text, fromName);
			if (isSpam or isFlood) then
				if (X4D_LibAntiSpam.Settings.SavedVars.NotifyWhenDetected) then
					local fromLink = ZO_LinkHandler_CreatePlayerLink(fromName);
					d('[LibAntiSpam] Detected Invite Spam from |cFFAE19' .. (fromLink or fromName));
				end
				RejectGuildInvite(guildId);
				zo_callLater(RejectSpammerGuildInvites, 1000);
				return;
			end
		end
	end
end

function X4D_LibAntiSpam.OnGuildInviteAdded(id1, id2, guildName, id4, fromName)
	zo_callLater(RejectSpammerGuildInvites, 1000);
end

function X4D_LibAntiSpam.Register()
	ZO_ChatSystem_AddEventHandler(EVENT_CHAT_MESSAGE_CHANNEL, X4D_LibAntiSpam.OnChatMessageReceived);
end

function X4D_LibAntiSpam.Unregister()
	ZO_ChatSystem_AddEventHandler(EVENT_CHAT_MESSAGE_CHANNEL, nil);
end

function X4D_LibAntiSpam.OnPlayerActivated()
	zo_callLater(function() 
		local merged = MergePatterns();
		SetEditBoxValue('X4D_LIBANTISPAM_EDIT_PATTERNS', table.concat(merged, '\n'), 4096);
		X4D_LibAntiSpam.Settings.SavedVars.Patterns = merged;
		RejectSpammerGuildInvites();
	end, 2000);
end

EVENT_MANAGER:RegisterForEvent(X4D_LibAntiSpam.NAME, EVENT_ADD_ON_LOADED, X4D_LibAntiSpam.OnAddOnLoaded);
EVENT_MANAGER:RegisterForEvent(X4D_LibAntiSpam.NAME, EVENT_GUILD_INVITE_ADDED, X4D_LibAntiSpam.OnGuildInviteAdded);
EVENT_MANAGER:RegisterForEvent(X4D_LibAntiSpam.NAME, EVENT_PLAYER_ACTIVATED, X4D_LibAntiSpam.OnPlayerActivated);

