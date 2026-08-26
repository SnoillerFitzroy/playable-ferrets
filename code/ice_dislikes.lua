<<<<<<< HEAD
local antiMustelaItems = RegisterMod("Mustela", 1)
local sfxManager = SFXManager()
local game = Game()

function antiMustelaItems:deadlyCollectibles(player, flag)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE then
	    if player:HasCollectible(CollectibleType.COLLECTIBLE_FORGET_ME_NOW) or player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_BRA) or player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_PAD) or player:HasCollectible(CollectibleType.COLLECTIBLE_EUCHARIST) or player:HasCollectible(CollectibleType.COLLECTIBLE_SERAPHIM) or player:HasCollectible(CollectibleType.COLLECTIBLE_PASCHAL_CANDLE) or player:HasCollectible(CollectibleType.COLLECTIBLE_IMMACULATE_HEART) or player:HasCollectible(CollectibleType.COLLECTIBLE_SACRED_HEART) or player:HasCollectible(CollectibleType.COLLECTIBLE_MULLIGAN) or player:HasCollectible(CollectibleType.COLLECTIBLE_INFESTATION) or player:HasCollectible(CollectibleType.COLLECTIBLE_INFESTATION_2) or player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) or player:HasCollectible(CollectibleType.COLLECTIBLE_DADDY_LONGLEGS) or player:HasCollectible(CollectibleType.COLLECTIBLE_SPIDERBABY) or player:HasCollectible(CollectibleType.COLLECTIBLE_MULLIGAN) or player:HasCollectible(CollectibleType.COLLECTIBLE_SPIDER_BUTT) or player:HasCollectible(CollectibleType.COLLECTIBLE_BEST_BUD) or player:HasCollectible(CollectibleType.COLLECTIBLE_SKATOLE) or player:HasCollectible(CollectibleType.COLLECTIBLE_HALO_OF_FLIES) or player:HasCollectible(CollectibleType.COLLECTIBLE_HIVE_MIND) or player:HasCollectible(CollectibleType.COLLECTIBLE_BBF) or player:HasCollectible(CollectibleType.COLLECTIBLE_SISSY_LONGLEGS) or player:HasCollectible(CollectibleType.COLLECTIBLE_BIG_FAN) or player:HasCollectible(CollectibleType.COLLECTIBLE_BLUE_BABYS_ONLY_FRIEND) or player:HasCollectible(CollectibleType.COLLECTIBLE_FRIEND_ZONE) or player:HasCollectible(CollectibleType.COLLECTIBLE_LOST_FLY) or player:HasCollectible(CollectibleType.COLLECTIBLE_BURSTING_SACK) or player:HasCollectible(CollectibleType.COLLECTIBLE_MATCH_BOOK) or player:HasCollectible(CollectibleType.COLLECTIBLE_RED_CANDLE) or player:HasCollectible(CollectibleType.COLLECTIBLE_CANDLE) or player:HasCollectible(CollectibleType.COLLECTIBLE_BIRDS_EYE) or player:HasCollectible(CollectibleType.COLLECTIBLE_GHOST_PEPPER) then
			SFXManager():Play(SoundEffect.SOUND_SATAN_GROW, 1, 0, false, 1, 0)
			player:AddBrokenHearts(666)
		end
	end
end

=======
local antiMustelaItems = RegisterMod("Mustela", 1)
local sfxManager = SFXManager()
local game = Game()

function antiMustelaItems:deadlyCollectibles(player, flag)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.ICE then
	    if player:HasCollectible(CollectibleType.COLLECTIBLE_FORGET_ME_NOW) or player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_BRA) or player:HasCollectible(CollectibleType.COLLECTIBLE_MOMS_PAD) or player:HasCollectible(CollectibleType.COLLECTIBLE_EUCHARIST) or player:HasCollectible(CollectibleType.COLLECTIBLE_SERAPHIM) or player:HasCollectible(CollectibleType.COLLECTIBLE_PASCHAL_CANDLE) or player:HasCollectible(CollectibleType.COLLECTIBLE_IMMACULATE_HEART) or player:HasCollectible(CollectibleType.COLLECTIBLE_SACRED_HEART) or player:HasCollectible(CollectibleType.COLLECTIBLE_MULLIGAN) or player:HasCollectible(CollectibleType.COLLECTIBLE_INFESTATION) or player:HasCollectible(CollectibleType.COLLECTIBLE_INFESTATION_2) or player:HasCollectible(CollectibleType.COLLECTIBLE_MUTANT_SPIDER) or player:HasCollectible(CollectibleType.COLLECTIBLE_DADDY_LONGLEGS) or player:HasCollectible(CollectibleType.COLLECTIBLE_SPIDERBABY) or player:HasCollectible(CollectibleType.COLLECTIBLE_MULLIGAN) or player:HasCollectible(CollectibleType.COLLECTIBLE_SPIDER_BUTT) or player:HasCollectible(CollectibleType.COLLECTIBLE_BEST_BUD) or player:HasCollectible(CollectibleType.COLLECTIBLE_SKATOLE) or player:HasCollectible(CollectibleType.COLLECTIBLE_HALO_OF_FLIES) or player:HasCollectible(CollectibleType.COLLECTIBLE_HIVE_MIND) or player:HasCollectible(CollectibleType.COLLECTIBLE_BBF) or player:HasCollectible(CollectibleType.COLLECTIBLE_SISSY_LONGLEGS) or player:HasCollectible(CollectibleType.COLLECTIBLE_BIG_FAN) or player:HasCollectible(CollectibleType.COLLECTIBLE_BLUE_BABYS_ONLY_FRIEND) or player:HasCollectible(CollectibleType.COLLECTIBLE_FRIEND_ZONE) or player:HasCollectible(CollectibleType.COLLECTIBLE_LOST_FLY) or player:HasCollectible(CollectibleType.COLLECTIBLE_BURSTING_SACK) or player:HasCollectible(CollectibleType.COLLECTIBLE_MATCH_BOOK) or player:HasCollectible(CollectibleType.COLLECTIBLE_RED_CANDLE) or player:HasCollectible(CollectibleType.COLLECTIBLE_CANDLE) or player:HasCollectible(CollectibleType.COLLECTIBLE_BIRDS_EYE) or player:HasCollectible(CollectibleType.COLLECTIBLE_GHOST_PEPPER) then
			SFXManager():Play(SoundEffect.SOUND_SATAN_GROW, 1, 0, false, 1, 0)
			player:AddBrokenHearts(666)
		end
	end
end

>>>>>>> origin
antiMustelaItems:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, antiMustelaItems.deadlyCollectibles)