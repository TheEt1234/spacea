--- so.... a bit of a problem
--- What if there are too many particlespawners in one small area
--- That is hell for the player
---
--- Solution: limit them
---
--- okay and to automatically limit them
--- so yeah i override core.add_particlespawner and uhh yeah
--- limiting is per some area
--- LIMITING ONLY HAPPENS WHEN `_limiting_pos` is defined in the particle spawner definition

local old_spawner = core.add_particlespawner

---@enum particle_spawner_limiting_priority oh and you can just ignore this and make it a float, your choice
s.particle_spawner_priorities = {
    low = 1,
    medium = 2,
    unspecified = 2, -- same as medium, might change idk
    high = 3,
    ambience = 4, -- for things like rain
    highest = 5, -- for really special stuff, that makes the rain not matter
}

---@class ParticleSpawner
---@field _direct? boolean
---@field _limiting_pos? vector
---@field _limiting_priority? particle_spawner_limiting_priority

--- Oh and, the player shouldn't be able to make a large amount of high priority particles

--- Table structure: {id:number, priority:number, time_end:number, id2:number, priority2:number, time2_end:number, ...}
--- This is to avoid making additional tables in case there are a million particlespawners
--- Instinctive objectively pointless premature optimization OH YES (I EVEN MADE A CACHE CLASS FOR THIS, but i will need it later)
--- Info: to get the id: (i*3)-2, to get the priority: (i*3)-1, to get the time: (i*3)
--- ALSO: i am aware of the vurnability that a player could in theory spawn particle spawners in 4096 other mapblocks (covering about 65536 of nodes, if they were in a line), to make the table forget the limit of one mapblock, or something like that, super dumb and unlikely
s.particle_spawners = s.Cache(4096)
local h = core.hash_node_position

local LIMITING_CHUNK_SIZE = 16 -- => for each mapblock (as mapblock is 16x16x16)
local function get_chunk_pos(p) return vector.floor(vector.divide(p, LIMITING_CHUNK_SIZE)) end

local max_particlespawners_per_chunk = 16
local time_offset = 1 -- 1 second

---@param particlespawner_def ParticleSpawner
---@return -1|ParticleSpawner_id
---@diagnostic disable-next-line: duplicate-set-field
function core.add_particlespawner(particlespawner_def)
    if
        particlespawner_def._direct
        or not particlespawner_def._limiting_pos and particlespawner_def.time
    then
        return old_spawner(particlespawner_def)
    end -- skip over all the limiting

    ---@type vector lua_ls needs to get smarter :rolling_eyes:
    local pos = particlespawner_def._limiting_pos
    local chunk_pos = get_chunk_pos(pos)

    if not s.particle_spawners:get(h(chunk_pos)) then s.particle_spawners:put(h(chunk_pos), {}) end
    ---@type (number|ParticleSpawner_id)[]
    local chunk = s.particle_spawners:get(h(chunk_pos))

    local current_amount_of_spawners = #chunk / 3
    if current_amount_of_spawners >= max_particlespawners_per_chunk then
        -- remove a lower priority particle spawner or return -1
        local this_priority = particlespawner_def._limiting_priority
            or s.particle_spawner_priorities.unspecified
        local to_remove = {}
        local removed_one = false
        for i = 1, #chunk / 3 do -- attempt to remove old ones
            local id, _, time = chunk[(i * 3) - 2], chunk[(i * 3) - 1], chunk[i * 3]
            if os.clock() > (time + time_offset) then
                removed_one = true
                to_remove[(i * 3) - 2] = true
                to_remove[(i * 3) - 1] = true
                to_remove[i * 3] = true
                ---@diagnostic disable-next-line: param-type-mismatch
                core.delete_particlespawner(id)
            end
        end
        if not removed_one then -- remove based on priority
            for i = 1, #chunk / 3 do
                local id, priority, _ = chunk[(i * 3) - 2], chunk[(i * 3) - 1], chunk[i * 3]
                if priority < this_priority then
                    removed_one = true
                    to_remove[(i * 3) - 2] = true
                    to_remove[(i * 3) - 1] = true
                    to_remove[i * 3] = true
                    ---@diagnostic disable-next-line: param-type-mismatch
                    core.delete_particlespawner(id)
                    break
                end
            end
        end
        if not removed_one then return -1 end
        local new_chunk = {}
        local rope = 0
        for i = 1, #chunk do
            if not to_remove[i] then
                rope = rope + 1
                new_chunk[rope] = i
            end
        end

        s.particle_spawners:put(h(chunk_pos), new_chunk)
        chunk = new_chunk
    end

    local id = old_spawner(particlespawner_def)
    if id == -1 then return -1 end

    -- add it to the chunk
    local rope = #chunk
    chunk[rope + 1] = id
    chunk[rope + 2] = particlespawner_def._limiting_priority
        or s.particle_spawner_priorities.unspecified
    chunk[rope + 3] = os.clock() + (particlespawner_def.time or 1)
    s.particle_spawners:put(h(chunk_pos), chunk)

    return id
end
