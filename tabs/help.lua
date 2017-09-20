
help = {x = 128, y = 658, w = 128, h = 50, bC=color(100), sC =color(50), state='unpressed'}

function help:touched(t)

    if t.state == BEGAN and self.state == 'unpressed' then
        if t.x > self.x and t.x < self.x + self.w 
        and t.y > self.y and t.y < self.y + self.h then
            self.state = 'pressing'
        end
    elseif t.state == ENDED and self.state == 'pressing' then
        self.state = 'unpressed'
    end
end

function help:draw()
    if self.state == 'unpressed' then
        fill(self.bC)
    elseif self.state == 'pressing' then
        fill(self.sC)
    end

    RoundedRectangle(self.x, self.y, self.w, self.h, 3)
    if self.state == 'pressing' then
        fill(self.bC)
        RoundedRectangle(self.x+self.w, self.y-32, self.w*2, self.h+64, 16)
    end
    pushStyle()
    fill(0)
    font("Copperplate")
    text('Help', self.x + self.w*.5, self.y + self.h*.5)
    if self.state == 'pressing' then
        font('Arial')
        textWrapWidth(self.w*2)
        text("Match cards that are one or three apart.", self.x + self.w*2, self.y + self.h*.5)
    end
    popStyle()
end

