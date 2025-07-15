-- THE ACTUAL MAPGEN
-- YEAH
local data = {}

--[[
Clouds!
hmm... ok
So, they would be around y=0, between y=-50 to y=50
And they would be like in a r=200 circle, weakening at the end
]]

local noises = core.ipc_get 'spacea_mapgen:noises'

--- THE BORING - CONFIGURATION
local cloud_radius = 1000 ^ 2
local cloud_radius_y = 40 ^ 2
local cloud_falloff = 100 ^ 2
--- THE BORING - c_*
local c_cloud_piece = core.get_content_id 'spacea_mapgen:cloud_piece'
local c_heavy_cloud_piece = core.get_content_id 'spacea_mapgen:cloud_piece_heavy'
local c_light_cloud_piece = core.get_content_id 'spacea_mapgen:cloud_piece_light'
local c_glowy_cloud_piece = core.get_content_id 'spacea_mapgen:cloud_piece_glowy'
--- THE BORING ENDs

--- Mapgen is a write-only language to express in an esoteric way how you want an entire infinite world to be created
--- I feel like?
--- Can you read other people's mapgens?
---@param vm VoxelManip
---@param minp vector
---@param maxp vector
---@diagnostic disable-next-line: undefined-field
core.register_on_generated(function(vm, minp, maxp, _)
    local t0 = os.clock()
    vm:get_data(data)
    local emin, emax = vm:get_emerged_area()
    local area = VoxelArea:new { MinEdge = emin, MaxEdge = emax }

    local sidelen = maxp.x - minp.x + 1
    local sidelen_vec = { x = sidelen, y = sidelen, z = sidelen }
    for _, def in pairs(noises) do
        if not def.map then def.map = ValueNoiseMap(def.np, sidelen_vec) end
        def.map:get_3d_map_flat(minp, def.noise)
    end

    local vi = 0
    local ni = 1
    local dist, dist_y
    for z = minp.z, maxp.z do
        for y = minp.y, maxp.y do
            vi = area:index(minp.x, y, z)
            for x = minp.x, maxp.x do
                dist = x ^ 2 + z ^ 2
                dist_y = y ^ 2

                local cloud_strength = (cloud_radius - dist) / cloud_falloff
                cloud_strength =
                    math.min(0, cloud_strength + (cloud_radius_y - dist_y) / cloud_falloff)

                local cloud_noise = (noises.cloud.noise[ni] ^ 3) + cloud_strength

                if cloud_noise > 0.5 then
                    data[vi] = c_cloud_piece
                    local heavy_cloud_noise = noises.cloud_heavy.noise[ni] ^ 3
                    if heavy_cloud_noise > 0.8 then
                        data[vi] = c_heavy_cloud_piece
                    else
                        -- Light clouds at the bottom
                        local n1, n2, n3 =
                            ((noises.cloud.noise[ni + sidelen] or 0) ^ 3),
                            ((noises.cloud.noise[ni + (sidelen * 2)] or 0) ^ 3),
                            ((noises.cloud.noise[ni + (sidelen * 3)] or 0) ^ 3)
                        if n1 > 1.2 and n2 > 1.2 and n3 < 1.2 then
                            data[vi] = c_light_cloud_piece
                        end
                    end
                    if data[vi] ~= c_heavy_cloud_piece then
                        if cloud_noise > 2 and noises.random.noise[ni] > 0.9 then
                            data[vi] = c_glowy_cloud_piece
                        end
                    end
                end

                vi = vi + 1
                ni = ni + 1
            end
        end
    end

    vm:set_data(data)
    vm:calc_lighting()

    --    core.debug('Mapgen took: ' .. os.clock() - t0 .. 's')
end)
