---@class Set: table
s.Set = {}

---@param t any[]
---@param set_mt boolean?
---@return Set|table<any, boolean>
function s.Set.new(t, set_mt)
    local set = {}
    if t ~= nil then s.foreach(t, function(v) set[v] = true end) end
    if set_mt then setmetatable(set, { __index = s.Set }) end
    return set
end

setmetatable(s.Set, {
    __call = s.Set.new,
})

---@param element any
function s.Set:remove(element) self[element] = nil end

---@param elements any[]
function s.Set:remove_all(elements)
    s.foreach(elements, function(v) self[v] = nil end)
end

---@param element any
function s.Set:add(element) self[element] = true end

---@param elements any[]
function s.Set:add_all(elements)
    s.foreach(elements, function(v) self[v] = true end)
end

---@nodiscard
---@param element any
---@return boolean|nil
function s.Set:contains(element) return self[element] end
