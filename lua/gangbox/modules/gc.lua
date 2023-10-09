local colors = gb.Colors
local string_NiceSize = string.NiceSize

--- Prints current Lua Memory usage
function gb.gc()
    MsgC( "\n" )
    MsgC( colors.text, "  Memory Usage: " )
    MsgC( colors.bold, string_NiceSize( collectgarbage( "count" ) ), "\n" )
end
