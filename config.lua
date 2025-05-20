--[[
    Script Name : PD Reception
    Author      : Riptide Studios
    Copyright   : © 2025 Riptide Studios
    Version     : 1.0.2.1
    Description : This configuration file is editable.
                  Feel free to modify the settings as needed.
]]

Config = Config or {}

Config = {
    locale = "en", -- Language

    Debug = true, -- Debug mode

    Menu = "ox_lib",            -- "qb", "ox_lib"
    Notify = "ox_lib",          -- "qb", "ox_lib"
    drawText = "ox_lib",        -- "qb", "ox_lib"

    min_dist = 2,

    webhook = 'https://discord.com/api/webhooks/1374237554856951838/kDBDe4VaiDDcFdS7q4_48vpaDfHqdk_J_bAx-HRZ7pR-i1PYtvqo9aoLbr69eZVvDaGI' -- Used to send application form to discord
}

Config.Departments = { -- Department names for the menu title
    bcso = 'Blaine County Sheriff\'s Office',
    sast = 'San Andreas State Troopers',
    lspd = 'Los Santos Police Department',
    lscso = 'Los Santos County Sheriff\'s Office',
}

Config.Applications = { -- Department names for the application form button
    bcso = 'BCSO Application',
    sast = 'SAST Application',
    lspd = 'LSPD Application',
    lscso = 'LSCSO Application',
}

Config.Roles = { -- Config your roles here. These are the discord roles that will get pinged when an application is submitted
    bcso = '',
    sast = '1361417753294274601',
    lspd = '1364381959043809410',
    lscso = '',
}

Config.Webhooks = { -- Config your webhooks here. This is the webhook for the Discord channel that applications will be posted to
    bcso = '',
    sast = 'https://discord.com/api/webhooks/1374279458617430016/f2kkJhrkx1r35d2U7BBvnAdGX1vS3bxZgNppzJA8PmYb3eojqdx9EfCIlXQ32su-n4gf',
    lspd = 'https://discord.com/api/webhooks/1374279675391770624/EWd7M868aAZgzt1xADkuPIhtvVGuzWkBKXFv2uUDp7WFoV8P-5f0ejGRx9f-lf6OqN96',
    lscso = '',
}

Config.Locations = {
    [1] = 
    { -- SAHP East
        name = 'San Andreas Highway Patrol - East',
        coords = vector3(1541.19, 816.67, 77.66),
        department = Config.Departments.sast,
        webhook_name = Config.Applications.sast,
        role = Config.Roles.sast,
        webhook = Config.Webhooks.sast,
    },
    [2] = 
    { -- MRPD
        name = 'Mission Row Police Department',
        coords = vector3(441.23, -981.86, 30.69),
        department = Config.Departments.lspd,
        webhook_name = Config.Applications.lspd,
        role = Config.Roles.lspd,
        webhook = Config.Webhooks.lspd,
    },
    [3] = 
    { -- BCSO Sandy
        name = 'Sandy Shores Police Department',
        coords = vector3(1834.11, 3678.06, 34.19),
        department = Config.Departments.bcso,
        webhook_name = Config.Applications.bcso,
        role = Config.Roles.bcso,
        webhook = Config.Webhooks.bcso,
    },
    [4] = 
    { -- BCSO Paleto
        name = 'Paleto Bay Police Department',
        coords = vector3(-446.83, 6012.65, 32.29),
        department = Config.Departments.bcso,
        webhook_name = Config.Applications.bcso,
        role = Config.Roles.bcso,
        webhook = Config.Webhooks.bcso,
    },
}