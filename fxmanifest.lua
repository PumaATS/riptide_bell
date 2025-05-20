--[[
    Script Name : PD Reception
    Author      : Riptide Studios
    Copyright   : © 2025 Riptide Studios
    Version     : 1.0.2.1
    Description : This configuration file is not intended to be edited.
                  Unauthorized modifications may cause unexpected behavior.
]]

name "riptide_bell"
author "Riptide Studios"
version "1.0.2.1"
description "PD Reception Bell"
fx_version "cerulean"
game "gta5"
lua54 'yes'

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua',
}

client_scripts {
    'client/main.lua',
    'client/utils.lua',
}

server_scripts {
    'server/main.lua',
    '@oxmysql/lib/MySQL.lua',
}

dependencies {
    'ox_lib',
}

ox_libs {
    'locale',
    'table',
}