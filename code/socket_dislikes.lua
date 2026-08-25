local sfxManager = SFXManager()

function MUSTELIDMOD:noPickUpSocket(player, flag)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.SOCKET then
	    if player:HasCollectible(CollectibleType.COLLECTIBLE_DEPRESSION) or player:HasCollectible(CollectibleType.COLLECTIBLE_EUCHARIST) or player:HasCollectible(CollectibleType.COLLECTIBLE_INFESTATION_2) or player:HasCollectible(CollectibleType.COLLECTIBLE_SPIDER_BUTT) or player:HasCollectible(CollectibleType.COLLECTIBLE_BEST_BUD) or player:HasCollectible(CollectibleType.COLLECTIBLE_GODHEAD) or player:HasCollectible(CollectibleType.COLLECTIBLE_IMMACULATE_HEART) then
			SFXManager():Play(SoundEffect.SOUND_SATAN_GROW, 1, 0, false, 1, 0)
			player:AddBrokenHearts(666)
		end
	end
end

MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.noPickUpSocket)