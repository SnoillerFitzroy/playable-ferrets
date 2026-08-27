local game = Game()
local level = Game():GetLevel()
local curses = {LevelCurse.CURSE_OF_BLIND}

function MUSTELIDMOD:addPogCompatibility()
    if Poglite then
		local pog_ice = Isaac.GetCostumeIdByPath("gfx/characters/icepog.anm2")
		local pog_socket = Isaac.GetCostumeIdByPath("gfx/characters/socketpog.anm2")
		local pog_fire = Isaac.GetCostumeIdByPath("gfx/characters/firepog.anm2")
		local pog_void = Isaac.GetCostumeIdByPath("gfx/characters/voidpog.anm2")
		Poglite:AddPogCostume("MustelaPog", MUSTELIDMOD_CHARACTERS.ICE, pog_ice)
		Poglite:AddPogCostume("TaintedMustelaPog", MUSTELIDMOD_CHARACTERS.SOCKET, pog_socket)
		Poglite:AddPogCostume("SablezPog", MUSTELIDMOD_CHARACTERS.FIRE, pog_fire)
		Poglite:AddPogCostume("TaintedSablezPog", MUSTELIDMOD_CHARACTERS.VOID, pog_void)
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, MUSTELIDMOD.addPogCompatibility)


--------------------------------------------------
--       MUSTELA                                                                                         --------------------------------------------------

function MUSTELIDMOD:FerretIceInitialization(player)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE then
		player:SetPocketActiveItem(MUSTELIDMOD_COLLECTIBLES.SATAN_REWARD, ActiveSlot.SLOT_POCKET, true)
		player:SetActiveCharge(0, ActiveSlot.SLOT_POCKET)
		player:AddSmeltedTrinket(TrinketType.TRINKET_YOUR_SOUL)
		standardMustelaBRGrantedYourSoulCopies = 0
		local game = Game()
		local pool = game:GetItemPool()
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SKATOLE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HALO_OF_FLIES)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BIBLE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_BRA)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_PAD)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_EPIC_FETUS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SISTER_MAGGY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BOOK_OF_REVELATIONS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SPIDER_BITE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_RELIC)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PARASITE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_GUARDIAN_ANGEL)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_KNIFE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FORGET_ME_NOW)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FOREVER_ALONE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_INFESTATION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MULLIGAN)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_CANDLE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MITRE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HOLY_WATER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SACRED_HEART)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_DEAD_DOVE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_JESUS_JUICE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SPIDERBABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_GOAT_HEAD)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_INFESTATION_2)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_E_COLI)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HIVE_MIND)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SMART_FLY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_JUICY_SACK)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BEST_BUD)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BIG_FAN)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BOX_OF_SPIDERS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_RED_CANDLE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SATANIC_BIBLE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_CONVERTER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FRIEND_ZONE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_LOST_FLY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_NUMBER_TWO)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SERAPHIM)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SPEAR_OF_DESTINY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_OBSESSED_FAN)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PAPA_FLY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_JAR_OF_FLIES)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PARASITOID)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_EUCHARIST)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HAEMOLACRIA)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_IMMACULATE_HEART)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_INTRUDER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BOOK_OF_VIRTUES)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_ACT_OF_CONTRITION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_REVELATION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_KEEPERS_KIN)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_TMTRAINER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_IBS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HEMOPTYSIS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_GELLO)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_DECAP_ATTACK)
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, MUSTELIDMOD.FerretIceInitialization)

-- Costume enabling
local snowEnabled = 0

function MUSTELIDMOD:forceIcyAppearance(player)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE then
		if snowEnabled == 0 then
			if player.CanFly == true then
				player:AddNullCostume(MUSTELIDMOD_COSTUMES.FLIGHT_ICE)
				snowEnabled = 1
			end
		end
		if snowEnabled == 1 then
			if player.CanFly == false then
				player:TryRemoveNullCostume(MUSTELIDMOD_COSTUMES.FLIGHT_ICE)
				snowEnabled = 0
			end
		end
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, MUSTELIDMOD.forceIcyAppearance, 0)

-- Stats
local MustelaStats = {
    SPEEDMULTIPLIER = 1.13,
    SHOTSPEEDMULTIPLIER = 0.666,
    FLYING = false,
    TEARFLAG = TearFlags.TEAR_FREEZE,
	TEARCOLOR = Color(0.01, 0.7, 0.95, 1.0, 0.1, 0.8, 0.9)
}

