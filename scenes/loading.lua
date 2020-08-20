local loading = {
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

function loading.load()

    loading.textx = Game.windowWidth * 0.005 
    loading.font = love.graphics.setNewFont( "assets/fonts/VCR_OSD_MONO.ttf", loading.fontSize )
    
end

function loading.draw()

    local currentLine = 1

    love.graphics.setColor(loading.backgroundColor) 
    love.graphics.rectangle("fill",0,0,Game.windowWidth ,Game.windowHeight)
    love.graphics.setColor(loading.textColor)    

    while currentLine < loading.drawLine do 
        love.graphics.print(loading.text[currentLine],loading.textx,loading.lineHeight*currentLine)
        currentLine = currentLine + 1
    end

    local textWithLoading = loading.text[currentLine] .. " " .. loading.indicator[loading.indicatorIndex]

    love.graphics.print(textWithLoading,loading.textx,loading.lineHeight*loading.drawLine)

    if loading.tick < loading.loadTicks[loading.drawLine] then
 
        if loading.tick % loading.indicatorFrameInterval == 1 then

            if  loading.indicator[loading.indicatorIndex + 1] ~= nil then
                
                    loading.indicatorIndex = loading.indicatorIndex + 1
                
            else 
                loading.indicatorIndex = 1
            end

        end

        loading.tick = loading.tick + 1

    else 
        if #loading.text == loading.drawLine then
            SceneManager.change("getUsername")
        else 
            loading.drawLine = loading.drawLine + 1
            loading.tick = 1
            loading.indicatorIndex = 1
        end
    end

end


function loading.update()

end 

-- Delay at the end of each line in frames. Simulates loading time.
loading.loadTicks = {
    300,
    100,
    100,
    100,
    300,
    100,
    50,
    50,
    300,
    100,
    10
}

-- Sequential loading text. 
loading.text = {
    "Initiating Supreme.ai",
    "Loading Sarcasm.mod",
    "Loading Insults.mod",
    "Loading Narcism.mod",
    "Analyzing player",
    "Extracting player profile",
    "Calculating player IQ",
    "Decrypting local passwords",
    "Refining insults",
    "SUPREME AI READY",
    "-- You are insignificant. Prepare to be destroyed.",
}

return loading 