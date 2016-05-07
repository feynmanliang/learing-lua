--vim:set et sw=4 ts=4:

--[[
All numbers (int, float, double, uint) are represented are the double.
No error when representing integers.
]]--

print(4)
print(0.4)
print(.4)
print(4.3)
print(0xFF) -- Hex
print(0xA33FF03) -- Hex
print(8.7e12)
print(8.7e+12)
print(8.7e-12)

--[[
`math` module
]]--
print(math.pi)
print(math.sin(math.pi))
print(math.cos(math.pi))
print(math.floor(math.pi))
print(math.ceil(math.pi))
print(math.huge) -- inf

math.randomseed(os.time())
print(math.random())
print(math.random())
print(math.random())
print(math.random())
