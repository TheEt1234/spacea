-- Even more strict than default luanti? no way?
-- Loaded only in development

s.strict = {}
s.strict.special_node_metadata_fields = s.Set { 'formspec', 'infotext' }
s.strict.special_item_metadata_fields = s.Set {
    'description',
    'short_description',
    'inventory_image',
    'inventory_overlay',
    'wield_image',
    'wield_overlay',
    'wield_scale',
    'color',
    'palette_index',
    'count_meta',
    'count_alignment',
    'range',
}

local max_warnings_until_giving_up = 50
local total_warnings = 0

local function strict_metametatable(metametatable, special_fields)
    s.foreach({ 'set_string', 'set_int', 'set_float' }, function(mt_field)
        local old_f = metametatable[mt_field]
        metametatable[mt_field] = function(k, v)
            if special_fields[k] or total_warnings >= max_warnings_until_giving_up then
                return old_f(k, v)
            else
                core.log(
                    'warning',
                    's.strict: MetaRef: key not in `modname:key` format, the key: ' .. k
                )
                return old_f(k, v)
            end
        end
    end)
end
minetest.after(0, function()
    local node_metametatable = getmetatable(core.get_meta(vector.zero())) -- Get it? because it's a node meta metatable? a meta metatable? metametatable? ... metatable? do words even mean anything anymore
    strict_metametatable(node_metametatable, s.strict.special_node_metadata_fields)
end)
