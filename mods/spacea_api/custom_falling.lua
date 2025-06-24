-- BEHAVIOR DEFINED IN FIELD _falling_node
--
---@class custom.node_defs._falling_node
---@field gravity vector.Vector?

local old_spawn_falling_node = core.spawn_falling_node
function core.spawn_falling_node(pos)
    local node = core.get_node(pos)

    local success, object = old_spawn_falling_node(pos)
    if not success then return false end

    local reg = core.registered_nodes[node.name]
    if not reg then return true, object end
    if not reg._falling_node then return true, object end

    if reg._falling_node.gravity then object:set_acceleration(reg._falling_node.gravity) end

    return true, object
end

local captured_object = nil
local add_entity = core.add_entity
local capture_object = function(...)
    local object = add_entity(...)
    captured_object = object
    return object
end

local old_check_single_for_falling = core.check_single_for_falling
function core.check_single_for_falling(p)
    local node = core.get_node(p)
    core.add_entity = capture_object
    local success = old_check_single_for_falling(p)
    core.add_entity = add_entity

    if not success or not captured_object then return success end

    local reg = core.registered_nodes[node.name]
    if not reg then return success end
    if reg._falling_node == nil then return success end

    if reg._falling_node.gravity then
        captured_object:set_acceleration(reg._falling_node.gravity)
    end

    return success
end

--local falling_node = core.registered_entities['__builtin:falling_node']
