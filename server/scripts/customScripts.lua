-- Load up your custom scripts here! Ideally, your custom scripts will be placed in the scripts/custom folder and then get loaded like this:
--
-- require("custom/yourScript")
--
-- Refer to the Tutorial.md file for information on how to use various event and command hooks in your scripts.

DataManager = require("custom.DataManager")
lustache = require("custom.lustache.main")
periodicCellResets = require("custom.periodicCellResets")
objectSpawnSystem = require("custom.objectSpawnSystem")  --  command: "/sobj"
serverWarp = require("custom.serverWarp")
markRecall = require("custom.markRecall")
potionTweaks = require("custom.potionTweaks")
PreventDamage = require("custom.PreventDamage")  --   command: "/pvp"
TeamGroup = require("custom.TeamGroup")  --  command: "/group"
DragonDoor = require("custom.DragonDoor")
TravelWorld = require("custom.TravelWorld")
MultiMark = require("custom.MultiMark")  -- command: "/mark /recall"
-- BagScript = require("custom.BagScript")
DecorateScript = require("custom.DecorateScript")  --  command: "/dh2"
kanaBank = require("custom.kanaBank")  --  command: "/bank"
customMerchantRestock = require("custom.customMerchantRestock")
quickKeyAddons = require("custom.quickKeyAddons")  --  command: "/macro /hotkey /hotkeys /hk"
levelCap = require("custom.levelCap")
mwScriptConverter = require("custom.mwScriptConverter")
decorateHelp = require("custom.decorateHelp")  --  command: "/dh"
kanaFurniture = require("custom.kanaFurniture")  --  command:  "/furniture /furn"
kanaHousing = require("custom.kanaHousing")  --  command:  "/house /adminhouse /houseinfo"
jcMarketplace = require("custom.jcMarketplace")  -- command:  "/market /marketadd /marketcreate /marketremove /marketdelete /marketlog /marketmessages /marketclearlog /marketjcinfo"
--Good to know:
--    When you're inside a cell you own you can crouch+activate a droped item to set it's price.
--    When a guest is inside a cell that's owned by someone they can't pick up anything that's been droped.
--    When a guest tries to activate a droped item and that item has a price set they can buy it.
--    Money will be transfered to the owned ever if they're offline.
kanaMOTD = require("custom.kanaMOTD")
noteWriting = require("custom.noteWriting")  --  command:  "/write"
DailyRewards = require("custom.DailyRewards")
dbFix = require("custom.dbFix")
memoryInfo = require("custom.memoryInfo")  --  command:  "/memoryinfo  /memoryinfo collect"
lastLogin = require("custom.lastLogin")  --  command:  "/lastlogin <username>"
easyFind = require("custom.easyFind")  --  command:  "/find"
xCard = require("custom.xCard")  --  command:  "/x /xa /n /na /o"
portableBedroll = require("custom.portableBedroll")
speechAntiCrash = require("custom.speechAntiCrash")  --  command:  "/speech /s"
jrpAnim = require("custom.jrpAnim")  --  command:  "/a /anim"
jrpStatus = require("custom.jrpStatus")  --  command:  "/status"
mannequinNPC = require("custom.mannequinNPC")  --  command:  "/mannequin"
followerQuestFixes = require("custom.followerQuestFixes")
modActionMenu = require("custom.modActionMenu")  --  command:  "many"
npcBuffing = require("custom.npcBuffing")
mailSystem = require("custom.mailSystem")  --  command:  "/mail"
VisualHarveting = require("custom.VisualHarvesting.main")
ShutdownServer = require("custom.ShutdownServer.main")  --  command:  "/shutdown"
familiars = require("custom.familiars")  --  command:  "/familiar"
trSummons = require("custom.trSummons")
AotS_Riders = require("custom.AotS_Riders")
pouches = require("custom.pouches")  --  command:  "/pouches"
questFixes = require("custom.questFixes")
spawnSystem = require("custom.spawnSystem")  --  command:  "/sp"
starterItems = require("custom.starterItems")
-- support = require("custom.support")  --  command: "/support /ticket"