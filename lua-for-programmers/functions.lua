-- vim:set et sw=2 ts=4:

-- functions have call by value semantics
function f(a) a = 5  end
a = 10
print(a) -- 10
f(a)
print(a) -- 10

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
