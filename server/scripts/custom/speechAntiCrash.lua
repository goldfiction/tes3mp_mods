-- speechAntiCrash for tes3mp 0.7-prerelease. created by malic for JRP Roleplay
-- Prevents crash from custom races uses /speech
-- under BSD

local isDisabled = false -- disable speech entirely

local function ChatListener(pid, cmd)
	if isDisabled == false then
		local race = string.lower(Players[pid].data.character.race)
		if (cmd[1] == "s" or cmd[1] == "speech") and race ~= "dark elf" and race ~= "high elf" and race ~= "redguard" and race ~= "argonian" and race ~= "breton" and race ~= "wood elf" and race ~= "imperial" and race ~= "nord" and race ~= "orc" and race ~= "khajiit" then
			tes3mp.MessageBox(pid, -1, "Your race cannot use /speech")
			return
		else
			local isValid = false
			if cmd[2] ~= nil and cmd[3] ~= nil and type(tonumber(cmd[3])) == "number" then
				isValid = speechHelper.PlaySpeech(pid, cmd[2], tonumber(cmd[3]))
			end
			if not isValid then
				local validList = speechHelper.GetPrintableValidListForPid(pid)
				tes3mp.SendMessage(pid, "That is not a valid speech. Try one of the following:\n"
					.. validList .. "\n", false)
			end
		end
	else
		tes3mp.MessageBox(pid, -1, "/speech has been disabled")
		return
	end
end

customCommandHooks.registerCommand("s", ChatListener)
customCommandHooks.registerCommand("speech", ChatListener)
