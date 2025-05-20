--[[
    Script Name : PD Reception
    Author      : Riptide Studios
    Copyright   : © 2025 Riptide Studios
    Version     : 1.0.3.0
    Description : This configuration file is not intended to be edited.
                  Unauthorized modifications may cause unexpected behavior.
                  
    IMPORTANT   : Some of the functions in this file are borrowed, with permission,
                  from Jimathy666. Huge shout out to him for allowing us to use his
                  code.
]]

QBCore = exports['qb-core']:GetCoreObject()

function checkWebhooks()
    if Config.Webhooks.bcso == '' then
        print("\27[31mA webhook is missing in: Config.Wehooks.bcso (config.lua > line 52)\27[0m")
    else
        print("\27[32mBCSO Webhook Active\27[0m")
    end

    if Config.Webhooks.sast == '' then
        print("\27[31mA webhook is missing in: Config.Wehooks.sast (config.lua > line 53)\27[0m")
    else
        print("\27[32mSAST Webhook Active\27[0m")
    end

    if Config.Webhooks.lspd == '' then
        print("\27[31mA webhook is missing in: Config.Wehooks.lspd (config.lua > line 54)\27[0m")
    else
        print("\27[32mLSPD Webhook Active\27[0m")
    end

    if Config.Webhooks.lscso == '' then
        print("\27[31mA webhook is missing in: Config.Wehooks.lscso (config.lua > line 55)\27[0m")
    else
        print("\27[32mLSCSO Webhook Active\27[0m")
    end
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    checkWebhooks()
    Wait(4000)
end)

QBCore.Functions.CreateCallback('riptide_reception:getCopCount', function(source, cb)
    local count = 0
    local jobWhitelist = {}

    -- Build a quick lookup table from Config.JobCheck.jobs
    for _, jobName in ipairs(Config.JobCheck.jobs) do
        jobWhitelist[jobName] = true
    end

    for _, playerId in ipairs(QBCore.Functions.GetPlayers()) do
        local Player = QBCore.Functions.GetPlayer(playerId)
        if Player and Player.PlayerData and Player.PlayerData.job then
            local job = Player.PlayerData.job
            if jobWhitelist[job.name] and job.onduty then
                count = count + 1
            end
        end
    end

    cb(count)
end)

function sendApplicationToDiscord(color, name, input, footer, pingMessage, phone, webhook)
    local fields = {
        { name = "Name", value = input[1] or "N/A", inline = false },
        { name = "Previous Experience", value = input[2] or "N/A", inline = false },
        { name = "High-Stress Example", value = input[3] or "N/A", inline = false },
        { name = "Qualities/Skills", value = input[4] or "N/A", inline = false },
        { name = "Understands Rejection Possibility", value = input[5] or "N/A", inline = false },
        { name = "Additional Info", value = input[6] or "N/A", inline = false },
        { name = "Discord", value = input[7] or "N/A", inline = false },
        { name = "Phone", value = phone or "N/A", inline = false },
    }

    local embed = {{
        color = color,
        title = "**" .. name .. "**",
        fields = fields,
        footer = {
            text = footer,
        },
    }}

    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({
        content = pingMessage,
        username = name,
        embeds = embed
    }), { ['Content-Type'] = 'application/json' })
end

RegisterNetEvent('riptide_reception:server:sendToDiscord')
AddEventHandler('riptide_reception:server:sendToDiscord', function(color, name, input, footer, pingMessage, phone, webhook)
    sendApplicationToDiscord(color, name, input, footer, pingMessage, phone, webhook)
end)

---------------------------
-- TAKEN FROM JIMATHY666 --
---------------------------

local function parseVersion(version)
    local parts = {}
    for num in version:gmatch("%d+") do
        table.insert(parts, tonumber(num))
    end
    return parts
end

local function compareVersions(current, newest)
    local currentParts = parseVersion(current)
    local newestParts = parseVersion(newest)
    for i = 1, math.max(#currentParts, #newestParts) do
        local c = currentParts[i] or 0
        local n = newestParts[i] or 0
        if c < n then return -1
        elseif c > n then return 1 end
    end
    return 0 -- equal
end

function checkVersion()
    CreateThread(function()
        Wait(4000)
        local currentVersionRaw = GetResourceMetadata("riptide_reception", 'version')
        PerformHttpRequest('https://raw.githubusercontent.com/PumaATS/riptide_reception/main/version.txt', function(err, body, headers)
            if not body then
                print("^Unable to run version check for ^7'^3riptide_reception^7' (^3"..currentVersionRaw.."^7)")
            end

            local lines = {}
            for line in body:gmatch("[^\r\n]+") do
                table.insert(lines, line)
            end

            local newestVersionRaw = lines[1] or "0.0.0"
            local changelog = {}
            for i = 2, #lines do
                table.insert(changelog, lines[i])
            end

            local compareResult = compareVersions(currentVersionRaw, newestVersionRaw)

            if compareResult == 0 then
                print("^7'^3PD Reception^7' - ^2Successfully loaded. You are running the latest version^7. ^7(^3"..currentVersionRaw.."^7)")
            elseif compareResult < 0 then
                print("^1----------------------------------------------------------------------^7")
                print("^7'^3PD Reception^7' - ^1Version out of date! You are running Version: ^7 ^7(^3"..currentVersionRaw.."^7) ^1Updated Version: ^7 ^7(^3"..newestVersionRaw.."^7)")
                for _, line in ipairs(changelog) do
                    print((line:find("http") and "^7" or "^5")..line)
                end
	            print("^1----------------------------------------------------------------------^7")
            else
                print("^7'^3PD Reception^7' - ^5You are running a newer version: ^7(^3"..currentVersionRaw.."^7 ← ^3"..newestVersionRaw.."^7)")
            end
        end)
    end)
end

checkVersion()