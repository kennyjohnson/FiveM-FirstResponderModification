local resource = GetCurrentResourceName()

if FirstResponderMod.Config.EconomyEnabled then
	
		AddEventHandler("playerConnecting", function(name, setReason, deferrals)
			if string.find(GetPlayerIdentifiers(source)[1], "steam:") then
					local user = source
					local data = ReadFile('cashdata')
					local count = 0
					local found = false

					for k, v in pairs(data) do
							count = count + 1
							if v.steamid == GetPlayerIdentifiers(user)[1] then
									found = true
							end
					end

					if not found then
							count = count + 1
							local userinfo = {
									["name"] = GetPlayerName(user),
									["steamid"] = GetPlayerIdentifiers(user)[1],
									["cash"] = 0,
									["bank"] = 0,
							}
							table.insert(data, userinfo)
							WriteFile('cashdata', data)
					end

					if count == 0 then
							local userinfo = {
									["name"] = GetPlayerName(user),
									["steamid"] = GetPlayerIdentifiers(user)[1],
									["cash"] = 0,
									["bank"] = 0,
							}
							table.insert(data, userinfo)
							WriteFile('cashdata', data)
					end
		else 
			setReason("Error! Steam is required to play on this FiveM server.")
			CancelEvent()
		end
	end)
	
	
end

function FirstResponderMod.AddMoney(user, type, amount)
    amount = tonumber(amount)
    if user == "self" then
        user = source
    end
    local userdata = GetUserData(user)
    local data = ReadFile('cashdata')
    if type == "bank" then
        local newuserdata = {
            ["name"] = GetPlayerName(user),
            ["steamid"] = GetPlayerIdentifiers(user)[1],
            ["cash"] = userdata.cash,
            ["bank"] = math.floor(userdata.bank + amount),
        }
        for k, v in pairs(data) do
            if v.steamid == userdata.steamid then
                table.remove(data, k)
                table.insert(data, newuserdata)
                WriteFile('cashdata', data)
            end
        end
        TriggerClientEvent("updateClientMoney", user, "bank", GetUserData(user).bank)  
    else
        local newuserdata = {
            ["name"] = GetPlayerName(user),
            ["steamid"] = GetPlayerIdentifiers(user)[1],
            ["cash"] = math.floor(userdata.cash + amount),
            ["bank"] = userdata.bank,
        }
        for k, v in pairs(data) do
            if v.steamid == userdata.steamid then
                table.remove(data, k)
                table.insert(data, newuserdata)
                WriteFile('cashdata', data)
            end
        end
        TriggerClientEvent("updateClientMoney", user, "cash", GetUserData(user).cash)  
    end
end

function FirstResponderMod.RemoveMoney(user, type, amount)
    amount = tonumber(amount)
    if user == "self" then
        user = source
    end
    local userdata = GetUserData(user)
    local data = ReadFile('cashdata')
    if type == "bank" then
        if userdata.bank < amount then
            return false
        else
            local newuserdata = {
                ["name"] = GetPlayerName(user),
                ["steamid"] = GetPlayerIdentifiers(user)[1],
                ["cash"] = userdata.cash,
                ["bank"] = math.floor(userdata.bank - amount),
            }
            for k, v in pairs(data) do
                if v.steamid == userdata.steamid then
                    table.remove(data, k)
                    table.insert(data, newuserdata)
                    WriteFile('cashdata', data)
                end
            end
            TriggerClientEvent("FirstResponderMod:updateClientMoney", user, "bank", GetUserData(user).bank)  
            return true
        end
    else
        if userdata.cash < amount then
            return false
        else
            local newuserdata = {
                ["name"] = GetPlayerName(user),
                ["steamid"] = GetPlayerIdentifiers(user)[1],
                ["cash"] = math.floor(userdata.cash - amount),
                ["bank"] = userdata.bank,
            }
            for k, v in pairs(data) do
                if v.steamid == userdata.steamid then
                    table.remove(data, k)
                    table.insert(data, newuserdata)
                    WriteFile('cashdata', data)
                end
            end
            TriggerClientEvent("FirstResponderMod:updateClientMoney", user, "cash", GetUserData(user).cash)  
            return true
        end
    end
		
end

function GetUserData(user)
    if user == "self" then
        user = source
    end
    local returndata = nil
    for k, v in pairs(ReadFile('cashdata')) do
        if v.steamid == GetPlayerIdentifiers(user)[1] then
            returndata = v
        end
    end
    return returndata
end

function ReadFile(file)
    local data = LoadResourceFile(resource, file .. '.json')
    if data then
        return json.decode(data)
    else
        return false
    end
end

function WriteFile(file, data)
    SaveResourceFile(resource, file .. '.json', json.encode(data), -1)
end

if not ReadFile('cashdata') then
    WriteFile('cashdata', {})
end

local function format_thousand(v)
    local s = string.format("%d", math.floor(v))
    local pos = string.len(s) % 3
    if pos == 0 then pos = 3 end
    return string.sub(s, 1, pos) .. string.gsub(string.sub(s, pos+1), "(...)", ",%1")
end
