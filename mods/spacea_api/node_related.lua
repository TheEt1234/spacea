---@param pos vector.Vector
function s.get_or_load_node(pos)
    local node = core.get_node_or_nil(pos)
    if node == nil then
        core.load_area(pos)
        return core.get_node_or_nil(pos)
    end
    return node
end

function s.is_air(name) return name == 'air' or name == 'ignore' end
