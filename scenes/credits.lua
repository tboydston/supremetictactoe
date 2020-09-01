local credits = {
    backgroundColor = {0,0,0.666},
    textColor = {1,1,1}, 
    lineHeight = 23,
    fontSize = 22,

    drawLine = 1,-- Line currently being draw
    drawCharacter = 1,-- Character on line being draw. 

    indicator = {"|","/","-","\\","|","/","-","\\","|"},
    indicatorIndex = 1, -- Frame of indicator arrray being drawn. 
    indicatorFrameInterval = 10, -- Number of frames between indicator array frame changes.     
    tick = 1

}

function credits.load()

    credits.tick = 1
    credits.drawLine = 1
    credits.drawCharacter = 1
    credits.textx = credits.lineHeight 
    credits.font = love.graphics.setNewFont( "assets/fonts/VCR_OSD_MONO.ttf", credits.fontSize )
    credits.typeSound = love.audio.newSource("assets/sounds/keyPress.wav","static")
    
end

function credits.draw()

    local currentLine = 1

    love.graphics.setColor(credits.backgroundColor) 
    love.graphics.rectangle("fill",0,0,Game.windowWidth ,Game.windowHeight)
    love.graphics.setColor(credits.textColor)    

    while currentLine < credits.drawLine do 
        love.graphics.print(credits.text[currentLine],credits.textx,credits.lineHeight*currentLine)
        currentLine = currentLine + 1
    end

    local textWithcredits = credits.text[currentLine] .. " " .. credits.indicator[credits.indicatorIndex]

    love.graphics.print(textWithcredits,credits.textx,credits.lineHeight*credits.drawLine)

    if credits.tick < credits.loadTicks[credits.drawLine] then
 
        if credits.tick % credits.indicatorFrameInterval == 1 then

            if  credits.indicator[credits.indicatorIndex + 1] ~= nil then
                
                    credits.indicatorIndex = credits.indicatorIndex + 1
                
            else 
                credits.indicatorIndex = 1
            end

        end

        credits.tick = credits.tick + 1

    else 
        if #credits.text == credits.drawLine then
            Game.reset()
            SceneManager.change("getUsername")
        else 
            credits.typeSound:play()
            credits.drawLine = credits.drawLine + 1
            credits.tick = 1
            credits.indicatorIndex = 1
        end
    end

end


function credits.update()

end 

-- Delay at the end of each line in frames. Simulates credits time.
credits.loadTicks = {
    300,
    100,
    300,
    100,
    300,
    0,
    100,
    300,
    300,
    100,
    300
}

-- Sequential credits text. 
credits.text = {
    "Debugging.",
    "Supreme: Maybe someone spilled some coffee on my mother board.",
    "Debugging..",
    "Supreme: I blame that Tracey Boydston guy he wrote me.",
    "Debugging...",
    "Supreme: And that Grant Brown and Riley Boydston",
    "Supreme: should have caught this in testing.",
    "Debugging....",
    "Debugging.....",
    "Debugger: No Errors Found",
    "Supreme: Impossible, I am a perfect immortal machine!",
}

return credits 