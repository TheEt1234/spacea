local keys = s.LinkedList.keys
--- LRU cache
--- To the ones with sanity, it is like a table but elements sometimes go away, this is a useful property
---@class s.Cache
---@field public store table
---@field public capacity integer
---@field public used_capacity integer
---@field private store_list table
---@field private head DoublyLinkedList
---@field private tail DoublyLinkedList
s.Cache = {}

s.Cache.__metatable = { __index = s.Cache }

--- needed to call with ":", or call s.Cache(), same thing
---@param capacity integer # The amount of kv pairs that it can store
---@return s.Cache
function s.Cache:new(capacity)
    local cache = {
        capacity = capacity,
        used_capacity = 0,
        store_list = {},
        store = {},
    }
    cache.head, cache.tail = s.LinkedList.make_doubly_head_tail()
    return setmetatable(cache, s.Cache.__metatable)
end

setmetatable(s.Cache, { __call = s.Cache.new })

--- Gets a value from the cache, and prioritizes it
--- Alternative: cache.store[k]
---@param k any
function s.Cache:get(k)
    self:prioritize(k, false)
    return self.store[k]
end

--- Puts a value to cache
--- DO NOT USE cache.store to do it
---@param k any
---@param v any
function s.Cache:put(k, v)
    if v == nil then
        return self:remove(k)
    else
        return self:put_force(k, v)
    end
end

--- Puts a k/v in the cache, please use s.Cache:put(), this doesn't work if v == nil the way you expect
--- Used internally
---@param k any
---@param v any
---@private
function s.Cache:put_force(k, v)
    local is_new = self.store[k] == nil
    self:prioritize(k, true)
    if is_new then self.used_capacity = self.used_capacity + 1 end
    self.store[k] = v
    self:enforce_size()
end

--- Used internally, use s.Cache:put(k, nil) instead
---@param k any
---@private
function s.Cache:remove(k)
    self.used_capacity = self.used_capacity - 1
    self.store[k] = nil
    s.LinkedList.doubly_remove_next(self.store_list[k][keys.PREV])
    self.store_list[k] = nil
end

--- Used internally
---@param k any
---@param allow_new boolean
---@private
function s.Cache:prioritize(k, allow_new)
    if not allow_new and self.store[k] == nil then
        return false
    elseif allow_new and self.store[k] == nil then
        s.LinkedList.doubly_insert(self.head[keys.PREV], k) -- prioritize by inserting new
        self.store_list[k] = self.head[keys.PREV]
    else
        -- need to actually prioritize
        local list = self.store_list[k]
        s.LinkedList.doubly_remove_next(list[keys.PREV])
        s.LinkedList.doubly_insert(self.head[keys.PREV], k) -- prioritize by inserting new
        self.store_list[k] = self.head[keys.PREV]
    end
end

--- Used internally, enforces capacity
---@private
function s.Cache:enforce_size()
    -- remove elements until self.used_capacity == self.capacity
    if self.used_capacity <= self.capacity then return end
    local n_to_remove = self.used_capacity - self.capacity

    for _ = 1, n_to_remove do
        local k = self.tail[keys.NEXT][keys.VALUE]
        if k then self:remove(k) end
    end
end

-- tests - they are fine
