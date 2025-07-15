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
    on_collide = function(meteorite_entity)
        local pos = meteorite_entity.object:get_pos()
        pos = pos + (vector.normalize(meteorite_entity.object:get_velocity()) * 2)
        local place_chance = 0.75 -- 75%, makes it look not weird, i think this is important
        if meteorite_entity.attracted then
            -- yeah i know i'm duplicating that piece of code from before... oh wait yeah right you the viewer can't tell what was "before"
            s.around_pos(pos, function(ipos)
                local node = 'spacea_meteorites:meteoric_cloudenium'
                if vector.equals(pos, ipos) then
                    node = 'spacea_meteorites:meteoric_cloudenium_glowing'
                else
                    if math.random() > place_chance then return end
                end
                if not s.is_air(core.get_node(ipos).name) then return end
                core.set_node(ipos, { name = node })
            end, { include_self = true, iterate_fully = true })
        else
            -- If its not an excited meteorite be a lot more chill
            s.around_pos(pos, function(ipos)
                local node = 'spacea_mapgen:cloud_piece_light'
                if vector.equals(pos, ipos) then
                    node = 'spacea_mapgen:cloud_piece_glowy'
                else
                    if math.random() > place_chance then return end
                end
                if not s.is_air(core.get_node(ipos).name) then return end
                core.set_node(ipos, { name = node })
            end, { include_self = true, iterate_fully = true })

            -- oh how could i forget, some particles! :D :D :D
            -- just some... not overkill | anything
            core.add_particlespawner {
                amount = 20,
                time = 0.1,
                texture = {
                    name = 'spacea_meteorites_cloud_meteorite_trail_hot.png^[invert:rb',
                    alpha = 0.4,
                },
                vel = { min = -3, max = 3 },
                exptime = { min = 5, max = 12, bias = 12 },
                pos = pos,
                radius = { min = 1, max = 2, bias = 1 },
                size = { min = 2, max = 4 },
                animation = { type = 'vertical_frames', length = -1 },
            }
        end
        meteorite_entity.object:remove()
    end,
    attract_groups = { ['cloud_meteorite_attract'] = 0.5, ['+gravity'] = 1, ['-gravity'] = -1 },
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
                _limiting_pos = from,
                _limiting_priority = s.particle_spawner_priorities.low,
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

--- Has strange properties that allow you to obtain it, but much less strange properties than the cloudeniuim block
core.register_node('spacea_meteorites:meteoric_cloudenium', {
    description = 'Meteoric Cloudenium',
    groups = { cloudenium = 2 }, -- cannot break with fist
    tiles = { 'spacea_meteorites_meteoric_cloudenium.png' },
})

--- cools down after all the meteoric cloudenium has been taken
core.register_node('spacea_meteorites:meteoric_cloudenium_glowing', {
    description = 'Glowing Meteoric Cloudenium',
    groups = { cloudenium = 2 }, -- cannot break with fist
    tiles = { 'spacea_meteorites_glowing_meteoric_cloudenium.png' },
    light_source = 14,
})
