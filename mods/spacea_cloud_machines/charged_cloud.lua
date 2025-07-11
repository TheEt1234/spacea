-- Made entirely of light and glowy cloud pieces, this is your starting point

--- when its transitioning between states, or exploding
local function trans_sparks(pos, pointed_thing, amount_mul, destructive)
    amount_mul = amount_mul or 1
    destructive = destructive or false
    core.add_particlespawner {
        amount = 25 * amount_mul,
        time = 0.1,
        exptime = { min = 0.5, max = destructive and 6 or 3, bias = destructive and 4 or 2 },
        collisiondetection = true,
        collision_removal = true,
        pos = pos,
        radius = { min = 0.5, max = 1, bias = 0.5 },
        vel = { min = -3, max = 3, bias = 0 },
        attract = {
            kind = 'point',
            origin = pos + 2 * (pointed_thing.above - pointed_thing.under), -- pos + face*2
            strength = -1,
        },
        texture = {
            name = (
                destructive and 'spacea_cloud_machines_sparks.png^[colorize:cyan:100'
                or 'spacea_cloud_machines_sparks.png'
            ),
            blend = destructive and 'add' or 'screen',
            alpha = destructive and 40 or 14, -- top 10 hack
            scale_tween = { destructive and 2 or 1, 0 },
        },
    }
end

local function supercritical_sparks(pos, intensity) -- when in stages 2 and 3, called in ABM
    local high_intensity = intensity == 2
    local low_intensity = intensity == 1
    core.add_particlespawner {
        amount = 25 * (low_intensity and 1 or 1),
        time = (low_intensity and 1 or 1),
        exptime = { min = 1, max = 20, bias = low_intensity and 2 or 1 },
        collisiondetection = true,
        collision_removal = false,
        bounce = 1,

        pos = pos,
        radius = { min = 0.6, max = 1, bias = 0.6 },
        vel = { min = low_intensity and -4 or -8, max = low_intensity and 4 or 8 },
        drag = { min = 0.2, max = 0.6, bias = 0.5 },

        texture = {
            name = 'spacea_cloud_machines_sparks.png',
            blend = high_intensity and 'add' or 'screen',
            alpha_tween = {
                style = 'pulse',
                reps = 4,
                high_intensity and 40 or 0.5,
                high_intensity and 50 or 0.5,
            }, -- top 10 hack
            scale_tween = { high_intensity and 1.5 or 1, 0 },
        },
    }
end

local function sparks(pos, puncher, pointed_thing, amount_mul, destructive)
    amount_mul = amount_mul or 1
    destructive = destructive or false
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
    local above_pos = (destructive and pointed_thing.under) or pointed_thing.above
    local strength = 3
    local vel_shift = -vector.subtract(puncher_pos, above_pos) * strength

    core.add_particlespawner {
        time = 0.1,
        amount = 50 * amount_mul,
        exptime = { min = 0.5, max = destructive and 8 or 5, bias = destructive and 4 or 2 },
        collisiondetection = true,
        collision_removal = destructive and true or false,
        texture = {
            name = (
                destructive and 'spacea_cloud_machines_sparks.png^[colorize:cyan:100'
                or 'spacea_cloud_machines_sparks.png'
            ),
            blend = destructive and 'add' or 'screen',
            alpha = destructive and 40 or 14, -- top 10 hack
            scale_tween = { destructive and 4 or 1, 0 },
        },
        glow = 14,
        jitter = 0,
        pos = pos_range,
        vel = {
            min = vector.add(vel_shift, vector.multiply(transform_face(face, 0.49, 1), 1)),
            max = vector.add(vel_shift, vector.multiply(transform_face(face, -0.49, 1), 9)),
        },
        drag = vector.new(0.5, 0, 0.5),
        acc = vector.new(0, -s.gravity * 3, 0),
    }
end
local function explode(pointed_thing, puncher)
    local pos = pointed_thing.under
    core.remove_node(pos)
    local radius = 4 -- this is the radius of the random direction
    local strength = 4

    -- the idea is: Surprizingly large range, weak explosion power, very directed by player

    local num_rays = 80 -- overkill perhaps?
    local drops = {}

    local puncher_pos = s.entities.get_eyepos(puncher)
    local under_pos = pointed_thing.under
    local dir_shift_strength = 4 -- strength of the player's fist, should not overpower `radius`
    local dir_shift = -vector.subtract(puncher_pos, under_pos) * dir_shift_strength

    local delete_queue = {}

    for _ = 1, num_rays do
        -- skew a bit in the direction of pointed
        local ray =
            Raycast(pos, pos + (vector.random_direction() * radius) + dir_shift, false, false)
        local used_strength = 0
        ---@type pointed_thing
        for target_pointed in ray do
            local node = core.get_node(target_pointed.under)
            if not s.is_air(node.name) then
                local cloudness = core.get_item_group(node.name, 'cloudy')
                if cloudness == 0 then break end
                used_strength = used_strength + (1 / cloudness)
                if used_strength > strength then break end
                drops[node.name] = (drops[node.name] or 0) + 1
                delete_queue[#delete_queue + 1] = target_pointed.under
            end
        end
    end
    s.foreach(delete_queue, core.remove_node)

    -- we give it to the puncher, items on the ground is overrated :)

    for drop, count in pairs(drops) do
        local leftover = puncher
            :get_inventory()
            :add_item(puncher:get_wield_list(), ItemStack(drop .. ' ' .. count))

        core.add_item(pointed_thing.under, leftover)
    end
    sparks(pointed_thing.above, puncher, pointed_thing, 10, true)
