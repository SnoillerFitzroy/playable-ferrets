<<<<<<< HEAD
function MUSTELIDMOD:populationBomb(tear, player, cacheFlag)
	local player = Isaac.GetPlayer()
	-- If the player is one of the ferrets that is part of this mod
	if (player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE
		or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.SOCKET
		or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.FIRE
		or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.VOID
		or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HALO
		--[[ or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HOLY ]] )
		and player:HasCollectible(CollectibleType.COLLECTIBLE_C_SECTION) then -- And if they have C Section
			local player = tear.SpawnerEntity
			if player ~= nil then -- If the player exists
				player = player:ToPlayer() -- Store them in a variable
				if tear.Variant ~= MUSTELIDMOD_FERRET_FETUS_TEAR then -- If the tear isn't a ferret fetus tear...
					local kitsprite = tear:GetSprite()
					tear:ChangeVariant(MUSTELIDMOD_FERRET_FETUS_TEAR) -- turn it into one.
					kitsprite:Load("gfx/002.8500_fetus tear.anm2")
					kitsprite:ReplaceSpritesheet(0, "gfx/kits.png") -- Then replace its graphics
					kitsprite:LoadGraphics()
					kitsprite:Play("Rotate2") -- ...and render it!
				end
			end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, MUSTELIDMOD.populationBomb)

function MUSTELIDMOD:pissOffPalkia(tear, player, cacheFlag) -- Tainted Sablez Birthright
	local player = Isaac.GetPlayer()
	-- If you're playing Tainted Sablez and have Birthright
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.VOID and player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then
		-- Roll some RNG
		local spaceDestabilization = math.random(1024)
		local spaceDistortion = math.random(1024)
		local player = tear.SpawnerEntity
		if player ~= nil then
			player = player:ToPlayer()
			if spaceDestabilization <= 260 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_ATTRACTOR -- A random chance for having Attractor tears
			end
			if spaceDistortion < 205 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_RIFT -- A different chance for having Rift tears
			end
			if tear.Variant ~= MUSTELIDMOD_FERRET_FETUS_TEAR then
				-- Same code for having C Section. Make the tears become Ferret Fetus Tears and render those kits!
				local kitsprite = tear:GetSprite()
				tear:ChangeVariant(MUSTELIDMOD_FERRET_FETUS_TEAR)
				kitsprite:Load("gfx/002.8500_fetus tear.anm2")
				kitsprite:ReplaceSpritesheet(0, "gfx/kits.png")
				kitsprite:LoadGraphics()
				kitsprite:Play("Rotate3")
			end
		end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, MUSTELIDMOD.pissOffPalkia)

function MUSTELIDMOD:randomizeTemperature(tear, player, cacheFlag)
	local player = Isaac.GetPlayer()
	-- If you're Mustela and have Birthright
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE and player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then
		-- Roll RNG
		local temperatureRNG = math.random(999)
		local player = tear.SpawnerEntity
		if player ~= nil then
			player = player:ToPlayer()
			if temperatureRNG <= 250 then -- Approximately 1/4 chance for Uranus tear effect
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_ICE
			end
		end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, MUSTELIDMOD.randomizeTemperature)

function MUSTELIDMOD:cryMeABlizzard(tear, player, cacheFlag) -- Wintasm's tears!!!
	local player = Isaac.GetPlayer()
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HALO then -- If you're Wintasm
		-- Luck Influence
		local luckModifier = player.Luck * 0.25
		-- Floor the luck modifier at 0 so negative luck doesn't punish Wintasm.
		if luckModifier < 0 then
			luckModifier = 0
			return luckModifier
		end
		-- Roll some RNG	
		local blessedRNG = (math.random() * 11) + luckModifier
		print("blessed RNG is " .. blessedRNG)
		local blizzardRNG = (math.random() * 9) + luckModifier
		print("blizzard RNG is " .. blizzardRNG)
		local splatRNG = (math.random() * 3) + luckModifier
		print("splat RNG is " .. splatRNG)
		local quadRNG = (math.random() * 3) + luckModifier
		print("split RNG is " .. quadRNG)
		local player = tear.SpawnerEntity
		if player ~= nil then
			player = player:ToPlayer()
			if blessedRNG >= 11 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_LIGHT_FROM_HEAVEN
			end
			if blizzardRNG >= 9 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_ICE
			end
			if splatRNG >= 3 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_BURSTSPLIT
			end
			if quadRNG >= 3 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_QUADSPLIT
			end
		end
	end
