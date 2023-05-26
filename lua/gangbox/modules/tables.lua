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

gb.CountRecursive = function( tbl, visited )
    local count = 0
    visited = visited or {}

    for _, v in pairs( tbl ) do
        if not visited[v] then
            -- TODO: Make sure there are no other cases where istable returns true on not-actually-tables
            if istable( v ) and not IsColor( v ) then
                visited[v] = true
                count = count + gb.CountRecursive( v, visited )
            else
                count = count + 1
            end
        end
    end

    return count
end

