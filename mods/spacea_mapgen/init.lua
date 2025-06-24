s.mapgen = {}
s.load_files {
    'nodes',
    'noises_and_respawning',
}

core.register_mapgen_script(core.get_modpath(core.get_current_modname()) .. '/async.lua')
