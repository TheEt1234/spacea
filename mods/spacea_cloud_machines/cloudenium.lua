--- Cloudenium - Cloud meteoric matter
--- Gotten from... you guessed it: angry cloud meteorites
--- <Insert some mystery lore about charged stuff+meteorite=>cloudenium>

--- Anyway, i want cloudenium to have some VERY strange properties once out of a meteorite formation (i.e. like 2 nodes away from a glowing cloudenium block, that one "stabilises" the cloudenium i guess)
--- And you can get directed strange properties when you refine it

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

--- When not charged at all
local default_groupcaps = {
    cloudy = { times = { 0.15, 0.35, 0.65, 0.75 } },
    sharp = { times = { 0.35, 0.55, 0.75, 1.25 }, maxlevel = 1 },
}

--- A not so useful form of cloudenium... for crafting anyway
--- Can be grinded into dust by punching it into a cloudstone
core.register_craftitem('spacea_cloud_machines:cloudenium_shard', {
    description = 'Cloudenium Shard',
    groups = { cloudenium = 1, shard = 1 },
    inventory_image = 'spacea_cloud_machines_cloudenium_shard.png',
    tool_capabilities = {
        full_punch_interval = 0.5,
        max_drop_level = 1,
        groupcaps = default_groupcaps,
        damage_groups = {},
    },
})

--- Made by punching cloudenium shard into cloudstone
core.register_craftitem('spacea_cloud_machines:cloudenium_powder', {
    description = 'Cloudenium Powder',
    groups = { cloudenium = 1, powder = 1 },
    inventory_image = 'spacea_cloud_machines_cloudenium_powder.png',
})
