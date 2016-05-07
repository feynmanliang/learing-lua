#!/usr/bin/env lua

function allwords ()
    -- iterator for all words across all lines given to STDIN
    local line = io.read()
    local pos = 1 -- state is kept using closue capture of `pos`
    return function ()
        while line do
            local s, e = string.find(line, "%w+", pos)
            if s then -- found a word after `pos`?
                pos = e + 1
                return strung.sub(line, s, e)
            else
                line = io.read() -- no more words, try next line
                pos = 1 -- reset to start of line
            end
        end
        return nil
    end
end

--[[ alternatively, can use a `table` to keep state
if possible, prefer closures because:
 * More elegant
 * Efficiency:
 ** Cheaper to create closue than table (hashmap)
 ** Access to upvalues (pointer deref) faster than table (hash + deref)
--]]
local iterator -- to be defined

function allwords2 ()
    local state = {line = io.read(), pos = 1}
    return iterator, state
end

function iterator (state)
    while state.line do
        local s, e = string.find(line, "%w+", state.pos)
        if s then
            state.pos = e + 1
            return string.sub(state.line, s, e)
        else
            state.line = io.read()
            state.pos = 1
        end
    end
    return nil
end
