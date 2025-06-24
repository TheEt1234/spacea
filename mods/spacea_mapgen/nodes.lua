local invcube3 = function(img) return core.inventorycube(img, img, img) end
core.register_node('spacea_mapgen:cloud_piece', {
    description = 'Cloud Piece',
    walkable = true,
    drawtype = 'normal',
    sunlight_propagates = true,
    light_source = 2,
    paramtype = 'light',
    collision_box = {
        type = 'fixed',
        fixed = { -0.5, -0.5, -0.5, 0.5, 0.2, 0.5 },
    },
    groups = { slippery = 1, cloudy = 2 },

    use_texture_alpha = 'blend',
    tiles = { 'spacea_mapgen_cloud_piece.png' },
    inventory_image = invcube3 'spacea_mapgen_cloud_piece_inv.png',
})

-- Also known as: Death traps
-- :)
core.register_node('spacea_mapgen:cloud_piece_heavy', {
    description = 'Heavy Cloud Piece',
    walkable = true,
    drawtype = 'liquid',
    sunlight_propagates = false,
    light_source = 0,
    paramtype = 'light',
    collision_box = {
        type = 'fixed',
        fixed = { -0.5, -0.5, -0.5, 0.5, 0.2, 0.5 },
    },
    groups = { falling_node = 1, float = 1, slippery = 0, cloudy = 4 },

    use_texture_alpha = 'blend',
    tiles = { 'spacea_mapgen_cloud_piece_heavy.png' },
    inventory_image = invcube3 'spacea_mapgen_cloud_piece_inv.png^[colorize:#151515:100',
})

core.register_node('spacea_mapgen:cloud_piece_light', {
    description = 'Light Cloud Piece', -- Has strange properties, definitely not bugs i swear :)
    walkable = true,
    drawtype = 'liquid',
    sunlight_propagates = true,
    light_source = 3,
    paramtype = 'light',
    collision_box = {
        type = 'fixed',
        fixed = { -0.5, -0.5, -0.5, 0.5, 0.0, 0.5 },
    },
    groups = { slippery = 0, falling_node = 1, float = 1, cloudy = 1 },

    _falling_node = {
        gravity = vector.new(0, -s.gravity / 2, 0), -- WAS SUPPOSED TO FALL UPWARDS but that was scuffed, so no
    },

    use_texture_alpha = 'blend',
    tiles = { 'spacea_mapgen_cloud_piece_light.png' },
    inventory_image = invcube3 'spacea_mapgen_cloud_piece_light_inv.png',
})

core.register_node('spacea_mapgen:cloud_piece_glowy', {
    description = 'Glowy Cloud Piece',
    walkable = true,
    drawtype = 'normal',
    sunlight_propagates = true,
    light_source = 8,
    paramtype = 'light',
    collision_box = {
        type = 'fixed',
        fixed = { -0.5, -0.5, -0.5, 0.5, 0.2, 0.5 },
    },
    groups = { float = 1, slippery = 3, cloudy = 3 },

    use_texture_alpha = 'blend',
    tiles = { 'spacea_mapgen_cloud_piece_glowy.png' }, -- i tried color curve and it went like REALLY good, feels like ice, or glass, or both!

    inventory_image = invcube3 'spacea_mapgen_cloud_piece_light_inv.png^[colorize:#A8C3DB:250',
})
