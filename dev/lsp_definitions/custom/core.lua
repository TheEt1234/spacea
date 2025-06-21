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