end
=======
function MUSTELIDMOD:populationBomb(tear, player, cacheFlag)
	local player = Isaac.GetPlayer()
	-- If the player is one of the ferrets that is part of this mod
	if (player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE
		or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.SOCKET
		or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.FIRE
		or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.VOID
		or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HALO
		--[[ or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HOLY ]] )
		and player:HasCollectible(CollectibleType.COLLECTIBLE_C_SECTION) then -- And if they have C Section
			local player = tear.SpawnerEntity
			if player ~= nil then -- If the player exists
				player = player:ToPlayer() -- Store them in a variable
				if tear.Variant ~= MUSTELIDMOD_FERRET_FETUS_TEAR then -- If the tear isn't a ferret fetus tear...
					local kitsprite = tear:GetSprite()
					tear:ChangeVariant(MUSTELIDMOD_FERRET_FETUS_TEAR) -- turn it into one.
					kitsprite:Load("gfx/002.8500_fetus tear.anm2")
					kitsprite:ReplaceSpritesheet(0, "gfx/kits.png") -- Then replace its graphics
					kitsprite:LoadGraphics()
					kitsprite:Play("Rotate2") -- ...and render it!
				end
			end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, MUSTELIDMOD.populationBomb)

function MUSTELIDMOD:pissOffPalkia(tear, player, cacheFlag) -- Tainted Sablez Birthright
	local player = Isaac.GetPlayer()
	-- If you're playing Tainted Sablez and have Birthright
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.VOID and player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then
		-- Roll some RNG
		local spaceDestabilization = math.random(1024)
		local spaceDistortion = math.random(1024)
		local player = tear.SpawnerEntity
		if player ~= nil then
			player = player:ToPlayer()
			if spaceDestabilization <= 260 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_ATTRACTOR -- A random chance for having Attractor tears
			end
			if spaceDistortion < 205 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_RIFT -- A different chance for having Rift tears
			end
			if tear.Variant ~= MUSTELIDMOD_FERRET_FETUS_TEAR then
				-- Same code for having C Section. Make the tears become Ferret Fetus Tears and render those kits!
				local kitsprite = tear:GetSprite()
				tear:ChangeVariant(MUSTELIDMOD_FERRET_FETUS_TEAR)
				kitsprite:Load("gfx/002.8500_fetus tear.anm2")
				kitsprite:ReplaceSpritesheet(0, "gfx/kits.png")
				kitsprite:LoadGraphics()
				kitsprite:Play("Rotate3")
			end
		end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, MUSTELIDMOD.pissOffPalkia)

function MUSTELIDMOD:randomizeTemperature(tear, player, cacheFlag)
	local player = Isaac.GetPlayer()
	-- If you're Mustela and have Birthright
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE and player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then
		-- Roll RNG
		local temperatureRNG = math.random(999)
		local player = tear.SpawnerEntity
		if player ~= nil then
			player = player:ToPlayer()
			if temperatureRNG <= 250 then -- Approximately 1/4 chance for Uranus tear effect
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_ICE
			end
		end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, MUSTELIDMOD.randomizeTemperature)

function MUSTELIDMOD:cryMeABlizzard(tear, player, cacheFlag) -- Wintasm's tears!!!
	local player = Isaac.GetPlayer()
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HALO then -- If you're Wintasm
		-- Luck Influence
		local luckModifier = player.Luck * 0.25
		-- Floor the luck modifier at 0 so negative luck doesn't punish Wintasm.
		if luckModifier < 0 then
			luckModifier = 0
			return luckModifier
		end
		-- Roll some RNG	
		local blessedRNG = (math.random() * 11) + luckModifier
		print("blessed RNG is " .. blessedRNG)
		local blizzardRNG = (math.random() * 9) + luckModifier
		print("blizzard RNG is " .. blizzardRNG)
		local splatRNG = (math.random() * 3) + luckModifier
		print("splat RNG is " .. splatRNG)
		local quadRNG = (math.random() * 3) + luckModifier
		print("split RNG is " .. quadRNG)
		local player = tear.SpawnerEntity
		if player ~= nil then
			player = player:ToPlayer()
			if blessedRNG >= 11 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_LIGHT_FROM_HEAVEN
			end
			if blizzardRNG >= 9 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_ICE
			end
			if splatRNG >= 3 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_BURSTSPLIT
			end
			if quadRNG >= 3 then
				tear.TearFlags = tear.TearFlags | TearFlags.TEAR_QUADSPLIT
			end
		end
	end
end
>>>>>>> origin
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_FIRE_TEAR, MUSTELIDMOD.cryMeABlizzard)