<<<<<<< HEAD
function MUSTELIDMOD:gotPaws(player, flag)
    local player = Isaac.GetPlayer()
    if player:HasTrinket(MUSTELIDMOD_TRINKETS.PAWS) then
        player:AddCollectibleEffect(CollectibleType.COLLECTIBLE_GUPPYS_EYE, false)
        if flag == CacheFlag.CACHE_SPEED then player.MoveSpeed = player.MoveSpeed + 0.1 end
        if flag == CacheFlag.CACHE_SHOTSPEED then player.ShotSpeed = player.ShotSpeed + 0.333 end
    end
=======
function MUSTELIDMOD:gotPaws(player, flag)
    local player = Isaac.GetPlayer()
    if player:HasTrinket(MUSTELIDMOD_TRINKETS.PAWS) then
        player:AddCollectibleEffect(CollectibleType.COLLECTIBLE_GUPPYS_EYE, false)
        if flag == CacheFlag.CACHE_SPEED then player.MoveSpeed = player.MoveSpeed + 0.1 end
        if flag == CacheFlag.CACHE_SHOTSPEED then player.ShotSpeed = player.ShotSpeed + 0.333 end
    end
>>>>>>> origin
end