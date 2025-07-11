core.register_on_placenode(function(pos, _, placer, oldnode, itemstack)
    if placer and placer:is_player() then
        return core.is_creative_enabled(placer:get_player_name())
    end
end)

-- Don't pick up if the item is already in the inventory
local old_handle_node_drops = core.handle_node_drops
---@diagnostic disable-next-line: duplicate-set-field
function core.handle_node_drops(pos, drops, digger)
    if
        not digger
        or not digger:is_player()
        or not core.is_creative_enabled(digger:get_player_name())
    then
        return old_handle_node_drops(pos, drops, digger)
    end
    local inv = digger:get_inventory()
    if inv then
        for _, item in ipairs(drops) do
            if not inv:contains_item('main', item, true) then inv:add_item('main', item) end
        end
    end
end
