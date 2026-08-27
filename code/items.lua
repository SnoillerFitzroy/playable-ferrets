local level = Game():GetLevel()

function MUSTELIDMOD:itemUsed_SatanReward(item, flag, player) -- Satan's Reward
	SFXManager():Play(SoundEffect.SOUND_FREEZE_SHATTER, 2, 0, false, 1)
	SFXManager():Play(SoundEffect.SOUND_FREEZE, 5, 0, false, 1, 0)
	local player = Isaac.GetPlayer()
	player:AddBlackHearts(1)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE then level:SetStateFlag(LevelStateFlag.STATE_SATANIC_BIBLE_USED, true) end
	-- Only Mustela should get Deals from his book. Others using the book are punished for taking his property <3
	MUSTELIDMOD:chillingBlast()
	MUSTELIDMOD:checkForSatanForms()
	if numS8nPresent > 0 then
		SFXManager():Play(SoundEffect.SOUND_SATAN_GROW, 3, 0, false, 1, 0)
		player:TakeDamage(1, DamageFlag.DAMAGE_FAKE, EntityRef(player), 0)
		player:UseActiveItem(CollectibleType.COLLECTIBLE_KAMIKAZE, false, false, true, false, -1)
	end
	return { Discharge = true, Remove = false, ShowAnim = true }
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_USE_ITEM, MUSTELIDMOD.itemUsed_SatanReward, MUSTELIDMOD_COLLECTIBLES.SATAN_REWARD)

function MUSTELIDMOD:itemUsed_BrokenHeart(item, flag, player) -- Mustela's Broken Heart
	local player = Isaac.GetPlayer()
	player:AddBrokenHearts(-1) player:AddMaxHearts(-4) player:AddBlackHearts(4)
	player:UseActiveItem(CollectibleType.COLLECTIBLE_CONVERTER, false)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.SOCKET then
		local accidentsHappen = math.random(3)
		if accidentsHappen == 3 then
			SFXManager():Play(SoundEffect.SOUND_HOLY_MANTLE, 2.25, 0, false, 1, 0)
			SFXManager():Play(SoundEffect.SOUND_SUPERHOLY, 1.25, 0, false, 1, 0)
			player:AddBrokenHearts(math.random(2))
		end
	end
	return { Discharge = true, Remove = false, ShowAnim = true }
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_USE_ITEM, MUSTELIDMOD.itemUsed_BrokenHeart, MUSTELIDMOD_COLLECTIBLES.BETRAYED_HEART)

