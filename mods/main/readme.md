##README
***
* This is repo for Goldfiction server
* the server uses 0.8.0 TES3MP version
* Added grass cover for all regions
* Removed Grass Vanilla2.esp from required mod list
* you need to copy all the files to /morrowind/data files/
* you also need to put ground cover files to /morrowind/data files/, not in ground cover subfolder
* you will also need to drag and drop mod sequence to match with server
* Now to have grass cover functionality in both pc and android version clients:
---
* Add this to your openmw.cfg:
```js
groundcover=Grass AC.esp
groundcover=Grass AI.esp
groundcover=Grass AL.esp
groundcover=Grass BC.esp
groundcover=Grass GL.esp
groundcover=Grass WG.esp
```
* also, in mods selection dialog in android, choose ground cover esp tab, choose above esp files as ground cover esp
---
* Add this to your settings.cfg:
```js
[Groundcover]
enabled = true
density = 0.5
min chunk size = 0.5
stomp mode = 2
stomp intensity = 2
```
* also, in settings dialog in android, enable same as above ground cover settings
* these changes no longer require vanilla 2 grass to be in the mod list. ground cover mod can also be replaced by [following 3 alternatives](https://modding-openmw.com/lists/total-overhaul/#total-overhaul-groundcover) 
----
* We have a few major new mods added to the box
** Tamriel Rebuilt  --  This mod require both tamriel rebuilt (included in the repo) and tamriel rebuilt data (you need to download following the link. It's around 700MB, this repo would not allow file that sized)
** Skyrim Home of Nords  --  included in the repo
** Province of Cyrodill  --  included in the repo
* These addition would include more than 300 quests!
* All places are visitable using android client
* We found that android client does not respond to shift+Y key to initiate a chat. For that you need to login to pc client, set in /hotkey, make hotkey 8 to have macro of "/hotkey". Then add hotkey 8 to your F1 quickbar 8 key. This way, in android, pressing 8 key will invoke hotkey menu, allowing you to modify hotkey 7 to be any value. Assign hotkey 7 to F1 quickbar 7 key to run this command. The other keys can be used this way as well even on android.
* We found Rapport 2.0 to be very popular. But we also found there is no Companion Warp spell added to newly created post-secondary players. The spell is only given to first player. So I created a small addon: GR_Rapport2_CompanionWarpSoldInBalmoraMagesGuild.ESP. As the name suggests, the Companion Warp is now sold in Balmora Mages Guild. It's quite easy to find. And voila, no more "where did my orc go".
* GR_BalmoraMagesGuildSellAllSummoningSpells.ESP is a small mod made by me. It's purpose is to sell all summoning spells in Balmora. These above all others, most importantly sells summon Ancestry Ghost (the beginner soul trapping), summon Golden Saint (the final stop for soul trapping), summon dewmer centaury (the one summoning spell you can't get until the last few quests in MG). They are uber expensive, mind you.
* And about ground cover:
** link to Aesthesia groundcover: this is just a reference. Aesthesia is attached in the repo. You need to unpack it and merge with data files.
** link to Remiros Groundcover: this is just provided if you are not satisfied with Aesthesia version
** you can use either one tbh
** these ground covers are not to be added to mod order queue
** these ground covers in pc are attached using the above config changes. In android client, where you choose mod order, look to the top to find ground cover tab to the right most. Voila, select Vanilla Grass 2.esp is sufficient. We don't  know what Vanilla Grass 1 do. But Vanilla 2 includes all 6 vanilla regions. We found the TR versions to be broken, so skip the TR, TRp s.
** they, after loaded as ground cover content, will only affect your local game experience, including but not limited to floural trampling. So your friends 5m away can't really see your flower trampling results.
* EBJ_spell_organizer is a small mod that renamed all the vanilla spells to follow a simple naming convention. So it's easy to find spells or use filter to find spells based on their school of magic.
* we removed stc_bloodmoon and stc_tribunal from mod queue because they are not that useful. They added around 5 ingredients to 2 vendors. Claiming they added all the missing ingredents that were not acquireable through normal game play. If you find them useful, let me know.



