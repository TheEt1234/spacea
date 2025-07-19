--- Adds an item to the player's inventory, if can't, it drops it to the player's pos
---@param player PlayerRef
---@param stack ItemStackAny
---@return boolean? # returns false if not player
function s.player.add_item(player, stack)
    local inv = player:get_inventory()
    if not inv then return false end
    local leftover = inv:add_item(player:get_wield_list(), stack)
    if leftover and not leftover:is_empty() then
        core.add_item(player:get_pos(), ItemStack(stack))
    end
    return true -- success
end
