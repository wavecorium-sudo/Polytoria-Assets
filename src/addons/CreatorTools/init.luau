--[[
	Creator Tools made by ericmasterofwars | v0.0.1 - 27/6/2026

	Setup:
	Edit the rotate and tilt keycode below to whatever you want.
	Check the module script parented under this script to change the
	rotate and tilt offset.
]]

local ROTATE_KEYCODE = Enums.KeyCode.R
local TILT_KEYCODE = Enums.KeyCode.T

local CreatorTools = require(script.CreatorTools)

local Addon = Addons:Register("Creator Tools")
Addon.AddonName = "Creator Tools"

local Init = Addon:CreateToolItem("Init")
local Close = Addon:CreateToolItem("Close")

Init.Pressed:Connect(function()
	CreatorTools:Init(Selections, ROTATE_KEYCODE, TILT_KEYCODE)
	print("Creator tools initalized!")	
end)

Close.Pressed:Connect(function()
	print("Closing creator tools...")
	CreatorTools:Cleanup()
end)
