     ___                                                                ___
 ___/   \______________________________________________________________/   \___
/   \___/                                                              \___/_  \
\__/   \                    SEI'S DYNAMIC WILDLIFE                       /   \_/
   \___/_________________________________________________________________\___/
                                                          Version 0.5


                                TABLE OF CONTENTS
             
             1. Description
             2. Requirements
             3. Compatibility
             4. Configuration
             5. Advanced configuration
             6. Known issues
             7. Permissions
             8. Contact
             9. Version history


                                   DESCRIPTION

             Tired of roaming the world and seeing creatures spawn in
             the same spots every time? Do you play a hunter and wish
             there were more creatures to hunt? Have you ever thought
             that the wilderness of Morrowind just needs more scribs?

             With Dynamic Wildlife, you will never run out of animals
             to hunt or practice your skills on. This mod dynamically
             spawns animals around you as you traverse the wilderness
             and despawns them as you move further away, so as to not
             clutter the landscape, ensuring a fresh experience every
             time you revisit an area.

             With the mod installed, you will run across creatures in
             places where you would least expect them. The mod uses a
             sophisticated scripting system to place and track spawns
             around the player, ensuring animals spawn in appropriate
             spots for their type and keeps them from spawning inside
             towns and settlements.

             Almost every animal that roams the land, including their
             diseased variants, are present in the custom spawn list.
             Drawing inspiration from another mod, a few new diseased
             variants have been added as well. Furthermore, in Blight
             or ash storms, blighted animals and Corprus monsters may
             appear in the haze.

             Every creature spawn is unleveled. Should you dare stray
             into the Red Mountain region, or if you venture into the
             Ashlands during an ash storm, you may well run into Lame
             Corpruses and Blighted animals at first level. Make sure
             you bring some protection against both common and Blight
             disease with you when venturing forth into the wilds.

             Daedra, undead, or vampires are not part of the scope of
             this mod. It only adds spawns for creatures that already
             spring from fixed spawn points in the outdoors.

             My decision to exclude daedra, even from the Grazelands,
             is a deliberate design choice. In the future, I may make
             a separate mod that adds vampires, daedra, or the undead
             to the wilds surrounding these creatures' haunts.


                                   REQUIREMENTS

             This mod needs both Tribunal and Bloodmoon to be active.


                                  COMPATIBILITY

             This mod should be compatible with nearly everything. No
             vanilla creatures are modified, and no leveled lists are
             changed. It only uses vanilla Morrowind scripting and is
             compatible with OpenMW. Indeed, it was developed for and
             tested on OpenMW, though the mod has been tested on both
             platforms to ensure its compatibility.

             Landmasses added by mods such as Tamriel Rebuilt are not
             covered by this mod, and neither is Solstheim. In future
             versions, support may be added for TR. This should still
             be compatible with TR, but the extra creature spawns are
             confined to the island of Vvardenfell for now.


                                  CONFIGURATION

             The mod is set up and ready to use as is. Just enable it
             in your launcher and play. However, if you would like to
             fine tune the experience, open up the console and change
             the following global variables. The values will be saved
             between sessions.

             MOBSPAWNING
             Set to 1 to enable, 0 to disable creature spawning. It's
             set to 1 by default.

             MOBCAP
             How many creatures to spawn. Default is 16. Setting this
             higher than 50 has no effect.

             MOBSLESSAGGRESSIVE
             Set to 0 by default. Setting this to 1 reduces the Fight
             rating of all creatures spawned by this mod, effectively
             reducing the distance at which they will attack you.


                                 ADVANCED CONFIGURATION

             You don't need to change these values, but they exist as
             debugging options or information.

             MOBSPAWNRANGE
             The minimum distance from you that creatures will spawn.
             Also the distance at which corpses will despawn. Default
             is 4096 (half a cell). You shouldn't have to change this
             unless you are debugging or want to experiment.

             MOBDESPAWNRANGE
             The maximum distance from you that creatures will spawn.
             Also the distance at which every creature will instantly
             despawn. Default is 8192 (one cell). Setting this higher
             than 8192 may result in creatures not despawning because
             their despawn scripts will not run (though this will not
             impact performance, for the same reason).

             MOBSPAWNHEIGHT
             The height over terrain level that creatures will spawn.
             Default is 1000. You may tweak this value if you see any
             creatures spawning inside statics.

             MOBSACTIVE
             You can't change this value. It only displays the number
             of currently active creatures around the player.

             MOBSTOTAL
             You cannot change this value. It only displays the total
             number of creatures that have been spawned in the world.
             This includes inactive creatures outside the active cell
             grid. This value is just debug information.


                                  KNOWN ISSUES

             There are minor differences between Morrowind and OpenMW
             in how the engines handle actor placement, which results
             in creatures sometimes appearing in the air for a single
             frame in the vanilla Morrowind engine. This issue is due
             to how the spawning script attempts to prevent creatures
             from spawning inside landscape objects like mushrooms or
             rocks. Animals may sometimes still spawn inside rocks or
             on top of mushrooms or in trees occasionally. I have yet
             to find a workaround for this without resorting to using
             either OpenMW-lua or MWSE-lua, so for the sake of cross-
             compatibility, I deem this an acceptable limitation. The
             issue with hovering creatures does not appear in OpenMW.

             Creatures may also sometimes appear on top of, or inside
             buildings like houses or ruins. This is because I wanted
             to preserve performance, especially in heavily populated
             regions like the Ascadian Isles, by not adding excessive
             distance calculations to the scripts. I may revisit this
             issue in a future version of the mod.


                                   PERMISSIONS

             Anyone may freely modify, distribute, or rehost this mod
             as long as they include this readme and attribute credit
             to me, Seibaby, as the original author, and provided any
             modified work is published under its own title.


                                    CONTACT

             If you have questions, feedback, or bug reports, you may
             send me a message via Nexus, or find me in the Morrowind
             modding Discord.


                                 VERSION HISTORY

             Version 0.5 - Initial release.


     ___                                                                ___
 ___/   \______________________________________________________________/   \___
/   \___/                                                              \___/_  \
\__/   \                    SEI'S DYNAMIC WILDLIFE                       /   \_/
   \___/_________________________________________________________________\___/