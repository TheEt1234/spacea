--- ---------------------------------------------
--- NOTE: WELCOME TO IMPROVEMENTS, IF YOU WANT TO
--- ---------------------------------------------

--- {[1]=value, [2]=next, [3]=prev (only if double linked list)}

---@class LinkedList<T>: {[1]:T, [2]:LinkedList}
---@field value nil
---@field next nil
---@field prev nil
---@class DoublyLinkedList<T>: {[1]:T, [2]:LinkedList, [3]:LinkedList}
---@field value nil
---@field next nil
---@field prev nil

--- It is not really formatted like a standard data structure class, there is no :new() or any metatables, more like just a set of utilities
---@class s.LinkedList
s.LinkedList = {}

--- In the format of {[1]=value, [2]=next}, for doublylinkedlists there is also [3]=prev
---@enum LinkedList.keys
s.LinkedList.keys = {
    VALUE = 1,
    NEXT = 2,
    PREV = 3,
}

local keys = s.LinkedList.keys -- localize for sanity

--- To/from table

---@param list LinkedList|DoublyLinkedList
---@return table
function s.LinkedList.to_table(list)
    local out = {}
    local rope = 0
    for v, _ in s.LinkedList.traverse(list) do
        rope = rope + 1
        out[rope] = v
    end
    return out
end

---@generic T
---@param t T[]
---@return LinkedList<T>|DoublyLinkedList<T>
function s.LinkedList.from_table(t)
    local list = {}
    local original_list = list
    for _, v in ipairs(t) do
        list[keys.VALUE] = v
        list[keys.NEXT] = {}
        list = list[keys.NEXT]
    end
    return original_list
end

--- Iteration

--- Use in a for loop, like `for value, next in s.LinkedList.traverse(my_list) do end
---@param list LinkedList|DoublyLinkedList
---@return function
function s.LinkedList.traverse(list)
    return function()
        if not list then return end
        local ret1, ret2 = list[keys.VALUE], list[keys.NEXT]
        list = list[keys.NEXT]
        return ret1, ret2
    end
end

--- O(n) - don't use too often
--- Don't use on weird recursive
---@param list LinkedList|DoublyLinkedList
---@return integer
function s.LinkedList.length(list)
    local len = 0
    while list do
        len = len + 1
        list = list[keys.NEXT]
    end
    return len
end

--- Works only on singly linked lists
--- Inserts a value
---@param list LinkedList
---@param value any
function s.LinkedList.single_insert(list, value)
    local next = list[keys.NEXT]
    list[keys.NEXT] = { [keys.VALUE] = value, [keys.NEXT] = next }
end

--- Works only on doubly linked lists
--- Inserts a value
---@param list DoublyLinkedList
---@param value any
function s.LinkedList.doubly_insert(list, value)
    local next = list[keys.NEXT]
    list[keys.NEXT] = { [keys.VALUE] = value, [keys.NEXT] = next, [keys.PREV] = list }
    next[keys.PREV] = list[keys.NEXT]
end

--- The returned linked list is the one removed
---@param list LinkedList
---@return (LinkedList|boolean)? removed_linked_list
function s.LinkedList.single_remove_next(list)
    if not list[keys.NEXT] then return false end -- Nothing to remove as its the tail
    -- Ok so, we want next(list) to point to next(next(list))
    -- Halfway through coding this i forgot what "next" means xDDD, it's such an unusual word, is it "text?" "not"? "not text?"
    local ret = list[keys.NEXT]
    list[keys.NEXT] = list[keys.NEXT][keys.NEXT]
    return ret
end

--- The returned linked list is the one removed
---@param list DoublyLinkedList
---@return (DoublyLinkedList|boolean)? removed_linked_list
function s.LinkedList.doubly_remove_next(list)
    if not list[keys.NEXT] then return false end -- Nothing to remove as its the tail
    local ret = list[keys.NEXT]
    list[keys.NEXT] = list[keys.NEXT][keys.NEXT]
    list[keys.NEXT][keys.PREV] = list
    return ret
end

--- Makes a doubly linked list tail/tail
---@return DoublyLinkedList head, DoublyLinkedList tail
function s.LinkedList.make_doubly_head_tail()
    local head = {}
    local tail = {}

    tail[keys.NEXT] = head
    head[keys.PREV] = tail

    return head, tail
end
