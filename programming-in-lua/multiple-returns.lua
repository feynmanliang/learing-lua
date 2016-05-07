--[[
Functions with multiple return.
--]]

s = "a b c def g"
p = "def"

-- All values are returned if last statement in list
a, b = string.find(s, p)
print(a,b)

-- Only first value returned if in part of expression
a, b = string.find(s, p), -5
print(a,b)

-- Enclosing in parentheses <=> evaluating in exp, forces single return
a, b = (string.find(s, p))
print(a,b)

-- `unpack` implements "splat" operator, e.g. generic function calls
function add(x,y,z)
    return x+y+z
end
print(add(unpack{1,2,3}))

-- Can use varargs to define `select` for selecting which return value
-- NOTE: this is provided by Lua stdlib
function select(i, ...)
    args = {...}
    return args[i]
end

print(string.find(s,p))
print(select(1, string.find(s,p)))
print(select(2, string.find(s,p)))
