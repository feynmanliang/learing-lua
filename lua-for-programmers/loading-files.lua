f = loadfile("factorial.lua") -- creates function `f` which loads the file when called
print(factorial) -- nil
f()
print(factorial)

factorial = nil
dofile("factorial.lua") -- `loadfile` and calls the function
print(factorial) -- function: ...

factorial = nil
--[[ Package system (modules), better way to load files
 * Replaces "." with directory separator ("/" in Unix)
 * Looks for file in all locations in `package.path`, which includes "./"
 * Adds path specified to `package.loaded` table, caching and ensuring loaded exactly once
]]--
require("factorial.lua")
-- require("folder.subfolder.file")
