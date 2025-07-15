--- This is fake, props is fake, just for types, i hope luajit discards it

--- Hey... does creating like 900000 classes lag lua_ls
--- i saw it being written in lua, you know, not-rust
--- nahh i'm suree it will be all fine as this project grows

---@type table<string, meteorite_properties>
local registered_meteorites = {}

s.meteorites.registered_meteorites = registered_meteorites

---@class meteorite_properties
local _props = {
    ---@class meteorite_properties.visual
    visual = { ---@type meteorite_properties.visual
        name = 'cube', ---@type "cube"|"mesh"
        mesh = '', ---@type string?
        textures = {}, ---@type string[]?
        glow = 14, ---@type number?
        size = vector.zero(), ---@type vector?
        alpha = 1, ---@type number?
    },
    attract_groups = {}, ---@type table<string, boolean>
    start_speed = 3, ---@type number
    on_collide = s.meteorites.default_on_collide, ---@type (fun(meteorite_entity:luaentity):nil)?
    on_attract = function() end, ---@type (fun(meteorite_entity:luaentity, from:vector?, strength:number):nil)?
}

--- By default, simply removes the entity
--- WARN: ONLY USED FOR TESTING
function s.meteorites.default_on_collide(meteorite_entity) meteorite_entity.object:remove() end

--- Registers a meteorite
--- It is an interesting entity
---@param mod string
---@param name string
---@param properties meteorite_properties
function s.meteorites.register_entity(mod, name, properties)
    local box_size = properties.visual.size and properties.visual.size.x / 2 or 0.5

    if properties.visual.alpha then
        s.foreachp(
            properties.visual.textures,
            function(v, k)
                properties.visual.textures[k] = v .. '^[opacity:' .. properties.visual.alpha
            end
        )
    end
    registered_meteorites[('%s:%s'):format(mod, name)] = properties
    core.register_entity(('%s:%s'):format(mod, name), {
        initial_properties = {
            hp_max = 2,
            physical = true,
            collide_with_objects = true,
            visual_size = properties.visual.size or vector.new(1, 1, 1),
            visual = properties.visual.name,
            mesh = properties.visual.mesh,
            selectionbox = {
                -box_size,
                -box_size,
                -box_size,
                box_size,
                box_size,
                box_size,
                rotate = true,
            },
            collisionbox = {
                -box_size,
                -box_size,
                -box_size,
                box_size,
                box_size,
                box_size,
            },
            pointable = true,
            textures = properties.visual.textures,
            use_texture_alpha = true,
            glow = properties.visual.glow or 14,
            static_save = false,
        },
        on_activate = function(self, staticdata, _)
            self.attracted = false
            self.object:add_velocity(vector.random_direction() * properties.start_speed)
            self.object:set_properties {
                automatic_rotate = properties.start_speed * 0.3, -- 0.2 (from sbz) feels too slow imo, might randomize this later
            }
            self.object:set_rotation(
                vector.new(math.random() * 2, math.random(), math.random() * 2) * math.pi -- this line is from sbz: by theidealist, thank you
            )
        end,
        on_punch = function(self, puncher, time_from_last_punch)
            -- Hmm, if i punch this meteorite, surely it will explode, surely
            -- Haha
            -- a meteorite does not go down like that!
            if not puncher then
                -- just invert the velocity yeah
                -- and uhh... also introduce a funny :)
                self.object:add_velocity(self:get_velocity() * -2)
                return true
            end

            local look_dir = puncher:get_look_dir()
            if look_dir == nil then return true end -- probably non player, meh, whatever

            local punch_strength = 5

            if time_from_last_punch then
                punch_strength = punch_strength * math.min(1, time_from_last_punch ^ 2)
            end

            self.object:add_velocity(look_dir * punch_strength)

            return true
        end,
        on_step = function(self, dtime, moveresult)
            if moveresult.collides then
                (properties.on_collide or s.meteorites.default_on_collide)(self)
            end
        end,
    })
end

