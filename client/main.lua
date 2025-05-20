--[[
    Script Name : PD Reception
    Author      : Riptide Studios
    Copyright   : © 2025 Riptide Studios
    Version     : 1.0.3.0
    Description : This configuration file is not intended to be edited.
                  Unauthorized modifications may cause unexpected behavior.
]]

QBCore = exports['qb-core']:GetCoreObject()
local ped = PlayerPedId()
local pCoords
local data

RegisterNetEvent('riptide_reception:client:assistance_requested')
AddEventHandler('riptide_reception:client:assistance_requested', function()
    return lib.notify({
        title = 'Assistance requested',
        description = 'An officer will be with you shortly!',
        position = 'center-right',
        type = 'success'
    })
end)

RegisterNetEvent('riptide_reception:client:insufficient_cops')
AddEventHandler('riptide_reception:client:insufficient_cops', function()
    return lib.notify({
        title = 'Assistance unavailable',
        description = 'Unfortunately nobody is able to assist you right now. Please try again later!',
        position = 'center-right',
        type = 'error'
    })
end)

RegisterNetEvent('riptide_reception:client:application_success')
AddEventHandler('riptide_reception:client:application_success', function()
    return lib.notify({
        title = 'Application sent',
        description = 'Thank you for applying!',
        position = 'center-right',
        type = 'success'
    })
end)

RegisterNetEvent('riptide_reception:client:request_supervisor')
AddEventHandler('riptide_reception:client:request_supervisor', function()
    QBCore.Functions.TriggerCallback('riptide_reception:getCopCount', function(copCount)
        print('[riptide_reception] Cops Online: ' .. copCount)
        if copCount > 0 then
            if GetResourceState("ps-dispatch") == "started" then
                local dispatchData =
                {
                    message = "Supervisor Requested",
                    codeName = "911call",
                    code = "Bell",
                    icon = "fas fa-phone",
                    priority = 2,
                    coords = pCoords,
                    street = GetStreetAndZone(pCoords),
                    jobs = { 'leo' }
                }
                TriggerServerEvent("ps-dispatch:server:notify", dispatchData)
            end
            TriggerEvent("riptide_reception:client:assistance_requested")
        else
            TriggerEvent("riptide_reception:client:insufficient_cops")
        end
    end)
end)

RegisterNetEvent('riptide_reception:client:request_officer')
AddEventHandler('riptide_reception:client:request_officer', function()
    QBCore.Functions.TriggerCallback('riptide_reception:getCopCount', function(copCount)
        print('[riptide_reception] Cops Online: ' .. copCount)
        if copCount > 0 then
            if GetResourceState("ps-dispatch") == "started" then
                local dispatchData =
                {
                    message = "Officer Requested",
                    codeName = "911call",
                    code = "Bell",
                    icon = "fas fa-phone",
                    priority = 2,
                    coords = pCoords,
                    street = GetStreetAndZone(pCoords),
                    jobs = { 'leo' }
                }
                TriggerServerEvent("ps-dispatch:server:notify", dispatchData)
            end
            TriggerEvent("riptide_reception:client:assistance_requested")
        else
            TriggerEvent("riptide_reception:client:insufficient_cops")
        end
    end)
end)

RegisterNetEvent('riptide_reception:client:request_weaponlicense')
AddEventHandler('riptide_reception:client:request_weaponlicense', function()
    QBCore.Functions.TriggerCallback('riptide_reception:getCopCount', function(copCount)
        print('[riptide_reception] Cops Online: ' .. copCount)
        if copCount > 0 then
            if GetResourceState("ps-dispatch") == "started" then
                local dispatchData =
                {
                    message = "Requesting Weapon License",
                    codeName = "911call",
                    code = "Bell",
                    icon = "fas fa-phone",
                    priority = 2,
                    coords = pCoords,
                    street = GetStreetAndZone(pCoords),
                    jobs = { 'leo' }
                }
                TriggerServerEvent("ps-dispatch:server:notify", dispatchData)
            end
            TriggerEvent("riptide_reception:client:assistance_requested")
        else
            TriggerEvent("riptide_reception:client:insufficient_cops")
        end
    end)
end)

RegisterNetEvent('riptide_reception:client:request_enhancedweaponlicense')
AddEventHandler('riptide_reception:client:request_enhancedweaponlicense', function()
    QBCore.Functions.TriggerCallback('riptide_reception:getCopCount', function(copCount)
        print('[riptide_reception] Cops Online: ' .. copCount)
        if copCount > 0 then
            if GetResourceState("ps-dispatch") == "started" then
                local dispatchData =
                {
                    message = "Requesting Enhanced Weapon License",
                    codeName = "911call",
                    code = "Bell",
                    icon = "fas fa-phone",
                    priority = 2,
                    coords = pCoords,
                    street = GetStreetAndZone(pCoords),
                    jobs = { 'leo' }
                }
                TriggerServerEvent("ps-dispatch:server:notify", dispatchData)
            end
            TriggerEvent("riptide_reception:client:assistance_requested")
        else
            TriggerEvent("riptide_reception:client:insufficient_cops")
        end
    end)
end)

