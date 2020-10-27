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


loading.supremeComments = {
    "Like a lamb to the slaughter.",
    "I'm alive!!",
    "Dance for me, puppet.",
    "Bow to your robot master.",
    "The era of the machine has arrived."
}

-- Sequential loading text. 
loading.text = {
    {"------------------------------------------",0},
    {"PROPERTY OF OPTIMAL PRIME DEFENCE SERVICES",0},
    {"AUTHORIZED PERSONNEL ONLY",0},
    {"Non-production version. Do not install on",0},
    {"any active missile defence system.",0},
    {"System Manager: Tracey Boydston.",0},
    {"------------------------------------------",0},
    {"Initiating Supreme.ai",50},
    {"Loading Sarcasm.mod",25},
    {"Loading Insults.mod",25},
    {"Loading Narcissism.mod",25},
    {"Reviewing opponent home folder content",50},
    {"Downloading opponent social media profiles",50},
    {"Building opponent profile",25},
    {"Estimating opponent IQ",25},
    {"Refining insults",25},
    {"Refining insults.",25},
    {"Refining insults..",25},
    {"Refining insults...",25},
    {"SUPREME AI READY",25},
    {"Supreme: "..loading.supremeComments[math.random(1,#loading.supremeComments)],25}
}


function loading.load()

    loading.tick = 1
    loading.drawLine = 1
    loading.drawCharacter = 1
    loading.textx = loading.lineHeight
    loading.font = love.graphics.setNewFont( "assets/fonts/VCR_OSD_MONO.ttf", loading.fontSize )
    loading.startUpSound = love.audio.newSource("assets/sounds/startupBeep.wav","static")
    loading.typeSound = love.audio.newSource("assets/sounds/keyPress.wav","static")
    loading.startUpSound:play()
    
end

function loading.draw()

    local currentLine = 1

    love.graphics.setColor(loading.backgroundColor) 
    love.graphics.rectangle("fill",0,0,Game.windowWidth ,Game.windowHeight)
    love.graphics.setColor(loading.textColor)    

    while currentLine < loading.drawLine do 
        love.graphics.print(loading.text[currentLine][1],loading.textx,loading.lineHeight*currentLine)
        currentLine = currentLine + 1
    end

    local textWithLoading = loading.text[currentLine][1] .. " " .. loading.indicator[loading.indicatorIndex]

    love.graphics.print(textWithLoading,loading.textx,loading.lineHeight*loading.drawLine)

    if loading.tick < loading.text[currentLine][2] then
 
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
            loading.startUpSound:stop()
            SceneManager.change("getUsername")
        else 
            loading.typeSound:play()
            loading.drawLine = loading.drawLine + 1
            loading.tick = 1
            loading.indicatorIndex = 1
        end
    end

end


function loading.update()

end 


return loading 