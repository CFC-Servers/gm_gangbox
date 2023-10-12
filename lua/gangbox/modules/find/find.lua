AddCSLuaFile( "provider.lua" )

local colors = gb.Colors

local bold = colors.bold
local text = colors.text
local subtext = colors.subtext
local bad = colors.bad
local highlight = colors.highlight

local ipairs = ipairs
local file_Find = file.Find
local string_sub = string.sub
local table_insert = table.insert
local coroutine_yield = coroutine.yield
local coroutine_resume = coroutine.resume
local coroutine_status = coroutine.status

--- @type fun(path: string): Provider[]
local findProviders = include( "provider.lua" )

local ignoreDirs = {
    ["/"] = true,
    ["addons"] = true
}

--- Gathers and returns a table of all filnames that match the given search string
--- (Recursive, yields the results)
local function findFiles( path )
    if not path then path = "" end

    local files, dirs = file_Find( path .. "*", "GAME" )
    if files then
        local filesCount = #files

        for i = 1, filesCount do
            coroutine_yield( path .. files[i] )
        end
    end

    if dirs then
        local dirsCount = #dirs

        for i = 1, dirsCount do
            local dir = dirs[i]

            if not ignoreDirs[dir] then
                local searchDir = path .. dir .. "/"
                findFiles( searchDir )
            end
        end
    end
end

--- @param printer fun(...): nil Finder Function
--- @param results { [string]: ProviderResult }
local function printResults( printer, results )
    for _, findResults in pairs( results ) do
        -- Print provider first
        local provider = findResults.provider

        -- Workshop - Wiremod (121451252)
        printer( bold, provider.source )
        printer( subtext, " - " )
        printer( text, provider.name )
        printer( subtext, ":" )

        local details = provider.details
        if details then
            printer( text, " (" )
            printer( subtext, details )
            printer( text, ")" )
        end

        printer( text, "\n" )

        -- Then print files
        local files = findResults.files
        local filesCount = #files

        for i = 1, filesCount do
            local resultFile = files[i]

            local filePath = resultFile.filePath
            local start = resultFile.start
            local fin = resultFile.fin

            local prefix = string_sub( filePath, 1, start - 1 )
            local main = string_sub( filePath, start, fin )
            local suffix = string_sub( filePath, fin + 1 )

            local leader = i < filesCount and "╞" or "└"
            printer( highlight, "  ", leader, " " )
            printer( text, prefix )
            printer( bad, main )
            printer( text, suffix, "\n" )
        end

        printer( text, "\n" )
    end
end

--- @class ProviderResultFile
--- @field filePath string The full file path
--- @field start number The starting position of the search string in the file path
--- @field fin number The ending position of the search string in the file path

--- @class ProviderResult
--- @field provider Provider
--- @field files ProviderResultFile[]

-- TODO: Refactor this to only one coroutine
--- Searches through all game paths to find files with the given string in their name
--- Primary searching loop (coroutine)
local function searchString( stringToFind )
    --- @type { [string]: ProviderResult }
    local findResults = {}
    local finder = coroutine.create( findFiles )

    local function addFoundFile( filePath, start, fin )
        local providers = findProviders( filePath )

        -- Group each result by their provider(s)
        for _, provider in ipairs( providers ) do
            local providerName = provider.name

            local providerResults = findResults[providerName]
            if not providerResults then
                providerResults = {
                    provider = provider,
                    files = {}
                }

                findResults[provider.name] = providerResults
            end

            table_insert( providerResults.files, {
                filePath = filePath,
                start = start,
                fin = fin
            } )
        end
    end

    local string_find = string.find

    while true do
        if coroutine_status( finder ) == "dead" then break end

        local success, output = coroutine_resume( finder )
        if not success then error( output ) end

        if output then
            local start, fin = string_find( output, stringToFind, 1, true )
            if start then
                addFoundFile( output, start, fin )
            end
        end

        coroutine_yield()
    end

    return findResults
end

--- Starts the searcher coroutine
local function startSearch( str, printer )
    local co = coroutine.create( function()
        local findResults = searchString( str )
        printResults( printer, findResults )
    end )

    local SysTime = SysTime
    hook.Add( "Think", "gb_FindCoroutineHook", function()
        local max = SysTime() + engine.TickInterval() * 0.75

        while SysTime() < max do
            if coroutine_status( co ) == "dead" then
                hook.Remove( "Think", "gb_FindCoroutineHook" )
                printer( bold, "Done!", "\n" )
                break
            end

            local success, output = coroutine_resume( co )
            if not success then
                hook.Remove( "Think", "gb_FindCoroutineHook" )
                error( output )
            end
        end
    end )
end

--- Performs some validation and starts the search
local function startFind( str, printer )
    if not str or str == "" or #str < 3 then
        printer( highlight, "Please enter a string, strings have to be a minimum of 3 characters long!", "\n" )
        return
    end

    startSearch( str, printer )
    printer( highlight, "Started file find...", "\n" )
end

--- Performs an asynchronous text search in all GMod file names and prints them
--- @param str string The string to search file names for
function gb.Find( str )
    startFind( str, MsgC )
end

do
    local AnsiC = gb.AnsiC

    concommand.Add( "gbfind", function( ply, _, args )
        -- If run from server console, we use the ANSI printer instead
        local printer = SERVER and AnsiC or MsgC

        if IsValid( ply ) and not ply:IsSuperAdmin() then
            printer( highlight, "No permission.", "\n" )
            return
        end

        local str = args[1]
        startFind( str, printer )
    end )
end

if CLIENT then
    concommand.Add( "gbfind_generate", function( _, _, args )
        local gameFolder = args[1]
        print( "loading" )
        include( "gangbox/modules/find/inference/generate_game_content.lua" )( gameFolder )
        print( "done" )
    end )
end
