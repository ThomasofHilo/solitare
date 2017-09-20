hand = {}

discard = {}
function newhand()
    for i,v in ipairs(hand) do --clear index
        v = nil
    end
    for i,v in ipairs(discard) do
        v = nil
    end
    hand.dx, hand.dy = 0, 0 --delta x and y
end
local w = 1024/8
local h = w*1.4

p = {}  -- positions for 16 cards

function newp()
    for i,v in ipairs(p) do --clear index
        v = nil
    end
    local x, y
    for i = 1,0,-1 do
        y = i*h + 40
        for j = 1,8 do
            x = (j-1)*w
            table.insert(p, vec2(x,y) )
        end
    end
end

local c = {color(0,100,0), color(0,100,100), color(100,100,0), s = color(100)}
c[0] = color(0,0,100)


local s = 0
hand.dx, hand.dy = 0,0
function p:touched(t)
    
    
    if t.state == BEGAN then
        
        for i,v in ipairs(self) do
            
            if hand[i] and t.x > v.x + hand.dx and t.x < v.x + w + hand.dx
            and t.y > v.y + hand.dy and t.y < v.y + h + hand.dy then
                s = i
                break
            end
        end
    
    elseif t.state == MOVING and s > 0 then
        hand.dx = hand.dx + t.deltaX
        hand.dy = hand.dy + t.deltaY

    elseif t.state == ENDED then
        for i,v in ipairs(self) do
            if hand[i] and t.x > v.x and t.x < v.x + w 
            and t.y > v.y  and t.y < v.y + h 
            then
                if hand:move(s, i) then
                    break
                end
            end
        end
                
    end
    if t.state == ENDED then
        s = 0
        hand.dx = 0
        hand.dy = 0
    end
end


function hand:move(s, i)    --moves cards, returns true to break loop in p:touched
    if s - i == 1 or s - i == 3 then
        if hand[s]%4 == hand[i]%4 or hand[s]%13 == hand[i]%13 then
            table.insert(discard, hand[i])
            hand[i] = hand[s]
            table.remove(hand, s)
            s = 0
            hand.dx = 0
            hand.dy = 0
            return true
        end
    end
end

function p:draw()
    fontSize(72)
    for i,v in ipairs(self) do
        if hand[i] then
            local color = hand[i]%4
            if s ~= i then
                
                fill(c[color])
                RoundedRectangle(v.x, v.y, w, h, 8)
                fill(168)

                text(hand[i]%13, v.x + w*.5, v.y + h*.5)
            end
        end
    end
    if s > 0 then
        fill(c['s'])
        RoundedRectangle(p[s]['x'] + hand.dx, p[s]['y'] + hand.dy, w, h, 8)
        local color = hand[s]%4
        fill(c[color])
        
        text(hand[s]%13, p[s]['x'] + w*.5 + hand.dx, p[s]['y'] + h*.5 + hand.dy)
    end
end



