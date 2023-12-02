-- TODO: Add a real loader

--- @class GangBox
gb = {}

AddCSLuaFile( "modules/colors.lua" )
include( "modules/colors.lua" )

if SERVER then
    include( "modules/ansic.lua" )
    include( "modules/retry.lua" )
end

AddCSLuaFile( "modules/tables.lua" )
include( "modules/tables.lua" )

AddCSLuaFile( "modules/random.lua" )
include( "modules/random.lua" )

AddCSLuaFile( "modules/alerts.lua" )
include( "modules/alerts.lua" )

AddCSLuaFile( "modules/diff.lua" )
include( "modules/diff.lua" )

AddCSLuaFile( "modules/flags/flags.lua" )
include( "modules/flags/flags.lua" )

AddCSLuaFile( "modules/gc.lua" )
include( "modules/gc.lua" )

AddCSLuaFile( "modules/thread.lua" )
include( "modules/thread.lua" )

AddCSLuaFile( "modules/find/find.lua" )
include( "modules/find/find.lua" )

AddCSLuaFile( "modules/file.lua" )
include( "modules/file.lua" )
