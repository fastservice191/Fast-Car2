ESX = exports["es_extended"]:getSharedObject()

RegisterCommand("car2", function(source, args, rawCommand)
    ESX.TriggerServerCallback('car2:checkAdmin', function(isAdmin)
        if not isAdmin then
            ESX.ShowNotification("~r~Du hast keine Berechtigung, diesen Befehl zu verwenden!")
            return
        end

        local vehicleName = args[1] or "hlcharger"

        if not IsModelInCdimage(vehicleName) or not IsModelAVehicle(vehicleName) then
            print("Dieses Fahrzeugmodell existiert nicht.")
            return
        end

        RequestModel(vehicleName)
        while not HasModelLoaded(vehicleName) do
            Wait(500)
        end

        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)

        local vehicle = CreateVehicle(vehicleName, pos.x, pos.y, pos.z, GetEntityHeading(playerPed), true, false)

        SetPedIntoVehicle(playerPed, vehicle, -1)

        SetVehicleModKit(vehicle, 0)
        SetVehicleMod(vehicle, 11, 3, false)
        SetVehicleMod(vehicle, 12, 2, false)
        SetVehicleMod(vehicle, 13, 2, false)
        SetVehicleMod(vehicle, 15, 3, false)
        ToggleVehicleMod(vehicle, 18, true)

        SetModelAsNoLongerNeeded(vehicleName)
        -- ESX.ShowNotification("~g~Fahrzeug gespawnt:~s~ " .. vehicleName)
    end)
end)
