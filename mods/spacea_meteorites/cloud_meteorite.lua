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
        local cloudenium_chance = 0.25
        if meteorite_entity.attracted then
            -- yeah i know i'm duplicating that piece of code from before... oh wait yeah right you the viewer can't tell what was "before"
            s.around_pos(pos, function(ipos)
                local node = 'spacea_meteorites:meteoric_cloudenium'
                if vector.equals(pos, ipos) then
                    node = 'spacea_meteorites:meteoric_cloudenium_glowing'
                else
                    if math.random() > place_chance then return end
                    if
                        math.random() > cloudenium_chance
                        and node == 'spacea_meteorites:meteoric_cloudenium'
                    then
                        node = 'spacea_meteorites:cloudstone'
                    end
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

local strength_needed = 3

local function calculate_meteoric_cloudenium_drops(strength)
    return 1 + math.round(math.random() * math.min(5, math.max(2, strength))) -- so maximum is around 5
end

local function trans_particles(pos)
    core.add_particlespawner {
        _limiting_pos = pos,
        _limiting_priority = s.particle_spawner_priorities.high,
        collisiondetection = true,
        collision_removal = true,

        amount = 12,
        time = 0.25,
        exptime = { min = 0.3, max = 2, bias = 1 },
        texture = {
            name = 'spacea_cloud_machines_cloudenium_shard.png',
            alpha_tween = { 1, 0 },
            scale_tween = { 3, 2 },
        },
        pos = pos,
        radius = { min = 0.5, max = 0.8, bias = 0.5 },
        vel = { min = -5, max = 5, bias = 0 },
        drag = 0.0005,
    }
end

core.register_node('spacea_meteorites:meteoric_cloudenium', {
    description = 'Meteoric Cloudenium',
    groups = { cloudenium = 2 }, -- cannot break with fist
    tiles = { 'spacea_meteorites_meteoric_cloudenium.png' },
    _on_cloudy_explode = function(pos, remaining_strength, _, drops)
        if remaining_strength < strength_needed then return 0 end -- stop the ray, acting as a blocker
        remaining_strength = remaining_strength - strength_needed
        local cloudenium_drops = calculate_meteoric_cloudenium_drops(remaining_strength)
        drops['spacea_cloud_machines:cloudenium_shard'] = (
            drops['spacea_cloud_machines:cloudenium_shard'] or 0
        ) + cloudenium_drops

        core.set_node(pos, { name = 'spacea_meteorites:cloudstone' })
        trans_particles(pos)
        return 0
    end,
    on_punch = function(pos, _, puncher, _)
        local wielded = puncher:get_wielded_item()
        if wielded and wielded:get_name() == 'spacea_cloud_machines:cloudenium_shard' then
            s.player.add_item(
                puncher,
                'spacea_cloud_machines:cloudenium_shard ' .. calculate_meteoric_cloudenium_drops(2)
            )
            core.set_node(pos, { name = 'spacea_meteorites:cloudstone' })
            trans_particles(pos)
        end
    end,
})

--- cools down after all the meteoric cloudenium has been taken
core.register_node('spacea_meteorites:meteoric_cloudenium_glowing', {
    description = 'Glowing Meteoric Cloudenium',
    groups = { cloudenium = 2 }, -- cannot break with fist
    tiles = { 'spacea_meteorites_glowing_meteoric_cloudenium.png' },
    light_source = 14,
})

local function shard_break_particles(pointed_thing)
    local pos = pointed_thing.under
    local face = vector.subtract(pointed_thing.above, pointed_thing.under)
    ---@return vector
    local function transform_face(face_vec, add, shift)
        local ret_vec = vector.copy(face_vec)
        for _, v in pairs { 'x', 'y', 'z' } do -- The worst way to iterate over a vector... ?
            local coordinate = ret_vec[v]
            if coordinate == 0 then
                ret_vec[v] = add
            else
                if math.sign(add) == -1 then
                    ret_vec[v] = math.sign(ret_vec[v])
                else
                    ret_vec[v] = math.sign(ret_vec[v]) * shift
                end
            end
        end
        return ret_vec
    end

    local pos_range = {
        min = vector.add(pos, transform_face(face, 0.49, 0.3)),
        max = vector.add(pos, transform_face(face, -0.49, 0.3)),
    }

    core.add_particlespawner {
        amount = 10,
        texture = { name = 'spacea_cloud_machines_cloudenium_sparks.png', alpha_tween = { 1, 0 } },
        glow = 14,
        pos = pos_range,
        vel = { min = -3, max = 3 },
        acc = vector.new(0, -s.gravity, 0),
        drag = vector.new(0.5, 0, 0.5),
        collisiondetection = true,
        collision_removal = false,
        bouncy = 1,
        time = 0.1,
        _limiting_priority = s.particle_spawner_priorities.medium,
        _limiting_pos = pos,
    }
end

core.register_node('spacea_meteorites:cloudstone', {
    description = 'Cloud Stone',
    groups = { cloudenium = 2, stone = 2 }, -- cannot break with fist, must do with tool
    tiles = { 'spacea_meteorites_cloudstone.png' },
    on_punch = function(_, _, puncher, pointed_thing)
        local wielded = puncher:get_wielded_item()
        if wielded:get_name() == 'spacea_cloud_machines:cloudenium_shard' then
            wielded:take_item(1)
            s.player.add_item(puncher, ItemStack 'spacea_cloud_machines:cloudenium_powder 1')
            puncher:set_wielded_item(wielded)
            shard_break_particles(pointed_thing)
        end
    end,
    on_rightclick = function(_, _, puncher, itemstack, pointed_thing)
        if itemstack:get_name() == 'spacea_cloud_machines:cloudenium_shard' then
            itemstack:take_item(1)
            s.player.add_item(puncher, ItemStack 'spacea_cloud_machines:cloudenium_powder 1')
            shard_break_particles(pointed_thing)
            return itemstack
        end
        return itemstack
    end,
})

s.meteorites.register_player_spawner(
    vector.new(-1000, -1000, -1000),
    vector.new(1000, 1000, 1000),
    {
        time = 60 * 8,
        type = 'spacea_meteorites:cloud_meteorite',
        distance = { min = 80, max = 120 },
    }
)
