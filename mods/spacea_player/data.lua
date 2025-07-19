--- player data lives here, use s.player.get_data to access it
---@see s.player.get_data
---@type { [string]: { [string]: table } }
s.player.data = {}
local player_data = s.player.data

--- Returns a table, modify it. There isn't a set_data because you are supposed to modify the table
--- Returns false if no player was found
---@param name string
---@param key string
---@return table|boolean
function s.player.get_data(name, key)
    if not player_data[name] then return false end
    if not player_data[name][key] then player_data[name][key] = {} end
    return player_data[name][key]
end

core.register_on_joinplayer(function(player_ref, _)
    local name = player_ref:get_player_name()
    s.player.data[name] = {}
end)

core.register_on_leaveplayer(function(player_ref, _)
    local name = player_ref:get_player_name()
    s.player.data[name] = nil
end)
