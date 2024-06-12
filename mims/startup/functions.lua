-- works like PHP's print_r(), returning the output instead of printing it to STDOUT
-- daniel speakmedia com
--[[ jaywha: added _G for easy Global access in ComputerCraft
-- also removed leading Lua addresses like "table:4a89a0" to make it more JSON-esque --]]

function dumpvar(data)
    -- cache of tables already printed, to avoid infinite recursive loops
    local tablecache = {}
    local buffer = ""
    local padder = "    "

    local function _dumpvar(d, depth)
        local t = type(d)
        local str = tostring(d)
        if (t == "table") then
            if (tablecache[str]) then
                -- table already dumped before, so we dont
                -- dump it again, just mention it
                buffer = buffer.."\n"
            else
                tablecache[str] = (tablecache[str] or 0) + 1
                buffer = buffer.."{\n"
                for k, v in pairs(d) do
                    buffer = buffer..string.rep(padder, depth+1).."\""..k.."\": "
                    _dumpvar(v, depth+1)
                end
                buffer = buffer..string.rep(padder, depth).."}\n"
            end
        elseif (t == "number") then
            buffer = buffer..str.."\n"
        else
            buffer = buffer.."\""..str.."\"\n"
        end
    end
    _dumpvar(data, 0)
    return buffer
end

_G.dumpvar = dumpvar
