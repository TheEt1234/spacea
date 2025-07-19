---@class meteorite_spawner_properties
local _props = {
    time = 0, ---@type number # The amount of time that it takes to spawn a meteorite
    type = 'my:meteorite_entity', ---@type string # The meteorite entity to spawn
    distance = { min = 0, max = 0 }, ---@type {min:number,max:number} # The min/max distance from the player that the meteorite player can spawn
}

local store = AreaStore()
---@type meteorite_spawner_properties[]
local registered_player_spawners = {}

--- Spawns meteorites near players
--- Spawns meteorites only in pmin/pmax area, including corners
--- The player must be in that area, for the spawning defined by `properties` to work
--- Overlapping areas don't work
---@param pmin vector
---@param pmax vector
---@param properties meteorite_spawner_properties
function s.meteorites.register_player_spawner(pmin, pmax, properties)
    registered_player_spawners[#registered_player_spawners + 1] = properties
    store:insert_area(pmin, pmax, tostring(#registered_player_spawners))
end

local random = PcgRandom(tonumber(core.get_mapgen_setting 'seed') or 0)

--- Attempts to spawn a meteorite near pos, spawn conditions defined by props
---@param pos vector
---@param props meteorite_spawner_properties
function s.meteorites.attempt_meteorite_spawn(pos, props)
    local distance = random:next(props.distance.min, props.distance.max)
    local max_attempts = 120
    local meteorite_pos
    for _ = 1, max_attempts do
        meteorite_pos = vector.add(pos, vector.random_direction() * distance)
        if s.is_air(core.get_node(meteorite_pos).name) then break end
        meteorite_pos = nil
    end
    if not meteorite_pos then return false end -- failed to spawn
    core.add_entity(meteorite_pos, props.type)
    return true
end

--- Attempts to spawn a meteorite near player, spawn conditions defined by props
---@param player ObjectRef
---@param props meteorite_spawner_properties
function s.meteorites.attempt_meteorite_player_spawn(player, props)
    local player_pos = player:get_pos()
    return s.meteorites.attempt_meteorite_spawn(player_pos, props)
end

core.register_globalstep(function(dtime)
    for _, player_obj in ipairs(core.get_connected_players()) do
        local name = player_obj:get_player_name()
        local data = s.player.get_data(name, 'meteorites')
        data.spawn_timer = data.spawn_timer or 0
        data.spawn_timer = data.spawn_timer + dtime
        local spawners = store:get_areas_for_pos(player_obj:get_pos(), true, true)
        local spawner
        ---@diagnostic disable-next-line: unused-local, param-type-mismatch
        for k, v in pairs(spawners) do -- i dont want to use next()
            spawner = v
            break
        end
        if spawner then
            local id = tonumber(spawner.data)
            local spawner_props = registered_player_spawners[id]

            if spawner_props.time < data.spawn_timer then
                s.meteorites.attempt_meteorite_player_spawn(player_obj, spawner_props)
                data.spawn_timer = 0
            end
        end
    end
end)

core.register_chatcommand('spawn_meteorite', {
    params = '[type|"get_valid_types"]',
    description = 'Spawns a meteorite, by default spawns a meteorite near a player, of type related to the area',
    privs = s.Set { 'server' },
    func = function(name, param)
        local param_split = param:split(' ', false)
        local player = core.get_player_by_name(name)
        if not player then return false, 'Not supported' end
        if param_split[1] == nil then
            local spawners = store:get_areas_for_pos(player:get_pos(), true, true)
            local spawner
            ---@diagnostic disable-next-line: unused-local, param-type-mismatch
            for k, v in pairs(spawners) do -- i dont want to use next()
                spawner = v
                break
            end
            if spawner then
                local id = tonumber(spawner.data)
                local spawner_props = registered_player_spawners[id]
                if s.meteorites.attempt_meteorite_player_spawn(player, spawner_props) then
                    return true, 'Spawned a meteorite somewhere'
                else
                    return false, 'Meteorite spawning failed for some reason'
                end
            end
            return false,
                'Could not find a nearby spawner [are you in a void?], please specify a meteorite type (the entity name)'
        elseif param_split[1] == 'get_valid_types' then
            local valid_meteorite_types = ''
            for k, _ in pairs(s.meteorites.registered_meteorites) do
                valid_meteorite_types = valid_meteorite_types .. k .. ', ' -- i know concatination bad concatination bad but i got lazy and it isn't much
            end
            return true, 'Valid meteorite types: ' .. string.sub(valid_meteorite_types, 1, -3)
        else
            if s.meteorites.registered_meteorites[param_split[1]] then
                core.add_entity(player:get_pos(), param_split[1])
                return true, 'Spawned meteorite'
            end
            return false,
                'Invalid meteorite type, see /spawn_meteorite get_valid_types, or use without arguments to spawn a meteorite to the theme'
        end
    end,
})

--- Don't make 'em too cheap, don't make them too fast
--- Use this only for sort of "ambient" spawners, or when its convenient
--- Like, after getting charged clouds, the way to progress is to get a meteorite
--- It would be really convenient for the player if charged clouds also spawned meteorites, wouldn't it?
--- Anyway this works by using an ABM
---@param nodename string
---@param chance number
---@param props meteorite_spawner_properties
---@return nil
function s.meteorites.register_node_meteorite_spawner(nodename, chance, props)
    core.register_abm {
        label = 'Node-meteorite spawner: ' .. nodename,
        nodenames = { nodename },
        neighbors = { 'air', 'group:air' }, -- hehe
        interval = 4,
        chance = chance,
        action = function(pos, _, _, _) s.meteorites.attempt_meteorite_spawn(pos, props) end,
    }
end
