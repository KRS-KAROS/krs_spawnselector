ESX = exports["es_extended"]:getSharedObject()


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(source)
    local identifier = ESX.GetPlayerFromId(source).identifier
    MySQL.Async.fetchAll('SELECT skin FROM users WHERE identifier = @identifier', {['@identifier'] = identifier}, function(res)
        if res[1].skin == nil then  
            TriggerClientEvent("krs_spawn", source)
        end
    end)
end)
