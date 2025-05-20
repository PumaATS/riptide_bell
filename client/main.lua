--[[
    Script Name : PD Reception
    Author      : Riptide Studios
    Copyright   : © 2025 Riptide Studios
    Version     : 1.0.2.1
    Description : This configuration file is not intended to be edited.
                  Unauthorized modifications may cause unexpected behavior.
]]

QBCore = exports['qb-core']:GetCoreObject()
local ped = PlayerPedId()
local pCoords
local data

function getCopCount()
    local leo = 0
    for _, playerId in ipairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayers(playerId)
        if Player and Player.PlayerData and Player.PlayerData.job then
            print(Player.PlayerData.job)
            local job = Player.PlayerData.job
            if job.type == 'leo' and job.onduty == true then
                leo = leo + 1
            end
        end
    end
    return leo
end

RegisterNetEvent('riptide_bell:client:getPhone')
AddEventHandler('riptide_bell:client:getPhone', function()
    local playerPhone = 0
    for _, playerId in ipairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayers(playerId)
        playerPhone = Player.PlayerData.phone
    end
    return playerPhone
end)

RegisterNetEvent('riptide_bell:client:assistance_requested')
AddEventHandler('riptide_bell:client:assistance_requested', function()
    return lib.notify({
        title = 'Assistance requested',
        description = 'An officer will be with you shortly!',
        position = 'center-right',
        type = 'success'
    })
end)

RegisterNetEvent('riptide_bell:client:insufficient_cops')
AddEventHandler('riptide_bell:client:insufficient_cops', function()
    return lib.notify({
        title = 'Assistance unavailable',
        description = 'Unfortunately nobody is able to assist you right now. Please try again later!',
        position = 'center-right',
        type = 'error'
    })
end)

RegisterNetEvent('riptide_bell:client:application_success')
AddEventHandler('riptide_bell:client:application_success', function()
    return lib.notify({
        title = 'Application sent',
        description = 'Thank you for applying!',
        position = 'center-right',
        type = 'success'
    })
end)

RegisterNetEvent('riptide_bell:client:request_supervisor')
AddEventHandler('riptide_bell:client:request_supervisor', function()
    if getCopCount() == 0 then
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
        TriggerEvent("riptide_bell:client:assistance_requested")
    else
        TriggerEvent("riptide_bell:client:insufficient_cops")
    end
end)

RegisterNetEvent('riptide_bell:client:request_officer')
AddEventHandler('riptide_bell:client:request_officer', function()
    if getCopCount() == 0 then
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
        TriggerEvent("riptide_bell:client:assistance_requested")
    else
        TriggerEvent("riptide_bell:client:insufficient_cops")
    end
end)

RegisterNetEvent('riptide_bell:client:request_weaponlicense')
AddEventHandler('riptide_bell:client:request_weaponlicense', function()
    if getCopCount() == 0 then
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
        TriggerEvent("riptide_bell:client:assistance_requested")
    else
        TriggerEvent("riptide_bell:client:insufficient_cops")
    end
end)

RegisterNetEvent('riptide_bell:client:request_enhancedweaponlicense')
AddEventHandler('riptide_bell:client:request_enhancedweaponlicense', function()
    if getCopCount() == 0 then
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
        TriggerEvent("riptide_bell:client:assistance_requested")
    else
        TriggerEvent("riptide_bell:client:insufficient_cops")
    end
end)

RegisterNetEvent('riptide_bell:client:request_interview')
AddEventHandler('riptide_bell:client:request_interview', function()
    if getCopCount() == 0 then
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
        TriggerEvent("riptide_bell:client:assistance_requested")
    else
        TriggerEvent("riptide_bell:client:insufficient_cops")
    end
end)

RegisterNetEvent('riptide_bell:client:report_property')
AddEventHandler('riptide_bell:client:report_property', function()
    if getCopCount() == 0 then
        local input = lib.inputDialog('Report Lost / Stolen Property', {'Your name', 'Description'})
 
        if not input then return end
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
        TriggerEvent("riptide_bell:client:assistance_requested")
    else
        TriggerEvent("riptide_bell:client:insufficient_cops")
    end
end)

RegisterNetEvent('riptide_bell:client:application_form')
AddEventHandler('riptide_bell:client:application_form', function()
    local v3loc = GetEntityCoords(ped)

    local input = lib.inputDialog('Apply for LEO', {
        'Your name',
        'Do you have previous experience with LEO?',
        'If you answered yes, can you provide an example of when you were in a high-stress environment and how you dealt with the situation?',
        'What qualities and skills can you bring to San Andreas State Troopers?',
        'Do you understand that your application could get rejected without reason?',
        'Is there anything else you would like us to know?',
        'Please enter your Discord username so we can contact you if you aren\'t in city',
    }) 

    if not input then return end

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
            local appName = v.webhook_name
            local webhook = v.webhook
            local ping = "**A new application has been submitted** <@&" .. v.role .. ">"
            -- Send all info including phone number
            TriggerServerEvent('riptide_bell:server:sendToDiscord', 16753920, appName, input, "New application submitted", ping, phone, webhook)
        end
    end

    TriggerEvent("riptide_bell:client:application_success")
end)

CreateThread(function()
    while true do
        Wait(1)
        local isOpen, text = lib.isTextUIOpen()
        pCoords = GetEntityCoords(ped)
        local nearby = false
        for _, v in ipairs(Config.Locations) do
            local dst = #(pCoords - v.coords)
            local opt = 
            {
                position = 'left-center'
            }
            lib.registerContext({
                id = 'assistance_menu',
                title = v.name,
                options = 
                {
                    {
                        title = 'Request Supervisor',
                        description = 'Request to talk to a supervisor',
                        icon = 'fa-solid fa-shield-halved',
                        event = 'riptide_bell:client:request_supervisor',
                    },
                    {
                        title = 'Request Officer',
                        description = 'Request to talk to an officer',
                        icon = 'fa-solid fa-user',
                        event = 'riptide_bell:client:request_officer',
                    },
                    {
                        title = 'Apply for Weapon License',
                        description = 'Request an officer to apply for a weapon license',
                        icon = 'fa-solid fa-gun',
                        event = 'riptide_bell:client:request_weaponlicense',
                    },
                    {
                        title = 'Apply for Enhanced Weapon License',
                        description = 'Request an officer to apply for an enhanced weapon license',
                        icon = 'fa-solid fa-gun',
                        event = 'riptide_bell:client:request_enhancedweaponlicense',
                    },
                    {
                        title = 'Request Interview',
                        description = 'Applied for the department and your application has been accepted? Ring the bell for your interview',
                        icon = 'fa-solid fa-clipboard-list',
                        event = 'riptide_bell:client:request_interview',
                    },
                    {
                        title = 'Report Lost / Stolen Property',
                        description = 'Lost property, or has your property been stolen? Report it now!',
                        icon = 'fa-solid fa-flag',
                        event = 'riptide_bell:client:report_property',
                    },
                    {
                        title = 'Apply for ' .. v.department,
                        description = 'Want to apply to become an officer? Send in your application now!',
                        icon = 'check',
                        event = 'riptide_bell:client:application_form',
                        -- disabled = true,
                    },
                }
            })
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