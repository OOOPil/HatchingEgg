local Pets = {}

Pets.Pets = {
	    ["Rare"] = {game.ReplicatedStorage.Pets.RedPanda};
		["Uncommon"] = {game.ReplicatedStorage.Pets.Panda};
		["Common"] = {game.ReplicatedStorage.Pets.Cat, game.ReplicatedStorage.Pets.Dog};

	}


Pets.Rarities = {
	    ["Rare"] = 10;
		["Uncommon"] = 30;
		["Common"] = 60;
	}


return Pets
