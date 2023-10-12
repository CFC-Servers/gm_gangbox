local file_Time = file.Time
local file_Find = file.Find
local file_Exists = file.Exists
local table_insert = table.insert
local string_Split = string.Split
local coroutine_yield = coroutine.yield
local string_StartsWith = string.StartsWith

--- @class Provider
--- @field source string The Provider's source (e.g. Workshop/Legacy/Content)
--- @field name string The name of the Provider (e.g. the workshop name, game name)
--- @field details string? Any additional details about the Provider

--- Searches Workshop Addons to find which one provides the given path
--- @param path string The full path of the file
local function findWorkshopSources( path )
    local addons = engine.GetAddons()
    local addonCount = #addons

    local foundIn = {}

    for i = 1, addonCount do
        local addon = addons[i]

        if file_Exists( path, addon.title ) then
            table_insert( foundIn, addon )
        end
    end

    return foundIn
end

--- Finds files added from Addons (Only works serverside)
--- @param path string The full path of the file
local function findAddonSources( path )
    -- If it already has addons/ in the path then we can take the easy win
    if string_StartsWith( path, "addons/" ) then
        local spl = string_Split( path, "/" )
        local addonName = spl[2]

        return { addonName }
    end

    local _, addons = file_Find( "addons/*", "MOD" )
    local addonCount = #addons

    local foundIn = {}
    for i = 1, addonCount do
        local addon = addons[i]

        if file_Exists( "addons/" .. addon .. "/" .. path, "MOD" ) then
            table_insert( foundIn, addon )
        end
    end

    return foundIn
end

local function isBaseSource( path )
    if file_Exists( "garrysmod/" .. path, "base_path" ) then
        return true
    end
end

-- Inference only used by the server
local inference = SERVER and include( "inference/inference.lua" )
local findGameSources

do
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

    --- Finds files added from Mounted Games
    --- @param path string The full path of the file
    findGameSources = function( path )
        -- Gather all the games we can actually use / search in

        -- Server can't just search through the files :(
        if SERVER then return inference( path, games, gamesCount ) end

        local foundIn = {}
        for i = 1, gamesCount do
            local game = games[i]

            if file_Exists( path, game.folder ) then
                table_insert( foundIn, game )
            end

            coroutine_yield()
        end

        return foundIn
    end
end

local unknownProvider = {
    source = "Unknown",
    name = "Unable to determine the source of the file",
}
if SERVER then
    unknownProvider.details = "It's probably a mounted game (make an Issue on GH)"
else
    unknownProvider.details = "It was probably AddCS/AddResource'd from the Server"
end

local dataDirProvider = {
    source = "Data",
    name = "The base data/ directory"
}

--- Finds the provider(s) of the given file path
--- @param path string The path to the file to inspect
--- @return Provider[] information about the Provider(s)
local function findProviders( path )
    local formatted = {}

    if string_StartsWith( path, "data/" ) then
        table_insert( formatted, dataDirProvider )
        return formatted
    end

    -- file.Time returns:
    --  - 0 on Mounted content
    --    - (as long as its guaranteed to exist - missing files also return 0)
    --  - 1 on Workshop files
    --  - a real timestamp on legacy addons/gmod files
    local fileTime = file_Time( path, "GAME" )

    if fileTime == 0 then
        local providers = findGameSources( path )
        for _, provider in ipairs( providers ) do
            table_insert( formatted, {
                source = "Game",
                name = provider.title
            } )
        end

    elseif fileTime == 1 then
        local providers = findWorkshopSources( path )
        for _, provider in ipairs( providers ) do
            table_insert( formatted, {
                source = "Workshop",
                name = provider.title,
                details = provider.wsid
            } )
        end

    else
        -- First check if its a base gmod file
        if isBaseSource( path ) then
            table_insert( formatted, {
                source = "Game",
                name = "Garry's Mod",
            } )
        else
            -- Otherwise check addons directly
            local providers = findAddonSources( path )
            for _, provider in ipairs( providers ) do
                table_insert( formatted, {
                    source = "Addon",
                    name = provider,
                    details = "Legacy"
                } )
            end
        end
    end

    if not formatted then
        print( "Couldn't determine provider for", path )
    end

    if #formatted == 0 then
        table_insert( formatted, unknownProvider )
    end

    return formatted
end

return findProviders
