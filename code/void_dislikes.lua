local sfxManager = SFXManager()

function MUSTELIDMOD:noPickUpVoid(player, flag)
	local player = Isaac.GetPlayer()
	if player:GetPlayerType() == MUSTELIDMOD_CHARACTERS.VOID then
		if player:HasCollectible(CollectibleType.COLLECTIBLE_FORGET_ME_NOW) or player:HasCollectible(CollectibleType.COLLECTIBLE_VOID) or player:HasCollectible(CollectibleType.COLLECTIBLE_ABYSS) then
			SFXManager():Play(SoundEffect.SOUND_SATAN_GROW, 1, 0, false, 1, 0)
			player:AddBrokenHearts(666)
		end
	end
end

MUSTELIDMOD:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, MUSTELIDMOD.noPickUpVoid)