--[[
    Script Name : PD Reception
    Author      : Riptide Studios
    Copyright   : © 2025 Riptide Studios
    Version     : 1.0.3.5
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

    webhook = '', -- Used to send application form to discord

    UseTarget = true,
}

Config.JobCheck = {
    jobs = { 'police', 'sast', 'bcso', 'lssd', 'fbi' },
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
    sast = '',
    lspd = '',
    lscso = '',
}

Config.Webhooks = { -- Config your webhooks here. This is the webhook for the Discord channel that applications will be posted to
    bcso = '',
    sast = '',
    lspd = '',
    lscso = '',
}

Config.Questions = {
    [1] = {
        'Your name',
        'Do you have previous experience with LEO?',
        'If you answered yes, can you provide an example of when you were in a high-stress environment and how you dealt with the situation?',
        'What qualities and skills can you bring to San Andreas State Troopers?',
        'Do you understand that your application could get rejected without reason?',
        'Is there anything else you would like us to know?',
        'Please enter your Discord username so we can contact you if you aren\'t in city',
    },
}

Config.Titles = {
    [1] = 'Apply for SAST',
    [2] = 'Apply for LSPD',
    [3] = 'Apply for BCSO',
}

Config.Colors = {
    ["bcso"] = 16753920,
    ["lspd"] = 2123412,
    ["sast"] = 15844367,
}

Config.Buttons = {
    [1] = { -- Police
        {
            title = 'Request Supervisor',
            description = 'Request to talk to a supervisor',
            icon = 'fa-solid fa-shield-halved',
            event = 'riptide_reception:client:request_supervisor',
        },
        {
            title = 'Request Officer',
            description = 'Request to talk to an officer',
            icon = 'fa-solid fa-user',
            event = 'riptide_reception:client:request_officer',
        },
        {
            title = 'Apply for Weapon License',
            description = 'Request an officer to apply for a weapon license',
            icon = 'fa-solid fa-gun',
            event = 'riptide_reception:client:request_weaponlicense',
        },
        {
            title = 'Apply for Enhanced Weapon License',
            description = 'Request an officer to apply for an enhanced weapon license',
            icon = 'fa-solid fa-gun',
            event = 'riptide_reception:client:request_enhancedweaponlicense',
        },
        {
            title = 'Request Ride Along',
            description = 'Want to experience what it\'s like to be an officer? Request a ride along!',
            icon = 'fa-solid fa-car',
            event = 'riptide_reception:client:request_ridealong',
        },
        {
            title = 'Request Interview',
            description = 'Applied for the department and your application has been accepted? Ring the bell for your interview',
            icon = 'fa-solid fa-clipboard-list',
            event = 'riptide_reception:client:request_interview',
        },
        {
            title = 'Report Lost / Stolen Property',
            description = 'Lost property, or has your property been stolen? Report it now!',
            icon = 'fa-solid fa-flag',
            event = 'riptide_reception:client:report_property',
        },
        {
            title = 'Application Form',
            description = 'Want to join the department? Send in your application now!',
            icon = 'check',
            event = 'riptide_reception:client:application_form',
            -- disabled = true,
        },
    }
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
        title = Config.Titles[1],
        questions = Config.Questions[1],
        options = Config.Buttons[1],
        webhook_color = Config.Colors["sast"],
    },
    [2] = 
    { -- MRPD
        name = 'Mission Row Police Department',
        coords = vector3(441.23, -981.86, 30.69),
        department = Config.Departments.lspd,
        webhook_name = Config.Applications.lspd,
        role = Config.Roles.lspd,
        webhook = Config.Webhooks.lspd,
        title = Config.Titles[2],
        questions = Config.Questions[1],
        options = Config.Buttons[1],
        webhook_color = Config.Colors["lspd"],
    },
    [3] = 
    { -- BCSO Sandy
        name = 'Sandy Shores Police Department',
        coords = vector3(1834.11, 3678.06, 34.19),
        department = Config.Departments.bcso,
        webhook_name = Config.Applications.bcso,
        role = Config.Roles.bcso,
        webhook = Config.Webhooks.bcso,
        title = Config.Titles[3],
        questions = Config.Questions[1],
        options = Config.Buttons[1],
        webhook_color = Config.Colors["bcso"],
    },
    [4] = 
    { -- BCSO Paleto
        name = 'Paleto Bay Police Department',
        coords = vector3(-446.83, 6012.65, 32.29),
        department = Config.Departments.bcso,
        webhook_name = Config.Applications.bcso,
        role = Config.Roles.bcso,
        webhook = Config.Webhooks.bcso,
        title = Config.Titles[3],
        questions = Config.Questions[1],
        options = Config.Buttons[1],
        webhook_color = Config.Colors["bcso"],
    },
}