end

for i = 1, 3 do
    core.register_node(('spacea_cloud_machines:charged_cloud_%s'):format(i), {
        description = 'Charged Cloud Piece',
        walkable = true,
        drawtype = 'normal',
        sunlight_propagates = false,
        light_source = 14,
        paramtype = 'light',
        groups = {
            float = 1,
            slippery = 5,
            cloud_charged = (i == 1 and 8 or i == 2 and 4 or i == 3 and 1 or 0), -- CE = Cloud energy
            cloud_meteorite_attract = (i - 1) ^ 2, -- 0, 1, 4
        },

        paramtype2 = 'color',

        use_texture_alpha = 'opaque',
        tiles = {
            {
                name = string.format(
                    'spacea_cloud_machines_charged_cloud.png%s',
                    (
                        i == 1 and ''
                        or i == 2 and '^[colorize:white:50'
                        or i == 3 and '^[invert:r^[colorize:white:120'

                    )
                ),
                animation = {
                    type = 'vertical_frames',
                    length = (i == 1 and 0.5 or i == 2 and 0.45 or i == 3 and 0.35 or 0.5),
                },
            },
        }, -- Going more for actual "OH NO THIS IS SO CHARGED" feeling now
        -- Oh i made it just kinda weird, like omega flowey in a way
        palette = 'spacea_cloud_machines_charged_cloud_palette.png',
        drop = '',
        diggable = false,
        on_timer = function(pos, _)
            -- revert to previous state
            ---@diagnostic disable-next-line: missing-fields
            trans_sparks(pos, { above = pos, under = pos }, 3, true)
            local node = core.get_node(pos)
            if node.name == 'spacea_cloud_machines:charged_cloud_3' then
                core.set_node(pos, { name = 'spacea_cloud_machines:charged_cloud_2' })
                core.get_node_timer(pos):start(160) -- lag solves itself eh?
            elseif node.name == 'spacea_cloud_machines:charged_cloud_2' then
                core.set_node(pos, { name = 'spacea_cloud_machines:charged_cloud_1' })
            end
        end,

        node_dig_prediction = '',

        on_punch = function(pos, node, puncher, pointed_thing)
            if not puncher:is_player() then return end
            if pointed_thing.type ~= 'node' then return end

            local prefix = 'spacea_cloud_machines:charged_cloud_'
            sparks(
                pos,
                puncher,
                pointed_thing,
                (
                    node.name == prefix .. 1 and 1
                    or node.name == prefix .. 2 and 2
                    or node.name == prefix .. 3 and 4
                )
            )

            local item = puncher:get_wielded_item():get_name()
            if item ~= 'spacea_mapgen:cloud_piece_heavy' then return end

            sparks(pos, puncher, pointed_thing, 6)

            if node.name ~= 'spacea_cloud_machines:charged_cloud_3' then
                trans_sparks(pos, pointed_thing, 2, false)
                local newname = string.sub(node.name, 1, -3) .. '_' .. i + 1
                core.set_node(pos, { name = newname })
                if newname == 'spacea_cloud_machines:charged_cloud_3' then
                    core.get_node_timer(pos):start(60)
                elseif newname == 'spacea_cloud_machines:charged_cloud_2' then
                    core.get_node_timer(pos):start(160) -- lag solves itself eh?
                end
            else
                trans_sparks(pos, pointed_thing, 4, true)
                explode(pointed_thing, puncher)
            end
        end,
    })
end

s.meteorites.register_attract_node_group 'cloud_meteorite_attract'

core.register_abm {
    label = 'Supercritical sparks charged_cloud_2',
    interval = 1,
    chance = 1,
    catch_up = false,
    nodenames = { 'spacea_cloud_machines:charged_cloud_2' },
    action = function(pos, _, _, _) supercritical_sparks(pos, 1) end,
}

core.register_abm {
    label = 'Supercritical sparks charged_cloud_3',
    interval = 1,
    chance = 1,
    catch_up = false,
    nodenames = { 'spacea_cloud_machines:charged_cloud_3' },
    action = function(pos, _, _, _) supercritical_sparks(pos, 2) end,
}
