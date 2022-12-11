-- racialPerks for tes3mp 0.7-prerelease. created by malic for JRP Roleplay
-- under GPLv3

local racialPerks = {}
racialPerks.argonianBreathing = true
racialPerks.argonianBurst = true
racialPerks.khajiitEye = true

local function createRecord(request)
	if request == "argonian water breathing" then
		local recordStore = RecordStores["spell"]
		recordStore.data.permanentRecords["water_breathing_perma"] = {
			name = "Gills",
			subtype = 4,
			cost = 0,
			flags = 0,
			effects = {{
				id = 0,
				attribute = -1,
				skill = -1,
				rangeType = 0,
				area = 0,
				magnitudeMax = 100,
				magnitudeMin = 100
			}}
		}
		recordStore:Save()
	elseif request == "argonian burst spell" then
		local recordStore = RecordStores["spell"]
		recordStore.data.permanentRecords["swift_swim_racial"] = {
			name = "Burst of Speed",
			subtype = 0,
			cost = 0,
			flags = 4,
			effects = {{
				id = 1,
				attribute = -1,
				skill = -1,
				rangeType = 0,
				area = 0,
				duration = 25,
				magnitudeMax = 70,
				magnitudeMin = 70
			}}
		}
		recordStore:Save()
	elseif request == "toggle nighteye" then
		local recordStore = RecordStores["spell"]
		recordStore.data.permanentRecords["nighteye_toggle"] = {
			name = "Night-Eye (/eyes)",
			subtype = 4,
			cost = 0,
			flags = 0,
			effects = {{
				id = 43,
				attribute = -1,
				skill = -1,
				rangeType = 0,
				area = 0,
				magnitudeMax = 50,
				magnitudeMin = 50
			}}
		}
		recordStore:Save()
	end
end

local function raceFunctions(eventStatus,pid)
	local race = string.lower(Players[pid].data.character.race)
	if race == "argonian" then
		if racialPerks.argonianBreathing == true then
			table.insert(Players[pid].data.spellbook, "water_breathing_perma")
			Players[pid]:LoadSpellbook()
		else
			logicHandler.RunConsoleCommandOnPlayer(pid, "player->removespell water_breathing_perma")
			tableHelper.removeValue(Players[pid].data.spellbook, "water_breathing_perma")
			Players[pid]:LoadSpellbook()
		end
		if racialPerks.argonianBurst == true then
			table.insert(Players[pid].data.spellbook, "swift_swim_racial")
			Players[pid]:LoadSpellbook()
		else
			logicHandler.RunConsoleCommandOnPlayer(pid, "player->removespell swift_swim_racial")
			tableHelper.removeValue(Players[pid].data.spellbook, "swift_swim_racial")
			Players[pid]:LoadSpellbook()
		end
	elseif (race == "khajiit" or race == "t_els_cathay" or race == "t_els_cathay-raht" or race == "t_els_ohmes" or race == "t_els_ohmes-raht" or race == "t_els_suthay") and racialPerks.khajiitEye == true then
		logicHandler.RunConsoleCommandOnPlayer(pid, "player->removespell nighteye_toggle")
		tableHelper.removeValue(Players[pid].data.spellbook, "nighteye_toggle")
		Players[pid]:LoadSpellbook()
	end
end

local function OnServerPostInitH(eventStatus)
	if racialPerks.argonianBreathing == true then
		local request = "argonian water breathing"
		createRecord(request)
	end
	if racialPerks.argonianBurst == true then
		local request = "argonian burst spell"
		createRecord(request)
	end
	if racialPerks.khajiitEye == true then
		local request = "toggle nighteye"
		createRecord(request)
	end
end

local function OnPlayerAuthentifiedH(eventStatus,pid)
	raceFunctions(eventStatus,pid)
end

local function ChatListener(pid,cmd)
	local race = string.lower(Players[pid].data.character.race)
	if cmd[1] == "eyes" and racialPerks.khajiitEye == true and (race == "khajiit" or race == "t_els_cathay" or race == "t_els_cathay-raht" or race == "t_els_ohmes" or race == "t_els_ohmes-raht" or race == "t_els_suthay") then
		if tableHelper.containsValue(Players[pid].data.spellbook, "nighteye_toggle") then
			logicHandler.RunConsoleCommandOnPlayer(pid, "player->removespell nighteye_toggle")
			tableHelper.removeValue(Players[pid].data.spellbook, "nighteye_toggle")
			Players[pid]:LoadSpellbook()
		else
			table.insert(Players[pid].data.spellbook, "nighteye_toggle")
			Players[pid]:LoadSpellbook()
		end
	elseif cmd[1] == "eyes" and racialPerks.khajiitEye == true then
		tes3mp.SendMessage(pid, "That command is only available for khajiit furstock.\n", false)
	end
end

customCommandHooks.registerCommand("eyes", ChatListener)
customEventHooks.registerHandler("OnPlayerAuthentified", OnPlayerAuthentifiedH)
customEventHooks.registerHandler("OnServerPostInit", OnServerPostInitH)
