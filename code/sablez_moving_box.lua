--[[This is a heavily modified version of the script for the Moving Box mod - you know,
the one that became a real item in the game. The main difference in using this script
is that I can give her a different cap of items and pickups to put in the box, and
this lets me give the item a unique look that's relevant to her lore. I also removed the
Car Battery effects because I don't find it to be a useful functionality for what I'm
intending for Sablez to be able to do.
Actually, never mind about Car Battery. apparently, from further testing, this is the
ONLY ACTIVE ITEM I HAVE that **AUTOMATICALLY** does something with Car Battery, no
custom code required, despite being the only one I don't want having Car Battery functionality.
This is why I smoke weed.]]

local game = Game()

sblzPokeActive = {
	IDEMPTY = MUSTELIDMOD_COLLECTIBLES.VOIDED_STORAGE_EMPTY,
	IDFULL = MUSTELIDMOD_COLLECTIBLES.VOIDED_STORAGE_FULL,
	EMPTY = true,
	PICKUPS = {},
	MAX = 8
}


local fertVoid_SaveData
function fertVoid_SaveData()
	local strTosave = ""
	for i = 1, #(sblzPokeActive.PICKUPS) do
		if i == 1 then
			strTosave = sblzPokeActive.PICKUPS[i].Type.."+"..sblzPokeActive.PICKUPS[i].Variant.."+"..sblzPokeActive.PICKUPS[i].SubType.."+"..sblzPokeActive.PICKUPS[i].Charge
		else
			strTosave = strTosave..","..sblzPokeActive.PICKUPS[i].Type.."+"..sblzPokeActive.PICKUPS[i].Variant.."+"..sblzPokeActive.PICKUPS[i].SubType.."+"..sblzPokeActive.PICKUPS[i].Charge
		end
	end
	Isaac.DebugString("[MUSTELA] Saving "..strTosave)
	Isaac.SaveModData(MUSTELIDMOD, strTosave)
end

function string:fertVoid_Split( inSplitPattern, outResults )
  if not outResults then
	outResults = { }
  end
  local theStart = 1
  local theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
  while theSplitStart do
	table.insert( outResults, string.sub( self, theStart, theSplitStart-1 ) )
	theStart = theSplitEnd + 1
	theSplitStart, theSplitEnd = string.find( self, inSplitPattern, theStart )
  end
  table.insert( outResults, string.sub( self, theStart ) )
  return outResults
end

local fertVoid_LoadData
function fertVoid_LoadData() 
	local player = Isaac.GetPlayer(0)
	sblzPokeActive.PICKUPS = {}
	if(Isaac.HasModData(MUSTELIDMOD)) then
		local fvStr = Isaac.LoadModData(MUSTELIDMOD)
		Isaac.DebugString("[MUSTELA] Loading "..fvStr)
		local savedPickups = fvStr:fertVoid_Split(",")
		j = 0
		for i = 1, #savedPickups do
			if savedPickups[i] ~= nil and savedPickups[i] ~= "" then
				Isaac.DebugString("[MUSTELA] Entity "..savedPickups[i])
				strEntity = savedPickups[i]
				pickup = strEntity:fertVoid_Split("+")
				j = j + 1
				local p = { Type = tonumber(pickup[1]), Variant = tonumber(pickup[2]), SubType = tonumber(pickup[3]), Charge = tonumber(pickup[4])}
				sblzPokeActive.PICKUPS[j] = p
			end
		end
	end
	sblzPokeActive.EMPTY = (j == 0)
	--if player:HasCollectible(sblzPokeActive.IDFULL) and (sblzPokeActive.EMPTY == true) then
		--player:SetPocketActiveItem(sblzPokeActive.IDEMPTY,  ActiveSlot.SLOT_POCKET, false)
	--elseif player:HasCollectible(sblzPokeActive.IDEMPTY) and (sblzPokeActive.EMPTY == false) then
		--player:SetPocketActiveItem(sblzPokeActive.IDFULL, ActiveSlot.SLOT_POCKET, false)
	--end
end

function table.fertVoid_Clone(org)
  return {table.unpack(org), }
end

local fertVoid_Pack
function fertVoid_Pack()
	local player = Isaac.GetPlayer(0)
	local entities = Isaac.GetRoomEntities()
	local j = 0
	local theresOptionCount = 0
	sblzPokeActive.PICKUPS = {}
	SFXManager():Play(SoundEffect.SOUND_DOGMA_BLACKHOLE_CLOSE, 1.4, 0, false, 1)
	SFXManager():Play(SoundEffect.SOUND_STATIC, 2, 0, false, 1)
	
	-- 1 in 5 chance to activate Coupon, making one purchase pickup/item in the room free to take
	local buyout = math.random(5)
	if buyout == 5 then player:UseActiveItem(CollectibleType.COLLECTIBLE_COUPON, false) end

	-- moving box style functionality
	for i = 1, #entities do	
		if entities[i].Type == EntityType.ENTITY_PICKUP then
			local ePickup = entities[i]:ToPickup()
			local isChest = entities[i].Variant == PickupVariant.PICKUP_CHEST or entities[i].Variant == PickupVariant.PICKUP_BOMBCHEST or entities[i].Variant == PickupVariant.PICKUP_SPIKEDCHEST or entities[i].Variant == PickupVariant.PICKUP_ETERNALCHEST or entities[i].Variant == PickupVariant.PICKUP_LOCKEDCHEST or entities[i].Variant == PickupVariant.PICKUP_REDCHEST
			local dontSave = (ePickup.TheresOptionsPickup and theresOptionCount > 0) or ePickup:IsShopItem() or (entities[i].Variant == PickupVariant.PICKUP_COLLECTIBLE and entities[i].SubType == 0) or (isChest and entities[i].SubType == ChestSubType.CHEST_OPENED) or entities[i].Variant == PickupVariant.PICKUP_TROPHY or entities[i].Variant == PickupVariant.PICKUP_BIGCHEST or entities[i].Variant == PickupVariant.PICKUP_BED

			if ePickup.TheresOptionsPickup then
				theresOptionCount = theresOptionCount + 1
			end

			if not dontSave then
				Isaac.DebugString("[MUSTELA] Pickup stored")
				local p = {Type = entities[i].Type, Variant = entities[i].Variant, SubType = entities[i].SubType, Charge = entities[i]:ToPickup().Charge}
				Isaac.DebugString("[MUSTELA] Charge = "..p.Charge)
				j = j + 1
				sblzPokeActive.PICKUPS[j] = p
				Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.POOF01, 1, entities[i].Position, Vector(0, 0), player)
				entities[i]:Remove()
				if(j>sblzPokeActive.MAX) then
					break
				end
			end
		end
	end
	sblzPokeActive.EMPTY = (j == 0)
	-- if not sblzPokeActive.EMPTY then
		--player:SetPocketActiveItem(sblzPokeActive.IDFULL, ActiveSlot.SLOT_POCKET, false)
	--else
		--player:SetPocketActiveItem(sblzPokeActive.IDEMPTY, ActiveSlot.SLOT_POCKET, false)
	--end
