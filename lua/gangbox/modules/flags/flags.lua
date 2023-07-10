AddCSLuaFile( "values.lua" )
include( "values.lua" )

local headerColor = Color( 220, 220, 220 )
local nameColor = Color( 200, 200, 255 )
local valueColor = Color( 255, 255, 0 )
local descColor = Color( 200, 255, 200 )
local infoColor = Color( 255, 200, 200 )

--- Parses a bitflag and returns its components as a table, printing them with MsgC in a beautiful format.
--- @param bitflag number The bitflag to parse.
--- @param flagset gb.FlagSet The flagset to use for parsing.
local function parseFlags( bitflag, flagset )
    for name, flagValue in SortedPairsByMemberValue( flagset, "value" ) do
        if bit.band( bitflag, flagValue.value ) ~= 0 then
            MsgC( nameColor, name .. " - " )
            MsgC( valueColor, tostring( flagValue.value ), "\n" )
            MsgC( descColor, "    ", flagValue.description, "\n\n" )
        end
    end
end

function gb.ParseFlags( subject, flagset )
    local typeID = TypeID( subject )

    if typeID == TYPE_NUMBER then
        assert( flagset, "No flagset provided for bitflag (check the gb.Bitflags table)" )
        parseFlags( subject, flagset )

    elseif typeID == TYPE_CONVAR then
        MsgC( headerColor, "Flag values for " )
        MsgC( infoColor, tostring( subject ), "\n" )
        parseFlags( subject:GetFlags(), gb.Bitflags.Convar )

    elseif typeID == TYPE_ENTITY then
        MsgC( headerColor, "Entity Flags for: " )
        MsgC( infoColor, tostring( subject ), "\n\n" )
        parseFlags( subject:GetFlags(), gb.Bitflags.Entity )

    elseif typeID == TYPE_DAMAGEINFO then
        MsgC( headerColor, "Damage Types for: " )
        MsgC( infoColor, string.Comma( subject:GetDamageAmount() ) )
        MsgC( headerColor, " | " )
        MsgC( infoColor, tostring( subject:GetAttacker() ) )
        MsgC( headerColor, ">" )
        MsgC( infoColor, tostring( subject:GetInflictor() ), "\n" )

        parseFlags( subject:GetDamageType(), gb.Bitflags.Damage )

    elseif typeID == TYPE_MATERIAL then
        MsgC( headerColor, "Material flags for: " )
        MsgC( infoColor, subject:GetName(), "\n\n" )

        MsgC( infoColor, "[\"$flags\"]:", "\n" )
        parseFlags( subject:GetInt( "$flags" ), gb.Bitflags.MaterialFlags )

        MsgC( infoColor, "[\"$flags2\"]:", "\n" )
        parseFlags( subject:GetInt( "$flags2" ), gb.Bitflags.MaterialFlags2 )
    else
        error( "Cannot parse flags for type " .. type( subject ) .. " (" .. tostring( typeID ) .. ")" )
    end
end
