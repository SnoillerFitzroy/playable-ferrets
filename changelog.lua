DeadSeaScrollsMenu.AddChangelog("Mustela", "Version 2.1.0", [[{FSIZE3}Update From
{FSIZE3}The Void

{FSIZE2}General changes

Mustela's Pocket active has been renamed
again to "Satan's Reward" because I felt
it wasn't clear enough that "love" meant
"like how Catholics think they love Jesus"

Tainted Mustela no longer starts with
Anemic and now constantly spawns red
creep below himself

Sablez now constantly spawns black
creep below herself

Finalized early implementation of
"Wrong Item" scripts - this mod's
characters really hate certain items!
(these scripts will be updated over time)

Added  base data for a few new
items to be released later

Added  base data for a
new character

Mustela's Medicine and Mustela's Tainted
Sockets can now be summoned
by Lemegeton

{FSIZE2} Items

Satan's Reward has been changed,
hopefully for the last time:
Chill slows enemies by 25% for 0.5s
Adds half a Black Heart
Triggers Satanic Bible's secondary FX
and slows enemies by 50% for 1s
Does something special if any Satan
Boss form is in the room.

Mustela's Birthright has been
changed...again. (again):
No longer grants ANY copies of
Your Soul.
Now removes the Petrification effect
Now adds a chance for tears to carry 
the Ice tearflag (like Uranus)
No longer buffs his Pocket Active

Tainted Mustela's Birthright has been
slightly adjusted:
Grants a second Crystal Key once again
No longer buffs his Pocket Active

Sablez's Birthright has been fixed:
Now correctly grants guaranteed
tear explosions

Sablez's Pocket Active has been replaced:
Now has Voided Storage, a weaker
Moving Box that only she can use.
Voided Storage also does a little bit
of damage to all enemies in the room
on use.

Added a new Item:
Cesarean Scalpel
Active item: 7s cooldown
Hurts you with fake damage
Procs Ventricle Razor
Triggers a Hallucination
For Tainted Sablez, has a 1/7 chance
to spawn a vanilla consumable
from a custom loot table.

Added a new Item: Extinction Certificate
Granted to Mustela or Tainted Mustela
in the Pocket Active slot upon picking
up the opposite form's Pocket Active, 
and removes both of the original items.
If you have Schoolbag, the  active item
in the other  schoolbag slot isn't touched,
even if it's in the main slot. The
replacement is triggered when you try to
use one of the two items,
cancelling their effects.

{FSIZE2}Character changes

Added a new character: Tainted Sablez
Speed: 0.80
Tears: 3.00
Attack: 1.25
Range: 5.00
Shot Speed: 0.80
Luck: -5.00
There are 39 items she can't find in a run.
Check the wiki for the full list.
Birthright: "Something wrong in you"
Grants space distortion fetus tears
Changes functionality of Cesaren Scalpel

Mustela's starting stats have been
adjusted, hopefully for the last time:
Speed: 1.13
Tears: 3.50
Damage: 2.00
Range: 8.50
Shot Speed: 0.75
Luck: 2.00

Tainted Mustela's starting stats have
been adjusted, hopefully for
the last time:
Speed: 1.12
Tears: 2.50
Damage: 2.75
Range: 12.00
Shot Speed: 1.25
Luck: 0.00
Now begins with 5 Broken Hearts and
1 Black Heart.
Luck is floored at -2.56, down from -2

Sablez's starting stats
have been rebalanced:
Speed: 1.20
Tears: 2.20
Damage: 1.75
Range: 7.00
Shot Speed: 1.13
Luck: 1.00
Now starts with a golden Store Credit

{FSIZE2}Other changes
16 more costumes and visual
fixes for Mustela for vanilla items

Banned 60 items from Mustela's runs
Banned 68 items from
Tainted Mustela's runs
Banned 24 items from Sablez's runs

You can check the wiki
for a full list of the banned items:

https://mustela-lore.fandom.com

Please do note that the banned items and
"wrong item scripts" are not the same!
Banned items will not show up naturally,
while "Wrong" items will have harmful
effects if picked up, maybe even ending
a run outright.

minor text fixes

removed herobrine


{FSIZE2}Coming soon
More lore items for all four characters

Yet more costumes for vanilla items for
all four characters
]])

DeadSeaScrollsMenu.AddChangelog("Mustela", "Version 2.1.1", [[{FSIZE3}Update From The
{FSIZE3}Void: Bug Patch

{FSIZE2}Bug Fixes

Sablez's new Pocket Active from the
last update no longer throws an error
on use.

Sablez now has a completed costume.
She was always meant to have glasses,
and I genuinely forgot them in the last
two updates.

Tainted Sablez now has a pair of broken
glasses as part of her costume.

Cesarean Scalpel now correctly spawns
pickups as originally  intended.

{FSIZE2}Item Changes
Voided Storage (Empty) has a
one in three (1/3) chance to
invoke Coupon.

{FSIZE2}Character Changes

Sablez now starts with 20/20

Sablez's Tears stat has been changed
from 2.20 to 1.00

{FSIZE2}Other changes

minor text fixes

removed herobrine
]])