function MUSTELIDMOD:iceStats(player, cacheFlag)
	-- Now, we ONLY handle flooring, capping, and multiplying via LUA code.
	-- Most stats can be handled by flatly editing them in Players.XML with RGON
	-- Some stats are being converted to flat values isntead of multiples, this is more balanced anyway.
    if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE then
        if cacheFlag == CacheFlag.CACHE_SPEED then  player.MoveSpeed = player.MoveSpeed * MustelaStats.SPEEDMULTIPLIER end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then player.ShotSpeed = player.ShotSpeed * MustelaStats.SHOTSPEEDMULTIPLIER
			if player.ShotSpeed > 3 then player.ShotSpeed = 3 end
        end
        if not player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) and cacheFlag == CacheFlag.CACHE_TEARFLAG then
            player.TearFlags = player.TearFlags | MustelaStats.TEARFLAG end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then player.TearColor = MustelaStats.TEARCOLOR end
		if cacheFlag == CacheFlag.CACHE_LUCK then if player.Luck < 0 then player.Luck = 0 end end
        if cacheFlag == CacheFlag.CACHE_FLYING and MustelaStats.FLYING then player.CanFly = true end
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.iceStats)

-- Mustela's tear dripping effect

function MUSTELIDMOD:TearDrippingFerret(player)
    if player:GetPlayerType() ~= MUSTELIDMOD_CHARACTERS.ICE then return end
    local game = Game()
	if game:GetFrameCount() % 11 == 0 then
        local creep = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, player.Position, Vector.Zero, player):ToEffect()
        creep.SpriteScale = Vector(math.random()*1.2, math.random()*1.2)
		creep.Color = Color(0.34, 0.6685, 0.78, 1.0, 0.34, 0.6685, 0.78)
        creep:Update() end
end MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, MUSTELIDMOD.TearDrippingFerret)


function MUSTELIDMOD:iceFlags(player, cacheFlag)
	if player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE then
			if not player:HasCollectible(CollectibleType.COLLECTIBLE_GOAT_HEAD) then
				player:AddInnateCollectible(CollectibleType.COLLECTIBLE_GOAT_HEAD)
			end
			if cacheFlag == CacheFlag.CACHE_TEARFLAG then
				player.TearFlags = player.TearFlags | TearFlags.TEAR_BACKSTAB | TearFlags.TEAR_EXTRA_GORE
			end
		end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.iceFlags)

function MUSTELIDMOD:BRSpriteIce(e)
	local player = Isaac.GetPlayer(0)
	local playerType = player:GetPlayerType()
	if e.Type==5 and e.Variant==100 and e.SubType==619 and math.floor(level:GetCurses()/LevelCurse.CURSE_OF_BLIND)%2 == 0 then -- If Birthright spawns and no blind curse
		local sprite =e:GetSprite()
		if playerType == MUSTELIDMOD_CHARACTERS.ICE then sprite:ReplaceSpritesheet ( 1, "gfx/items/collectibles/br_ice.png") end  sprite:LoadGraphics() end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, MUSTELIDMOD.BRSpriteIce)


--------------------------------------------------
--       TAINTED MUSTELA                                                                        
--------------------------------------------------

