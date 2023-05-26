do
    local allEnts
    local generators

    generators = {
        -- Random number
        [1] = function()
            return math.random( 9999999 )
        end,

        -- Random string
        [2] = function()
            local ret = ""

            for i = 1, math.random( 64 ) do
                ret = ret .. string.char( math.random( 97, 122 ) )
            end

            return ret
        end,

        -- Random entity
        [3] = function()
            return allEnts[math.random( #allEnts )]
        end,

        -- Random Vector
        [4] = function()
            return VectorRand( -100000, 100000 )
        end,

        -- Random Angle
        [5] = function()
            return Angle( math.random( -360, 360 ), math.random( -360, 360 ), math.random( -360, 360 ) )
        end,

        -- Random Color
        [6] = function()
            return Color( math.random( 255 ), math.random( 255 ), math.random( 255 ) )
        end,

        -- Random table
        [7] = function(totalElements, maxDepth, currentDepth)
            maxDepth = maxDepth or 3 -- default maximum depth is 3
            currentDepth = currentDepth or 1

            local tbl = {}
            local numElements = 0
            while numElements < totalElements do
                local generatorIndex = math.random(#generators - 1)
                local element = generators[generatorIndex]()

                -- Check if the element is a table and the maximum depth hasn't been reached
                if type(element) == "table" and currentDepth < maxDepth then
                    local remainingElements = totalElements - numElements
                    local remainingDepth = maxDepth - currentDepth
                    local maxSubElements = math.ceil(remainingElements / remainingDepth)

                    -- Generate a sub-table with a maximum number of elements
                    element = generators[7](math.random(1, maxSubElements), remainingDepth, currentDepth + 1)
                end

                -- Add the element to the table if it doesn't exceed the total number of elements
                if type(element) == "table" and numElements + #element <= totalElements then
                    table.insert(tbl, element)
                    numElements = numElements + #element
                elseif numElements + 1 <= totalElements then
                    table.insert(tbl, element)
                    numElements = numElements + 1
                else
                    break
                end
            end

            return tbl
        end,
    }

    gb.RandomTable = function(totalElements, maxDepth)
        allEnts = ents.GetAll()
        return generators[7](totalElements, maxDepth)
    end
end