local VoidNoodleSpawnables = { -- Table for Cesarean Scalpel occasionally dropping consumables
-- [[ Mythical (Weight: 1;   5) ]]
	36, -- Ansus
	37, -- Jera
	42, -- Chaos Card
	53, -- Ancient Recall
	83, -- Soul of Cain

-- [[ Legendary (Weight: 2;   5) ]]
	32, -- Hagalaz
	32, -- Hagalaz (2)
	35, -- Dagaz
	35, -- Dagaz (2)
	39, -- Algiz
	39, -- Algiz (2)
	90, -- Soul of Eden
	90, -- Soul of Eden (2)
	94, -- Soul of Apollyon
	94, -- Soul of Apollyon (2)

-- [[ Elusive (Weight: 3;   4) ]]
	40, -- Blank Rune
	40, -- Blank Rune (2)
	40, -- Blank Rune (3)
	43, -- Credit Card
	43, -- Credit Card (2)
	43, -- Credit Card (3)
	49, -- Dice Shard
	49, -- Dice Shard (2)
	49, -- Dice Shard (3)
	78, -- Cracked Key
	78, -- Cracked Key (2)
	78, -- Cracked Key (3)

-- [[ Rare (Weight: 4;   4) ]]
	38, -- Berkano
	38, -- Berkano (2)
	38, -- Berkano (3)
	38, -- Berkano (4)
	41, -- Black Rune
	41, -- Black Rune (2)
	41, -- Black Rune (3)
	41, -- Black Rune (4)
	81, -- Soul of Isaac
	81, -- Soul of Isaac (2)
	81, -- Soul of Isaac (3)
	81, -- Soul of Isaac (4)
	93, -- Soul of The Keeper
	93, -- Soul of The Keeper (2)
	93, -- Soul of The Keeper (3)
	93, -- Soul of The Keeper (4)

	-- [[ Common (Weight: 5;   3) ]]
	55, -- Rune Shard
	55, -- Rune Shard (2)
	55, -- Rune Shard (3)
	55, -- Rune Shard (4)
	55, -- Rune Shard (5)
	82, -- Soul of Magdelene
	82, -- Soul of Magdelene (2)
	82, -- Soul of Magdelene (3)
	82, -- Soul of Magdelene (4)
	82, -- Soul of Magdelene (5)
	92, -- Soul of Lilith
	92, -- Soul of Lilith (2)
	92, -- Soul of Lilith (3)
	92, -- Soul of Lilith (4)
	92, -- Soul of Lilith (5)

}
function MUSTELIDMOD:selfHarm(item, player) -- Cesarean Scalpel
	-- Variables
    local player = Isaac.GetPlayer()
	player:UseActiveItem(CollectibleType.COLLECTIBLE_VENTRICLE_RAZOR, false)
	local game = Game()
	local sfxManager = SFXManager()
	local sDamage = math.random(2)
	local sDistort = math.random(8)
	local mindFuckDuration = math.random(127) + 64
	-- Tainted Sablez
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.VOID then
		game:ShowHallucination(((mindFuckDuration +  math.random(160)) - 32) , BackdropType.DARK_CLOSET)
		if player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then
			MUSTELIDMOD:selfHarmSafely()
			MUSTELIDMOD:voidReward()
			if sDistort == 8 then
				MUSTELIDMOD:spaceDistortion()
				player:UseActiveItem(CollectibleType.COLLECTIBLE_TAMMYS_HEAD)
				player:UseActiveItem(CollectibleType.COLLECTIBLE_KAMIKAZE, false, false, true, false, -1)
			end
		else
			if sDamage < 2 then
				MUSTELIDMOD:selfHarmSafely()
			else
				MUSTELIDMOD:selfHarmDamage()
				player:UseActiveItem(CollectibleType.COLLECTIBLE_TAMMYS_HEAD)
			end
			if sDistort > 6 then
				player:UseActiveItem(CollectibleType.COLLECTIBLE_TAMMYS_HEAD)
				player:UseActiveItem(CollectibleType.COLLECTIBLE_KAMIKAZE, false, false, true, false, -1)
			end
			MUSTELIDMOD:voidReward()
		end
	else -- Not Tainted Sablez
		game:ShowHallucination( (mindFuckDuration - 48), BackdropType.DARK_CLOSET)
		MUSTELIDMOD:selfHarmSafely() player:UseActiveItem(CollectibleType.COLLECTIBLE_KAMIKAZE, false, false, true, false, -1)
		if sDistort == 1 then MUSTELIDMOD:spaceDistortion() end
	end
	return { Discharge = true, Remove = false, ShowAnim = true }
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_USE_ITEM, MUSTELIDMOD.selfHarm, MUSTELIDMOD_COLLECTIBLES.CESAREAN_SCALPEL)

function MUSTELIDMOD:rollForExtinction(item, player) -- Extinction Certificate
    local player = Isaac.GetPlayer()
	-- Roll 1/1000
    local ECRNG = math.random(1, 1000)
	if ECRNG <= 200 then player:AddBrokenHearts(2) end
	if ECRNG > 200 and ECRNG <= 500 then player:AddBrokenHearts(-1) end
	if ECRNG > 500 and ECRNG <= 800 then player:AddBrokenHearts(-2) end
	if ECRNG > 800 and ECRNG <= 990 then
		player:AddBrokenHearts(4)
		player:UseActiveItem(CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE, false)
	end
	if ECRNG > 990 then
		player:AddBrokenHearts(-1)
		player:UseActiveItem(CollectibleType.COLLECTIBLE_DEATH_CERTIFICATE, false)
	end
	return { Discharge = true, Remove = false, ShowAnim = true }
end MUSTELIDMOD:AddCallback(ModCallbacks.MC_USE_ITEM, MUSTELIDMOD.rollForExtinction, MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE)

function MUSTELIDMOD:drinkProzac(player, flag) -- Mustela's Medicine
local prozacTaken = player:GetCollectibleNum(MUSTELIDMOD_COLLECTIBLES.FLUOXETINE)
local player = Isaac.GetPlayer()
	if player:HasCollectible(MUSTELIDMOD_COLLECTIBLES.FLUOXETINE) then
	    if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE or player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.SOCKET then
	    	if flag == CacheFlag.CACHE_FIREDELAY then player.MaxFireDelay = player.MaxFireDelay * math.sqrt((1.28 * math.sqrt(math.sqrt(prozacTaken))))
				-- we take the square root of the number of copies of the item, so the absolute value of the tears down is less and less each time.
		    end
		    if flag == CacheFlag.CACHE_DAMAGE then player.Damage = (player.Damage * (2 * prozacTaken)) + (1 * prozacTaken)
				-- For Mustela or Tainted Mustela to get a bigger Damage Up from the item, we multiply that Damage up by the actual amount of copies of the item instead.
		    end
	    else
	    	if flag == CacheFlag.CACHE_FIREDELAY then
				player.MaxFireDelay = player.MaxFireDelay * math.sqrt((1.5 * math.sqrt(prozacTaken))) end
		    if flag == CacheFlag.CACHE_DAMAGE then
				player.Damage = (player.Damage * (2 * math.sqrt(prozacTaken))) + (1 * prozacTaken) end
	    end
	end
end MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.drinkProzac)

function MUSTELIDMOD:taintedSocketPickup(player, flag) -- Muistela's Tainted sockets
	local socketsOwned = player:GetCollectibleNum(MUSTELIDMOD_COLLECTIBLES.SOCKETS)
	if player:HasCollectible(MUSTELIDMOD_COLLECTIBLES.SOCKETS) then
		if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.SOCKET then
			if flag == CacheFlag.CACHE_FIREDELAY then player.MaxFireDelay = player.MaxFireDelay * (1.1 * math.sqrt(socketsOwned)) end
			if flag == CacheFlag.CACHE_DAMAGE then player.Damage = player.Damage + (1.75 * math.sqrt(socketsOwned)) end
			if flag == CacheFlag.CACHE_RANGE then player.TearRange = player.TearRange + 40 end
			if flag == CacheFlag.CACHE_LUCK then player.Luck = player.Luck + 2 end
		else
				if player:GetCollectibleNum(CollectibleType.COLLECTIBLE_PEEPER) < 2 then player:AddCollectible(CollectibleType.COLLECTIBLE_PEEPER) player:AddBrokenHearts(1) end
				if flag == CacheFlag.CACHE_FIREDELAY then player.MaxFireDelay = player.MaxFireDelay * (1.25 * math.sqrt(socketsOwned)) end
				if flag == CacheFlag.CACHE_DAMAGE then player.Damage = player.Damage + (1.5 * math.sqrt(socketsOwned)) end
				if flag == CacheFlag.CACHE_TEARFLAG then player.TearFlags = player.TearFlags | TearFlags.TEAR_TURN_HORIZONTAL end
				if flag == CacheFlag.CACHE_TEARCOLOR then player.TearColor = Color(1, 0.04, 0.04, 1.0, 0, 0, 0) end
				if flag == CacheFlag.CACHE_RANGE then player.TearRange = player.TearRange + 168 end
		end
	end
end MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.taintedSocketPickup)

function MUSTELIDMOD:catMemorialization(player, flag) -- Mischievous Corpse
	local player = Isaac.GetPlayer()
	if player:HasCollectible(MUSTELIDMOD_COLLECTIBLES.MEMORIAL) then
		if flag == CacheFlag.CACHE_FIREDELAY then player.MaxFireDelay = player.MaxFireDelay * 0.69 end
		local game = Game()
		if game:GetFrameCount() % 1 == 0 then
			if player:HasCollectible(CollectibleType.COLLECTIBLE_DEAD_CAT) then
				local creep = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, player.Position, Vector.Zero, player):ToEffect()
				creep.SpriteScale = Vector(2, 2)
				creep.Color = Color(0, 1, 1, 1.0, 0, 0.75, 1) -- Make it cyan
				creep:Update()
			else
				local creep = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, player.Position, Vector.Zero, player):ToEffect()
				creep.SpriteScale = Vector(0.05, 0.05)
				creep.Color = Color(0, 1, 1, 1.0, 0, 0.75, 1) 
				creep:Update()
			end
		end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.catMemorialization)
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, MUSTELIDMOD.catMemorialization)

function MUSTELIDMOD:chillingHaunt(item, player, flag) -- Hibernation
	local player = Isaac.GetPlayer()
	if player:HasCollectible(MUSTELIDMOD_COLLECTIBLES.HALO)then
		if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HALO then
			player:UseActiveItem(CollectibleType.COLLECTIBLE_DULL_RAZOR)
			player:UseActiveItem(CollectibleType.COLLECTIBLE_WAFER)
		end
		player:UseActiveItem(CollectibleType.COLLECTIBLE_SPOON_BENDER)
		player:UseActiveItem(CollectibleType.COLLECTIBLE_HOLY_MANTLE)
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_USE_ITEM, MUSTELIDMOD.chillingHaunt, MUSTELIDMOD_COLLECTIBLES.HALO)

