local sfxManager = SFXManager()

function MUSTELIDMOD:noPickUpFire(player, flag)
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.FIRE then
	    if player:HasCollectible(CollectibleType.COLLECTIBLE_SAUSAGE) or player:HasCollectible(CollectibleType.COLLECTIBLE_EPIC_FETUS) or player:HasCollectible(CollectibleType.COLLECTIBLE_DR_FETUS) or player:HasCollectible(CollectibleType.COLLECTIBLE_FREEZER_BABY) or player:HasCollectible(CollectibleType.COLLECTIBLE_CUBE_BABY) or player:HasCollectible(CollectibleType.COLLECTIBLE_URANUS) or player:HasCollectible(CollectibleType.COLLECTIBLE_NEPTUNUS) or player:HasCollectible(CollectibleType.COLLECTIBLE_HOLY_WATER) or player:HasCollectible(CollectibleType.COLLECTIBLE_AQUARIUS) or player:HasCollectible(CollectibleType.COLLECTIBLE_ISAACS_TEARS) or player:HasCollectible(CollectibleType.COLLECTIBLE_TRISAGION) or player:HasCollectible(CollectibleType.COLLECTIBLE_FREE_LEMONADE) then
			SFXManager():Play(SoundEffect.SOUND_SATAN_GROW, 1, 0, false, 1, 0)
			player:AddBrokenHearts(666)
		end
	end
end

MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.noPickUpFire)