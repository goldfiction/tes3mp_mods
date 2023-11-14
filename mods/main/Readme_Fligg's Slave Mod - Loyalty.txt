The Elder Scrolls III MORROWIND:

====================================
Fligg's Slave Mod - Loyalty (v1.0.5)
====================================

By Deylendor
9.30.2013

1. Description
2. Requirements
3. Installing the plug-in
4. Save games
5. Version history


========================
1. DESCRIPTION
========================

This is an add-on for 'Fligg's Slave Mod' [http://download.fliggerty.com/download-110-6]

Fligg's slave mod has a small loyalty system integrated into the mod. After your claimed slave's disposition is
at least 80 you can gain loyalty points when choosing the "-- slave care" topic and give food, drinks or just talk 
to your slave. If you release your slave while having at least 15 loyalty with it would NOT disappear after a cell
reload, instead it would stay and offer to be your friend as it likes you and has nowhere to go.

Add-on features::

- Each time you talk to your slaves now you get a summary of their current health and loyalty.
Loyalty itself IS part of Fliggerty's mod but wasn't directly visible.
- 5 loyalty stages:: -- Apprehensive->Neutral->Favorable->Friendly->Devoted (0-9,10-19,20-29,30-39,40+)
Slaves have to be at least 'Friendly' towards the player to not vanish when freed.
- After disposition 80 when your slaves are able to gain loyalty it's no longer possible to exploit free
loyalty increasal by just talking to them repeatedly. Loyalty incresal by talking happens only once per day.
- Limited the amount of food and drinks slaves can consume per day to 2 each. ( It was unlimited )
- quick access messagebox to issue basic movement commands.. Its faster and move efficient that way to
move around multiple slaves, especially for people with slowed down dialogue like Vampire Embrace users.
To trigger the messagebox menu just have your fists/weapon drawn while attempting to talk to your slaves.
- sub-menu messagebox "Discuss Tactics" to issue melee/ranged/mixed weapon preference commands.
- Combat bonuses for loyalty stages after 'Apprehensive'.
	Fortify Attack 10			-- Neutral
	Fortify Attack 15, Restore Fatigue 1 	-- Favorable
	Fortify Attack 20, Restore Fatigue 3	-- Friendly
	Fortify Attack 25, Restore Fatigue 5	-- Devoted
- Added "Slaver's key" to Addamasartus (first cave near Seya Neen). Equipping it starts the option menu
- Option menu lets you choose bewteen "1x" and "2x" loyaylty stage requirement. Default is "2x"

Features to add::
- Utilize your Slaves for labor and make profit.
- labor bonuses for various loyalty stages after 'Apprehensive'.
- Name it. If I like it I'll add it.

========================
2. REQUIREMENTS
========================

Morrowind, Tribunal, Bloodmoon, Fligg's Slave Mod 1.3 -- http://download.fliggerty.com/download-110-6

========================
3. INSTALLING THE PLUGIN
========================

Extract 'Fligg's Slave Mod - Loyalty.esp' into your 'Data Files' folder and load it after 'Fligg's Slave Mod.esp'

========================
4. SAVE GAMES
========================

Your savegames will detect that the local count for variables in any 'slavescript' has been changed. 
This can be safely ignored and it happens only the first time you load your savegame...
... and after an update if I happen to change the number of variables in a script.

========================
5. VERSION HISTORY
========================
1.0.5
- Fixed critical bug when hiting your slaves.
- Fixed health/loyalty reports when activating already dead slaves.
- Fixed some menu typos.
1.0.4
- Reduced 'slaveScript' script size ( Most calculations are done with a function )
- Added Combat bonuses for loyalty stages after 'Apprehensive'
- Added "Slaver's key" to Addamasartus (first cave near Seya Neen). Equipping it starts the option menu.
Option menu lets you choose between "1x" and "2x" loyalty stage requirement. Default is "2x"
1.0.3
- Your slaves are now able to gain max 5 loyalty per day as giving food and drinks is now limited to 2x per day each.
1.0.2
- Fixed the "Only talk to slaves to increase their loyalty" abuse. Slaves now gainloyalty ONCE per day by being talked to.
Feed them or give them something to drink to increase their loyalty further.
1.0.1	
- Fixed 'meele'->'melee' typo
- Added greeting for freed slaves who stay ( preventing "go free" greetings based on their initial location )
1.0 	
- Release