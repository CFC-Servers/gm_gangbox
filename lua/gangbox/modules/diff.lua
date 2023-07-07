local Color = Color
local TypeID = TypeID
local tostring = tostring
local string_len = string.len
local string_rep = string.rep
local string_find = string.find
local string_Split = string.Split
local table_concat = table.concat

local COLOR_RED = Color( 255, 0, 0 )
local COLOR_GREEN = Color( 0, 255, 0 )
local COLOR_WHITE = Color( 255, 255, 255 )

local function stringify( t )
    local typeId = TypeID( t )

    if typeId == TYPE_TABLE then
        local str = "{"

        for k, v in pairs( t ) do
            str = str .. stringify( k ) .. " = " .. stringify( v ) .. ", "
        end

        return str .. "}"
    else
        return tostring( t )
    end
end

-- take a multiline string like a matrix and make sure the lines are indented properly to line up with the start of the
-- first line
local function indentMultiline( str, k, indent )
    local lines = string_Split( str, "\n" )

    local prefixLen = string_len( k ) + string_len( indent ) + 5
    local prefix = string_rep( " ", prefixLen )

    for i = 2, #lines do
        lines[i] = prefix .. lines[i]
    end

    return table_concat( lines, "\n" )
end

local function formatValue( str, k, indent )
    if string_find( str, "\n" ) then
        return indentMultiline( str, k, indent )
    end

    return str
end

function gb.Diff( t1, t2, indent )
    indent = indent or ""

    for k, v in pairs( t1 ) do
        local strK = stringify( k )
        local strV = formatValue( stringify( v ), strK, indent )
        local t2strV = formatValue( stringify( t2[k] ), strK, indent )

        if t2[k] == nil then
            MsgC( COLOR_RED, indent, "- ", strK, " = ", strV, "\n" )

        elseif TypeID( v ) == TYPE_TABLE and TypeID( t2[k] ) == TYPE_TABLE then
            MsgC( COLOR_WHITE, indent, "  ", strK, " = ", "\n" )
            printTableDiff( v, t2[k], indent .. "  " )

        elseif strV ~= t2strV then
            MsgC( COLOR_RED, indent, "- ", strK, " = ", strV, "\n" )
            MsgC( COLOR_GREEN, indent, "+ ", strK, " = ", t2strV .. "\n" )

        else
            MsgC( COLOR_WHITE, indent, "  ", strK, " = ", strV, "\n" )
        end
    end

    for k, v in pairs( t2 ) do
        if t1[k] == nil then
            MsgC( COLOR_GREEN, indent .. "+ " .. stringify( k ) .. " = " .. stringify( v ) .. "\n" )
        end
    end
end
