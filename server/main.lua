--[[
    Script Name : PD Reception
    Author      : Riptide Studios
    Copyright   : © 2025 Riptide Studios
    Version     : 1.0.0.0
    Description : This configuration file is not intended to be edited.
                  Unauthorized modifications may cause unexpected behavior.
]]

QBCore = exports['qb-core']:GetCoreObject()

--[[ QBCore.Functions.CreateCallback('riptide_bell:server:getcopcount', function(cb)
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
    cb(leo)
end) ]]

function checkVersion()
    CreateThread(function()
        Wait(4000)
        local currentVersionRaw = GetResourceMetadata("riptide_bell", 'version')
        print("^1----------------------------------------------------------------------^7")
	    print("^7'^3PD Reception^7' - ^2Successfully loaded. You are running the latest version^7. ^7(^3"..currentVersionRaw.."^7)")
	    print("^1----------------------------------------------------------------------^7")
    end)
end

checkVersion()