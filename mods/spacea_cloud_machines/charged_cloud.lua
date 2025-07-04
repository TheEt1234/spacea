-- Made entirely of light cloud pieces, this is your starting point
core.register_node('spacea_cloud_machines:charged_cloud', {
    description = 'Charged Cloud Piece',
    walkable = true,
    drawtype = 'normal',
    sunlight_propagates = false,
    light_source = 14,
    paramtype = 'light',
    groups = { float = 1, slippery = 5, cloudy = 4 },

    paramtype2 = 'none',

    use_texture_alpha = 'opaque',
    tiles = {
        {
            name = 'spacea_cloud_machines_charged_cloud.png',
            animation = { type = 'vertical_frames', length = 0.5 },
        },
    }, -- Going more for actual "OH NO THIS IS SO CHARGED" feeling now
    -- Oh i made it just kinda weird
    -- drop = '',

    -- Imagine spending all of this time just for a silly little effect...
    on_punch = function(pos, node, puncher, pointed_thing)
        if not puncher:is_player() then return end
        if pointed_thing.type ~= 'node' then return end

        local pos = pointed_thing.under
        local item = puncher:get_wielded_item():get_name()
        if item ~= 'spacea_cloud_machines:charged_cloud' then return end

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

        local puncher_pos = s.entities.get_eyepos(puncher)
        local above_pos = pointed_thing.above
        local vel_shift = vector.subtract(puncher_pos, above_pos)

        core.add_particlespawner {
            time = 0.1,
            amount = 50,
            exptime = { min = 0.5, max = 1 },
            collisiondetection = true,
            collision_removal = false,
            texture = {
                name = 'spacea_cloud_machines_sparks.png',
                blend = 'screen',
                alpha = 14, -- top 10 hack
                scale_tween = { 1, 0 },
            },
            glow = 14,
            jitter = 1,
            bounce = 1,
            pos = pos_range,
            vel = {
                min = vector.multiply(transform_face(face, 0.49, 1), 1),
                max = vector.multiply(transform_face(face, -0.49, 1), 9),
            },
            drag = vector.new(0.5, 0, 0.5),
            acc = vector.new(0, -s.gravity * 3, 0),
        }
    end,
})
