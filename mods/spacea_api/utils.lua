--- equivalent to an *ipairs* loop
---@generic T
---@param t T[]
---@param f fun(v: T, i: integer)
function s.foreach(t, f)
    for i, v in ipairs(t) do
        f(v, i)
    end
end

--- equivalent to a *pairs* loop
--- Ordering is randomized
---@param t table<any, any> any table
---@param f fun(v: any, k: any)
function s.foreachp(t, f)
    for k, v in pairs(t) do
        f(v, k)
    end
end

local vec_list_full = {} -- 3x3x3 cube missing center

for x = -1, 1 do
    for y = -1, 1 do
        for z = -1, 1 do
            if not (x == 0 and y == 0 and z == 0) then
                vec_list_full[#vec_list_full + 1] = vector.new(x, y, z)
            end
        end
    end
end

local vec_list_star = {} -- in a star shape
for i = 0, 5 do
    vec_list_star[#vec_list_star + 1] = core.wallmounted_to_dir(i) -- xD thanks luanti
end

--- Iterates around position p
--- NOT suitable for performance-dependant tasks, each table you create matters to gc
---@param pos vector
---@param f fun(ipos:vector):boolean? Optionally returns if it should stop, `ipos` is safely mutable!
---@param flags {include_self:boolean?, iterate_fully: boolean?, custom_vec_list: vector[]? }? `include_self` will include `p` in iteration, `iterate_fully` will iterate around corners too, custom vec list will use that vector list
function s.around_pos(pos, f, flags)
    ---@type vector[]
    local vec_list_to_use = vec_list_star
    if flags then
        if flags.include_self then
            if f(pos) then return end
        end
        if flags.iterate_fully then vec_list_to_use = vec_list_full end
        if flags.custom_vec_list ~= nil then
            ---@type vector[]
            vec_list_to_use = flags.custom_vec_list
        end
    end
    for i = 1, #vec_list_to_use do
        local v = vector.copy(vec_list_to_use[i])
        if f(vector.add(v, pos)) then break end
    end
end

---@param paths string[]
function s.load_files(paths) s.foreach(paths, s.load_file) end

---@nodiscard
---@param str1 string
---@param str2 string
---@return boolean
function string.starts_with(str1, str2) return string.sub(str1, #str2) == str2 end
