-- implicit block scope x
for i = 1, 10 do
  local x = "foo"
end
-- x does not exist here
print(x) -- nil

-- explicit block
do
  local x = 3
  local y = 4
end

-- lexical scoping
x = 5 -- global

function foo()
  local x = 6
  print(x) -- 6

  if x == 6 then
    local x = 7
    y = 10 -- global
    print(x) -- 7, local x=7 shadows outer x=6
  end
  -- x=7 goes out of scope, so x=6

  print(x, y) -- 6, 10

  do
    x = 3 -- notice lack of `local`, so outer scope modified
    print(x) -- 3
  end

  print(x) -- 3
  x=3 -- this still does not modify global scope
end
-- x=3 goes out of scope, so x=5

foo()
print(x, y) -- 5, 10
