---@param pos vector
function s.get_or_load_node(pos)
    local node = core.get_node_or_nil(pos)
    if node == nil then
        core.load_area(pos)
        return core.get_node_or_nil(pos)
    end
    return node
end

function s.is_air(name) return name == 'air' or name == 'ignore' end

function s.drop_node(pos)
    local drops = core.get_node_drops(core.get_node(pos), nil, nil, nil, pos)
    for _, item in pairs(drops) do
        core.add_item(pos, ItemStack(item))
    end
    core.remove_node(pos)
end
