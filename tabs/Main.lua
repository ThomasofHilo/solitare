-- new card

-- Use this function to perform your initial setup
function setup()
    displayMode(FULLSCREEN)
    CurrentScreen.new()

    
end

-- This function gets called once every frame
function draw()
    -- This sets a dark background color 
    background(40, 40, 50)

    -- This sets the line thickness
    strokeWidth(5)

    -- Do your drawing here
    switchscreen:draw()
    help:draw()
    CurrentScreen.draw()
end


function touched(touch)
    --switchscreen:touched(touch)
    help:touched(touch)
    CurrentScreen.touched(touch)
end