--- Triggers the <meteorite properties>.on_attract function if present
--- It will do this every time the meteorite gets attracted to
--- You can use this for cool visuals (Not this function though, its more like an internal function, you shouldn't call it, you can override it if you want to)
function s.meteorites.trigger_attract_mode(meteorite_obj, from_pos, strength)
    local lu = meteorite_obj:get_luaentity()
    if registered_meteorites[lu.name].on_attract then
        registered_meteorites[lu.name].on_attract(lu, from_pos, strength)
    end
    lu.attracted = true
end

--- FROM SKYBLOCK ZERO sbz_api.get_attraction(pos1, pos2)
--- Gets the attraction velocity, multiply it by dtime and some amount
---@param pos1 vector
---@param pos2 vector
---@return vector
function s.meteorites.get_attraction_velocity(pos1, pos2)
    local dir = pos2 - pos1
    local length = vector.length(dir)
    return vector.normalize(dir) * (length ~= 0 and (length ^ -2) or 0)
end

--- Attracts a single meteorite
--- For attracting meteorites in a radius, see `s.meteorites.attract_meteorites_in_radius`
--- :)
---@param meteorite_obj ObjectRef
---@param to vector
---@param strength number
function s.meteorites.attract_meteorite(meteorite_obj, to, strength, dtime)
    -- let `on_attract` do the visuals
    s.meteorites.trigger_attract_mode(meteorite_obj, to, strength)

    -- alright whats the formula here... oh let me just look at sbz
    -- "obj:add_velocity(t * dtime * sbz_api.get_attraction(obj:get_pos(), pos) * magnitude)"
    -- ok

    meteorite_obj:add_velocity(
        dtime * strength * 256 * s.meteorites.get_attraction_velocity(meteorite_obj:get_pos(), to)
    )
end

-- love screaming case
local METEORITE_RADIUS = 200 -- 200 is enough i think, may get changed later

--- Dtime: Time between these function calls
--- For attracting a single meteorite see `s.meteorites.attract_meteorite`
---  NOTE: Radius is hardcoded to be 200, may change (correct radius would be infinity but uhh, i DON'T WANT TO DEAL WITH THAT OH NO!)
---@param group_name string
---@param strength number
---@param pos vector
---@param dtime number
function s.meteorites.attract_meteorites_in_radius(group_name, strength, pos, dtime)
    local meteorites = core.get_objects_inside_radius(pos, METEORITE_RADIUS)
    s.foreach(meteorites, function(meteorite_obj)
        local lu = meteorite_obj:get_luaentity()
        if not lu then return end
        local luname = lu.name
        if not registered_meteorites[luname] then return end
        local strength_mul = registered_meteorites[luname].attract_groups[group_name]
        if not strength_mul then return end
        s.meteorites.attract_meteorite(meteorite_obj, pos, strength * strength_mul, dtime)
    end)
end

--- Attracts meteorites in a more smooth way, do not use if you don't need to
--- More performant than running attract_meteorites_in_radius multiple times
---@async
function s.meteorites.attract_meteorites_in_radius_smooth(
    group_name,
    strength,
    pos,
    steps,
    time -- in seconds
)
    -- Step 1: Filter for actual meteorites
    local meteorites_unfiltered = core.get_objects_inside_radius(pos, METEORITE_RADIUS)
    local meteorites = {}
    local strength_table = {}
    s.foreach(meteorites_unfiltered, function(potential_meteorite)
        local lu = potential_meteorite:get_luaentity()
        if not lu then return end

        local luname = lu.name
        if not registered_meteorites[luname] then return end

        local strength_mul = registered_meteorites[luname].attract_groups[group_name]
        if not strength_mul then return end

        meteorites[#meteorites + 1] = potential_meteorite
        strength_table[#strength_table + 1] = strength_mul * strength
    end)

    local expected_dtime = time / steps -- cannot

    -- Step 2: actually attract them (over time... and space)
    local previous_time = os.clock()
    for step = 1, steps do -- First step will execute immiadedly after this globalstep
        core.after(step * expected_dtime, function()
            s.foreach(meteorites, function(meteorite, i)
                if not meteorite:is_valid() then return end
                s.meteorites.attract_meteorite(
                    meteorite,
                    pos,
                    strength_table[i],
                    os.clock() - previous_time
                )
            end)
            previous_time = os.clock()
        end)
    end
end

--- Makes nodes with `group_name` attract meteorites
--- NOTE: if something has 2 meteorite-attracting-groups, and a meteorite happens to be attracted to both of them, it will be attracted by both groups
---@param group_name string
---@return nil
function s.meteorites.register_attract_node_group(group_name)
    core.register_abm {
        label = ('Meteorite attraction, group: %s'):format(group_name),
        nodenames = { ('group:%s'):format(group_name) },
        interval = 1,
        chance = 1,
        action = function(pos, node)
            s.meteorites.attract_meteorites_in_radius_smooth(
                group_name,
                core.get_item_group(node.name, group_name),
                pos,
                4,
                1
            )
            -- if regular attract_meteorites_in_radius was used, it would *appear* laggy, because the attraction is done only once per second
            -- to solve this problem, why don't i just attract more? yeah
        end,
    }
end
