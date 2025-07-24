--- TODOs:
--- ENTITY
--- TRANSMISSION ITSELF

local viz_size = { min = 0.3, max = 0.8 }
local viz_size_per_charge = (viz_size.max - viz_size.min) / 8
--- ASSUMED max_charge_level = 8, if it goes above that then oh no that wasn't intended but oh well

local seconds_per_charge = 0.5
local seconds_min = 3

core.register_entity('spacea_cloud_machines:cloud_charge', {
    initial_properties = {
        hp_max = 10,
        physical = true,
        collide_with_objects = false,
        pointable = false,
        visual = 'cube',
        --- Alll based on charge level
        -- visual_size = vector.new(0.5, 0.5, 0.5), -- viz size and textures are modified based on charge level
        -- textures = {
        --     'cloud_charge.png',
        --     'cloud_charge.png',
        --     'cloud_charge.png',
        --     'cloud_charge.png',
        --     'cloud_charge.png',
        --     'cloud_charge.png',
        -- },
        --- glow = based on charge kevel
        static_save = false,
    },
    on_activate = function(self, staticdata, dtime_s)
        local charge = tonumber(staticdata)
        self.charge = charge

        ---@type ObjectRef
        local obj = self.object

        local tex = ('spacea_cloud_machines_cloud_charge.png^[resize:%sx%s'):format(
            math.min(16, 2 + charge),
            math.min(16, 2 + charge)
        )

        obj:set_properties {
            visual_size = vector.new(0.3, 0.3, 0.3) + vector.new(
                viz_size_per_charge * charge,
                viz_size_per_charge * charge,
                viz_size_per_charge * charge
            ),
            glow = math.max(charge * 2, core.LIGHT_MAX),
            textures = { tex, tex, tex, tex, tex, tex },
        }
        self.livespan = seconds_min + (charge * seconds_per_charge)
        self.livespan_timer = 0

        self.particle_spawner = core.add_particlespawner {
            _direct = true,
            amount = 8 * charge,
            time = 0,
            exptime = { min = 0.5, max = 1 },
            attached = self.object,
            texture = {
                name = 'spacea_cloud_machines_cloud_charge.png^[resize:8x8',
                blend = 'screen',
                alpha_tween = { 2, 0 },
            },
            vel = { min = -2, max = 2 },
        }
    end,
    on_deactivate = function(self, removal)
        ---@diagnostic disable-next-line: param-type-mismatch
        core.delete_particlespawner(self.particle_spawner or -1)
    end,
    on_step = function(self, dtime, moveresult)
        --- if collided with a node, do a fun _on_cloudy_explode OR (priority) _on_cloudy_charge, or just explode it
        if moveresult.collides then
            s.foreach(moveresult.collisions, function(collision)
                if self.object:is_valid() == false then return end -- if it removed itself
                if collision.type ~= 'node' then return end
                local npos = collision.node_pos ---@type vector
                local node = core.get_node(npos)

                if node.name == 'spacea_cloud_machines:charge_extractor' then return end
                local reg = core.registered_nodes[node.name]
                if not reg then return end
                ---@class NodeDef Geheheheh like 10 different ---@class definitions for a node definition you love to see it
                ---@field _on_cloudy_charge? fun(pos:vector, charge:integer, velocity:vector):nil
                if reg._on_cloudy_charge then
                    reg._on_cloudy_charge(npos, self.charge, collision.old_velocity) -- by far easiest
                    self.object:remove()
                    return
                end
                -- treat it like an explosion
                -- drops should go to object:get_pos()
                if reg._on_cloudy_explode then
                    local drop_list, remove_list = {}, {}
                    reg._on_cloudy_explode(npos, self.charge * 10, remove_list, drop_list)
                    for drop, value in pairs(drop_list) do
                        core.add_item(self.object:get_pos(), ItemStack(drop .. ' ' .. value))
                    end
                    for pos, _ in pairs(remove_list) do
                        core.remove_node(core.get_position_from_hash(pos))
                    end
                    self.object:remove()
                    return
                end

                --- If its an explodable node, without _on_cloudy_charge or _on_cloudy_explode, then we can just remove it
                if core.get_item_group(node.name, 'cloudy') ~= 0 then core.remove_node(npos) end
                self.object:remove() -- remove itself always
            end)
            return
        end

        --- ok, now... the entity also has a limited livespan
        self.livespan_timer = self.livespan_timer + dtime
        if self.livespan < self.livespan_timer then self.object:remove() end
    end,
})

