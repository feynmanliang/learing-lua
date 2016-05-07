x = 5
a = {} -- empty table
b = { key = x, anotherKey = 10 } -- strings as keys
c = { [x] = b, ["string"] = 10, [34] = 10, [b] = x } -- variables and literals as keys


t = { 24, 25, 8, 13, 1, 40 } -- arrays are tables with 1..#t keys (1 indexed)
table.insert(t, 50) -- append
table.insert(t, 3, 89) -- inserts at position 3, shifting rest of array right
table.remove(t, 2) -- removes itema t index 2 (25)
table.sort(t) -- sorts via the < operator
