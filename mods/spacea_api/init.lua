-- This mod should get loaded first

--- Short for "spacea"
--- You will need this a LOT trust me
---@class Spacea
---@diagnostic disable-next-line: lowercase-global
s = {}

--- Loads the path of <mod dir>/<path>.lua
---@param path string Without .lua file extension
function s.load_file(path) dofile(core.get_modpath(core.get_current_modname()) .. '/' .. path) end

s.load_file 'utils.lua'

-- utils gives access to load_files
s.load_files {
    'version.lua',
    'polyfill.lua',
    'functional.lua',
    'misc.lua',
    'data_structures/init.lua',
    'node_related.lua',
    'node_def_extensions.lua',
    'custom_falling.lua',
    'arm.lua',
    'settings.lua',
    'particle_spawner_limiter.lua',
}

if s.version.is_dev then s.load_file 'strict.lua' end
