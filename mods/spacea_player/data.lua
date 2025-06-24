s.player.data = {}
local player_data = s.player.data

---@param name string
---@param key string
---@return table?
function s.player.get_data(name, key)
    if not player_data[name] then return end
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
