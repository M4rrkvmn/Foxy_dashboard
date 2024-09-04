ESX = exports.es_extended:getSharedObject()


ESX.RegisterServerCallback('nui:sendData', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local data = {
        name = xPlayer.getName(),
        job = xPlayer.getJob().label,
        jobgrade = xPlayer.getJob().grade_label,
        money = xPlayer.getMoney(),
        bank = xPlayer.getAccount('bank').money,
        group = xPlayer.getGroup(),
        id = xPlayer.source,
        date = xPlayer.get('dateofbirth'),
        sex = xPlayer.get('sex'),
        steam = GetPlayerName(source),
    }
    cb(data)
end)
