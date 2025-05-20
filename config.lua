--[[
    Script Name : PD Reception
    Author      : Riptide Studios
    Copyright   : © 2025 Riptide Studios
    Version     : 1.0.0.0
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
}

Config.Locations = {
    { -- SAHP East
        name = 'San Andreas Highway Patrol - East',
        coords = vector3(1541.19, 816.67, 77.66),
    },
    { -- MRPD
        name = 'Mission Row Police Department',
        coords = vector3(441.23, -981.86, 30.69),
    },
    { -- BCSO Sandy
        name = 'Sandy Shores Police Department',
        coords = vector3(1834.11, 3678.06, 34.19),
    },
    { -- BCSO Paleto
        name = 'Paleto Bay Police Department',
        coords = vector3(-446.83, 6012.65, 32.29),
    },
}