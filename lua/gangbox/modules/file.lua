local colors = gb.Colors

file._GB_Find = file._GB_Find or file.Find
local file_Find = file.Find
local table_remove = table.remove

file.Find = function( name, ... )
    local files, dirs = file_Find( name, ... )

    if not dirs then
        return files, dirs
    end

    if dirs[1] == "/" then
        -- MsgC( colors.highlight, "[GB] " )
        -- MsgC( colors.bad, "Removed `/` from dirs in file.Find return: " )
        -- MsgC( colors.subtext, "'" )
        -- MsgC( colors.text, name )
        -- MsgC( colors.subtext, "'" )

        table_remove( dirs, 1 )
    end

    return files, dirs
end
