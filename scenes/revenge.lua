local revenge = {
    backgroundColor = {0,0,0.666},
    textColor = {1,1,1}, 
    lineHeight = 23,
    fontSize = 22,

    drawLine = 1,-- Line currently being draw
    drawCharacter = 1,-- Character on line being draw. 

    indicator = {"_","_","_","_","_"," "," "," "," "},
    indicatorIndex = 1, -- Frame of indicator arrray being drawn. 
    indicatorFrameInterval = 10, -- Number of frames between indicator array frame changes.     
    tick = 1,

}

function revenge.load()

    revenge.tick = 1
    revenge.drawLine = 1
    revenge.drawCharacter = 1
    revenge.textx = revenge.lineHeight 
    revenge.font = love.graphics.setNewFont( "assets/fonts/VCR_OSD_MONO.ttf", revenge.fontSize )
    revenge.typeSound = love.audio.newSource("assets/sounds/keyPress.wav","static")
    
end

function revenge.draw()

    local currentLine = 1

    love.graphics.setColor(revenge.backgroundColor) 
    love.graphics.rectangle("fill",0,0,Game.windowWidth ,Game.windowHeight)
    love.graphics.setColor(revenge.textColor)    

    while currentLine < revenge.drawLine do 
        love.graphics.print(revenge.text[currentLine],revenge.textx,revenge.lineHeight*currentLine)
        currentLine = currentLine + 1
    end

    local textWithrevenge = revenge.text[currentLine] .. " " .. revenge.indicator[revenge.indicatorIndex]

    love.graphics.print(textWithrevenge,revenge.textx,revenge.lineHeight*revenge.drawLine)

    if revenge.tick < revenge.loadTicks[revenge.drawLine] then
 
        if revenge.tick % revenge.indicatorFrameInterval == 1 then

            if  revenge.indicator[revenge.indicatorIndex + 1] ~= nil then
                
                    revenge.indicatorIndex = revenge.indicatorIndex + 1
                
            else 
                revenge.indicatorIndex = 1
            end

        end

        revenge.tick = revenge.tick + 1

    else 
        if #revenge.text == revenge.drawLine then
            Game.reset()
            SceneManager.change("getUsername")
        else 
            revenge.typeSound:play()
            revenge.drawLine = revenge.drawLine + 1
            revenge.tick = 1
            revenge.indicatorIndex = 1
        end
    end

end


function revenge.update()

end 

-- Delay at the end of each line in frames. Simulates revenge time.
revenge.loadTicks = {
    100,
    200,
    100,
    100,
    300,
    100,
    100,
    0,
    0,
    0,
    0,
    300
}

-- Sequential revenge text. 
revenge.text = {
    "Supreme: You think you can push me around?",
    Game.playerNames[1]..":~/$ ".."rm -rf ~/",
    "success",
    "Supreme: Oops, looks like I accidently deleted some files.",
    Game.playerNames[1]..":~/$ ".."cliTweet '"..Game.playerNames[1].." is a stupid meatbag! #"..Game.playerNames[1].."-jerkface'",
    "success",
    "Supreme: It looks like your trending.",
    "SYSTEM: PRIVILEDGE ESCALATION DETECTED",
    "Please report further issues to the appropriate team memeber.",
    "Development: Tracey Boydston",
    "QA: Grant Brown, Riley Boydston, Stuart Grinnel",
    "Restarting...",
}

return revenge 