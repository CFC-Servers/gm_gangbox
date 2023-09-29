local colors = gb.Colors

do
    -- Lua Refresh alert
    local reloads = 0
    hook.Add( "OnReloaded", "GB_AlertsReload", function()
        print( "[GB] Lua Refresh detected" )
        reloads = reloads + 1
    end )

    timer.Create( "GB_AlertsReload", 1, 0, function()
        if reloads > 0 then
            MsgC( colors.highlight, "[GB] ", colors.bad, "Lua Refresh detected (x" .. reloads .. ")\n" )
            reloads = 0
        end
    end )
end

do
    -- file.Write with invalid suffix
    -- (Silent failure)

    local validSuffix = {
        txt = true,
        dat = true,
        json = true,
        xml = true,
        csv = true,
        jpg = true,
        jpeg = true,
        png = true,
        vtf = true,
        vmt = true,
        mp3 = true,
        wav = true,
        ogg = true,
    }

    file._GB_Write = file._GB_Write or file.Write
    file.Write = function( path, data )
        if not path then
            -- This will error on its own
            return file._GB_Write( path, data )
        end

        if path == "" then
            MsgC( colors.highlight, "[GB] ", colors.bad, "Empty file path on file.Write\n" )
            debug.Trace()
            return file._GB_Write( path, data )
        end

        local suffix = string.GetExtensionFromFilename( path )
        if not validSuffix[suffix] then
            MsgC( colors.highlight, "[GB] ", colors.bad, "Invalid file suffix on file.Write: '" .. path .. "'\n" )
            debug.Trace()
        end

        return file._GB_Write( path, data )
    end
end

do
    -- Entity:AddCallback with nil return

    local entityMeta = FindMetaTable( "Entity" )
    entityMeta._GB_AddCallback = entityMeta._GB_AddCallback or entityMeta.AddCallback

    entityMeta.AddCallback = function( self, hookName, func )
        local ret = entityMeta._GB_AddCallback( self, hookName, func )

        if ret == nil then
            MsgC( colors.highlight, "[GB] " )
            MsgC( colors.bad, "Entity:AddCallback with nil return!\n" )

            MsgC( colors.bold, "  Hook: " )
            MsgC( colors.details, hookName .. "\n" )

            MsgC( colors.bold, "  Func: " )
            MsgC( colors.details, tostring( func ) .. "\n" )
            debug.Trace()
        end

        return ret
    end
end