function MUSTELIDMOD:FerretSocketInitialization(player)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.SOCKET then
		local game = Game()
		local pool = game:GetItemPool()
		player:SetPocketActiveItem(MUSTELIDMOD_COLLECTIBLES.BETRAYED_HEART, ActiveSlot.SLOT_POCKET, true)
		player:SetActiveCharge(0, ActiveSlot.SLOT_POCKET)
		-- Banned Items
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_INNER_EYE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SKATOLE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HALO_OF_FLIES)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_UNDERWEAR)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_HEELS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_LIPSTICK)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_WIRE_COAT_HANGER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BIBLE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_BRA)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_PAD)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_EPIC_FETUS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SISTER_MAGGY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_ROSARY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BOOK_OF_REVELATIONS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SPIDER_BITE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_RELIC)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PARASITE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_KNIFE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FORGET_ME_NOW)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PRAYER_CARD)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_INFESTATION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MULLIGAN)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PEEPER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_POLYPHEMUS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MITRE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HOLY_WATER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_DEAD_DOVE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_JESUS_JUICE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SPIDERBABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_INFESTATION_2)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_E_COLI)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_20_20)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HIVE_MIND)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BLACK_CANDLE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SMART_FLY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_JUICY_SACK)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BEST_BUD)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BIG_FAN)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BOX_OF_SPIDERS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SATANIC_BIBLE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_CONVERTER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FRIEND_ZONE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_LOST_FLY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_STICKY_BOMBS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_EPIPHORA)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HOLY_LIGHT)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_NUMBER_TWO)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SERAPHIM)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SPEAR_OF_DESTINY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_OBSESSED_FAN)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PAPA_FLY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_JAR_OF_FLIES)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PARASITOID)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_EYE_OF_BELIAL)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_EUCHARIST)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_INTRUDER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BOOK_OF_VIRTUES)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_ACT_OF_CONTRITION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_REVELATION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_REDEMPTION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_C_SECTION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_KEEPERS_KIN)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_TMTRAINER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_IBS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_GELLO)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_STYE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_DECAP_ATTACK)
		-- Birthright Variable
		taintedMustelaCrystalKeyCopies = 1
		-- Costume stuff
		player:AddNullCostume(MUSTELIDMOD_COSTUMES.SOCKET)
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, MUSTELIDMOD.FerretSocketInitialization)

-- Costume enabling
local occultEnabled = 0

function MUSTELIDMOD:forceOccultAppearance(player)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.SOCKET then
		if occultEnabled == 0 then
			if player.CanFly then player:AddNullCostume(MUSTELIDMOD_COSTUMES.FLIGHT_SOCKET) occultEnabled = 1 end end
		if occultEnabled == 1 then
			if not player.CanFly then player:TryRemoveNullCostume(MUSTELIDMOD_COSTUMES.FLIGHT_SOCKET) occultEnabled = 0 end end end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, MUSTELIDMOD.forceOccultAppearance, 0)

-- Stats
local SocketStats = {
    SPEEDMULTIPLIER = 1.12,
    TEARFLAG = TearFlags.TEAR_TURN_HORIZONTAL | TearFlags.TEAR_KNOCKBACK,
	TEARCOLOR = Color(0.85, 0.05098, 0.05098, 1.0, 0, 0, 0)
}

function MUSTELIDMOD:taintedStats(player, cacheFlag)
    if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.SOCKET then
        if cacheFlag == CacheFlag.CACHE_SPEED then player.MoveSpeed = player.MoveSpeed * SocketStats.SPEEDMULTIPLIER end
        if not player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) and cacheFlag == CacheFlag.CACHE_TEARFLAG then
			player.TearFlags = player.TearFlags | SocketStats.TEARFLAG
		elseif player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) and cacheFlag == CacheFlag.CACHE_TEARFLAG then
			player.TearFlags = player.TearFlags | TearFlags.TEAR_KNOCKBACK end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR and not player:HasCollectible(CollectibleType.COLLECTIBLE_C_SECTION) then player.TearColor = SocketStats.TEARCOLOR end
	end
end MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.taintedStats)

-- Tainted Mustela's blood dripping effect

function MUSTELIDMOD:BloodSoakedFerret(player)
    if player:GetPlayerType() ~= MUSTELIDMOD_CHARACTERS.SOCKET then return end
    local game = Game()
	if game:GetFrameCount() % 2 == 0 then
        local creep = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, player.Position, Vector.Zero, player):ToEffect()
        creep.SpriteScale = Vector(1.2, 1.2)
        creep:Update() end
end MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, MUSTELIDMOD.BloodSoakedFerret)

function MUSTELIDMOD:socketFlags(player, cacheFlag)
	if player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.SOCKET then
		while player:GetCollectibleNum(CollectibleType.COLLECTIBLE_PEEPER) < 2 do player:AddCollectible(CollectibleType.COLLECTIBLE_PEEPER) end
		while taintedMustelaCrystalKeyCopies < 2 do player:AddSmeltedTrinket(TrinketType.TRINKET_CRYSTAL_KEY) taintedMustelaCrystalKeyCopies = taintedMustelaCrystalKeyCopies + 1 end
		if cacheFlag == CacheFlag.CACHE_TEARFLAG then player.TearFlags = player.TearFlags | TearFlags.TEAR_HOMING end end
	end
end MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.socketFlags)

local level = Game():GetLevel()

function MUSTELIDMOD:BRSpriteSocket(e)
	local player = Isaac.GetPlayer(0)
	local playerType = player:GetPlayerType()
	if e.Type==5 and e.Variant==100 and e.SubType==619 and math.floor(level:GetCurses()/LevelCurse.CURSE_OF_BLIND)%2 == 0 then -- If Birthright spawns and no blind curse
		local sprite =e:GetSprite()
		if playerType == MUSTELIDMOD_CHARACTERS.SOCKET then
		    sprite:ReplaceSpritesheet ( 1, "gfx/items/collectibles/br_socket.png") end  sprite:LoadGraphics() end
end MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, MUSTELIDMOD.BRSpriteSocket)


--------------------------------------------------
--       SABLEZ                                                                                          
--------------------------------------------------

function MUSTELIDMOD:FerretSableInitialization(player)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.FIRE then
		player:SetPocketActiveItem(MUSTELIDMOD_COLLECTIBLES.VOIDED_STORAGE_EMPTY, ActiveSlot.SLOT_POCKET, false)
		player:SetActiveCharge(0, ActiveSlot.SLOT_POCKET)
		player:AddSmeltedTrinket(32781)
		sableFerretHasBRExplosiveTears = 0
		player:AddNullCostume(MUSTELIDMOD_COSTUMES.FIRE)
		player:AddNullCostume(MUSTELIDMOD_COSTUMES.SPECS)
		local game = Game()
		local pool = game:GetItemPool()
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FORGET_ME_NOW)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_IPECAC)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HOLY_WATER)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_JESUS_JUICE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PLACENTA)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PYROMANIAC)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_GIMPY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_AQUARIUS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MAGGYS_BOW)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_ISAACS_TEARS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_EPIPHORA)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_CAMBION_CONCEPTION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_IMMACULATE_CONCEPTION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MILK)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_LACHRYPHAGY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_TRISAGION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_ALMOND_MILK)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FREE_LEMONADE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_NEPTUNUS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FREEZER_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_CUBE_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SAUSAGE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_C_SECTION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_GELLO)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_CAR_BATTERY)
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, MUSTELIDMOD.FerretSableInitialization)

-- Costume enabling
local smokeEnabled = 0

function MUSTELIDMOD:forceFireAppearance(player)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.FIRE then
		if smokeEnabled == 0 then
			if player.CanFly then
				player:AddNullCostume(MUSTELIDMOD_COSTUMES.FLIGHT_FIRE)
				smokeEnabled = 1
			end
		end
		if smokeEnabled == 1 then
			if not player.CanFly then
				player:TryRemoveNullCostume(MUSTELIDMOD_COSTUMES.FLIGHT_FIRE)
				smokeEnabled = 0
			end
		end
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, MUSTELIDMOD.forceFireAppearance, 0)

-- Stats
local SableStats = {
	SHOTSPEEDMULTIPLIER = 1.33,
	FIREDELAY = 1.5,
    FLYING = false,
    TEARFLAG = TearFlags.TEAR_BURN | TearFlags.TEAR_ACID,
    TEARCOLOR = Color(0.05, 0.05, 0.05, 1.0, 0, 0, 0) --rocksand
}
 
function MUSTELIDMOD:flamingStats(player, cacheFlag)
    if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.FIRE then
		if cacheFlag == CacheFlag.CACHE_FIREDELAY then player.MaxFireDelay = (player.MaxFireDelay + 9.4) * SableStats.FIREDELAY end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then
            player.ShotSpeed = player.ShotSpeed * SableStats.SHOTSPEEDMULTIPLIER
			if player.ShotSpeed > 5 then player.ShotSpeed = 5 end
        end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then player.TearFlags = player.TearFlags | SableStats.TEARFLAG  end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then player.TearColor = SableStats.TEARCOLOR end
        if cacheFlag == CacheFlag.CACHE_FLYING and SableStats.FLYING then player.CanFly = true end
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.flamingStats)

-- Sablez's soot dripping effect

