-- So that it doesn't spam particles:
local global_particle_timer = 0
local global_particle_timer_max = 1 -- increase for a server i guess

s.meteorites.register_entity('spacea_meteorites', 'cloud_meteorite', {
    visual = {
        glow = 14,
        name = 'cube',
        size = vector.new(2, 2, 2),
        textures = {
            'spacea_meteorites_cloud_meteorite_cold.png',
            'spacea_meteorites_cloud_meteorite_cold.png',
            'spacea_meteorites_cloud_meteorite_cold.png',
            'spacea_meteorites_cloud_meteorite_cold.png',
            'spacea_meteorites_cloud_meteorite_cold.png',
            'spacea_meteorites_cloud_meteorite_cold.png',
        },
        alpha = 40,
    },
    attract_groups = { ['cloud_meteorite_attract'] = 1 },
    start_speed = 1,
    on_attract = function(meteorite_entity, from, dtime)
        global_particle_timer = global_particle_timer + dtime

        ---@type ObjectRef gotta get those sweet sweet completions so i don't have to open up lua_api.md
        local obj = meteorite_entity.object

        if not meteorite_entity.attracted then
            -- do a little explosion particle :)
            core.add_particlespawner {
                time = 0.05,
                amount = 100,
                exptime = 2,
                size = { min = 2, max = 4 },
                drag = 1,
                pos = obj:get_pos(),
                radius = 3,
                texture = {
                    name = 'spacea_meteorites_cloud_meteorite_trail_hot.png',
                    blend = 'screen',
                },
                animation = {
                    type = 'vertical_frames',
                    length = -1,
                },
                glow = 14,
                vel = { min = -8, max = 8, bias = 0 },
            }

            --- and transform
            obj:set_properties {
                textures = { -- full alpha this time
                    'spacea_meteorites_cloud_meteorite_hot.png',
                    'spacea_meteorites_cloud_meteorite_hot.png',
                    'spacea_meteorites_cloud_meteorite_hot.png',
                    'spacea_meteorites_cloud_meteorite_hot.png',
                    'spacea_meteorites_cloud_meteorite_hot.png',
                    'spacea_meteorites_cloud_meteorite_hot.png',
                },
            }
        end
        -- initiate the particle spawner, inspired by the sbz attract particles
        if global_particle_timer > global_particle_timer_max then
            core.add_particlespawner { -- **based off** of sbz line particle thing, that was done by theidealist
                time = 0.5,
                amount = math.floor(vector.distance(from, obj:get_pos()) / 2),
                exptime = 1,
                size = { min = 2, max = 4 },
                drag = 3,
                pos = { min = from, max = obj:get_pos() },
                -- 8x8 animated texture
                texture = {
                    name = 'spacea_meteorites_cloud_meteorite_trail_hot.png',
                    blend = 'screen',
                },
                animation = {
                    type = 'vertical_frames',
                    aspect_width = 4,
                    aspect_height = 4,
                    length = -1,
                },
                glow = 7,
                attract = {
                    kind = 'line',
                    origin_attached = obj,
                    direction = from - obj:get_pos(),
                    strength = 3,
                    die_on_contact = false,
                },
            }
            global_particle_timer = 0
        end
    end,
})
