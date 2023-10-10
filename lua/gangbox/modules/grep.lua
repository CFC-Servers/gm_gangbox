local colors = gb.Colors

local finished = colors.bold
local softWhite = colors.text
local foundRed = colors.bad
-- local pink = Color( 235, 52, 137 )
local pink = colors.highlight

local next = next
local ipairs = ipairs
local file_Find = file.Find
local table_insert = table.insert
local coroutine_yield = coroutine.yield
local coroutine_resume = coroutine.resume


local function findFiles( path, scope, foundFiles )
    if not path then path = "" end
    if not foundFiles then foundFiles = {} end

    local fils, dirs = file_Find( path .. "*", scope )

    if fils and next( fils ) ~= 0 then
        for _, fil in ipairs( fils ) do
            table_insert( foundFiles, path .. fil )
        end
    end

    if dirs and next( dirs ) ~= 0 then
        for _, dir in ipairs( dirs ) do
            local searchPath = path .. dir .. "/"
            coroutine_yield()
            findFiles( searchPath, scope, foundFiles )
        end
    end

    return foundFiles
end


local searchString
do
    local string_sub = string.sub
    local string_find = string.find

    searchString = function( stringToFind, scope, path, printer )
        local allFiles = findFiles( path, scope )

        for _, filePath in ipairs( allFiles ) do
            local start, fin = string_find( filePath, stringToFind )
            if start then
                local prefix = string_sub( filePath, 1, start - 1 )
                local main = string_sub( filePath, start, fin )
                local suffix = string_sub( filePath, fin + 1 )

                printer( softWhite, prefix )
                printer( foundRed, main )
                printer( softWhite, suffix, "\n" )
            end
        end
    end
end

local function startSearch( str, scope, path, printer )
    local co = coroutine.create( function()
        searchString( str, scope, path, printer )
        coroutine_yield( "done" )
    end )

    local SysTime = SysTime
    hook.Add( "Think", "grepCoroutineHook", function()
        local max = SysTime() + ( engine.TickInterval() * 0.75 )

        while SysTime() < max do
            local ran, done = coroutine_resume( co )
            if not ran or done == "done" then
                hook.Remove( "Think", "grepCoroutineHook" )
                printer( finished, "Done!", "\n" )
                break
            end
        end
    end )
end

local function startGrep( str, scope, path, printer )
    if not str or str == "" or #str < 3 then
        printer( pink, "Please enter a string, strings have to be a minimum of 3 characters long!", "\n" )
        return
    end

    startSearch( str, scope, path, printer )
    printer( pink, "Started grep search...", "\n" )
end

--- Performs an asynchronous text search in all GMod file names and prints them
--- @param str string The string to search file names for
--- @param scope string The Game Path to search in (GAME/DATA/Lua/etc.) (defaults to GAME)
--- @param path string? The path to start looking in (defaults to /)
function gb.Grep( str, scope, path )
    scope = scope or "GAME"
    path = path or ""

    startGrep( str, scope, path, MsgC )
end

do
    local AnsiC
    if SERVER then AnsiC = include( "ansic.lua" ) end

    concommand.Add( "grep", function( ply, _, args )
        -- If run from server console, we convert the colors to ANSI coloring
        local printer = SERVER and AnsiC or MsgC

        if IsValid( ply ) and not ply:IsSuperAdmin() then
            printer( pink, "No permission.", "\n" )
            return
        end

        local str = args[1]
        local scope = args[2] or "GAME"
        local path  = args[3] or ""
        startGrep( str, scope, path, printer )
    end )
end