function MUSTELIDMOD:sootCoveredFerret(player)
    if player:GetPlayerType() ~= MUSTELIDMOD_CHARACTERS.FIRE then return end
    local game = Game()
	local sootFrequency = math.random(4, 7)
	local sootDropX = 0.2 + (math.random() * 0.933)
	local sootDropY = 0.2 + (math.random() * 0.933)
	local ssColor = (math.random() * 0.10196)-0.0225
	if game:GetFrameCount() % sootFrequency == 0 then
        local creep = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, player.Position, Vector.Zero, player):ToEffect()
        creep.SpriteScale = Vector(sootDropX, sootDropY)
		-- Make it randomly black or gray, with varied brightness
        creep.Color = Color(ssColor*0.925, ssColor, ssColor, 1.0, ssColor*0.925, ssColor, ssColor)
        creep:Update() -- Update it to get rid of the initial red animation that lasts a single frame.
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, MUSTELIDMOD.sootCoveredFerret)


function MUSTELIDMOD:fireFlags(player, cacheFlag)
	if player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.FIRE then
				if cacheFlag == CacheFlag.CACHE_TEARFLAG then
					player.TearFlags = player.TearFlags | TearFlags.TEAR_EXPLOSIVE
				end
			if not player:HasCollectible(CollectibleType.COLLECTIBLE_PYROMANIAC) then
				player:AddCollectible(CollectibleType.COLLECTIBLE_PYROMANIAC) player:AddSmeltedTrinket(32781) player:AddSmeltedTrinket(32781)
			end
		end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.fireFlags)

function MUSTELIDMOD:BRSpriteFire(e)
	local player = Isaac.GetPlayer(0)
	local playerType = player:GetPlayerType()
	if e.Type==5 and e.Variant==100 and e.SubType==619 and math.floor(level:GetCurses()/LevelCurse.CURSE_OF_BLIND)%2 == 0 then -- If Birthright spawns and no blind curse
		local sprite =e:GetSprite()
		if playerType == MUSTELIDMOD_CHARACTERS.FIRE then
		    sprite:ReplaceSpritesheet ( 1, "gfx/items/collectibles/br_fire.png") end  sprite:LoadGraphics() end
end

MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, MUSTELIDMOD.BRSpriteFire)


--------------------------------------------------
--       TAINTED SABLEZ                                                                           --------------------------------------------------

function MUSTELIDMOD:FerretVoidInitialization(player)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.VOID then
		player:SetPocketActiveItem(MUSTELIDMOD_COLLECTIBLES.CESAREAN_SCALPEL, ActiveSlot.SLOT_POCKET, true)
		player:AddCollectible(CollectibleType.COLLECTIBLE_LIL_PORTAL)
		player:AddSmeltedTrinket(TrinketType.TRINKET_MYOSOTIS)
		player:AddSoulHearts(-99) player:AddBlackHearts(-99)
		player:AddBoneHearts(3) player:AddSoulHearts(1)
		player:AddCollectibleEffect(CollectibleType.COLLECTIBLE_HOLY_MANTLE, true)
		voidNoodleHasBRBonus = 0
		player:AddNullCostume(MUSTELIDMOD_COSTUMES.VOID)
		player:AddNullCostume(MUSTELIDMOD_COSTUMES.VOID_BODY)
		player:AddNullCostume(MUSTELIDMOD_COSTUMES.VSPECS)
		local game = Game()
		local pool = game:GetItemPool()
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BROTHER_BOBBY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_BRA)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_PAD)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_DR_FETUS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SISTER_MAGGY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_LITTLE_CHUBBY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_ROBO_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_LITTLE_CHAD)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_DEMON_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_IPECAC)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_GHOST_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HARLEQUIN_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_EPIC_FETUS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_RAINBOW_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_GIMPY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_ROBO_BABY_2)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_ROTTEN_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_HEADLESS_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FIRE_MIND)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_AQUARIUS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MAGGYS_BOW)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_GEMINI)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MONGO_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_LUDOVICO_TECHNIQUE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MULTIDIMENSIONAL_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BINKY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_KING_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_PLAN_C)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_ACID_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BOX_OF_FRIENDS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_MYSTERY_EGG)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_OCULAR_RIFT)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_BOILED_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_FREEZER_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_CUBE_BABY)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_QUINTS)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_SAUSAGE)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_C_SECTION)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_VANISHING_TWIN)
		pool:RemoveCollectible(CollectibleType.COLLECTIBLE_GELLO)
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, MUSTELIDMOD.FerretVoidInitialization)

