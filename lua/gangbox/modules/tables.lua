gb.Filter = function( tbl, comp )
    local ret = {}

    for k, v in pairs( tbl ) do
        if comp( v ) then
            ret[k] = v
        end
    end

    return ret
end

gb.Map = function( tbl, func )
    local ret = {}

    for k, v in pairs( tbl ) do
        ret[k] = func( v )
    end

    return ret
end

