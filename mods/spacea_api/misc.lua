s.gravity = tonumber(core.settings:get 'movement_gravity') or 9.81
s.default_jump = 0.8

---@param timer_max number
---@param f fun(dtime:number)
---@return nil
function s.globalstep_with_timer(timer_max, f)
    local timer = 0
    core.register_globalstep(function(dtime)
        timer = timer + dtime
        if timer >= timer_max then
            timer = 0
            f(dtime)
        end
    end)
end