-- Costume enabling
local portalEnabled = 0
local voidEarsEnabled = 0

function MUSTELIDMOD:forceVoidAppearance(player)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.VOID then
    	if voidEarsEnabled == 0 then
    		player:AddNullCostume(MUSTELIDMOD_COSTUMES.VOID)
		    player:AddNullCostume(MUSTELIDMOD_COSTUMES.VOID_BODY)
			voidEarsEnabled = voidEarsEnabled + 1
		end
		if portalEnabled == 0 then
			if player.CanFly then
				player:AddNullCostume(MUSTELIDMOD_COSTUMES.FLIGHT_VOID)
				portalEnabled = 1
			end
		end
		if portalEnabled == 1 then
			if not player.CanFly then
				player:TryRemoveNullCostume(MUSTELIDMOD_COSTUMES.FLIGHT_VOID)
				portalEnabled = 0
			end
		end
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, MUSTELIDMOD.forceVoidAppearance, 0)

-- Stats
local VoidStats = { 
    DAMAGE = -2.3,
	DAMAGEMULTIPLIER = 1.00,
    SPEED = 0.55,
	SPEEDMULTIPLIER = 0.58,
    SHOTSPEED = 0.0,
	SHOTSPEEDMULTIPLIER = 0.5,
	FDM = 0.95,
	RANGE = 153,
    LUCK = -2,
	FLYING = false,
    TEARCOLOR = Color(0.5, 0.03137, 0.5, 1.0, 0.55, 0.1, 0.53)
}

function MUSTELIDMOD:statsFromTheVoid(player, cacheFlag)
    if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.VOID then
        if cacheFlag == CacheFlag.CACHE_SPEED then player.MoveSpeed = (player.MoveSpeed + VoidStats.SPEED) * VoidStats.SPEEDMULTIPLIER end
		if cacheFlag == CacheFlag.CACHE_FIREDELAY then player.MaxFireDelay = (player.MaxFireDelay- 0.85) * VoidStats.FDM end
        if cacheFlag == CacheFlag.CACHE_DAMAGE then player.Damage = (player.Damage + VoidStats.DAMAGE) * VoidStats.DAMAGEMULTIPLIER end
        if cacheFlag == CacheFlag.CACHE_RANGE then player.TearRange = ((player.TearRange * 0.334) + VoidStats.RANGE) end
		if player.TearRange < 100 then player.TearRange = 100 end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then player.ShotSpeed = (player.ShotSpeed + VoidStats.SHOTSPEED) * VoidStats.SHOTSPEEDMULTIPLIER end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then player.TearColor = VoidStats.TEARCOLOR end
		if cacheFlag == CacheFlag.CACHE_LUCK then player.Luck = player.Luck + VoidStats.LUCK end
        if cacheFlag == CacheFlag.CACHE_FLYING and VoidStats.FLYING then player.CanFly = true end
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.statsFromTheVoid)

-- -- Tainted Sablez's void bleed effect

function MUSTELIDMOD:StaticDrippingFerret(player)
    if player:GetPlayerType() ~= MUSTELIDMOD_CHARACTERS.VOID then return end
    local game = Game()
	if game:GetFrameCount() % 1 == 0 then
		local creepColor = math.random() * 0.9
		local creepSizeX = math.random() * 0.1
		local creepSizeY = math.random() * 0.1
        -- Vector.Zero is the same as Vector(0, 0). It is a constant!
        local creep = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.PLAYER_CREEP_RED, 0, player.Position, Vector.Zero, player):ToEffect()
		creep.SpriteScale = Vector(creepSizeX, creepSizeY)
		creep.Color = Color(0,0,0,1,creepColor-0.025, creepColor-0.025, creepColor-0.025)
        creep:Update() -- Update it to get rid of the initial red animation that lasts a single frame.
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, MUSTELIDMOD.StaticDrippingFerret)

local level = Game():GetLevel()

function MUSTELIDMOD:voidFlags(player, cacheFlag)
	if player:HasCollectible(CollectibleType.COLLECTIBLE_BIRTHRIGHT) then if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.VOID then
			if cacheFlag == CacheFlag.CACHE_TEARFLAG then
				player.TearFlags = player.TearFlags | TearFlags.TEAR_CONTINUUM
			end
			if cacheFlag == CacheFlag.CACHE_RANGE then player.TearRange = ((player.TearRange * 1.1) + 400) end
		end
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.voidFlags)

