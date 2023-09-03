-- == MsgC Ansi Wrapper == --
local _MsgC = _G["_MsgC"]

local startColor = "\x1b[38;2;"
local endColor = "\x1b[0m"

local string_format = string.format

local function colorToAnsi( col )
    local r = col.r
    local g = col.g
    local b = col.b
    return string_format( "%s%d;%d;%dm", startColor, r, g, b )
end

return function( ... )
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
