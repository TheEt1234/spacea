---@nodiscard
---@param object ObjectRef
---@return vector
s.entities.get_eyepos = function(object)
    local eye_offset = object:get_eye_offset() or vector.zero()
    return vector.add(object:get_pos(), eye_offset)
end
