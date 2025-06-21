--- equivalent to an *ipairs* loop
---@param t table<integer, any> array
---@param f fun(v: any, i: integer)
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

---@param paths string[]
function s.load_files(paths)
    s.foreach(paths, s.load_file)
end

---@nodiscard
---@param str1 string
---@param str2 string
---@return boolean
function string.starts_with(str1, str2)
    return string.sub(str1, #str2) == str2
end
