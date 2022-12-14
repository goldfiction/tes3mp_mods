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
