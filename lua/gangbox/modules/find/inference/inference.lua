AddCSLuaFile( "generate_game_content.lua" )

local assert = assert
local istable = istable
local table_insert = table.insert

--- Games can implement the same file and the server has no way of knowing
--- so we manually generate hashes of every file name of every game and do it that way (:
--- @type { [string]: string[] }
gb._GameContent = gb._GameContent or {}
local contentByGame = gb._GameContent

local function loadGameContent()
    local path = "gangbox/modules/find/inference/games/"

    local games = file.Find( path .. "*", "lsv" )
    if not games then return end

    local gamesCount = #games
    for i = 1, gamesCount do
        local gameFile = games[i]
        local contents = include( path .. gameFile )

        assert( istable( contents ), "The contents of the included game file is not a table, as expected! Is the file malformed?" )

        local mountFolder = string.Split( gameFile, "." )[1]
        local gameContent = {}
        contentByGame[mountFolder] = gameContent

        local contentsCount = #contents
        for j = 1, contentsCount do
            local cPath = contents[j]
            gameContent[cPath] = true
        end
    end
end

if table.Count( contentByGame ) == 0 then
    print( "[GB] Loading Mounted Game content for file finding module..." )
    loadGameContent()
    print( "[GB] Done loading Mounted Game content" )
end

return function( path, games, gamesCount )
    -- Generates a way to look up the game struct by its folder name
    local gamesByFolder = { ["garrysmod"] = { title = "Garry's Mod" } }

    for i = 1, gamesCount do
        local g = games[i]
        gamesByFolder[g.folder] = g
    end

    local foundIn = {}

    for gameFolder, lookup in pairs( contentByGame ) do
        if lookup[path] then
            table_insert( foundIn, gamesByFolder[gameFolder] )
        end
    end

    return foundIn
end
