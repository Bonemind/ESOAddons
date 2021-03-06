# X4D LibAntiSpam

A LibStub-compatible Anti-Spam Library that can be used from Chat Mods, Mail Mods, etc.

Can also be used as a Stand-Alone Chat Mod to filter 'spammers' and 'flooders'.

## Features

* Does not clog up your in-game ignore list.
* Detects Flooders
* Detects Spammer Domains
* Detects Spammer Words/Phrases
* Spam Dictionary is User Editable
* Can be used from other Add-Ons, such as **X4D Chat**, hopefully others (requires author support.)
* Can be used as a stand-alone Add-On to auto-filter Spammers and Flooders from Chat.

## Planned Features

* Spam Dictionary Sync (share your spam dictionary your Guild, your Friends, etc)

## Installation

Open the Archive and copy the **X4D_LibAntiSpam** folder into **%USERPROFILE%\Documents\Elder Scrolls Online\live\Addons\** folder.

If ESO is already running, execute **/reloadui** command.

## Versions
v1.24
- Modified Scrubbers.
v1.23
- Updated CharMap.
- Updated Patterns.
- Added message for when player is blocked for flooding (as opposed to spamming)
v1.22
- Fix Spam Check. 
v1.21
- Fix Flooder Check.
v1.20
- Auto-Whitelist for Self, Friends, Group Members and Guild Members.
- Modified Patterns, removed a pattern that would catch too many non-spammers.
- Modified Scrubbers, added a large utf8 scrub list based on a modification of Kyle Smith's "utf8.lua"
v1.19
- Modified Patterns.
v1.18
- New Spam Patterns.
- Sliding Expiry for 'Flooding' is only extended when user continues flooding same text, different text does not extend expiry.
- Simplified Scrubbers and Aggregation.
- Normalization output now shows Player/Character Name of sender.
- Fix a bug with monster names not writing out to chat.
v1.17
- Removed debug lines accidentally left in the code (oops!)
v1.16
- Modified Patterns to be more restrictive.
- Added new spam Patterns.
- Modified Scrubbers to deal with link-based spam.
v1.15
- Modified Patterns.
v1.14
- Modifications to text scrubbers.
- Spammer notification now only occurs once per spammer, rather than for every message detected.
- Spammer notifications are again enabled by default to promote reporting by users.
- Fixed a bug with SavedVars being reset for every release, what a horrible API.
v1.13
- New Algo for Line-Break Spammers.
- New Algo for Multi-Line Spammers.
- Boot in the Mouth for all Spammers.
v1.12
- New Spam Pattern.
- Fixed bug with Pattern Merge.
v1.11
- Automatic Pattern Merges on Add-On Load/Init - Users do not need to explicitly 'reset to defaults' to pick up new patterns.
v1.10
- Fix bug with Pattern Merge.
- Fix bug with GuildInvite 'nil' Error for uninitialized variable name.
v1.9
- Refactor of Patterns into a single list, implemented pattern merge (no longer lose your customized patterns when resetting to defaults, but still get NEW patterns added to Add-On.)
- Reworked Flood/Spam notifications so that the spammer names are links, you can now right-click to report spammers (if you wish.)
- Reworked Flood/Spam notifications so they are shown regardless of which Chat Add-On you are using, this option is still disabled by default.
- Refactored "Spammer Guild Invite" - previous version was notifying, but not actually declining the invites. Was not yet able to test.
- Updated spam definitions, and added a few additional mappings to charmap. Fixed a bug with charmap code not mapping certain characters correctly.
- Misc output window clean-up/colorization, only really matters for people who enable the output options.
v1.8
- Modified Spam Patterns based on feedback.
v1.7
- New Spam Pattern
v1.6
- Fix bug where Spam Notifications are always being sent. Quite annoying.
v1.5
- New Spam Definition
- Fixed bug with 'Reset to Defaults' which affected both UI and SavedVars.
v1.4
- additional definition for new spammer.
- fix a bug where spam dictionaries were being truncated when loaded into the settings UI.
- modified how spam and flood checks are performed, to better deal with spammers that pose as 'normal' chatters, and to filter out their 'non-spam' text as well.
v1.3
- Fix bug with Guild Invite Spam displaying debug text.
- Added option to display 'normalized' text for all checks, to assist with creating new patterns.
- Increased maximum possible flood time to 5 minutes, default is changed to 30 seconds.
v1.2
- Renamed LibStub registration as "LibAntiSpam" to facilitate polyfill creation.
- Deprecated 'IsSpam' method, add-on authors should use the new 'Check' method instead.
- Added support to Auto-Decline invites from 'Spammer Guilds'.
v1.1
- Adds additional mapping to catch a new spammer.
v1.0
- Initial release.
