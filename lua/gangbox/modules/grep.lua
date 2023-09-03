local softWhite = Color( 205, 205, 205 )
local foundRed = Color( 231, 72, 86 )
local pink = Color( 235, 52, 137 )

local next = next
local ipairs = ipairs
local SysTime = SysTime
local file_Find = file.Find
local table_insert = table.insert
local coroutine_yield = coroutine.yield
local coroutine_resume = coroutine.resume

local MsgC = MsgC
if SERVER then
    MsgC = include( "msgc.lua" )
end

local function findFiles( path, foundFiles )
    if not path then path = "" end
    if not foundFiles then foundFiles = {} end

    local fils, dirs = file_Find( path .. "*", "GAME" )

    if fils and next( fils ) ~= 0 then
        for _, fil in ipairs( fils ) do
            table_insert( foundFiles, path .. fil )
        end
    end

    if dirs and next( dirs ) ~= 0 then
        for _, dir in ipairs( dirs ) do
            local searchPath = path .. dir .. "/"
            coroutine_yield()
            findFiles( searchPath, foundFiles )
        end
    end

    return foundFiles
end


local function searchString( stringToFind )
    local allFiles = findFiles( "" ) -- Finds all files.

    for _, path in ipairs( allFiles ) do
        local start, fin = string.find( path, stringToFind )
        if start then
            local prefix = string.sub( path, 1, start - 1 )
            local main = string.sub( path, start, fin )
            local suffix = string.sub( path, fin + 1 )

            MsgC( softWhite, prefix, foundRed, main, softWhite, suffix )
            MsgC( "\n" )
        end
    end
end

local function startSearch( str )
    local co = coroutine.create( function()
        searchString( str )
        coroutine_yield( "done" )
    end )

    hook.Add( "Think", "grepCoroutineHook", function()
        local max = SysTime() + ( engine.TickInterval() / 3 )
        while SysTime() < max do
            local ran, done = coroutine_resume( co )
            if not ran or done == "done" then
                hook.Remove( "Think", "grepCoroutineHook" )
                MsgC( pink, "Done!", "\n" )
            end
        end
    end )
end

concommand.Add( "grep", function( ply, _, _, str )
    if IsValid( ply ) and not ply:IsSuperAdmin() then
        return MsgC( pink, "No permission.\n" )
    end
    if not str or str == "" or #str < 3 then
        return MsgC( pink, "Please enter a string, strings have to be a minimum of 3 characters long!\n" )
    end

    startSearch( str )
    MsgC( pink, "Started grep search...\n" )
end )
