RegisterNetEvent("FirstResponderMod:updateClientMoney")
AddEventHandler("FirstResponderMod:updateClientMoney", function(type, amount)
    if type == "bank" then
        StatSetInt('BANK_BALANCE', amount, true)
    else
        StatSetInt('MP0_WALLET_BALANCE', amount, true)
    end
end)
