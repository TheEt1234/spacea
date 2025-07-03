s.mapgen.noises = {
    cloud_heavy = {
        np = {
            scale = 1,
            spread = { x = 30, y = 15, z = 30 },
            seed = 420420,
            octaves = 2,
            persist = 0.5,
            lacunarity = 2,
            flags = 'absvalue', -- Give it a distinct... feel, i guess, idk if good idea
        },
        noise = {},
    },
    cloud = { -- What do clouds sound like
        np = {
            offset = 0,
            scale = 1,
            spread = { x = 30, y = 15, z = 30 },
            seed = 420420,
            octaves = 3,
            persist = 0.7,
            lacunarity = 2,
            flags = '',
        },
        noise = {},
    },
    random = {
        np = {
            offset = 0,
            scale = 1,
            spread = { x = 1, y = 1, z = 1 },
            seed = 59192308410,
            octaves = 1,
            persist = 0.7,
            lacunarity = 2,
            flags = '',
        },
        noise = {},
    },
}
core.ipc_set('spacea_mapgen:noises', s.mapgen.noises)

local rand = PcgRandom(tonumber(core.get_mapgen_setting 'seed') --[[@as integer]])

-- TODO: RESPAWN POINTS (like /home)

local max_attempts, max_y_look = 200, 200

---@param player_ref PlayerRef
---@param attempts integer?
---@return boolean?
function s.player.respawn_player(player_ref, attempts)
    attempts = attempts or 1
    if attempts > max_attempts then -- Something VERY wrong happened, so yeah let's just, let's just NOT, the player can survive on their own i'm sure
        return
    end

    attempts = attempts + 1
    local x, z = rand:next(-400, 400), rand:next(-400, 400)
    local y = 50

    local pos = vector.new(x, y, z)
    local node = s.get_or_load_node(pos).name
    local is_air = s.is_air(node)
    local direction = is_air and -1 or 1

    local current_y_look = 0
    while math.abs(current_y_look) <= max_y_look do
        current_y_look = current_y_look + direction
        pos.y = y + current_y_look -- i know i should treat vectors like they are immutable but meh

        node = s.get_or_load_node(pos).name
        local current_is_air = s.is_air(node)

        if current_is_air ~= is_air then -- Basically, uhh, this will need a visual explanation
            -- Try re-writing the code, you will get what i mean
            pos.y = pos.y + 1
            player_ref:set_pos(pos)
            return true
        end
    end

    -- oh no, welp, gotta try again
    return s.player.respawn_player(player_ref, attempts)
end

core.register_on_respawnplayer(s.player.respawn_player)
