-- Because the Server has no way of searching through a specific Mounted Game's files, we do it on the Client and then save it to a file
-- Yes, it's kind of retarded, but yes, it also works

local table_insert = table.insert
local function recurse( dir, mount, content )
    dir = dir == "" and "" or dir .. "/"

    local files, dirs = file.Find( dir .. "*", mount )

    if files then
        local filesCount = #files

        for i = 1, filesCount do
            local f = files[i]
            local fullPath = dir .. f

            print( "Tracking", fullPath )
            table_insert( content, fullPath )
        end
    end

    if dirs then
        local dirsCount = #dirs

        for i = 1, dirsCount do
            local d = dirs[i]

            if d ~= "/" then
                recurse( dir .. d, mount, content )
            end
        end
    end
end

local validMounts = {}
for _, mountInfo in ipairs( engine.GetGames() ) do
    validMounts[mountInfo.folder] = {
        available = mountInfo.mounted
    }
end

local function writeContentFile( content, mount )
    local fileName = "gb_game_content_" .. mount .. ".dat"

    local fmt = string.format

    local lines = {
        "return {",
    }

    local contentCount = #content
    for i = 1, contentCount do
        local path = content[i]
        table_insert( lines, fmt( [["%s",]], path ) )
    end

    table_insert( lines, "}" )

    file.Write( fileName, table.concat( lines, "\n" ) )

    print( "[GB] Wrote: data/" .. fileName )
    print( "Please move this file to: gm_gangbox/lua/modules/find/inference/games/" .. mount .. ".lua" )
end

return function( mount )
    local validity = validMounts[mount]
    if not validity then
        error( "Given game name was not valid! '" .. mount .. "' is not a valid mount folder. Expected a folder name from engine.GetGames()" )
    end

    if not validity.available then
        error( "Game is not mounted! Please mount the game content, restart, and try again" )
    end

    print( "[GB] Game Content Generator started, the game will freeze briefly." )

    local content = {}
    recurse( "", mount, content )
    recurse( "sound", mount, content )
    recurse( "models", mount, content )
    recurse( "materials", mount, content )
    recurse( "bin", mount, content )
    recurse( "scenes", mount, content )

    writeContentFile( content, mount )
end
