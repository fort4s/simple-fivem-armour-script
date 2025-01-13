ESX = exports['es_extended']:getSharedObject()

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(500)
    end

    RegisterCommand(Config.CommandName, function(source, args, rawCommand)
        local xPlayer = ESX.GetPlayerFromId(source)
        if not xPlayer then return end

        local playerGroup = xPlayer.getGroup()
        if not Config.AllowedGroups or not table.contains(Config.AllowedGroups, playerGroup) then
            xPlayer.showNotification(Config.Messages.NoPermission)
            return
        end

        local targetPlayerId = tonumber(args[1])
        local armourValue = tonumber(args[2]) or Config.DefaultArmour

        if targetPlayerId then
            local targetPlayer = ESX.GetPlayerFromId(targetPlayerId)
            if targetPlayer then
                TriggerClientEvent('armour:setPlayerArmour', targetPlayer.source, armourValue)
                local targetPlayerID = targetPlayer.source
                xPlayer.showNotification(Config.Messages.ArmourGivenOther:format(targetPlayerID, targetPlayerID))
                targetPlayer.showNotification(Config.Messages.ArmourReceived:format(xPlayer.source, xPlayer.source))
            else
                xPlayer.showNotification("Player ID not found.")
            end
        else
            TriggerClientEvent('armour:setPlayerArmour', source, armourValue)
            xPlayer.showNotification(Config.Messages.ArmourGivenSelf)
        end
    end, false)
end)

function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then return true end
    end
    return false
end
