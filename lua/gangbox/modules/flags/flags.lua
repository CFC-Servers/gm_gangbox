AddCSLuaFile( "values.lua" )
include( "values.lua" )

local Bitflags = gb.Bitflags

local headerColor = Color( 220, 220, 220 )
local nameColor = Color( 200, 200, 255 )
local valueColor = Color( 255, 255, 0 )
local descColor = Color( 200, 255, 200 )
local infoColor = Color( 255, 200, 200 )
local darkInfoColor = Color( 255, 150, 150 )

local assert = assert
local tostring = tostring
local bit_band = bit.band
local string_Comma = string.Comma

--- Parses a bitflag and returns its components as a table, printing them with MsgC in a beautiful format.
--- @param bitflag number The bitflag to parse.
--- @param flagset gb.FlagSet The flagset to use for parsing.
local function parseFlags( bitflag, flagset )
    local prefix = "  "

    for name, flagValue in SortedPairsByMemberValue( flagset, "value" ) do
        if bit_band( bitflag, flagValue.value ) ~= 0 then
            MsgC( nameColor, prefix, name .. " - " )
            MsgC( valueColor, tostring( flagValue.value ), "\n" )
            MsgC( descColor, "    ", flagValue.description, "\n\n" )
        end
    end
end

--- Checks a given table to see if it's a TraceResult structure
--- @param tbl table The table to check
--- @return boolean isTrace
local function isTrace( tbl )
    local traceKeys = { "AllSolid", "DispFlags", "HitTexture", "StartSolid", "SurfaceFlags" }

    for _, key in ipairs( traceKeys ) do
        if tbl[key] == nil then return false end
    end

    return true
end


function gb.ParseFlags( subject, flagset )
    local typeID = TypeID( subject )

    if typeID == TYPE_NUMBER then
        assert( flagset, "No flagset provided for bitflag (check the gb.Bitflags table, or pass the subject directly, rather than their flags)" )
        parseFlags( subject, flagset )

    elseif typeID == TYPE_CONVAR then
        MsgC( headerColor, "Flag values for " )
        MsgC( infoColor, tostring( subject ), "\n" )
        parseFlags( subject:GetFlags(), Bitflags.Convar )

    elseif typeID == TYPE_ENTITY then
        MsgC( headerColor, "Flags for: " )
        MsgC( infoColor, tostring( subject ), "\n\n" )

        do
            local flags = subject.GetFlags and subject:GetFlags() or 0
            if flags ~= 0 then
                MsgC( headerColor, "Entity Flags:\n" )
                parseFlags( flags, Bitflags.Entity )
            end
        end

        do
            local eFlags = subject.GetEFlags and subject:GetEFlags() or 0
            if eFlags ~= 0 then
                MsgC( headerColor, "Engine Flags:\n" )
                parseFlags( eFlags, Bitflags.EntityEngine )
            end
        end

        do
            local spawnFlags = subject.GetSpawnFlags and subject:GetSpawnFlags() or 0
            if spawnFlags ~= 0 then
                MsgC( headerColor, "Spawn Flags:\n" )
                parseFlags( spawnFlags, Bitflags.EntitySpawn )
            end
        end

        do
            local solidFlags = subject.GetSolidFlags and subject:GetSolidFlags() or 0
            if solidFlags ~= 0 then
                MsgC( headerColor, "Solid Flags:\n" )
                parseFlags( solidFlags, Bitflags.EntitySolid )
            end
        end

    elseif typeID == TYPE_DAMAGEINFO then
        MsgC( headerColor, "Damage Type Flags for: " )

        MsgC( valueColor, tostring( subject:GetAttacker() ) )
        MsgC( headerColor, " > " )
        MsgC( darkInfoColor, string_Comma( subject:GetDamage() ), " " )

        local bonus = subject:GetDamageBonus()
        if bonus ~= 0 then
            MsgC( headerColor, "(" )
            MsgC( descColor, "+", bonus )
            MsgC( headerColor, ") " )
        end
        MsgC( headerColor, "\n" )

        parseFlags( subject:GetDamageType(), Bitflags.Damage )

    elseif typeID == TYPE_MATERIAL then
        MsgC( headerColor, "Material flags for: " )
        MsgC( infoColor, subject:GetName(), "\n\n" )

        do
            local flags = subject:GetInt( "$flags" ) or 0
            if flags ~= 0 then
                MsgC( headerColor, "[\"$flags\"]:", "\n" )
                parseFlags( flags, Bitflags.MaterialFlags )
            end
        end

        do
            local flags2 = subject:GetInt( "$flags2" ) or 0
            if flags2 ~= 0 then
                MsgC( headerColor, "[\"$flags2\"]:", "\n" )
                parseFlags( flags2, Bitflags.MaterialFlags2 )
            end
        end

    elseif typeID == TYPE_TABLE then
        if isTrace( subject ) then
            MsgC( headerColor, "Surface Flags for:  " )
            MsgC( infoColor, subject.HitTexture, "\n\n" )

            do
                local surfaceFlags = subject.SurfaceFlags or 0
                if surfaceFlags ~= 0 then
                    MsgC( headerColor, "SurfaceFlags:\n" )
                    parseFlags( surfaceFlags, Bitflags.Surface )
                end
            end

            do
                local dispFlags = subject.DispFlags or 0
                if dispFlags ~= 0 then
                    MsgC( headerColor, "DispFlags:\n" )
                    parseFlags( dispFlags, Bitflags.DispSurface )
                end
            end
        end

    else
        error( "Cannot parse flags for type " .. type( subject ) .. " (" .. tostring( typeID ) .. ")" )
    end
end
