ESX = exports["es_extended"]:getSharedObject()


local lastPosition = nil
local cam

-- Function Close 
RegisterNUICallback('close', function(data, cb)
   SetNuiFocus(false,false)
    cb('ok')
end)




function SpawnPlayer(x, y, z)
    local pos = GetEntityCoords(PlayerPedId())
    local cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", x, y, z + 200.0, 270.00, 0.00, 0.00, 80.00, 0, 0)

    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)

    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityVisible(PlayerPedId(), false, false)
    SetEntityCoords(PlayerPedId(), x, y, z, 1, 0, 0, 1)

    SetTimeout(1000, function()
        ESX.Game.Teleport(PlayerPedId(), vector3(x, y, z))
        DoScreenFadeOut(500)
        Citizen.Wait(500)

        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityVisible(PlayerPedId(), true, false)

        RenderScriptCams(false, false, 0, true, true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)
        SetNuiFocus(false, false)
        DoScreenFadeIn(500)
    end)
end



function openSpawnSelector()
    SendNUIMessage({
        type = "openSpawnSelector",
    })
    SetNuiFocus(true, true)
end

RegisterCommand('map', function()
    openSpawnSelector()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function()
    TriggerServerEvent("krs_spawn", source)
    openSpawnSelector()
end)


RegisterNUICallback('sandy', function(data, cb)
    local pos = GetEntityCoords(PlayerPedId())
    local x, y, z = pos.x, pos.y, pos.z
    local spawnPos = vector3(1758.2344, 3293.7024, 41.1342)
    SpawnPlayer(spawnPos.x, spawnPos.y, spawnPos.z)
    cb('ok')
end)


RegisterNUICallback('police', function(data, cb)
    local pos = GetEntityCoords(PlayerPedId())
    local x, y, z = pos.x, pos.y, pos.z
    local spawnPos = vector3(411.5239, -979.7604, 29.4136)
    SpawnPlayer(spawnPos.x, spawnPos.y, spawnPos.z)
    cb('ok')
end)


RegisterNUICallback('airport', function(data, cb)
    local pos = GetEntityCoords(PlayerPedId())
    local x, y, z = pos.x, pos.y, pos.z
    local spawnPos = vector3(-1035.2404, -2733.4690, 20.1693)
    SpawnPlayer(spawnPos.x, spawnPos.y, spawnPos.z)
    cb('ok')
end)


RegisterNUICallback('paleto', function(data, cb)
    local pos = GetEntityCoords(PlayerPedId())
    local x, y, z = pos.x, pos.y, pos.z
    local spawnPos = vector3(-435.5411, 6023.0200, 31.4901)
    SpawnPlayer(spawnPos.x, spawnPos.y, spawnPos.z)
    cb('ok')
end)

RegisterNUICallback('spawn', function(data, cb)
    if lastPosition ~= nil then
        SpawnPlayer(lastPosition.x, lastPosition.y, lastPosition.z)
        cb('ok')
    else
      
        cb('error: last known position not found')
    end
end)

RegisterNetEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
    local pos = GetEntityCoords(PlayerPedId())
    lastPosition = pos
end)
