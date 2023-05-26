function gb.IsActuallyTable( element )
    if IsColor( element ) then return false end
    return istable( element )
end
