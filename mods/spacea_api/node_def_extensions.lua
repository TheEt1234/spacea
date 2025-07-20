--- For things that extend the node definition
--- Split into multiple files if there is too much
--- Also, ALWAYS DEFINE IT IN ---@class NodeDef ---@field x y
--- i want those sweet sweet completions
local old_get_drops = core.get_node_drops

---@class NodeDef
---@field _on_custom_drops? fun(node:MapNode|string, toolname:string?, tool:ItemStack?, digger:ObjectRef?, pos: vector?):string[]
---@field _player_inside? fun(player:PlayerRef, pos:vector, node:MapNode, dtime:number):nil

---@diagnostic disable-next-line: duplicate-set-field
function core.get_node_drops(node, ...)
    local reg
    if type(node) == 'string' then
        reg = core.registered_nodes[node]
    else
        reg = core.registered_nodes[node.name]
    end
    if reg and reg._on_custom_drops then return reg._on_custom_drops(node, ...) end
    return old_get_drops(node, ...)
end

--- _player_inside

core.register_globalstep(function(dtime)
    for _, player in pairs(core.get_connected_players()) do
        local p = player:get_pos()
        local node = core.get_node(p:round())
        local reg = core.registered_nodes[node.name]
        if reg then
            if reg._player_inside then reg._player_inside(player, p, node, dtime) end
        end
    end
end)
