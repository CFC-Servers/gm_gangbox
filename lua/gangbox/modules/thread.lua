local msg
local SysTime = SysTime
local math_floor = math.floor
local table_insert = table.insert
local table_remove = table.remove
local coroutine_yield = coroutine.yield
local coroutine_resume = coroutine.resume
local coroutine_status = coroutine.status

gb._ThreadWorkers = {}
local workers = gb._ThreadWorkers

local colors = gb.Colors

local function generator( iterator )
    return function( tbl, ... )
        local iteratorFunc = iterator( tbl, ... )

        local index = 1
        local count = table.Count( tbl )
        local alertStep = math_floor( count * 0.1 )

        local function alert()
            msg( colors.bold, "Thread progress: " )
            msg( colors.highlight, math_floor( index / count * 100 ), "%\n" )
        end

        return function( ... )
            coroutine_yield()
            index = index + 1

            if ( index / 2 ) % alertStep == 0 or index == count then
                alert()
            end

            return iteratorFunc( ... )
        end, tbl
    end
end

local function setup( func )
    return setfenv(
        func,
        setmetatable(
            {
                pairs = generator( pairs ),
                ipairs = generator( ipairs )
            },
            { __index = _G }
        )
    )
end

--- Given an existing function using pairs/ipairs, process the function in a background thread
--- @param func function The function that uses pairs/ipairs
function gb.Thread( func )
    msg = MsgC
    table.insert( workers, coroutine.create( setup( func ) ) )
end

--- Run the given function on every element in the table in a background thread
--- @param func function The function to run on the table elements
--- @param tbl table The table containing elements to run the function on
function gb.ThreadWork( func, tbl )
    msg = MsgC

    table.insert( workers, coroutine.create( function()
        local iter = generator( pairs )
        for k, v in iter( tbl ) do
            func( k, v )
        end
    end ) )
end

local duration = engine.TickInterval() * 0.35
hook.Add( "Think", "GMN_Threads", function()
    if #workers == 0 then return end

    local startTime = SysTime()
    local limit = startTime + duration

    local toRemove = {}

    local idx = 1
    while SysTime() < limit do
        if idx > #workers then idx = 1 end

        local item = workers[idx]

        if coroutine_status( item ) == "dead" then
            table_insert( toRemove, idx )
        else
            local success, err = coroutine_resume( item )
            if not success then
                msg( colors.bad, "Thread error: " )
                msg( colors.text, err, "\n" )
                table_insert( toRemove, idx )
            end
        end

        idx = idx + 1
    end

    for i = #toRemove, 1, -1 do
        table_remove( workers, toRemove[i] )
    end
end )
