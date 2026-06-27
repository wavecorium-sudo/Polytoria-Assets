-- adjust these both if u wanna
local ROTATION = 45
local TILT = 45

local CreatorTools = {}

local inputEvent: PTSignalConnection

local function isDynamic(inst: Dynamic)
	return inst and (
		inst:IsA("Part") or
		inst:IsA("Mesh") or
		inst:IsA("Model")
	)	
end

local function onRotate(Selections)
	local selection = Selections:GetSelected()
	for _, part in selection do
		if isDynamic(part) then
			print("Rotating "..part.Name)
			part.Quaternion *= Quaternion.Euler(0, ROTATION, 0)
		end
	end
end

local function onTilt(Selections)
	local selection = Selections:GetSelected()
	for _, part in selection do
		if isDynamic(part) then
			print("Tilting "..part.Name)
			part.Quaternion *= Quaternion.Euler(0, 0, TILT)
		end
	end
end

function CreatorTools:Init(Selections, rotateKeycode, tiltKeycode)
	-- due to some UNKNOWN reasons, i couldn't get to use InputButtons
	-- cus they would sometimes work and sometimes not work
	inputEvent = Input.KeyDown:Connect(function(keycode: KeyCode)
		if keycode == rotateKeycode then
			onRotate(Selections)
		elseif keycode == tiltKeycode then
			onTilt(Selections)
		end
	end)
end

function CreatorTools:Cleanup()
	if inputEvent then
		inputEvent:Disconnect()
	end
end

return CreatorTools
