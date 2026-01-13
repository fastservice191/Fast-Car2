ESX = exports["es_extended"]:getSharedObject()

ESX.RegisterServerCallback('car2:checkAdmin', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then
        cb(false)
        return
    end

    if xPlayer.getGroup() == 'admin' then
        cb(true)
    else
        cb(false)
    end
end)
