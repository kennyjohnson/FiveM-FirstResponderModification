local resource = GetCurrentResourceName()
FirstRepsonderMod.DataTable = {}

function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
        setmetatable(copy, deepcopy(getmetatable(orig)))
    else
        copy = orig
    end
    return copy
end

function FirstRepsonderMod.InitializeDataTable( title, table )
  FirstRepsonderMod.DataTable[title]= deepcopy(table)
end
  
  





AddEventHandler("playerConnecting", function(name, setReason, deferrals)
    if string.find(GetPlayerIdentifiers(source)[1], "steam:") then
        local user = source
        local data = ReadFile('data')
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
            WriteFile('data', data)
        end
    
        if count == 0 then
            local userinfo = {
                ["name"] = GetPlayerName(user),
                ["steamid"] = GetPlayerIdentifiers(user)[1],
                ["cash"] = 0,
                ["bank"] = 0,
            }
            table.insert(data, userinfo)
            WriteFile('data', data)
        end
	else 
		setReason("Error! Steam is required to play on this FiveM server.")
		CancelEvent()
	end
end)
