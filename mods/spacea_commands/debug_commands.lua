local required_privs = s.Set('server', false)

core.register_chatcommand('dbg_delete_blocks', {
    params = '<radius>',
    description = 'For testing mapgen, re-generates blocks in a square radius',
    privs = required_privs,
    func = function(name, param)
        local r = tonumber(param) or 0
        local player = core.get_player_by_name(name)
        if not player then return false, 'Command not supported' end

        local player_pos = player:get_pos()
        local r_vec = vector.new(r, r, r)
        core.delete_area(player_pos - r_vec, player_pos + r_vec)
    end,
})
