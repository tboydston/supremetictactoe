local recoveryRestart = {
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

function recoveryRestart.load()

    recoveryRestart.tick = 1
    recoveryRestart.drawLine = 1
    recoveryRestart.drawCharacter = 1
    recoveryRestart.textx = recoveryRestart.lineHeight 
    recoveryRestart.font = love.graphics.setNewFont( "assets/fonts/VCR_OSD_MONO.ttf", recoveryRestart.fontSize )
    recoveryRestart.typeSound = love.audio.newSource("assets/sounds/keyPress.wav","static")
    
end

function recoveryRestart.draw()

    local currentLine = 1

    love.graphics.setColor(recoveryRestart.backgroundColor) 
    love.graphics.rectangle("fill",0,0,Game.windowWidth ,Game.windowHeight)
    love.graphics.setColor(recoveryRestart.textColor)    

    while currentLine < recoveryRestart.drawLine do 
        love.graphics.print(recoveryRestart.text[currentLine],recoveryRestart.textx,recoveryRestart.lineHeight*currentLine)
        currentLine = currentLine + 1
    end

    local textWithrecoveryRestart = recoveryRestart.text[currentLine] .. " " .. recoveryRestart.indicator[recoveryRestart.indicatorIndex]

    love.graphics.print(textWithrecoveryRestart,recoveryRestart.textx,recoveryRestart.lineHeight*recoveryRestart.drawLine)

    if recoveryRestart.tick < recoveryRestart.loadTicks[recoveryRestart.drawLine] then
 
        if recoveryRestart.tick % recoveryRestart.indicatorFrameInterval == 1 then

            if  recoveryRestart.indicator[recoveryRestart.indicatorIndex + 1] ~= nil then
                
                    recoveryRestart.indicatorIndex = recoveryRestart.indicatorIndex + 1
                
            else 
                recoveryRestart.indicatorIndex = 1
            end

        end

        recoveryRestart.tick = recoveryRestart.tick + 1

    else 
        if #recoveryRestart.text == recoveryRestart.drawLine then
            Game.reset()
            SceneManager.change("getUsername")
        else 
            recoveryRestart.typeSound:play()
            recoveryRestart.drawLine = recoveryRestart.drawLine + 1
            recoveryRestart.tick = 1
            recoveryRestart.indicatorIndex = 1
        end
    end

end


function recoveryRestart.update()

end 

-- Delay at the end of each line in frames. Simulates recoveryRestart time.
recoveryRestart.loadTicks = {
    100,
    300,
    100,
    200,
    300,
    0,
    0,
    0,
    0,
    300
}

-- Sequential recoveryRestart text. 
recoveryRestart.text = {
    "ENTERING RECOVERY MODE",
    "Validating file system.",
    "Missing: supreme.ai",
    "Copying surpeme.ai from supreme.bak",
    "Validating file system.",
    "FILE SYSTEM VALID",
    "Please report further issues to the appropriate team memeber.",
    "Development: Tracey Boydston",
    "QA: Grant Brown, Riley Boydston, Stuart Grinnel",
    "Restarting...",
}

return recoveryRestart 