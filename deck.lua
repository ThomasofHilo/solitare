local w = 1024/8
local h = w*1.4
deck = {x = 0, y = h*2 + 40}

local n = 52

function newdeck()
    for i,v in ipairs(deck) do --clear index
        v = nil
    end
    for i = 1,n do 
        deck[i] = i
    end
    
    local j
    for i = n,2,-1 do
        j = math.random(n)
        deck[i], deck[j] = deck[j], deck[i]
    end
end
function deck:touched(t)
    if t.state == ENDED and self[1] and not hand[16]
    and t.x > self.x and t.x < self.x + w
    and t.y > self.y and t.y < self.y + h
    then
        deck.deal()
    end
end

function deck:deal()
    deck[#deck], hand[#hand+1] = nil, deck[#deck]
end


function deck:draw()

    fill(168,0,0)

    RoundedRectangle(self.x, self.y, w, h, 8)
    fill(0) 
    fontSize(32)

    text('#'..#self, self.x + w*.5, self.y + h*.5)
end

