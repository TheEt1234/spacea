-- This mod should get loaded first

--- Short for "spacea"
--- You will need this a LOT trust me
---@class Spacea
---@diagnostic disable-next-line: lowercase-global
s = {}

--- Loads the path of <mod dir>/<path>.lua
---@param path string Without .lua file extension
function s.load_file(path)
    dofile(core.get_modpath(core.get_current_modname()) .. '/' .. path .. '.lua')
end

s.load_file 'utils'

-- utils gives access to load_files
s.load_files {
    'version',
    'polyfill',
    'functional',
    'misc',
    'data_structures/init',
    'node_related',
    'custom_falling',
    'arm',
    'settings',
}

if s.version.is_dev then s.load_file 'strict' end