function MUSTELIDMOD:rollTimeTravel(item, player, flag) -- Frantic Wormhole
	local player = Isaac.GetPlayer()
	if player:HasCollectible(MUSTELIDMOD_COLLECTIBLES.HOLE) then
		-- Seasons to reference:
		-- Winter, Spring, Summer, Fall, Tornado, Wildfire
		local time = math.random(1, 6)
		if time == 1 then -- winter
			player:UseActiveItem(CollectibleType.COLLECTIBLE_TORN_PHOTO)
			player:UseActiveItem(CollectibleType.COLLECTIBLE_SAD_ONION)
			local rollKrampus = math.random(1, 31)
			if rollKrampus <= 10 then
				player:UseActiveItem(CollectibleType.COLLECTIBLE_MYSTERY_GIFT)
			end
		elseif time == 2 then -- spring
			player:UseActiveItem(CollectibleType.COLLECTIBLE_MAGIC_8_BALL)
			player:UseActiveItem(CollectibleType.COLLECTIBLE_PENTAGRAM)
		elseif time == 3 then -- tornado
			player:UseActiveItem(CollectibleType.COLLECTIBLE_BELT)
			player:UseActiveItem(CollectibleType.COLLECTIBLE_SAD_ONION)
		elseif time == 4 then -- summer
			player:UseActiveItem(CollectibleType.COLLECTIBLE_MOMS_HEELS)
			player:UseActiveItem(CollectibleType.COLLECTIBLE_PENTAGRAM)
			local rollSolarPower = math.random(1, 9)
			if rollSolarPower == 1 then
				player:UseCard(Card.CARD_SUN)
			end
		elseif time == 5 then -- wildfire
			player:UseActiveItem(CollectibleType.COLLECTIBLE_MOMS_HEELS)
			player:UseActiveItem(CollectibleType.COLLECTIBLE_BELT)
			player:UseActiveItem(CollectibleType.COLLECTIBLE_PYROMANIAC)
		elseif time == 6 then -- fall
			player:UseActiveItem(CollectibleType.COLLECTIBLE_MAGIC_8_BALL)
			player:UseActiveItem(CollectibleType.COLLECTIBLE_SAD_ONION)
		end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_USE_ITEM, MUSTELIDMOD.rollTimeTravel, MUSTELIDMOD_COLLECTIBLES.HOLE)

function MUSTELIDMOD:checkForSatanForms() -- "If Satan is here" easter egg
	s8n = Isaac.CountEntities(nil, 84, 0, 0)
	s8n_foot = Isaac.CountEntities(nil, 84, 10, 0)
	s8n_mega = Isaac.CountEntities(nil, 274, 0, 0)
	s8n_skull = Isaac.CountEntities(nil, 275, 0, 0)
	numS8nPresent = s8n + s8n_foot + s8n_mega + s8n_skull
	return numS8nPresent
end

function MUSTELIDMOD:chillingBlast() -- The chilling effect from Satan's Reward.
-- It's in a separate function so that I can call it with his Soul Stone later on.
	local entities = Isaac.GetRoomEntities()
	local player = Isaac.GetPlayer()
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE then
		for _, entity in ipairs(entities) do
			if entity:IsActiveEnemy() then
				entity:AddSlowing(EntityRef(player), 60, 0.5, Color(0.64, 0.85, 1, 1, 0, 0, 0))
			end
		end
	else
		for _, entity in ipairs(entities) do
			if entity:IsActiveEnemy() and entity:IsVulnerableEnemy() then
				entity:AddSlowing(EntityRef(player), 30, 0.75, Color(0.64, 0.85, 1, 1, 0, 0, 0))
			end
		end
	end
end

function MUSTELIDMOD:selfHarmSafely(player) -- Fake damage from Cesarean Scalpel
	local player = Isaac.GetPlayer()
	player:TakeDamage(1, DamageFlag.DAMAGE_FAKE, EntityRef(player), 0)
end

function MUSTELIDMOD:selfHarmDamage(player) -- Real Damage from Cesarean Scalpel
	local player = Isaac.GetPlayer()
	player:TakeDamage(1, DamageFlag.DAMAGE_NO_PENALTIES | DamageFlag.DAMAGE_NO_MODIFIERS | DamageFlag.DAMAGE_NOKILL, EntityRef(player), 0)
end

