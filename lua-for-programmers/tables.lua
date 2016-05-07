x = 5
a = {} -- empty table
b = { key = x, anotherKey = 10 } -- strings as keys
c = { [x] = b, ["string"] = 10, [34] = 10, [b] = x } -- variables and literals as keys


t = { 24, 25, 8, 13, 1, 40 } -- arrays are tables with 1..#t keys (1 indexed)
table.insert(t, 50) -- append
table.insert(t, 3, 89) -- inserts at position 3, shifting rest of array right
table.remove(t, 2) -- removes itema t index 2 (25)
table.sort(t) -- sorts via the < operator
for _, v in ipairs(t) do
  print(v)
end

-- "#" is for arrays and only counts up to first nil index
t = {[1]=1, [2]=2, [5]=5}
print(#t) -- 3, NOT 5


-- Can use optional "order function" in `table.sort`
network = {
  {name = "grauna", IP = "210.26.30.34"},
  {name = "arraial", IP = "210.26.30.23"},
  {name = "lua", IP = "210.26.23.12"},
  {name = "derain", IP = "210.26.23.20"},
}
table.sort(network, function(a,b)
  return (a.name > b.name)
end)
for _, v in ipairs(network) do
  print(v.name, v.IP)
end

