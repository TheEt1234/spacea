local default_armor_groups = {
    fall_damage_add_percent = -100,
    cloudy = 100, -- Would this imply you are some sort of anomaly forming from the clouds
    -- Eh who cares about the lore
}

core.register_on_joinplayer(
    function(player_ref, last_login) player_ref:set_armor_groups(default_armor_groups) end
)

-- handles the fact that
-- player turns to dust
-- if they fall too fast
-- why did that rhyme
-- anyway

local max_velocity = 50
s.globalstep_with_timer(0.3, function(dtime)
    s.foreach(core.get_connected_players(), function(ref)
        if (ref:get_armor_groups().cloudy or 0) ~= 100 then return end -- Literally no armor
        local velocity = ref:get_velocity()
        if vector.distance(vector.zero(), velocity) > max_velocity then
            ref:set_hp(ref:get_hp() - 1, 'fall')
        end
    end)
end)