function MUSTELIDMOD:spaceDistortion(player) -- Rare effect from Cesarean Scalpel when Tainted Sablez has Birthright
    local player = Isaac.GetPlayer()
	local sfxManager = SFXManager()
	SFXManager():Play(SoundEffect.SOUND_DOGMA_BLACKHOLE_CLOSE, 2.5, 0, false, 1)
	local x = math.random(17)
	if x > 6 then player:UseActiveItem(CollectibleType.COLLECTIBLE_DIPLOPIA, false) end
	if x < 12 then Isaac.Spawn(5, 300, 49, player.Position, Vector.Zero, nil) end
end

function MUSTELIDMOD:voidReward() -- Chance for Tainted Sablez to summon a consumable
	local spawner = math.random(7)
	local player = Isaac.GetPlayer()
	if spawner == 7 then
		local voidNoodleDropSubType = math.random(#VoidNoodleSpawnables)
		Isaac.Spawn(5, 300, VoidNoodleSpawnables[voidNoodleDropSubType], player.Position, Vector.Zero, nil)
	end
end

function MUSTELIDMOD:activateExtinctionEvent(player) -- Grant Extinction Certificate when the conditions are met
	local player = Isaac.GetPlayer()
	local hasReward = player:HasCollectible(MUSTELIDMOD_COLLECTIBLES.SATAN_REWARD) -- Does he have Satan's Reward?
	local hasTrauma = player:HasCollectible(MUSTELIDMOD_COLLECTIBLES.BETRAYED_HEART) -- Does he have MBH?
	local gotCertified = player:HasCollectible(MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE) -- Does he have Extinction?
	
	-- Only for Mustela/Tainted Mustela
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE or MUSTELIDMOD_CHARACTERS.SOCKET then
		if hasReward and hasTrauma then -- If Mustela has both his pocket actives
			-- play some sounds to indicate something happened!
		    SFXManager():Play(SoundEffect.SOUND_DOGMA_BLACKHOLE_CHARGE, 2.56, 0, false, 1)
		    SFXManager():Play(SoundEffect.SOUND_SATAN_ROOM_APPEAR, 1.5, 0, false, 1)
			-- Delete both pocket actives
			player:RemoveCollectible(MUSTELIDMOD_COLLECTIBLES.SATAN_REWARD)
			player:RemoveCollectible(MUSTELIDMOD_COLLECTIBLES.BETRAYED_HEART)
			-- Grant Extinction
			player:SetPocketActiveItem(MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE, ActiveSlot.SLOT_POCKET, false)
			-- Start uncharged. No free DCs!
		    player:SetActiveCharge(0, ActiveSlot.SLOT_POCKET)
		end
		
		-- Did the player get another MBH or SR? BOTH items can spawn for BOTH forms!
		if gotCertified and (hasReward or hasTrauma) then
			-- play some sounds to indicate something happened!
			SFXManager():Play(SoundEffect.SOUND_SATAN_CHARGE_UP, 2, 0, false, 1)
			-- Modifying an item's charge to increase it does not play the battery sound! Let's fix that!
			SFXManager():Play(SoundEffect.SOUND_BATTERYCHARGE, 2.5, 0, false, 1)
			-- delete BOTH pocket active items. Maybe hte player wanted to take a second copy of either of Mustela's pockets
			-- after procing DC from EC??? I don't know why they would do that but we have to account for it!
			if hasReward then player:RemoveCollectible(MUSTELIDMOD_COLLECTIBLES.SATAN_REWARD) end
			if hasTrauma then player:RemoveCollectible(MUSTELIDMOD_COLLECTIBLES.BETRAYED_HEART) end
			-- What if they get DC for real and took EC?
			player:RemoveCollectible(MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE)
			-- Now to make SURE EC is in the POCKET slot, NOT the main slots!
			player:SetPocketActiveItem(MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE, ActiveSlot.SLOT_POCKET, false)
			-- Max out the charge
			player:SetActiveCharge(31, ActiveSlot.SLOT_POCKET)
		end

		-- What if hey pick up another Extinction Certificate? The whole point is that they can go to DC dimension more than once!
		if player:GetCollectibleNum(MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE) > 1 then
			--[[ Remove it THREE times, in case they somehow have one in each Schoolbag slot, WHILE already having it in the pocket.
			I don't know if the Pocket is done first or last, so I'm doing all three slots just ot make sure. ]]
			player:RemoveCollectible(MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE)
			player:RemoveCollectible(MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE)
			player:RemoveCollectible(MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE)
			-- Now to make SURE EC is in the POCKET slot, NOT the main slots!
			player:SetPocketActiveItem(MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE, ActiveSlot.SLOT_POCKET, false)
			-- Max out the charge
			player:SetActiveCharge(31, ActiveSlot.SLOT_POCKET)
		end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.activateExtinctionEvent)
