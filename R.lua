local Players = game:GetService("Players")
local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local function onCharacterAdded(char)
	local humanoid = char:WaitForChild("Humanoid")
	camera.CameraType = Enum.CameraType.Custom
	camera.CameraSubject = humanoid

	humanoid.Died:Connect(function()
		-- Ждём респавн персонажа
		local newChar = player.CharacterAdded:Wait()
		local newHumanoid = newChar:WaitForChild("Humanoid")
		camera.CameraType = Enum.CameraType.Custom
		camera.CameraSubject = newHumanoid
	end)
end

player.CharacterAdded:Connect(onCharacterAdded)
if player.Character then
	onCharacterAdded(player.Character)
end
