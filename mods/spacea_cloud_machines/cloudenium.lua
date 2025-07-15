--- Cloudenium - Cloud meteoric matter
--- Gotten from... you guessed it: angry cloud meteorites
--- <Insert some mystery lore about charged stuff+meteorite=>cloudenium>

--- Anyway, i want cloudenium to have some VERY strange properties once out of a meteorite formation (i.e. like 2 nodes away from a glowing cloudenium block, that one "stabilises" the cloudenium i guess)
--- And you can get directed strange properties when you refine it

--- TODO: MOVE TO SPACEA MACHINES MOD!!
core.register_node('spacea_cloud_machines:cloudenium_block', {
    description = 'Cloudenium Block',
    groups = { cloudenium = 1 }, -- No longer breakable by your fist, you have to do it by other means
    tiles = { 'spacea_cloud_machines_cloudenium_block.png' }, -- distinct border
})

core.register_node('spacea_cloud_machines:glowing_cloudenium_block', {
    description = 'Glowing Cloudenium Block',
    groups = { cloudenium = 1 }, -- No longer breakable by your fist, you have to do it by other means
    tiles = { 'spacea_cloud_machines_cloudenium_block_glowing.png' }, -- distinct border

    -- when attempting to break it, it will hurt, and will be impossible to break
    -- it will cool down once there aren't any cloudenium nearby
})
