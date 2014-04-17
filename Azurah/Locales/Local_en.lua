local Azurah = _G['Azurah'] -- grab addon table from global

-- Temporary locale setup until proper library sorted out.
local strings = {
	['en'] = {},
}
local L

-- English (en)
L = strings.en

L.Azurah = '|c67b1e9A|c4779cezurah|r'
L.Usage = '|c67b1e9A|c4779cezurah|r - Usage: /azurah lock OR unlock to toggle UI movement'

-- UNLOCK NAMES --
L.Health = 'Player Health'
L.HealthSiege = 'Siege Health'
L.Magicka = 'Player Magicka'
L.Werewolf = 'Werewolf Timer'
L.Stamina = 'Player Stamina'
L.StaminaMount = 'Mount Stamina'
L.Experience = 'Experience Bar'
L.Synergy = 'Synergy'
L.Compass = 'Compass'
L.ReticleOver = 'Target Health'
L.ActionBar = 'Action Bar'
L.Group = 'Group Members'
L.Raid1 = 'Raid Group 1'
L.Raid2 = 'Raid Group 2'
L.Raid3 = 'Raid Group 3'
L.Raid4 = 'Raid Group 4'
L.Raid5 = 'Raid Group 5'
L.Raid6 = 'Raid Group 6'
L.FocusedQuest = 'Quest Tracker'
L.PlayerPrompt = 'Player Interaction Prompt'


-- DROPBOX ENTRIES --
L.DropStyle1 = 'Default'
L.DropStyle2 = 'Faded Bars'
L.DropStyle3 = 'Always Shown'
L.DropOverlay1 = 'Show All'
L.DropOverlay2 = 'Value & Max'
L.DropOverlay3 = 'Value & Percent'
L.DropOverlay4 = 'Value Only'
L.DropOverlay5 = 'Percent Only'
L.DropColourBy1 = 'Default'
L.DropColourBy2 = 'By Reaction'
L.DropColourBy3 = 'By Level'

-- UNLOCK SETTINGS --
L.UnlockHeader = 'Unlock UI Windows'
L.UnlockDesc = 'Unlocking UI windows allows them to be moved using the mouse and size scaled using the scrollwheel. An overlay will be shown for each unlocked UI window and will reposition windows even if they are not currently shown (eg, the target health if you have no target).'
L.UnlockButton = 'Unlock UI Windows'
L.LockButton = 'Lock UI Windows'
L.Unlocked = 'UI Unlocked'
L.GridSnapEnable = 'Enable Snap To Grid'
L.GridSnapDisable = 'Disable Snap To Grid'
L.ResetToDefaults = 'Reset To Defaults'
L.ResetToDefaultsConfirm = 'Confirm Reset'

-- ATTRIBUTE VISIBILITY --
L.VisibilityHeader = 'Player Attribute Visibility'
L.VisibilityStyle = 'Out Of Combat Fade Style'
L.VisibilityStyleTip = 'Set how the player attributes will appear when out of combat.\n\nDefault - bars will fade entirely\nFaded Bars - bars fade to a minimum level\nAlways Shown - bars always fully visible'
L.VisibilityStyleWarning = 'When changing to any other style from Always Shown, you must enter /reloadui into chat or relog for changes to fully take effect.'
L.VisibilityAlpha = 'Faded Bars Transparency Level'
L.VisibilityAlphaTip = 'Set how opaque attribute bars will be when out of combat and using the Faded Bars stye.'

-- OVERLAYS --
L.OverlaysHeader = 'Text Overlays'
L.OverlaysPlayer = 'Player Attributes'
L.OverlaysPlayerTip = 'Set whether to show a text overlay over the player\'s attribute bars.'
L.OverlaysUltimate = 'Ultimate Charge: Value'
L.OverlaysUltimateTip = 'Set whether to show a text overlay above the ultimate ability slot showing the current ultimate level as a number.'
L.OverlaysUltimatePer = 'Ultimate Charge: Percentage'
L.OverlaysUltimatePerTip = 'Set whether to show a text overlay over the ultimate ability slot showing the current ultimate level as a percentage.'
L.OverlaysUltimateRel = 'Ultimate Charge: Relative Percent'
L.OverlaysUltimateRelTip = 'Set whether the percentage shown on the overlay is relative to the cost of your slotted ultimate ability instead of a percentage of your maximum ultimate pool of 1000 points.'
L.OverlaysTarget = 'Target\'s Health bar'
L.OverlaysTargetTip = 'Set whether to show a text overlay over the target\'s health bar.'
L.OverlaysExp = 'Experience Bar'
L.OverlaysExpTip = 'Set whether to show a text overlay below the experience bar. The format for this overlay is:\n\nCurrent / Maximum (Percent)'
L.OverlaysStylePlayer = 'Overlay Style: Player'
L.OverlaysStylePlayerTip = 'Set the style of the overlay text over the player\'s attribute bars.'
L.OverlaysStyleTarget = 'Overlay Style: Target'
L.OverlaysStyleTargetTip = 'Set the style of the overlay text over the target\'s health bar.'
L.OverlaysFont = 'Overlay Font'
L.OverlaysFontTip = 'Set the font of the text used in the overlays.'
L.OverlaysColour = 'Overlay Colour'
L.OverlaysColourTip = 'Set the colour of the text used in the overlays.'

-- TARGET COLOURING --
L.TargetHeader = 'Target Colouring'
L.TargetColourByBar = 'Colour Target\'s Health Bar'
L.TargetColourByBarTip = 'Set whether the target\'s health bar is coloured by either disposition (reaction) or difficulty (level).'
L.TargetColourByName = 'Colour Target\'s Name'
L.TargetColourByNameTip = 'Set whether the target\'s nameplate is coloured by either disposition (reaction) or difficulty (level).'
L.TargetColourByLevel = 'Colour Target\'s Level By Difficulty'
L.TargetColourByLevelTip = 'Set whether the target\'s level is coloured by its difficulty (level).'

-- RANGE FINDER --
L.RangeHeader = 'Range Finder'
L.RangeShow = 'Show Range Finder'
L.RangeShowTip = 'Set whether to show a range finder by the targeting reticle showing the distance (in meters) to the target.'
L.RangeFont = 'Range Finder Font'
L.RangeFontTip = 'Set the font of the text used in the range finder.'
L.RangeColour = 'Range Finder Colour'
L.RangeColourTip = 'Set the colour of the text used in the range finder.'

-- EXTRAS --
L.ExtrasHeader = 'Extra Settings'
L.ExpAlwaysShow = 'Always Show Experience Bar'
L.ExpAlwaysShowTip = 'Set whether the experience bar will always be shown.'
L.PinScale = 'Compass Pin Size'
L.PinScaleTip = 'Set how large the compass pins should be. This size is independant of the size of the compass itself which can be changed when the UI is unlocked.\n\nA setting of 100 is 100% of the default size (no change).'


--	local lang = GetCVar("language.2")
function Azurah:GetLocale()
	return strings.en
end
