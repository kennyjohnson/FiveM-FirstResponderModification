--[[
Do Not Edit This Section
--]]
FirstResponderMod = {}
FirstResponderMod.Config = {}



--[[
Default / Game Configurations ( THIS IS NOT WHERE YOU ADD OR REMOVE JOBS, DEPARTMENTS, ETC. )
--]]

FirstResponderMod.Config.BaseJobs = { -- True = Enabled, False = Disabled
  
  "Civilian" = true,
  "Taxi Driver" = true,
  "Delivery Driver" = true,
  "Tow Truck Operator" = true,
  "Police Officer" = true,
  "Sheriff Deputy" = true,
  "Medic" = true,
  "Firefighter" = true,
  "Criminal" = true,
  "Governor" = true
  
}

FirstResponderMod.Config.Departments = {
  
  "Los Santos Police Department" = true,
  "Blaine County Sheriff Office" = true,
  "San Andreas Fire Rescue" = true,
  "San Andreas Medical Service" = true
  
}

--[[
First Responder Mod Main Configuraiton
--]]

FirstResponderMod.Config.DefaultJobId = "ID_CIVILIAN",
FirstResponderMod.Config.StartingCash = "5000",
FirstResponderMod.Config.PayCycle = "900", -- In Seconds
FirstResponderMod.Config.AllowJobSwitching = true, -- Allow players to choose their jobs
FirstResponderMod.Config.RoleplayName = true, -- Allow players to set a Roleplay Name ( Admins can view real name )
FirstResponderMod.Config.VehicleLock = false, -- Vehicles are able to be locked
FirstResponderMod.Config.AnnounceDeaths = false, -- whether Death Notifications are shown
FirstResponderMod.Config.DynamicVoice = true, -- Where FRM Voice is enabled
FirstResponderMod.Config.EnforcePlayerModels = true, -- Whether players must use thier job specific models ( If specified in jobconfig )
FirstResponderMod.Config.ShowName = 2, -- 1 is all players can see Real + Roleplay Name, 2 is all players can see Roleplay Name and admins view Real name, 3 only admins can view names
FirstResponderMod.Config.AllOOC = true, -- Any chat message without a command is sent as OOC
FirstResponderMod.Config.BaseLaws = true, -- Base laws will always be used
FirstResponderMod.Config.ResetLaws = true, -- After mayor leaves or quits, custom laws reset  
FirstResponderMod.Config.Taxes = false, -- Whether taxes are put on payments and shop purchases
FirstResponderMod.Config.WantedRespawn = true, -- Whether a player is wanted on respawn
FirstResponderMod.Config.CustomJailTime = false, -- Whether cops can set a jailtime upon arrest
FirstResponderMod.Config.MaxJailTime = false, -- if CustomJailTime is enabled, this is the max
FirstResponderMod.Config.DefaultJailTime = 180, -- If CustomJailTime is disabled, this is the default jail time
FirstResponderMod.Config.RunSpeed = 2, -- 1 is Slow, 2 is Normal, 3 is Fast, 4 is Superfast
FirstResponderMod.Config.PoliceRunSpeed = 3,

--[[
Voice and Talking Options, Similar to Inches
--]]

FirstResponderMod.Config.talkDistance = 250
FirstResponderMod.Config.whisperDistance = 90
FirstResponderMod.Config.yellDistance = 550
FirstResponderMod.Config.meDistance = 250
FirstResponderMod.Config.voiceDistance = 550

