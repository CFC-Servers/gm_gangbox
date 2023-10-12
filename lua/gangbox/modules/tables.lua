--- Filter a table down to a new set of elements using a given function
--- @param tbl table The table to filter
--- @param comp function The filter function, return true to include element in the output
--- @return table filtered The return table
gb.Filter = function( tbl, comp )
    local ret = {}

    for k, v in pairs( tbl ) do
        if comp( v ) then
            ret[k] = v
        end
    end

    return ret
end

--- Run the given function on all elements in the given table
--- @param tbl table The table to map
--- @param func function The function to run on all elements
--- @return table mappedResults The output of the given function for all elements in the given table
gb.Map = function( tbl, func )
    local ret = {}

    for k, v in pairs( tbl ) do
        ret[k] = func( v )
    end

    return ret
end

--- Recursively count the total elements in the given table
--- @param tbl table The table to recursively count
--- @param visited table? Internal state tracker
--- @return number count The total number of elements in the table
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

--- Picks a number of random elements from the given table
--- @param tbl table The sequential table to pick from
--- @param count number The number of elements to return
gb.PickRandom = function( tbl, count )
    local keys = table.GetKeys( tbl )
    table.Shuffle( keys )

    local selected = {}
    for i = 1, count do
        local key = keys[i]
        selected[key] = tbl[key]
    end

    if not table.IsSequential( tbl ) then
        return selected
    end

    -- If the input table is sequential, so should the output
    return table.ClearKeys( selected )
end