function MUSTELIDMOD:BRSpriteVoid(e)
	local player = Isaac.GetPlayer(0)
	local playerType = player:GetPlayerType()
	if e.Type==5 and e.Variant==100 and e.SubType==619 and math.floor(level:GetCurses()/LevelCurse.CURSE_OF_BLIND)%2 == 0 then -- If Birthright spawns and no blind curse
		local sprite =e:GetSprite()
		if playerType == MUSTELIDMOD_CHARACTERS.VOID then sprite:ReplaceSpritesheet ( 1, "gfx/items/collectibles/br_void.png") end sprite:LoadGraphics() end
end

MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, MUSTELIDMOD.BRSpriteVoid)





--------------------------------------------------
--------------------------------------------------
--       WINTASM                                                                                         --------------------------------------------------
--------------------------------------------------

function MUSTELIDMOD:HaloFerretInitialization(player)
	local player = Isaac.GetPlayer()
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HALO then
		player:SetPocketActiveItem(MUSTELIDMOD_COLLECTIBLES.HALO, ActiveSlot.SLOT_POCKET, true)
		player:AddNullCostume(MUSTELIDMOD_COSTUMES.HALO)
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, MUSTELIDMOD.HaloFerretInitialization)

-- Costume enabling
local stormEnabled = 0

function MUSTELIDMOD:forceHaloAppearance(player)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HALO then
		if stormEnabled == 0 and player.CanFly == true then
			player:AddNullCostume(MUSTELIDMOD_COSTUMES.FLIGHT_HALO)
			stormEnabled = 1
		end
		if stormEnabled == 1 and player.CanFly == false then
			player:TryRemoveNullCostume(MUSTELIDMOD_COSTUMES.FLIGHT_HALO)
			stormEnabled = 0
		end
	end
end

MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, MUSTELIDMOD.forceHaloAppearance, 0)

local HaloStats = {
	SPE = -0.1304347826,
	SPEM = 1.15,
	TEAR = 1.1,
	ATK = -0.3,
	ATKM = 0.5,
	RANGE = 60,
	SSPE = -0.2,
	SSPEM = 0.5,
    FLY = false,
    TEARFLAG = TearFlags.TEAR_SPLIT,
    TCOLOR = Color(0.25, 0.9, 1, 1.0, 0.7, 0.85, 1)
}
 
function MUSTELIDMOD:HaloStats(player, cacheFlag)
	local player = Isaac.GetPlayer()
    if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HALO then
        if cacheFlag == CacheFlag.CACHE_SPEED then player.MoveSpeed = (player.MoveSpeed + HaloStats.SPE) * HaloStats.SPEM end
		if cacheFlag == CacheFlag.CACHE_FIREDELAY then  player.MaxFireDelay = (player.MaxFireDelay + 2.75 ) * HaloStats.TEAR end
        if cacheFlag == CacheFlag.CACHE_DAMAGE then player.Damage = (player.Damage + HaloStats.ATK) * HaloStats.ATKM end
        if cacheFlag == CacheFlag.CACHE_RANGE then player.TearRange = player.TearRange + HaloStats.RANGE end
        if cacheFlag == CacheFlag.CACHE_SHOTSPEED then player.ShotSpeed = (player.ShotSpeed + HaloStats.SSPE) * HaloStats.SSPEM end
        if cacheFlag == CacheFlag.CACHE_TEARFLAG then player.TearFlags = player.TearFlags | HaloStats.TEARFLAG  end
        if cacheFlag == CacheFlag.CACHE_TEARCOLOR then player.TearColor = HaloStats.TCOLOR end
        if cacheFlag == CacheFlag.CACHE_FLYING and HaloStats.FLY then player.CanFly = true end
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.HaloStats)





--------------------------------------------------
--------------------------------------------------
--       TAINTED WINTASM                                                                         --------------------------------------------------
--------------------------------------------------
--------------------------------------------------


--[[ function MUSTELIDMOD:HolyFerretInitialization(player)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.HOLY then
		local game = Game()
		local pool = game:GetItemPool()
	end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, MUSTELIDMOD.HolyFerretInitialization) ]]
