---The hand, fist
core.override_item('', {
    tool_capabilities = {
        full_punch_interval = 0.9,
        max_drop_level = 0,
        groupcaps = {
            cloudy = { times = { 0.5, 1, 1.5, 2 } },
            ddig_immediate = { times = { 1, 0.5, 0 } },
        },
    },
})
