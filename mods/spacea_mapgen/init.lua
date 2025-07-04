s.mapgen = {}
s.load_files {
    'nodes.lua',
    'noises_and_respawning.lua',
}

core.register_mapgen_script(core.get_modpath(core.get_current_modname()) .. '/async.lua')
