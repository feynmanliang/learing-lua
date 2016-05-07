#!/usr/bin/env lua

--[[
`ipairs` without returning index
`list_iter` is a factory returning a new closure iterator on each call
--]]
function list_iter (t)
    local i = 0
    local n = #t
    return function ()
        i = i + 1
        if i <= n then return t[i] end
    end
end

t = {10, 20, 30}
--[[
do
    local iter = list_iter(t) -- creates iterator
    while true do
        local element = iter() -- calls the iterator
        if element == nil then break end
        print(element)
    end
end
--]]
-- equivalent to generic for
for element in list_iter(t) do
    print(element)
end

-- vim:set et sw=4 ts=4:
