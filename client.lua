ESX = exports.es_extended:getSharedObject()
local ped = PlayerPedId()


RegisterCommand("dashboard", function(source, args, rawCommand)
    TriggerEvent("openUi")
end, false)

RegisterCommand("closeUi", function(source, args, rawCommand)
    TriggerEvent("closeUi")
end, false)

RegisterNetEvent("openUi")
AddEventHandler("openUi", function()
    SendNUIMessage({
        action = "open"
    })
    SetNuiFocus(true, true)
end)

RegisterNetEvent("closeUi")
AddEventHandler("closeUi", function()
    SendNUIMessage({
        action = "close"
    })
    SetNuiFocus(false, false)
end)

RegisterNUICallback("close", function(data, cb)
    TriggerEvent("closeUi")
    cb("ok")
end)

RegisterNUICallback("getPlayerData", function(data, cb)
    ESX.TriggerServerCallback('nui:sendData', function(playerData)
        cb({
            name = playerData.name,
            job = playerData.job,
            jobgrade = playerData.jobgrade;
            money = playerData.money,
            bank = playerData.bank,
            group = playerData.group,
            id = playerData.id,
            date = playerData.date,
            sex = playerData.sex,
            Male = Config.Male,
            Female = Config.Female,
            Heal = GetEntityHealth(ped) / 2,
            Armor = GetPedArmour(ped),
            steam = playerData.steam,
            ServerName = Config.ServerName,
        })
    end)
end)

