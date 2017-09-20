-- Currently Disabled, as i never coded menu

switchscreen = {x = 0, y = 658, w = 128, h = 50, bC=color(50), sC =color(200,0,0), state='unpressed'}

function switchscreen:touched(t)

    if t.state == BEGAN and self.state == 'unpressed' then
        if t.x > self.x and t.x < self.x + self.w 
        and t.y > self.y and t.y < self.y + self.h then
            self.state = 'pressing'
        end
    elseif t.state == ENDED and self.state == 'pressing' then
        if t.x > self.x and t.x < self.x + self.w 
        and t.y > self.y and t.y < self.y + self.h then
            CurrentScreen = menu
            self.state = 'unpressed'
        else
            self.state = 'unpressed'
        end
    end
end

function switchscreen:draw()
    if self.state == 'unpressed' then
        fill(self.bC)
    elseif self.state == 'pressing' then
        fill(self.sC)
    end
    RoundedRectangle(self.x, self.y, self.w, self.h, 3)
    pushStyle()
    fill(0)
    font("Copperplate")
    text('Menu', self.x + self.w*.5, self.y + self.h*.5)
    popStyle()
end

