local light_max = 3 / 14
local light_min = 3 / 14
local light_per_second = 0.01 / 14

local current_light = 3 / 14
local night = false
core.register_globalstep(function(dtime)
    local add_light = light_per_second * dtime
    if night then add_light = -add_light end
    current_light = current_light + add_light

    if current_light > light_max then night = true end
    if current_light < light_min then night = false end

    core.set_timeofday(current_light)
end)

core.register_on_joinplayer(function(player_ref, last_login)
    ---@diagnostic disable-next-line: undefined-field
    player_ref:set_sun {
        visible = false,
        sunrise_visible = false,
        sunrise = '',
    }
    ---@diagnostic disable-next-line: undefined-field
    player_ref:set_moon {
        visible = false,
    }
    ---@diagnostic disable-next-line: undefined-field
    player_ref:set_sky {
        base_color = '#121212',
        type = 'plain',
        clouds = false,
    }
    ---@diagnostic disable-next-line: undefined-field
    player_ref:set_stars {
        visible = true,
        day_opacity = 1,
        count = 2000,
        scale = 2,
    }

    --player_ref:set_lighting {}
end)
