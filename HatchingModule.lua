local HatchingSystem = {}
local PetStats = require(game.ServerStorage.PetStats)

HatchingSystem.HatchPet = function(PetList)
	
	local Pets = require(PetList)
	

		local value = math.random(0,100)
		local count = 0

	for rarity, number in pairs(Pets.Rarities) do
			count += number

		if value <= count then
			local PetTable = Pets.Pets[rarity]
			local NewPet = PetTable[math.random(1,#PetTable)]
			local RandomStrength = math.random(PetStats.Stats[NewPet.Name].MinimumDamage, PetStats.Stats[NewPet.Name].MaximumDamage)
			return {
				["Pet"] = NewPet,
				["Strength"] = RandomStrength,
			}
		end
		
	end
	
end


return HatchingSystem