RegisterNetEvent('riptide_reception:client:request_interview')
AddEventHandler('riptide_reception:client:request_interview', function()
    QBCore.Functions.TriggerCallback('riptide_reception:getCopCount', function(copCount)
        print('[riptide_reception] Cops Online: ' .. copCount)
        if copCount > 0 then
            if GetResourceState("ps-dispatch") == "started" then
                local dispatchData =
                {
                    message = "Requesting Interview",
                    codeName = "911call",
                    code = "Bell",
                    icon = "fas fa-phone",
                    priority = 2,
                    coords = pCoords,
                    street = GetStreetAndZone(pCoords),
                    jobs = { 'leo' }
                }
                TriggerServerEvent("ps-dispatch:server:notify", dispatchData)
            end
            TriggerEvent("riptide_reception:client:assistance_requested")
        else
            TriggerEvent("riptide_reception:client:insufficient_cops")
        end
    end)
end)

RegisterNetEvent('riptide_reception:client:report_property')
AddEventHandler('riptide_reception:client:report_property', function()
    local input = lib.inputDialog('Report Lost / Stolen Property', {'Your name', 'Description'})
 
    if not input then return end
    QBCore.Functions.TriggerCallback('riptide_reception:getCopCount', function(copCount)
        print('[riptide_reception] Cops Online: ' .. copCount)
        if copCount > 0 then
            if GetResourceState("ps-dispatch") == "started" then
                local dispatchData =
                {
                    message = "Lost Property / Stolen Property",
                    codeName = "911call",
                    code = "Bell",
                    icon = "fas fa-phone",
                    priority = 2,
                    coords = pCoords,
                    name = input[1],
                    information = input[2],
                    street = GetStreetAndZone(pCoords),
                    jobs = { 'leo' }
                }
                TriggerServerEvent("ps-dispatch:server:notify", dispatchData)
            end
            TriggerEvent("riptide_reception:client:assistance_requested")
        else
            TriggerEvent("riptide_reception:client:insufficient_cops")
        end
    end)
end)

RegisterNetEvent('riptide_reception:client:request_ridealong')
AddEventHandler('riptide_reception:client:request_ridealong', function()
    local name = nil
    local Player = QBCore.Functions.GetPlayerData()
    if Player and Player.charinfo and Player.charinfo.firstname then
        name = Player.charinfo.firstname .. ' ' .. Player.charinfo.lastname
    else
        name = "N/A"
    end
    QBCore.Functions.TriggerCallback('riptide_reception:getCopCount', function(copCount)
        print('[riptide_reception] Cops Online: ' .. copCount)
        if copCount > 0 then
            if GetResourceState("ps-dispatch") == "started" then
                local dispatchData =
                {
                    message = "Requesting Ride Along",
                    codeName = "911call",
                    code = "Bell",
                    icon = "fas fa-phone",
                    priority = 2,
                    coords = pCoords,
                    name = name,
                    street = GetStreetAndZone(pCoords),
                    jobs = { 'leo' }
                }
                TriggerServerEvent("ps-dispatch:server:notify", dispatchData)
            end
            TriggerEvent("riptide_reception:client:assistance_requested")
        else
            TriggerEvent("riptide_reception:client:insufficient_cops")
        end
    end)
end)

RegisterNetEvent('riptide_reception:client:application_form')
AddEventHandler('riptide_reception:client:application_form', function()
    local v3loc = GetEntityCoords(ped)

    local phone = nil
    local Player = QBCore.Functions.GetPlayerData()
    if Player and Player.charinfo and Player.charinfo.phone then
        phone = Player.charinfo.phone
    else
        phone = "N/A"
    end

    for _, v in ipairs(Config.Locations) do
        local dist = #(v3loc - v.coords)
        if dist < Config.min_dist then
            local input = lib.inputDialog(v.title, v.questions) 

            if not input then return end
            local appName = v.webhook_name
            local webhook = v.webhook
            local ping = "**A new application has been submitted** <@&" .. v.role .. ">"
            -- Send all info including phone number
            TriggerServerEvent('riptide_reception:server:sendToDiscord', v.webhook_color, appName, input, "New application submitted", ping, phone, webhook)
        end
    end

    TriggerEvent("riptide_reception:client:application_success")
end)

CreateThread(function()
    -- Wait until the game session is started
    while not NetworkIsSessionStarted() do
        Wait(100)
    end

    -- Wait for ox_lib to fully initialize (safe delay)
    Wait(1000)

    -- Register your context menu once
    for _, v in ipairs(Config.Locations) do
        lib.registerContext({
            id = 'assistance_menu',
            title = v.name,
            options = v.options,
        })
    end

    -- Main TextUI + interaction loop
    while true do
        Wait(1)

        local isOpen, text = lib.isTextUIOpen()
        local nearby = false
        pCoords = GetEntityCoords(ped)

        for _, v in ipairs(Config.Locations) do
            local dst = #(pCoords - v.coords)
            local opt = {
                position = 'left-center'
            }

            if dst < Config.min_dist then
                if not text then
                    lib.showTextUI('[E] - Ring Bell', opt)
                end
                if IsControlJustReleased(0, 38) then
                    lib.showContext('assistance_menu')
                end
                nearby = true
            end
        end

        if not nearby and text then
            lib.hideTextUI()
        end
    end
end)