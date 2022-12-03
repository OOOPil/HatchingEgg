local ProxPrompt = script.Parent
local HatchEvent = game:GetService("ReplicatedStorage").EggHatch
local egg = game.Workspace["Void Egg"]
local HatchingSystem = require(game.ServerStorage.HatchingSystem)
local PetList = game.ServerStorage.VoidPetList
local PRICE = 500
local Hatching = false

ProxPrompt.Triggered:Connect(function(Player)
	if not Hatching then
		Hatching = true
	if Player:WaitForChild("leaderstats"):WaitForChild("Cash").Value >= PRICE then
		local PickedPet = HatchingSystem.HatchPet(PetList)
		Player:FindFirstChild("leaderstats"):WaitForChild("Cash").Value -= PRICE
		
		print(Player.Name)
			
			if Player.Pets:FindFirstChild(PickedPet.Pet.Name) then
				Player.Pets:FindFirstChild(PickedPet.Pet.Name).Value += 1 
			else
				local NumVal = Instance.new("NumberValue", Player.Pets)
				NumVal.Name = PickedPet.Pet.Name
				NumVal.Value = 1
			end
			
		HatchEvent:FireClient(Player, PickedPet)
		HatchEvent.OnServerEvent:Wait()
		Hatching = false	
			
	else
		print("Not Enough")
		Hatching = false
	end
		
	end
end)
