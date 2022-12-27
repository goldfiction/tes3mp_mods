Enable Combat Music for TES3MP Coop
version 1.1
by Adul



Description and Usage:
----------------------

This plugin enables combat music playback for TES3MP 0.7 coop games, which lack it by default. Other TES3MP versions might also be compatible.

After installing the mod, use the console command "player->AddSpell CombatMusicSpell" (without the quotations) on whichever client you want to control combat music playback for the entire server. Only one player character should possess the spell at any time, otherwise the music streaming script calls will overlap and cause an unpleasant listening experience for everyone.

Due to scripting restrictions, this mod's conditions for when combat music starts and stops are different to the original game.

With this mod, combat music starts whenever the player character who possesses the aforementioned spell ability:
- swings their fist or swings/fires/throws a weapon
- attempts to cast a destruction spell
- is either hit or missed by a melee weapon attack
- is hit by a destruction spell effect
- takes falling/drowning/lava damage.

Combat music stops after all of the above events fail to occur for 7 seconds.

The combat music tracks are selected at random, and the same track is never played twice in a row.

As with all plugins running on TES3MP games, server permission is required.



Installation:
-------------

Unpack the zip archive into one of OpenMW's data folders, then enable the TES3MP_Combat_Music.esp from the OpenMW launcher.

Naturally, the server needs to enable clients to use the plugin. Check the TES3MP Steam FAQ page for tips on how to set up plugins for your server.

Don't forget to add the CombatMusicSpell ability to a player character (see usage notes above).



Customization:
--------------

By default, the mod is configured to play the seven combat music tracks that originally shipped with Morrowind. If required, it can be reconfigured to play different tracks by editing the script 'TES3MP_Combat_Music_Script'. Instructions are provided through comment lines in the script, under the 'CUSTOMIZATION' header. Note that every client should probably use the same version of the plugin file, otherwise issues might occur.

The length of the delay before combat music switches off is customizable by setting the float global 'TES3MP_Combat_Music_Delay' to the desired length in seconds. This might also be possible to achieve through server-side scripts. (Not sure.)



Known Issues:
-------------

1. Being hit by a hand-to-hand attack doesn't proc combat music
2. Being missed by a projectile weapon doesn't proc combat music



Changelog:
----------

1.0
Initial release under the name "Restored Combat Music for TES3MP"

1.1
- Due to me previously overlooking the fact that TES3MP always sends out StreamMusic script calls to all clients simultaneously, this mod had to be thoroughly redesigned and repurposed. It's now apparent that this mod is not fit to use on large public servers where players tend to wander off to do their own thing, because due to how the engine handles the StreamMusic function, the game would always stream combat music to all players whenever any single player gets into a fight. However, it's still fit to use in coop games where players stick together and do joint activities. Because of these considerations, the mod has been renamed to "Enable Combat Music for TES3MP Coop".
- Added the spell ability "CombatMusicSpell", which can be assigned to any player character via the console. The player character who is in possession of this spell ability will control combat music playback for all clients across the server. Only one player should possess the spell at any given time, otherwise the StreamMusic script calls will overlap.
- Fixed a bug where the combat music would fail to play if the combat music instigating action occured right after the last combat music playback session had come to an end.



Contact:
--------

If you have questions, you can contact me via email: adam.zsoldos@reddwarfgames.com