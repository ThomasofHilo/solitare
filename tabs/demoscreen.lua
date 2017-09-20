--[[
-- demo of gameplay that was too much work, works but it was too hard to
-- code the delta x and y changes manually. well, i could have just xopied the codea print
-- but i sisnt think of that at the time
demo = {}

-- demo will play itself, by iterating time + 0.1 every frame
-- and executing actions from the acts table corresponding to that index

local function set(x, y)
    hand.dx = x or hand.dx
    hand.dy = y or hand.dy
end


local d = deck.deal
local time = 650    --countdown to demo end


local function m()
    hand:move(m[1], m[2])
    table.remove(move, 1)
    table.remove(move, 1)
end
--act is a table of demo actions
local act = {d,d,d,d,d,d,m}
local move = {2,1}
actTime = {649,640,610,590,400,300} 

--acttime is a table of times to take actions, ordered from highest to lowest
function demo.new()
    math.randomseed(1)
    newdeck()
    newhand()
    newp()
end

function demo:draw()
    time = time - 1
    deck:draw()
    p:draw()
    if time == actTime[1] then
        act[1]()
        table.remove(act, 1)
        table.remove(actTime, 1)
    end
end

function demo:touched(t)
    if t.state == BEGAN then
        CurrentScreen = game
    end
end
]]
