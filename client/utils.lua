--[[
    Script Name : PD Reception
    Author      : Riptide Studios
    Copyright   : © 2025 Riptide Studios
    Version     : 1.0.1.0
    Description : This configuration file is not intended to be edited.
                  Unauthorized modifications may cause unexpected behavior.
]]

---@param coords table
---@return string
function GetStreetAndZone(coords)
    local zone = GetLabelText(GetNameOfZone(coords.x, coords.y, coords.z))
    local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
    return street .. ", " .. zone
end