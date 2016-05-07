-- vim:set et sw=2 ts=4:

-- parameter passing semantics
function f(a)
  if type(a) == "number" then
    a = 5
  elseif type(a) == "table" then
    a[1] = 5
  else
    print("Error! Unsupported type: " .. type(a))
  end
end
a = 10
print(a) -- 10
f(a) -- a is an atomic value, so passed by value
print(a) -- 10

t = {} -- t is an object (table), so passed by reference
print(t[1]) -- nil
f(t)
print(t[1]) -- 5


-- table syntax for functions with table arguments
function foo(t)
  return t[1] * t.x + t[2] * t.y
end

foo{3, 4, x = 5, y = 6} -- 39
foo({ 3, 4, x = 5, y = 6 }) -- equivalent

-- varargs
function sum(...)
  local ret = 0
  -- access varargs by putting in table
  args = {...}
  print(#args)
  print(args[1])

  -- altenative, using `select` function
  for i = 1, select("#", ...) do ret = ret + select(i, ...) end
  return ret
end

print(sum(3, 4, 5, 6)) -- 4 (#args), 3 (args[1]), 18



-- self, allows functions in tables to modify the table using `self` arg
-- used for implementing "instance" methods
t = {}

-- colon syntax
function t:func(x,y)
  self.x = x
  self.y = y
end
--[[
--equivalent to
function t.func(self, x, y)
  self.x = x
  self.y = y
end
]]

t:func(1,1)
print(t.x) -- 1
