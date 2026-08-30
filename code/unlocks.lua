local persistGameData = Isaac.GetPersistentGameData()
local game = Game()

--Fetches the tainted spritesheet of the passed player.
local function getTaintedSpritesheet(player)
    local playerConfig = player:GetEntityConfigPlayer()
    local taintedConfig = playerConfig:GetTaintedCounterpart()
    --If already a tainted character or has no tainted, returns the current player's spritesheet.
    if playerConfig:IsTainted() or not taintedConfig then
        return playerConfig:GetSkinPath()
    end
    --Return the tainted character's spritesheet path.
    return taintedConfig:GetSkinPath()
end


--------------------------------
-- UNLOCK TAINTED MUSTELA
--------------------------------

local function isTaintedMustelaLocked()
    local player = Isaac.GetPlayer()
    local playerType = player:GetPlayerType()
    return playerType == MUSTELIDMOD_CHARACTERS.ICE and not persistGameData:Unlocked(MUSTELIDMOD_ACHEESEMENTS.UNLOCK_TAINTED_MUSTELA)
end

function MUSTELIDMOD:AllowHomeClosetMustela(entType, variant, subtype, grid, seed)
    local level = game:GetLevel()
    if level:GetStage() == LevelStage.STAGE8 --Home.
        and level:GetCurrentRoomIndex() == 94 --Closet.
        and entType == EntityType.ENTITY_SLOT
        and variant == 14
        and isTaintedMustelaLocked()
    then
        --Return its own entity type, variant, and subtype as to not turn into Inner Child or a shopkeeper by the game.
        return {entType, variant, subtype}
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_PRE_ROOM_ENTITY_SPAWN, MUSTELIDMOD.AllowHomeClosetMustela)

function MUSTELIDMOD:OnClosetIsaacInit_Mustela(slot)
    if isTaintedMustelaLocked() then
        local sprite = slot:GetSprite()
        local player = Isaac.GetPlayer()
        local spritesheet = getTaintedSpritesheet(player)
        sprite:ReplaceSpritesheet(0, spritesheet, true)
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_SLOT_INIT, MUSTELIDMOD.OnClosetIsaacInit_Mustela, SlotVariant.HOME_CLOSET_PLAYER)

function MUSTELIDMOD:UnlockTaintedMustelaOnPayPrize(slot)
    if isTaintedMustelaLocked() then
        local sprite = slot:GetSprite()
        if sprite:IsFinished("PayPrize") then
            local persistGameData = Isaac.GetPersistentGameData()
            persistGameData:TryUnlock(MUSTELIDMOD_ACHEESEMENTS.UNLOCK_TAINTED_MUSTELA)
        end
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_SLOT_UPDATE, MUSTELIDMOD.UnlockTaintedMustelaOnPayPrize, SlotVariant.HOME_CLOSET_PLAYER)


--------------------------------
-- UNLOCK TAINTED SABLEZ
--------------------------------

local function isTaintedSablezLocked()
    local player = Isaac.GetPlayer()
    local playerType = player:GetPlayerType()
    return playerType == MUSTELIDMOD_CHARACTERS.FIRE and not persistGameData:Unlocked(MUSTELIDMOD_ACHEESEMENTS.UNLOCK_TAINTED_SABLEZ)
end

function MUSTELIDMOD:AllowHomeClosetSablez(entType, variant, subtype, grid, seed)
    local level = game:GetLevel()
    if level:GetStage() == LevelStage.STAGE8 --Home.
        and level:GetCurrentRoomIndex() == 94 --Closet.
        and entType == EntityType.ENTITY_SLOT
        and variant == 14
        and isTaintedSablezLocked()
    then
        --Return its own entity type, variant, and subtype as to not turn into Inner Child or a shopkeeper by the game.
        return {entType, variant, subtype}
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_PRE_ROOM_ENTITY_SPAWN, MUSTELIDMOD.AllowHomeClosetSablez)

function MUSTELIDMOD:OnClosetIsaacInit_Sablez(slot)
    if isTaintedSablezLocked() then
        local sprite = slot:GetSprite()
        local player = Isaac.GetPlayer()
        local spritesheet = getTaintedSpritesheet(player)
        sprite:ReplaceSpritesheet(0, spritesheet, true)
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_SLOT_INIT, MUSTELIDMOD.OnClosetIsaacInit_Sablez, SlotVariant.HOME_CLOSET_PLAYER)

function MUSTELIDMOD:UnlockTaintedSablezOnPayPrize(slot)
    if isTaintedSablezLocked() then
        local sprite = slot:GetSprite()
        if sprite:IsFinished("PayPrize") then
            local persistGameData = Isaac.GetPersistentGameData()
            persistGameData:TryUnlock(MUSTELIDMOD_ACHEESEMENTS.UNLOCK_TAINTED_SABLEZ)
        end
    end
end
MUSTELIDMOD:AddCallback(ModCallbacks.MC_POST_SLOT_UPDATE, MUSTELIDMOD.UnlockTaintedSablezOnPayPrize, SlotVariant.HOME_CLOSET_PLAYER)


--------------------------------
-- UNLOCK TAINTED WINTASM
--------------------------------

