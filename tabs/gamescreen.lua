game = {}   --game screen


local score = '0'

local x = 512
local y = 608

function points()
    
    -- counts each rank and suit in the discard pile (see hand.lua)
    -- worth bonus points
    
    local ranks = {0,0,0,0,0,0,0,0,0,0,0,0,0}
    local suits = {0,0,0,0}
    
    for i,v in ipairs(discard) do
        suits[(v%4)+1] = suits[v%4+1] + 1
        ranks[(v%13)+1] = ranks[v%13+1] + 1
    end
    score = 0
    for i,v in ipairs(ranks) do
        score = score + v * 5000
        if v == 2 or v == 3 then 
            score = score + 2000
        elseif 
            v == 4 then score = score + 4000
        end
    end
    for i,v in ipairs(suits) do
        score = score + v * 5000
        if v == 13 then score = score + 20000 end
    end
    if not deck[1] and not hand[2] then
        score = score + 32000
    end
    score = tostring(score)
    local r = 8 - string.len(score)
    local s = ''
    while r > 0 do
        s = s .. '0'
        r = r - 1
    end
    return s..score
end


function game.new()
    newdeck()
    newhand()
    newp()
end

function game.draw()
    background(0)
    deck:draw()
    p:draw()
    score = points()
    fill(168)
    fontSize(32)
    text(score, x, y)
    if not deck[1] and not hand[2] then
        pushStyle()
        fontSize(144)
        fill(100)
        font("AmericanTypewriter-Bold")
        text('You Win!', x, HEIGHT/2)
        popStyle()
    end
end

function game.touched(touch)
    deck:touched(touch)
    p:touched(touch)
end


