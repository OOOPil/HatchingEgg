local Egg = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VoidEggHatch").View.Egg
local PetViewer = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("PetHatch")
local Camera = game.Workspace.Camera
local Hatching = game:GetService("ReplicatedStorage").EggHatch
local HatchOffset = 20
local FullHatches = 6 -- how many times to shake the egg

------------
local TweenService = game:GetService("TweenService")
local Anim = {}
Anim.CFrame = Egg.CFrame * CFrame.Angles(math.rad(HatchOffset), 0, 0)
local TweenInf = TweenInfo.new(.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, FullHatches, true, 0)
------------

Hatching.OnClientEvent:Connect(function(PetTable)
	
	game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VoidEggHatch").Enabled = true
	
	local tickStart = tick()
	
	local Tween = TweenService:Create(Egg, TweenInf, Anim)
	
	Tween:Play()
	
	Tween.Completed:Wait()
	
	game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("VoidEggHatch").Enabled = false
	
	PetViewer.Enabled = true
	
	
	local Clone = PetTable.Pet:Clone()

	Clone.Parent = PetViewer.View
	
	PetViewer.View.PetName.Text = PetTable.Pet.Name
	
	local ts = game:GetService("TweenService")


	local tween1 = ts:Create(Clone, TweenInfo.new(.4, Enum.EasingStyle.Sine), {Orientation = Clone.Orientation + Vector3.new(0, -100, 0)})
	tween1:Play()

	tween1.Completed:Once(function()
		ts:Create(Clone, TweenInfo.new(.6, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {Orientation = Clone.Orientation + Vector3.new(0, 460, 0)}):Play()
	end)
		
	wait(1.5)
	Clone:Destroy()
	
	PetViewer.Enabled = false
	wait(1)
	
	print(PetTable.Strength)
	
	
	
	Hatching:FireServer("Finished Hatching"..PetTable.Pet.Name)
	
end)


