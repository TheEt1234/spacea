--- Cloudenium - Cloud meteoric matter
--- Gotten from... you guessed it: angry cloud meteorites
--- <Insert some mystery lore about charged stuff+meteorite=>cloudenium>

--- Anyway, i want cloudenium to have some VERY strange properties once out of a meteorite formation (i.e. like 2 nodes away from a glowing cloudenium block, that one "stabilises" the cloudenium i guess)
--- And you can get directed strange properties when you refine it

core.register_node('spacea_cloud_machines:cloudenium_block', {
    description = 'Cloudenium Block',
    groups = { cloudenium = 1 }, -- No longer breakable by your fist, you have to do it by other means
    tiles = { 'spacea_cloud_machines_cloudenium_block.png' }, -- distinct border
})

core.register_node('spacea_cloud_machines:glowing_cloudenium_block', {
    description = 'Glowing Cloudenium Block',
    groups = { cloudenium = 1 }, -- No longer breakable by your fist, you have to do it by other means
    tiles = { 'spacea_cloud_machines_cloudenium_block_glowing.png' }, -- distinct border

    -- when attempting to break it, it will hurt, and will be impossible to break
    -- it will cool down once there aren't any cloudenium nearby
})

--- When not charged at all
local default_groupcaps = {
    cloudy = { times = { 0.15, 0.35, 0.65, 0.75 } },
    sharp = { times = { 0.35, 0.55, 0.75, 1.25 }, maxlevel = 1 },
}

--- A not so useful form of cloudenium... for crafting anyway
--- Can be grinded into dust by punching it into a cloudstone
core.register_craftitem('spacea_cloud_machines:cloudenium_shard', {
    description = 'Cloudenium Shard',
    groups = { cloudenium = 1, shard = 1 },
    inventory_image = 'spacea_cloud_machines_cloudenium_shard.png',
    tool_capabilities = {
        full_punch_interval = 0.5,
        max_drop_level = 1,
        groupcaps = default_groupcaps,
        damage_groups = {},
    },
})

--- Made by punching cloudenium shard into cloudstone
--- Used for crafting things
--- 8 cloudenium powder compressed in-world = cloudenium block
core.register_node('spacea_cloud_machines:cloudenium_powder', {
    --  as an item
    description = 'Cloudenium Powder',
    groups = { cloudenium = 1, powder = 1, falling_node = 1, float = 1 },
    inventory_image = 'spacea_cloud_machines_cloudenium_powder.png',
    wield_image = 'spacea_cloud_machines_cloudenium_powder.png',

    -- as a node
    walkable = true,
    collision_box = { type = 'fixed', fixed = { 0, 0, 0, 0, 0, 0 } }, -- hack to make falling node behavior less weird
    tiles = {
        'spacea_cloud_machines_cloudenium_powder_node_top.png',
        'spacea_cloud_machines_cloudenium_powder_node_top.png',
        'spacea_cloud_machines_cloudenium_powder_node_top.png',
    },
    drawtype = 'nodebox',
    paramtype2 = 'leveled',
    leveled_max = 64, -- 1 node
    place_param2 = (64 / 8) * 1, -- 1 level
    light_source = 14,
    node_box = {
        type = 'leveled',
        fixed = {
            -0.5,
            -0.5,
            -0.5,
            0.5,
            0.5,
            0.5,
        },
    },
    sunlight_propagates = true,
    drop = '',
    _on_custom_drops = function(_, _, _, _, pos)
        if pos then
            local node = core.get_node(pos)
            local param2 = node.param2
            local amount = (param2 / 8)
            return { 'spacea_cloud_machines:cloudenium_powder ' .. amount }
        else
            return { 'spacea_cloud_machines:cloudenium_powder 1' }
        end
    end,
    _player_inside = function(player, _, node, dtime)
        local strength = 10 -- per second
        local vel = (node.param2 / 8) * strength * dtime
        player:add_velocity(vector.new(0, vel, 0))
        --- heheheh attach the particle spawner to the player
        --- Also: Q: Does this mean this particle spawner gets spawned multiple times, per second A: yes
        --- Q: Is this a problem A: maybe

        core.add_particlespawner {
            _direct = true,
            amount = 30 * vel,
            time = 2,
            exptime = { min = 0.5, max = 1 },
            texture = {
                name = 'spacea_cloud_machines_cloudenium_sparks.png',
                blend = 'screen',
                alpha_tween = { 1, 0 },
                scale_tween = { 1, 0 },
            },
            pos = { min = vector.new(-0.5, 0, -0.5), max = vector.new(0.5, 0, 0.5), bias = 0 },
            glow = 14,
            attached = player,
            vel = { min = -3, max = 3 },
            drag = vector.new(0.5, 0, 0.5),
            collisiondetection = true,
            collision_removal = false,
            bouncy = 1,
        }
    end,
    on_rightclick = function(pos, node, clicker, itemstack, _)
        if
            itemstack:get_name() == 'spacea_cloud_machines:cloudenium_powder'
            and node.param2 < 64
        then
            if not core.is_creative_enabled(clicker:get_player_name()) then
                itemstack:take_item(1)
            end
            core.swap_node(pos, {
                name = 'spacea_cloud_machines:cloudenium_powder',
                param2 = node.param2 + (64 / 8),
            })
            return itemstack
        else
            return itemstack
        end
    end,
    _on_cloudy_explode = function(pos, remaining_strength, _, _)
        -- turns into cloudenium block if surrounded by cloudstone in a:
        -- AXA
        -- XPX
        -- AXA
        -- formation, where A = any, X = cloudstone, P = powder,param2=64

        local should_transform = true

        s.around_pos(pos, function(ipos)
            local n = core.get_node(ipos)
            if n.name ~= 'spacea_meteorites:cloudstone' then
                should_transform = false
                return true
            end
        end, {
            custom_vec_list = { -- goes around in that shape
                vector.new(-1, 0, 0),
                vector.new(1, 0, 0),
                vector.new(0, 0, -1),
                vector.new(0, 0, 1),
            },
        })

        if should_transform then
            core.set_node(pos, { name = 'spacea_cloud_machines:cloudenium_block' })
            return remaining_strength -- yeah sure, cursed setups GO!
        end

        return 0
    end,
})
