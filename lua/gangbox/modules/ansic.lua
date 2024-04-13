-- Don't add ANSI colouring on dev/main branch on windows as it breaks colour output
if system.IsWindows() and BRANCH != "x86-64" then return end
-- MsgC but with Colors converted to ANSI codes for server console output

local _MsgC = rawget( _G, "MsgC" )

local startColor = "\x1b[38;2;"
local endColor = "\x1b[0m"

local string_format = string.format

local function colorToAnsi( col )
    local r = col.r
    local g = col.g
    local b = col.b
    return string_format( "%s%d;%d;%dm", startColor, r, g, b )
end

--- MsgC but uses ANSI printing instead
function gb.AnsiC( ... )
    local line = ""
    local IsColor = IsColor

    for _, t in ipairs( { ... } ) do
        if IsColor( t ) then
            line = line .. colorToAnsi( t )
        else
            line = line .. tostring( t )
        end
    end

    line = string.Replace( line, "\n", endColor .. "\n" )

    return _MsgC( line )
end
