local colors = gb.Colors

local bold = colors.bold
local text = colors.text
local subtext = colors.subtext
local bad = colors.bad
local highlight = colors.highlight

local ipairs = ipairs
local file_Find = file.Find
local table_insert = table.insert
local coroutine_yield = coroutine.yield
local coroutine_resume = coroutine.resume
local coroutine_status = coroutine.status

--- @class Provider
--- @field source string The Provider's source (e.g. Workshop/Legacy/Content)
--- @field name string The name of the Provider (e.g. the workshop name, game name)
--- @field details string? Any additional details about the Provider

--- Searches Workshop Addons to find which one provides the given path
--- @param path string The full path of the file
local function findWorkshopSource( path )
    local addons = engine.GetAddons()
    local addonCount = #addons

    for i = 1, addonCount do
        local addon = addons[i]

        local results = file_Find( path, addon.title )
        if #results > 0 then
            return addon
        end

        coroutine_yield()
    end
end

local string_Split = string.Split
local string_StartsWith = string.StartsWith
--- Finds files added from Addons (Only works serverside)
--- @param path string The full path of the file
local function findAddonSource( path )
    if string_StartsWith( path, "addons/" ) then
        local spl = string_Split( path, "/" )
        local addonName = spl[2]

        return addonName
    end

    local _, addons = file_Find( "addons/*", "MOD" )
    local addonCount = #addons

    for i = 1, addonCount do
        local addon = addons[i]

        local results = file_Find( "addons/" .. path, "MOD" )
        if #results > 0 then
            return addon
        end

        coroutine_yield()
    end
end

--- Finds files added from Mounted Games
--- @param path string The full path of the file
local function findGameSource( path )
    local games = {}

    do
        local allGames = engine.GetGames()
        local allGamesCount = #allGames

        for i = 1, allGamesCount do
            local game = allGames[i]
            if game.mounted then
                table_insert( games, game )
            end
        end
    end

    local gamesCount = #games

    for i = 1, gamesCount do
        local game = games[i]

        local results = file_Find( path, game.folder )
        if #results > 0 then
            return game
        end

        coroutine_yield()
    end
end

--- Finds the provider of the given file path
--- @param path string The path to the file to inspect
--- @return Provider? information about the Provider 
local function findProvider( path )
    local provider

    provider = findWorkshopSource( path )
    if provider then
        return { source = "Workshop", name = provider.title, details = provider.wsid }
    end

    provider = findAddonSource( path )
    if provider then
        return { source = "Addon", name = provider }
    end

    provider = findGameSource( path )
    if provider then
        return { source = "Game", name = provider.title }
    end
end

--- Gathers and returns a table of all filnames that match the given search string
--- (Recursive, yields the results)
local function findFiles( path, scope )
    if not path then path = "" end

    local fils, dirs = file_Find( path .. "*", scope )
    if fils then
        for _, fil in ipairs( fils ) do
            coroutine_yield( path .. fil )
        end
    end

    if dirs then
        for _, dir in ipairs( dirs ) do
            local searchPath = path .. dir .. "/"
            findFiles( searchPath, scope )
        end
    end
end

local string_sub = string.sub
local string_find = string.find

local function printResults( printer, results )
    local resultCount = #results

    for i = 1, resultCount do
        local result = results[i]

        local filePath = result.filePath
        local provider = result.provider
        local start = result.start
        local fin = result.fin

        local prefix = string_sub( filePath, 1, start - 1 )
        local main = string_sub( filePath, start, fin )
        local suffix = string_sub( filePath, fin + 1 )

        printer( text, prefix )
        printer( bad, main )
        printer( text, suffix, "\n" )

        if provider then
            printer( highlight, "  └ " )
            printer( bold, provider.source )
            printer( text, " - " )
            printer( text, provider.name )

            if provider.details then
                printer( text, " (" )
                printer( subtext, provider.details )
                printer( text, ")" )
            end

            printer( "\n" )
        end
    end
end

-- TODO: Refactor this to only one coroutine
local function searchString( stringToFind, scope, path )
    -- Here we make a sub-coroutine to actually find the files
    local findResults = {}
    local finder = coroutine.create( findFiles )

    while true do
        coroutine_yield()

        if coroutine_status( finder ) == "dead" then
            break
        end

        local success, output = coroutine_resume( finder, path, scope )
        if not success then error( output ) end

        if output then
            local filePath = output

            local start, fin = string_find( filePath, stringToFind, 1, true )
            if start then
                local provider = findProvider( filePath )
                table_insert( findResults, {
                    filePath = filePath,
                    provider = provider,
                    start = start,
                    fin = fin
                } )
            end
        end
    end

    return findResults
end

local function startSearch( str, scope, path, printer )
    local co = coroutine.create( function()
        local findResults = searchString( str, scope, path )
        printResults( printer, findResults )

        coroutine_yield( "done" )
    end )

    local SysTime = SysTime
    hook.Add( "Think", "grepCoroutineHook", function()
        local max = SysTime() + ( engine.TickInterval() * 0.75 )

        while SysTime() < max do
            if coroutine_status( co ) == "dead" then
                hook.Remove( "Think", "grepCoroutineHook" )
                printer( bold, "Done!", "\n" )
                break
            end

            local success, output = coroutine_resume( co )
            if not success then
                hook.Remove( "Think", "grepCoroutineHook" )
                error( output )
            end
        end
    end )
end

local function startGrep( str, scope, path, printer )
    if not str or str == "" or #str < 3 then
        printer( highlight, "Please enter a string, strings have to be a minimum of 3 characters long!", "\n" )
        return
    end

    startSearch( str, scope, path, printer )
    printer( highlight, "Started grep search...", "\n" )
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
            printer( highlight, "No permission.", "\n" )
            return
        end

        local str = args[1]
        local scope = args[2] or "GAME"
        local path  = args[3] or ""
        startGrep( str, scope, path, printer )
    end )
end
