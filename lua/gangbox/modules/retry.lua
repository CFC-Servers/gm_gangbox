concommand.Add( "retry", function( ply )
    if IsValid( ply ) then return end

    print( "[GangBox] Performing soft restart..." )

    timer.Simple( 1, function()
        RunConsoleCommand( "changelevel", game.GetMap() )
    end )
end )