---@param pos vector
---@param charge_level integer
---@param direction vector should be normalized, as vel *should* be based on `charge_level`
---@return ObjectRef? obj, boolean err
local function spawn_cloud_charge(pos, charge_level, direction)
    local obj = core.add_entity(pos, 'spacea_cloud_machines:cloud_charge', tostring(charge_level))
    if not obj then return nil, false end
    obj:set_velocity(vector.multiply(direction, 2 + (charge_level * 1)))
    return obj, true
end

--- Recipe: //lua s.spawn_cloud_charge(pos, 8, player:get_look_dir()) -- be able to summon charges
---
--- I might make a wand node idk

core.register_node('spacea_cloud_machines:charge_extractor', {
    description = 'Charge Extractor',
    paramtype2 = 'wallmounted',
    drawtype = 'nodebox',
    sunlight_propagates = true,
    groups = { cloudenium = 1, dig_immediate = 1, attached_node = 1 },
    node_box = {
        type = 'fixed',
        fixed = {
            { -0.5, -0.5, -0.5, 0.5, -0.3125, 0.5 },
            { -0.125, -0.375, -0.125, 0.125, 0.125, 0.125 },
            { -0.1875, -0.375, -0.1875, 0.1875, -0.25, 0.1875 },
        },
    },
    tiles = {
        'spacea_cloud_machines_charge_extractor_front.png',
        'spacea_cloud_machines_charge_extractor_back.png',
        'spacea_cloud_machines_charge_extractor_side.png',
        'spacea_cloud_machines_charge_extractor_side.png',
        'spacea_cloud_machines_charge_extractor_side.png',
        'spacea_cloud_machines_charge_extractor_side.png',
    },
})

core.register_abm {
    label = 'Charge Extractor',
    nodenames = { 'spacea_cloud_machines:charge_extractor' },
    neighbors = { 'air' },
    interval = 1,
    chance = 1,
    action = function(pos, node, _, _)
        local dir = core.wallmounted_to_dir(node.param2)
        local input_pos = vector.add(pos, dir)
        local output_pos = vector.subtract(pos, vector.multiply(dir, 0.5))

        local input_node = s.get_or_load_node(input_pos)

        local reg = core.registered_nodes[input_node.name]
        if not reg then return s.drop_node(pos) end

        ---@class NodeDef
        ---@field _cloudy_get_charge? fun(pos:vector):integer
        ---@field _cloudy_set_charge? fun(pos:vector, charge:integer)

        if not reg._cloudy_get_charge then return s.drop_node(pos) end
        if not reg._cloudy_set_charge then
            error('Uhh: ' .. input_node.name .. ' is missing _cloudy_set_charge')
        end

        local charge = reg._cloudy_get_charge(input_pos)
        local use_charge = 1
        if charge < use_charge then return end
        charge = charge - use_charge
        reg._cloudy_set_charge(input_pos, charge)

        spawn_cloud_charge(output_pos, use_charge, -dir)

        --- let me just explain what the hell is that
        --- So, ABMs just... don't execute if nothing is being changed in their mapblock
        --- WHYY??? i don't knowwww,
        --- so this has to be the workaround
        core.after(0, function()
            if core.get_node(pos).name == node.name then core.swap_node(pos, node) end
        end)
    end,
}

--- OH.... TODO: MAKE THIS A THING!
--- -  TURING COMPLETENESS (POSSIBLY COMPARING THE STATE OF THE NODE BESIDE IT, AND BASED ON THAT DECIDE IF TO FIRE?)
--- -  MORE TRANSFER THAN JUST ONE CHARGE
--- - MORE DIRECTIONS THAN THE BORING 6, DO ALL OF THEM, ALL OF THEM, ALL OF THEM
--- A WAND THAT ALLOWS YOU TO THROW CHARGES AT THINGS