DeadSeaScrollsMenu.AddChangelog("Mustela", "Version 2.2.0", [[{FSIZE3}A Wintasm holiday,
{FSIZE3}Part 1

{FSIZE2}Item Changes

Added a new item: Hibernation
Grants homing for the
current room
Deals fake damage, triggering
Astral Projection in hostile rooms
and granting temporary
invincibility (fake damage) otherwise.


{FSIZE2}Character changes

Added a new character: Wintasm
Speed: 1.05
Tears: 2.00
Attack: 3.00
Range: 8.00
Shot Speed: 0.65
Luck: 1.00

He starts with Astral Projection
as a passive, and a custom
pocket active, Hibernation. He also
has a chance for each tear to
have any of the following effects:
Burst Splitting (33.333%)
Splitting (20%)
Freeze (as in Uranus) (14.28%)
Holy Light (10%)
These effects can be combined,
if you're lucky.

{FSIZE2}Other changes

minor text fixes

removed herobrine
]])

DeadSeaScrollsMenu.AddChangelog("Mustela", "Version 2.3.0", [[{FSIZE3}A Wintasm holiday,
{FSIZE3}Part 2

{FSIZE2}General Changes
Tweaked the patch notes so they fit
better into this menu, and now contain
the name of each respective update.

Added hurt and death sounds for all 5
characters in this mod.

Added a new DSS color palette:
"Wintasm's Favorites"

Moved a lot of character stats out of
characters.lua and into players.xml.
This should make starting a run with
the playable ferrets induce less lag,
makes their stats more balanced without
actually modifying the start values, and
is easier to handle for characters
who will be added in the future.

Mustela, Sablez, Tainted Sablez, and
Wintasm now have a Range floor of 2.50
Tainted Mustela has a Range floor of 4.00
It's fucking rediculous that the base
game's floor is 1.25. That's fuckin' bullshit.

Changed Character Menu sprites for
Mustela, Sablez, and Wintasm to be more
lore-accurate. Mustela has his
Satanic Bible, Sablez has her glasses,
and Wintasm has better lighting.

{FSIZE2} Bug Fixes

Fixed a bug where Mustela's
Shot Speed Multiplier was too high

{FSIZE2}Item Changes

The effect of Hibernation
has been changed:

Invokes Dull Razor, then grants homing
and a Holy Mantle shield for the current
room, and grants 3 seconds of invincibility
frames (180 frames). Also invokes
The Wafer before Dull Razor
if used by Wintasm.

Hibernation now requires 3 charges.
(up from 2)

Voided Storage has a shorter cooldown.

Cesarean Scalpel has a shorter cooldown.

Extinction Certificate's odds have been
adjusted so they now actually match what
the description says.

Extinction Certificate's description has
been updated so that it now accurately
calls the Death Certificate Dimension a
"dimension" instead of a "floor." The DC
Dimension is internally known as a
"Dimension" because it is separate
per floor in a run. The twisted version of
Mausoleum/Gehenna that you get from
beating Mausoleum Mom's Heart is also
classified as a "Dimension," so this is an
established thing already.


{FSIZE2}Character changes

Mustela

Depression is now an Innate item.
Number Magnet is now an Innate Trinket
Judas' Tongue is now an Innate Trinket
Mustela now makes his own rare and small
Creep in addition to what
Depression generates.


Tainted Mustela

Black Candle is now an Innate Item.
Sigil of Baphomet is now an Innate Trinket.
Crystal Key is now an Innate Trinket.
Creep is slightly larger and more frequent.

Luck no longer has a floor.

Shot Speed no longer capped.


Sablez

Match Book is now an Innate Item.
Creep is much more frequent with slightly
random frequency, and slightly random
color, and random size.

Damage increased to 1.20
Shot Speed Cap raised to 5
Removed Luck flooring

Replaced Terra TearFlag with
Sulfuric Acid TearFlag. This makes her
damage and grid/wall breaking abilities
more consistent.


Tainted Sablez

Tainted Sablez's stats have
been adjusted:

Speed: 0.90 (Unchanged)
Speed multiplier reduced to 0.58
Tears: 3.10
Damage:  1.20
Range: 6.00
Shot Speed: 0.60
Luck: -2.00

Creep is now smaller, much more frequent,
and color RNG has wider variance.


Wintasm

Holy Light chance changed: 1/11 (9.09%)
Freeze chance changed: 1/9 (11.1%)
Burst Split chance changed: 100%
Split Chance removed.
Intrinsic Tear Effects are now
influenced by Luck

Starting health is now 3 Bone Hearts

Now starts with 9 Broken Hearts, one
for each non-winter month of the year.

Banned Parasite and Cricket's Body from
showing up in a run for Wintasm.

Astral Projection is now an Innate Item.

Wintasm's stats have been adjusted:

Speed: 1.00
Tears: 2.00
Attack: 1.60
Range: 8.00
Shot Speed: 0.6
Luck: 0

Wintasm now has a Birthright effect:

"Unreasonably optimistic..."

Grants innate effects of
Holy Mantle and Dogma.
Grants quad-splitting tears.
Makes Hibernation grant 120 more
i-frames, for a total of 300 (5 seconds)

This effect is subject to change.


{FSIZE2}Known Bugs
Voided Storage doesn't change its
appearance when used, meaninig the
player needs to manually keep track of
whether it contains anything.


{FSIZE2}Other changes

minor text fixes

major text fixes

removed herobrine
]])