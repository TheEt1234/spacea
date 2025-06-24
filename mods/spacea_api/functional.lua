-- Attempts to implement some concepts from functional programming i guess

---@class Functional
s.f = {}

s.f.curry = function(f, ...)
    local args = { ... }
    return function(...) return f(unpack(args), ...) end
end

s.f.math = {}

s.f.math.add = function(a, b) return a + b end
s.f.math.sub = function(a, b) return a - b end
s.f.math.mul = function(a, b) return a * b end
s.f.math.div = function(a, b) return a / b end
