core.register_chatcommand('killme', {
    description = 'A very mysterious command, i wonder what happens if you, type it out? Will there be a secret?',
    func = function(name, _)
        local player = core.get_player_by_name(name)
        if not player then return false, 'No' end
        player:set_hp(0)
        return false, 'No'
    end,
})
