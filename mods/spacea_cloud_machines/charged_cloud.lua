-- Made entirely of light and glowy cloud pieces, this is your starting point
-- THE EXPLOSION CODE HERE IS ONLY MEANT FOR CLOUDS, and only these specific explosions
-- Do not extend this to groups that may require new features

--- when its transitioning between states, or exploding
local function trans_sparks(pos, pointed_thing, amount_mul, destructive)
    amount_mul = amount_mul or 1
    destructive = destructive or false
    core.add_particlespawner {
        _limiting_pos = pos,
        _limiting_priority = s.particle_spawner_priorities.highest,
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
        _limiting_pos = pos,
        _limiting_priority = s.particle_spawner_priorities.low,
        amount = 15 * (low_intensity and 1 or 1),
        time = (low_intensity and 1 or 1),
        exptime = { min = 1, max = 15, bias = low_intensity and 2 or 1 },
        collisiondetection = false,
        collision_removal = false,

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
        _limiting_pos = pos,
        _limiting_priority = s.particle_spawner_priorities.highest,
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

--- IMPORTANT: THIS EXPLOSION CODE ISN'T MEANT TO BE GENERAL-USE, ONLY FOR CLOUDY STUFF
--- It isn't optimized at all, doesn't take into account custom node drops, just...
--- If you are making general explosion code START FROM SCRATCH INSTEAD OF THIS
---
--- - frog
---@param puncher PlayerRef|boolean
local function explode(pointed_thing, puncher, look_dir)
    look_dir = look_dir or puncher:get_look_dir()
    local puncher_name = puncher and puncher:get_player_name() or ''
    local pos = pointed_thing.under
    core.remove_node(pos)
    local strength = 16

    -- the idea is: Surprizingly large range, weak explosion power, very directed by player
    -- BTW: don't put check for falling here
    -- You can put things that harm the player here though, assuming they collide with a raycast

    local num_rays = 100 -- overkill perhaps?
    local drops = {}

    local dir_shift_strength = 12 -- strength of the player's fist, should not overpower `radius`
    local dir_shift = look_dir * dir_shift_strength
    local spread = 3

    ---@type table<poshash, boolean>
    local delete_queue = {}

    for _ = 1, num_rays do
        local ray = Raycast(pos, pos + dir_shift + vector.random_direction() * spread, false, false)
        local used_strength = 0
        ---@type pointed_thing
        for target_pointed in ray do
            if core.is_protected(target_pointed.under, puncher_name) then break end
            local node = core.get_node(target_pointed.under)

            ---@class NodeDef
            ---@field _on_cloudy_explode? fun(pos:vector, remaining_strength:number, delete_queue:table<poshash, boolean>, drops: table<string, number>):number # Returns the remaining strength after, can be used to amplify a cloud explosion, mutate `delete_queue` and `drops` tables to do node deletion and drops

            if core.registered_nodes[node.name]._on_cloudy_explode then
                used_strength = strength
                    - core.registered_nodes[node.name]._on_cloudy_explode(
                        target_pointed.under,
                        strength - used_strength,
                        delete_queue,
                        drops
                    )

                if used_strength > strength then break end
            elseif not s.is_air(node.name) then
                local cloudness = core.get_item_group(node.name, 'cloudy')
                if cloudness == 0 then break end
                used_strength = used_strength + (1 / cloudness)
                if used_strength > strength then break end
                if not delete_queue[core.hash_node_position(target_pointed.under)] then
                    drops[node.name] = (drops[node.name] or 0) + 1
                    delete_queue[core.hash_node_position(target_pointed.under)] = true
                end
            end
        end
    end
    s.foreachp(delete_queue, function(_, k) core.remove_node(core.get_position_from_hash(k)) end)

    -- we give it to the puncher, items on the ground is overrated :)

    if puncher then
        for drop, count in pairs(drops) do
            local leftover = puncher
                :get_inventory()
                :add_item(puncher:get_wield_list(), ItemStack(drop .. ' ' .. count))

            core.add_item(pointed_thing.under, leftover)
        end
    else
        --- but if there isn't one then uhh... bit of an issue
        for drop, count in pairs(drops) do
            core.add_item(pointed_thing.under, ItemStack(drop .. ' ' .. count))
        end
    end

    -- then oOO particles
    -- NEEDS to be a particle spawner i'm sorry xDDDD [need scale_tween]
    core.add_particlespawner {
        _direct = true,
        amount = 1,
        time = 0.5,
        pos = pointed_thing.above,
        vel = look_dir * 40,
        exptime = 0.6,
        collision_removal = true,
        collisiondetection = true,
        drag = 0.001,
        glow = 14,
        animation = { type = 'vertical_frames', length = -1 },
        texture = {
            name = 'spacea_cloud_machines_explosion_echo.png',
            scale_tween = { 10, 50 },
            alpha_tween = { 1, 0 },
        },
    }
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
                    core.get_node_timer(pos):start(160)
                end
            else
                trans_sparks(pos, pointed_thing, 4, true)
                explode(pointed_thing, puncher)
            end
        end,
        _on_cloudy_charge = function(pos, charge, vel)
            local current_charge_level = i
            local future_charge_level = math.min(4, current_charge_level + charge)
            if future_charge_level == 4 then
                -- explode
                local pointed_thing = { above = pos, under = pos }
                pointed_thing.above = pointed_thing.above - vel
                explode(pointed_thing, false, vel)
            else
                -- charge up, without particles
                core.set_node(
                    pos,
                    { name = 'spacea_cloud_machines:charged_cloud_' .. future_charge_level }
                )
                core.get_node_timer(pos):start(60) -- lore reason: Its less durable.. or something, definitely not because i was lazy while coding this
            end
        end,
    })
end

s.meteorites.register_attract_node_group 'cloud_meteorite_attract'

core.register_abm {
    label = 'Supercritical sparks charged_cloud_2',
    interval = 1,
    chance = 2,
    catch_up = false,
    nodenames = { 'spacea_cloud_machines:charged_cloud_2' },
    neighbors = { 'group:air', 'air' },
    action = function(pos, _, _, _) supercritical_sparks(pos, 1) end,
}

core.register_abm {
    label = 'Supercritical sparks charged_cloud_3',
    interval = 1,
    chance = 2,
    catch_up = false,
    nodenames = { 'spacea_cloud_machines:charged_cloud_3' },
    neighbors = { 'group:air', 'air' },
    action = function(pos, _, _, _) supercritical_sparks(pos, 2) end,
}

s.meteorites.register_node_meteorite_spawner('spacea_cloud_machines:charged_cloud_2', 44, {
    time = 0, -- not relevant
    type = 'spacea_meteorites:cloud_meteorite',
    distance = { min = 64, max = 128 }, -- why am i doing powers of two
})

s.meteorites.register_node_meteorite_spawner('spacea_cloud_machines:charged_cloud_3', 22, {
    time = 0, -- not relevant
    type = 'spacea_meteorites:cloud_meteorite',
    distance = { min = 32, max = 64 }, -- why am i doing powers of two, anyway: intentionally allows a bit closer
})
