-- xCard for tes3mp 0.7-prerelease. created by malic for JRP Roleplay
-- Based on the X-Card concept by John Stavropoulos
-- Adds /x, /n, and /o card commands with optional anonymity as /xa and /na
-- under BSD

local xCard = {}

function xCard.tapCard(pid,cmd)
	local cellDescription = Players[pid].data.location.cell
	if logicHandler.IsCellLoaded(cellDescription) == true then
		for index, visitorPid in pairs(LoadedCells[cellDescription].visitors) do
			if cmd[1] == "x" and cmd[2] ~= nil then
				local message = logicHandler.GetChatName(pid) .. " has tapped the X-Card for the following subject: " .. tableHelper.concatenateFromIndex(cmd, 2) .. "\n"
				tes3mp.SendMessage(visitorPid, color.Error .. message .. color.Default, false)
			elseif cmd[1] == "xa" and cmd[2] ~= nil then
				local message = "Someone has tapped the X-Card for the following subject: " .. tableHelper.concatenateFromIndex(cmd, 2) .. "\n"
				tes3mp.SendMessage(visitorPid, color.Error .. message .. color.Default, false)
			elseif cmd[1] == "n" and cmd[2] ~= nil then
				local message = logicHandler.GetChatName(pid) .. " wants to steer clear of following subject: " .. tableHelper.concatenateFromIndex(cmd, 2) .. "\n"
				tes3mp.SendMessage(visitorPid, color.Error .. message .. color.Default, false)
			elseif cmd[1] == "na" and cmd[2] ~= nil then
				local message = "Someone wants to steer clear of the following subject: " .. tableHelper.concatenateFromIndex(cmd, 2) .. "\n"
				tes3mp.SendMessage(visitorPid, color.Error .. message .. color.Default, false)
			elseif cmd[1] == "o" and cmd[2] ~= nil then
				local message = logicHandler.GetChatName(pid) .. " wants to see more of following subject: " .. tableHelper.concatenateFromIndex(cmd, 2) .. "\n"
				tes3mp.SendMessage(visitorPid, color.Default .. message .. color.Default, false)
			else return
			end
		end
	end
end

customCommandHooks.registerCommand("x", xCard.tapCard)
customCommandHooks.registerCommand("xa", xCard.tapCard)
customCommandHooks.registerCommand("n", xCard.tapCard)
customCommandHooks.registerCommand("na", xCard.tapCard)
customCommandHooks.registerCommand("o", xCard.tapCard)
