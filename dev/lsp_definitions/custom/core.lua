---@meta
--- Uses lua_api.md, see luanti-lls-definitions LICENSE, the one for lua_api.md is for this one
--- Now with licensing out of the way

---returns the currently loading mod's name, when loading a mod.
---@nodiscard
---@return string
function core.get_current_modname() end

--- Called when a player joins the game
--- last_login: The timestamp of the previous login, or nil if player is new
---@param f fun(player_ref: core.Player, last_login: integer?)
function core.register_on_joinplayer(f) end

--- Called when a player leaves the game
--- Does not get executed for connected players on shutdown.
--- timed_out: True for timeout, false for other reasons.
---@param f fun(player_ref: core.Player, timed_out: boolean)
function core.register_on_leaveplayer(f) end

---@param f fun(player_ref: core.Player): boolean?
function core.register_on_respawnplayer(f) end

---@param f fun(dtime:number)
function core.register_globalstep(f) end

---@class core.Job
---@field cancel fun(self)

---@param time number
---@param func fun(...)
---@return core.Job
function core.after(time, func, ...) end

---@param f fun()
function core.register_on_mods_loaded(f) end

---@param val number
function core.set_timeofday(val) end

---@nodiscard
---@return vector.Vector
function vector.zero() end

---@param pos vector.Vector
---@return core.MetaDataRef
---@nodiscard
function core.get_meta(pos) end

---@param pos vector.Vector
---@return core.Node?
---@nodiscard
function core.get_node_or_nil(pos) end

---@param pos1 vector.Vector
---@param pos2 vector.Vector?
function core.load_area(pos1, pos2) end

---@alias LogLevel "none"|"verbose"|"action"|"info"|"warning"|"error"

---@param level LogLevel
---@param str string
function core.log(level, str) end

function core.debug(...) end

---@param path string
function core.register_mapgen_script(path) end

---@param key string
---@param value any
function core.ipc_set(key, value) end

--- TODO: List all the different settings
---@nodiscard
---@param setting string
---@return any
function core.get_mapgen_setting(setting) end

---@class PcgRandom
PcgRandom = {}

---@param seed number?
---@param seq number[]?
---@return PcgRandom
function PcgRandom(seed, seq) end

---@param min integer?
---@param max integer?
---@return integer
function PcgRandom:next(min, max) end
