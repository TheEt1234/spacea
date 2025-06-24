-- Imagine player monoids with "not invented here" syndrome
-- actually no this isnt monoids, since i support everything togheter, with priorities
-- this is more scuffed but allows for more

s.player.physics = {}
s.player.physics.types = {}
local physics_types = s.player.physics.types

---@param name string
---@param action fun(player:core.Player, value: any)
---@param default_value any
s.player.physics.register_type = function(name, action, default_value)
    physics_types[name] = { action = action, default = default_value }
end

s.player.physics.get_value = function(player, type)
    local data = s.player.get_data(player:get_player_name(), 'physics')
    if not data then return false end
    data[type] = data[type] or {}

    local value = physics_types[type].default
    --- v = {id, operation, value, priority}
    --- That's readable! totally!
    s.foreach(data[type], function(v) value = v[2](value, v[3]) end)

    return value
end

--- Example usage: s.player.physics.add_change("speed", player, "mymod:cofffeeee", 8, s.f.math.add, 0) - would add 8 to the player's speed value
--- DO NOT HAVE ""priority creep"" (as in like, leaving the user wondering what effect activates "first")
--- To prevent it, the priority of multiplications should be 1
--- The priority of subtractions should be 1, the priority of additions should be 0
--- And the priority of division should be 2
--- Obviously have some exceptions, like if something should nullify the speed no matter the buff, set the priority to math.huge
---@param type string
---@param player core.Player
---@param id string
---@param value any
---@param operation (fun(a:any , b:any): any)?
---@param priority number?
---@return boolean|nil
s.player.physics.add_change = function(player, type, id, value, operation, priority)
    priority = priority or 0
    operation = operation or s.f.math.mul
    local data = s.player.get_data(player:get_player_name(), 'physics')
    if not data then return false end
    data[type] = data[type] or {}

    local has_that_id_already = false
    s.foreach(data[type], function(v)
        if v[1] == id then has_that_id_already = true end
    end)
    if has_that_id_already then return false end

    table.insert(data[type], { id, operation, value, priority })
    table.sort(data[type], function(a, b) return a[3] < b[3] end) -- the naive way i know

    local set_value = s.player.physics.get_value(player, type)
    physics_types[type].action(set_value)
    return true
end

s.player.physics.apply_change = function(player, type)
    local set_value = s.player.physics.get_value(player, type)
    physics_types[type].action(player, set_value)
end

s.player.physics.del_change = function(player, type, id)
    local data = s.player.get_data(player:get_player_name(), 'physics')
    if not data then return end
    data[type] = data[type] or {}

    s.foreach(data[type], function(v, i)
        if v[1] == id then table.remove(data[type], i) end
    end)
end

core.register_on_joinplayer(function(player_ref, _)
    s.foreachp(physics_types, function(_, k) s.player.physics.apply_change(player_ref, k) end)
end)

-- Alright, now some types
-- Hmm, ok, let's start with physics overrides
-- BTW - this stuff doesn't just have to be used for physics, it can be used for ***ANYTHING*** player related

local function physics_override(key)
    return function(player, value) player:set_physics_override { [key] = value } end
end

s.foreach({
    { 'speed', 1 },
    { 'speed_walk', 1 },
    { 'speed_climb', 1 },
    { 'speed_crouch', 1 },
    { 'speed_fast', 1 },
    { 'jump', s.default_jump },
    { 'gravity', 1 },
    { 'liquid_fluidity', 1 },
    { 'liquid_fluidity_smooth', 1 },
    { 'liquid_sink', 1 },
    { 'acceleration_default', 1 },
    { 'acceleration_air', 1 },
    { 'acceleration_fast', 1 },
    { 'sneak', true },
    { 'sneak_glitch', true }, -- All of my games will have sneak glitch enabled.
    { 'new_move', true },
}, function(v) s.player.physics.register_type(v[1], physics_override(v[1]), v[2]) end)
