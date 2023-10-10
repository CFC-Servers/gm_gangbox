do
    local allEnts

    --- Returns a random boolean
    --- @param trueWeight number? Adjusts the likelihood of returning 'true'. (e.g. 1 means equal chance, 2 means double chance of true, 0.5 means half chance of true
    --- @return boolean "The random boolean"
    function gb.RandomBool( trueWeight )
        trueWeight = trueWeight or 1
        return math.random() < trueWeight / ( 1 + trueWeight )
    end

    --- Returns a random float
    --- @param scale number? The scale of the float (from -scale to scale)
    --- @return number "The random float"
    function gb.RandomFloat( scale )
        scale = scale or 1
        return math.Rand( -scale, scale )
    end

    --- Returns a random whole integer
    --- @param scale number? The scale of the integer (from -scale to scale)
    --- @return number "The random integer"
    function gb.RandomInt( scale )
        scale = scale or 1
        return math.random( -scale, scale )
    end

    --- Returns a random number (either float or integer)
    --- @param scale number? The scale of the number (from -scale to scale)
    --- @return number "The random number"
    function gb.RandomNumber( scale )
        scale = scale or 1
        local dice = math.random( 2 )
        if dice == 1 then
            return gb.RandomFloat( scale )
        else
            return gb.RandomInt( scale )
        end
    end

    --- Generate a random string with the given length and, optionally, utf8 range
    --- @param len number The length of the output string
    --- @param minChar number? The minimum utf8 character to use (defaults to 97)
    --- @param maxChar number? The maximum utf8 character to use (defaults to 122)
    --- @return string "The generated string"
    function gb.RandomString( len, minChar, maxChar )
        local ret = ""
        len = len or 64
        minChar = minChar or 97
        maxChar = maxChar or 122

        for _ = 1, math.random( len ) do
            ret = ret .. string.char( math.random( minChar, maxChar ) )
        end

        return ret
    end

    --- Returns a random entity
    --- @return Entity "The random entity"
    function gb.RandomEnt()
        if not allEnts then
            allEnts = ents.GetAll()

            for i = #allEnts, 1, -1 do
                if string.StartsWith( allEnts[i]:GetClass(), "class " ) then
                    table.remove( allEnts, i )
                end
            end
        end

        return allEnts[math.random( #allEnts )]
    end

    --- Returns a random Vector with the given scale
    --- @param scale number? The scale of the Vector (from -scale to scale)
    --- @return Vector "The random Vector"
    function gb.RandomVec( scale )
        scale = scale or 1
        return VectorRand( -scale, scale )
    end

    --- Returns a random Angle
    --- @return Angle "The random Angle"
    function gb.RandomAngle()
        return Angle( math.random( -360, 360 ), math.random( -360, 360 ), math.random( -360, 360 ) )
    end

    --- Returns a random Color
    --- @return Color "The random Color"
    function gb.RandomColor()
        return Color( math.random( 255 ), math.random( 255 ), math.random( 255 ) )
    end

    --- Fills a given table with random values (numerically indexed)
    --- @param tbl table The table to fill
    --- @param count number? The number of elements to add to the table (default: 1000)
    function gb.RandomFillTable( tbl, count )
        count = count or 1000
        local generators = gb.RandomGenerators

        local numElements = 0
        while numElements < count do
            local generatorIndex = math.random( #generators )

            local element
            local generator = generators[generatorIndex]

            -- FIXME: Special case for the random table
            if generator == gb.RandomTable then
                -- TODO: Should we count the table itself as an element?
                local remainingElements = count - numElements
                local elementCount = math.random( remainingElements )

                element = generator( elementCount )
                numElements = numElements + elementCount
            else
                element = generator()
                numElements = numElements + 1
            end

            if numElements > count then
                print( "RandomTable: Too many elements in table", numElements, count )
                break
            end

            table.insert( tbl, element )
        end
    end

    --- Returns a table filled with a configurable number of random elements
    --- @param count number? The total number of elements in the table (default: 1000)
    function gb.RandomTable( count )
        local tbl = {}
        if count == 0 then
            return tbl
        end

        gb.RandomFillTable( tbl, count )

        return tbl
    end

    gb.RandomGenerators = {
        gb.RandomBool,
        gb.RandomNumber,
        gb.RandomString,
        gb.RandomEnt,
        gb.RandomVec,
        gb.RandomAngle,
        gb.RandomColor,
        gb.RandomTable,
    }
end

