--[[
  * Wykkyd's [ Framework ]
  * Sponsored & Supported by: Mostly Harmless (mostly-harmless-guild.com)
  * Author: Wykkyd, aka Wykkyd Gaming (wykkyd.gaming@gmail.com)
  * Toolbar & Subtitles originally by Bazgrim.
  * Embedded: LibStub & libAddonMenu by Seerah.
  * Special Thanks To: Zenimax Online Studios & Bethesda for The Elder Scrolls Online
  * 
  * This Framework is supplied as a simplified, elegant utility for addon developers
  * to quickly and easily implement robust, completely dynamic features without alot
  * of the complex, often repetitive, programming that would typically be needed.
  *
  * This library is provided free and 'as is' with no guarantees or conditions. You
  * may use, change and distribute this library bundled within your addon(s) to any
  * extent that you wish. I simply ask that common courtesy be adhered to and that
  * the original development team lead by Wykkyd of Mostly Harmless be given the 
  * credit that they are due.
  * 
  * Updates will be provided as often as necessary and possible. It is up to each
  * addon developer to keep their own addons up to date, however, and it will be the
  * sole responsibility of the addon developer(s) who distribute this library to keep
  * their own addon(s) up to date, regardless of the utilization of this library or
  * any errors that may be incurred from the usage of this addon library until such a
  * time as the development team finds the time and resources with which 
  * to update this library itself. It will then, after said update, be each individual
  * addon developer(s)' responsibility to distribute the updated library, had they
  * distributed it along with their addon originally.
  * 
  * If you would like to contribute to the development of this addon or join our dev team
  * or guild, please visit our guild website or contact @Wykkyd in game.
  *
  * Macro Doc: https://docs.google.com/document/d/12mnkKgI3Th2-xWauRLu3AYtvzTKrvT3-YKnTjNkQi5A
  * API Doc: https://docs.google.com/document/d/1-mfVYEwYHM1UGHNHCQPJqyAu6AJ9ho601sl1D_6H8sw
  *
]]--

if not wykkydsFramework then wykkydsFramework = {} end 
wykkydsFramework.__index = wykkydsFramework

wykkydsFramework.AddonID = "mhFramework"
wykkydsFramework.Ready = false
wykkydsFramework.AddonName = "[WF] Framework"
wykkydsFramework.AddonAbbrev = "wf"
wykkydsFramework.AddonVersion = "1.4.14.1"
wykkydsFramework.AddonDescr = wykkydsFramework.AddonName .. " v" .. wykkydsFramework.AddonVersion
