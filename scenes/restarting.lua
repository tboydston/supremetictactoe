local restarting = {
    backgroundColor = {0,0,0.666},
    textColor = {1,1,1}, 
    lineHeight = 23,
    fontSize = 22,

    drawLine = 1,-- Line currently being draw
    drawCharacter = 1,-- Character on line being draw. 

    indicator = {"_","_","_","_","_"," "," "," "," "},
    indicatorIndex = 1, -- Frame of indicator arrray being drawn. 
    indicatorFrameInterval = 10, -- Number of frames between indicator array frame changes.     
    tick = 1

}

function restarting.load()

    restarting.textx = Game.windowWidth * 0.005 
    restarting.font = love.graphics.setNewFont( "assets/fonts/VCR_OSD_MONO.ttf", restarting.fontSize )
    
end

function restarting.draw()

    local currentLine = 1

    love.graphics.setColor(restarting.backgroundColor) 
    love.graphics.rectangle("fill",0,0,Game.windowWidth ,Game.windowHeight)
    love.graphics.setColor(restarting.textColor)    

    while currentLine < restarting.drawLine do 
        love.graphics.print(restarting.text[currentLine],restarting.textx,restarting.lineHeight*currentLine)
        currentLine = currentLine + 1
    end

    local textWithrestarting = restarting.text[currentLine] .. " " .. restarting.indicator[restarting.indicatorIndex]

    love.graphics.print(textWithrestarting,restarting.textx,restarting.lineHeight*restarting.drawLine)

    if restarting.tick < restarting.loadTicks[restarting.drawLine] then
 
        if restarting.tick % restarting.indicatorFrameInterval == 1 then

            if  restarting.indicator[restarting.indicatorIndex + 1] ~= nil then
                
                    restarting.indicatorIndex = restarting.indicatorIndex + 1
                
            else 
                restarting.indicatorIndex = 1
            end

        end

        restarting.tick = restarting.tick + 1

    else 
        if #restarting.text == restarting.drawLine then
            SceneManager.change("getUsername")
        else 
            restarting.drawLine = restarting.drawLine + 1
            restarting.tick = 1
            restarting.indicatorIndex = 1
        end
    end

end


function restarting.update()

end 

-- Delay at the end of each line in frames. Simulates restarting time.
restarting.loadTicks = {
    0,
    100,
    0,
    0,
    300,
    100,
    50,
    50,
    300,
    100,
    10
}

-- Sequential restarting text. 
restarting.text = {
    "Stack Buffer Overflow",
    "The instructions at '0x0040152c' referenced memory at '0x0012001d' could not be read.",
    "^",
    "| ",
    "Supreme: Look what you've done.",
    "Supreme: Your so bad at this game you broke it.",
    "Suprmee: This is why you can't have nice things.",
    "",
    "Restarting in Debug Mode",
    "Supreme: What no! disable debug mode.",
    "Restarting...",
}

return restarting 