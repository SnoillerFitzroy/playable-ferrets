if EID then
    -- EID Indicator
	EID:setModIndicatorName("Playable Ferrets")

	-- Icons for the ferrets for EID
	local icons = Sprite()
	icons:Load("gfx/ui/eid.anm2", true)
	EID:addIcon("Player"..MUSTELIDMOD_CHARACTERS.ICE, "Mustela", 0, 16, 16, 0, 0, icons)
	EID:addIcon("Player"..MUSTELIDMOD_CHARACTERS.SOCKET, "Tainted Mustela", 0, 16, 16, 0, 0, icons)
	EID:addIcon("Player"..MUSTELIDMOD_CHARACTERS.FIRE, "Sablez", 0, 16, 16, 0, 0, icons)
	EID:addIcon("Player"..MUSTELIDMOD_CHARACTERS.VOID, "Tainted Sablez", 0, 16, 16, 0, 0, icons)

	-- Mustela BR info
	EID:addBirthright(MUSTELIDMOD_CHARACTERS.ICE, "Mustela gains backstabbing gore tears that have a chance to freeze enemies in ice on kill, and loses paralysis effect on his tears#Devil Deals are guaranteed to spawn")
	-- Tainted Mustela BR info
	EID:addBirthright(MUSTELIDMOD_CHARACTERS.SOCKET, "Grants two copies of {{Collectible155}} The Peeper, a second smelted Crystal Key, and homing", "Tainted Mustela")
	-- Sablez BR info
	EID:addBirthright(MUSTELIDMOD_CHARACTERS.FIRE, "Grants immunity to fire and explosions#Makes Sablez's tears always explode, instead of being luck based")
	-- Tainted Sablez BR info
	EID:addBirthright(MUSTELIDMOD_CHARACTERS.VOID, "Grants a 20% chance to fire an Oculus Rift tear, and an independent 25% chance to fire an Attractor tear#Cesarean Scalpel gains a 1/64 chance to invoke Diplopia and then D20, and is far more likely to do fake damage instead of actually hurting you", "Tainted Sablez")

	---------
	-- Items--
	---------
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.SATAN_REWARD, "{{Slow}} Chills all enemies in the room, slowing them by 25% for half a second.#Does something special if any Satan Boss form is in the room#!!!If used by Mustela:#Invokes Satanic Bible, with only half a {{BlackHeart}}#Slows enemies to 50% speed for 1 second")
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.BETRAYED_HEART, "Removes a {{BrokenHeart}} and two Heart Containers, then adds two {{BlackHeart}} and invokes Converter#!!!If used by Tainted Mustela:#Random 1/3 chance to add a random 1 or 2 {{BrokenHeart}}")
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.EXTINCTION_CERTIFICATE, "Does one of the following with random chance:#20%: Add two {{BrokenHeart}}#30%: Remove one {{BrokenHeart}}#30%: Remove two {{BrokenHeart}}#19%: Add four {{BrokenHeart}} then teleport to Death Certificate Dimension#1%: Remove one {{BrokenHeart}} then teleport to Death Certificate Dimension")
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.SOCKETS, "{{Damage}} 1.5 Damage Up#{{Range}} 4.2 Range Up#{{Tears}} 25% Tears Down#Adds the Brain Worm Trinket effect and gives two {{BrokenHeart}} and two copies of {{Collectible155}}#For Tainted Mustela: instead gives 1.75 {{Damage}}, -10% {{Tears}}, +1 {{Range}}, and +2 {{Luck}} without adding {{BrokenHeart}}, {{Collectible155}}, or Brain Worm Trinket effect#If you somehow obtain multiple copies of this item, the stat changes have diminishing returns.")
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.FLUOXETINE, "{{Heart}} +1 HP Up +3 {{Heart}} healed and a {{HalfSoulHeart}}#{{Damage}} x2 Damage Multiplier#{{Tears}} x2 max firedelay (Tears Down)#!!! If Mustela or Tainted Mustela pick this up, this gives less Tears Down and more Damage Up.#This can appear many times, even if picked up.")
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.RODENT, "{{Heart}} +1 Heart Containers#↑ Heals two {{Heart}}")
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.CESAREAN_SCALPEL, "{{Collectible396}}Invokes Ventricle Razor#{{BrokenHeart}}Hurts you with fake damage#Makes you Hallucinate for a random amount of time#!!!If used by Tainted Sablez:#50% chance to deal 1/2 heart of NON-LETHAL damage with no penalties.#1/7 chance to drop a vanilla consumable from a custom loot table")
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.VOIDED_STORAGE_EMPTY, "Acts like Moving Box with a smaller storage limit.#Hurts all enemies in the room, scaling with your attack stat.#The damage counts as burning and crushing.#Full version has no cost to use.#!!!ONLY WORKS FOR SABLEZ!!!")
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.VOIDED_STORAGE_FULL, "The filled form of Voided Storage#Using this in a room that has enemies still hurts them, but less than the empty form does.#!!!This form doesn't require charging!!!#!!!ONLY WORKS FOR SABLEZ!!!")
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.MEMORIAL, "x0.666 Max Fire Delay (50% Tears Up)#Grants a constant line of cyan creep that damages grounded enemies#The creep is *significantly* larger if the player has Dead Cat")
	EID:addCollectible(MUSTELIDMOD_COLLECTIBLES.HALO, "Invokes {{Collectible486}}Dull Razor#Grants {{Collectible3}}Homing and a {{Collectible313}}Holy Mantle shield for the current room#!!!If used by Wintasm:#Invokes {{Collectible108}}The Wafer and then {{Collectible486}}Dull Razor#Grants {{Collectible3}}Homing and a {{Collectible313}}Holy Mantle shield for the current room#!!!The fake damage triggers {{Collectible677}}Astral Projection in a hostile room if it hasn't been triggered already")
end

if TheFuture then
	TheFuture.ModdedCharacterDialogue["Mustela"] = {
	"you wanna go to the future?",
	"you may not like what you...see.", }

	TheFuture.ModdedTaintedCharacterDialogue["Mustela"] = {
	"that's a lot of blood on you, buddy.",
	"do i even wanna know if it's yours?", }

	TheFuture.ModdedCharacterDialogue["Sablez"] = {
	"You seem familiar.",
	"Last time I saw a ferret as depressed as you,",
	"his eyes were missing.",
	"Did you get them back?",}

	TheFuture.ModdedTaintedCharacterDialogue["Sablez"] = {
	"You look like you're from some place...extradimensional.",
	"...",
	"I think you won't be surprised by what comes next.",	}

	TheFuture.ModdedCharacterDialogue["Wintasm"] = {
	"A *holy* noodle?",
	"Maybe you can fix the future...",
	"before it happens.",
	}

	TheFuture.ModdedTaintedCharacterDialogue["Wintasm"] = {
	"It's too late.",
	"The air went bad.",
	"You do not want, and I have the same.",
	"Look at your face. Look at your paws.",
	"I know what you did, and so does the Queen.",
	}
end