end

local fertVoid_Unpack
function fertVoid_Unpack(pickupList)
	local player = Isaac.GetPlayer(0)
	SFXManager():Play(SoundEffect.SOUND_DOGMA_BLACKHOLE_OPEN, 2.5, 0, false, 1)
	-- SFXManager():Play(SoundEffect.SOUND_BLACK_POOF, 2, 0, false, 1)
	-- SFXManager():Play(SoundEffect.SOUND_DOOR_HEAVY_OPEN, 1.5, 0, false, 1)
	SFXManager():Play(SoundEffect.SOUND_STATIC, 0.5, 0, false, 1)
	for i = 1, #(pickupList) do
		Isaac.DebugString("[MUSTELA] Spawn entity")
		local spawnedPickup = Isaac.Spawn(pickupList[i].Type, pickupList[i].Variant, pickupList[i].SubType, Isaac.GetFreeNearPosition(player.Position, 40.0), Vector(0, 0), player)
		if spawnedPickup ~= nil and pickupList[i].Charge ~= nil then
			Isaac.DebugString("[MUSTELA] Set Charge "..pickupList[i].Charge)
			local p = spawnedPickup:ToPickup()
			p.Charge = pickupList[i].Charge
		end
	end
end

function MUSTELIDMOD:fertVoid_init()
	Isaac.DebugString("[MUSTELA] Init")
	fertVoid_LoadData()
end

function MUSTELIDMOD:fertVoid_update()
	if game:GetFrameCount() == 1 then
		sblzPokeActive.PICKUPS = {}
		sblzPokeActive.EMPTY = true
		fertVoid_SaveData()
	end
end

function MUSTELIDMOD:fertVoid_useItem()
	Isaac.DebugString("[MUSTELA] Void Storage used")
	local player = Isaac.GetPlayer(0)

	if sblzPokeActive.EMPTY then
		Isaac.DebugString("[MUSTELA] Void Storage empty")
		fertVoid_Pack()
		local roomEntities = Isaac.GetRoomEntities()
		local storage_damage_quantity = ((player.Damage * 1.5) + 15)
		local damage_from_the_void = DamageFlag.DAMAGE_CRUSH | DamageFlag.DAMAGE_IGNORE_ARMOR | DamageFlag.DAMAGE_FIRE
		for _, entity in ipairs(roomEntities) do
			if entity:IsActiveEnemy() then
				entity:TakeDamage(storage_damage_quantity, damage_from_the_void, EntityRef(player), 0)
			end
		end
		-- local voidStoreSpr = MUSTELIDMOD_COLLECTIBLES.VOIDED_STORAGE_EMPTY
		-- voidStoreSpr:GetSprite()
		-- voidStoreSpr:ReplaceSpritesheet(0, "gfx/items/collectibles/voided_storage_closed.png", true)
	else
		Isaac.DebugString("[MUSTELA] Void Storage full")
		fertVoid_Unpack(sblzPokeActive.PICKUPS)
		local roomEntities = Isaac.GetRoomEntities()
		local unvoid_damage_quantity = ((player.Damage * 1.2) + 7)
		local damage_from_unvoid = DamageFlag.DAMAGE_FIRE
		for _, entity in ipairs(roomEntities) do
			if entity:IsActiveEnemy() then
				entity:TakeDamage(unvoid_damage_quantity, damage_from_unvoid, EntityRef(player), 0)
			end
		end
		sblzPokeActive.EMPTY = true
		sblzPokeActive.PICKUPS = {}
	end
	fertVoid_SaveData()
	return { Discharge = true, Remove = false, ShowAnim = true }
end

	-- callbacks bindings
	MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, MUSTELIDMOD.fertVoid_init)
	MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_UPDATE , MUSTELIDMOD.fertVoid_update)
	MUSTELIDMOD:AddCallback(ModCallbacks.MC_USE_ITEM, MUSTELIDMOD.fertVoid_useItem, sblzPokeActive.IDEMPTY)
	MUSTELIDMOD:AddCallback(ModCallbacks.MC_USE_ITEM, MUSTELIDMOD.fertVoid_useItem, sblzPokeActive.IDFULL)