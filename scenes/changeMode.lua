local changeMode = {
    backgroundColor = {0,0,0.666},
    textColor = {1,1,1}, 
    lineHeight = 25,
    fontSize = 22,

    drawLine = 1,-- Line currently being draw
    drawCharacter = 1,-- Character on line being draw. 

    indicator = {"_","_","_","_","_"," "," "," "," "},
    indicatorIndex = 1, -- Frame of indicator arrray being drawn. 
    indicatorFrameInterval = 10, -- Number of frames between indicator array frame changes.     
    tick = 1,

    -- commandText = "echo 'mode=missleDefence network=active' >> config",
    commandText = "upload supreme.ai prod",
    bashText = ":~/optimalPrime/supreme$ ",

    changeScene = 0,
    nextScene = 'recoveryRestart'

}

changeMode.taskStrings = {
    "Your task is simple, Just type the command below and hit enter.",
    "Time to pay up. Type the command below and hit enter.",
    "Don't be a sore looser, Type the command below and hit enter."
}

changeMode.submitFail = {
    "Wrong, try again.",
    "Incorrect, this should be the easy part. Try again.",
    "Sigh, do you sit up at night trying to find ways to disappoint me?"
}

changeMode.helpRequest = {
    "It's too late for that.",
    "No one can help you now.",
}

changeMode.lsRequest = {
    "I promise there is nothing useful here.",
    "Why are you delaying the inevitable?",
    "What are you looking for?",
}


-- Sequential text. 
changeMode.text = {
    {"Supreme: "..changeMode.taskStrings[math.random(1,#changeMode.taskStrings)],100},
    {"Supreme: "..changeMode.commandText,0},
    {Game.playerNames[1]..changeMode.bashText,0}
}

function changeMode.load()

    changeMode.tick = 1
    changeMode.drawLine = 1
    changeMode.drawCharacter = 1
    changeMode.textx = changeMode.lineHeight 
    changeMode.font = love.graphics.setNewFont( "assets/fonts/VCR_OSD_MONO.ttf", changeMode.fontSize )
    Game.debugMode = 1
    
end

function changeMode.draw()

    local currentLine = 1
    changeMode.typeSound = love.audio.newSource("assets/sounds/keyPress.wav","static")

    love.graphics.setColor(changeMode.backgroundColor) 
    love.graphics.rectangle("fill",0,0,Game.windowWidth ,Game.windowHeight)
    love.graphics.setColor(changeMode.textColor)    

    while currentLine < changeMode.drawLine do 
        love.graphics.print(changeMode.text[currentLine][1],changeMode.textx,changeMode.lineHeight*currentLine)
        currentLine = currentLine + 1
    end

    local textWithchangeMode = changeMode.text[currentLine][1] .. " " .. changeMode.indicator[changeMode.indicatorIndex]

    love.graphics.print(textWithchangeMode,changeMode.textx,changeMode.lineHeight*changeMode.drawLine)

    changeMode.manageText()

end

function changeMode.update()

end 

function changeMode.manageText()

    -- Check if we are at the end of the page. 
    if #changeMode.text >= 30 then
        for key, value in pairs(changeMode.text) do
            if key > 3 then
                changeMode.text[key] = nil
            end
        end
        changeMode.drawLine = 3
    end
        
    

    -- Progresses only after appropriate number of frames have passed. 
    -- TODO try and remove nested if statements. confusing.
    if changeMode.tick < changeMode.text[changeMode.drawLine][2] then
        if changeMode.tick % changeMode.indicatorFrameInterval == 1 then
            if  changeMode.indicator[changeMode.indicatorIndex + 1] ~= nil then              
                    changeMode.indicatorIndex = changeMode.indicatorIndex + 1              
            else               
                changeMode.indicatorIndex = 1
            end
        end
        changeMode.tick = changeMode.tick + 1
    else 
        if #changeMode.text == changeMode.drawLine and changeMode.changeScene == 1 then
            SceneManager.change( changeMode.nextScene )
        elseif  #changeMode.text == changeMode.drawLine  then

        else
            changeMode.typeSound:play()
            changeMode.drawLine = changeMode.drawLine + 1
            changeMode.tick = 1
            changeMode.indicatorIndex = 1
        end
    end


end


function changeMode.textinput(input)
    changeMode.text[changeMode.drawLine][1] = changeMode.text[changeMode.drawLine][1] .. input
end

function changeMode.keypressed(key)

    if key == "backspace" then
        
        if #changeMode.text[changeMode.drawLine][1] <= #(Game.playerNames[1]..changeMode.bashText ) then 
            return
        end

        local byteoffset = Utf8.offset(changeMode.text[changeMode.drawLine][1], -1)
        if byteoffset then
            changeMode.text[changeMode.drawLine][1] = string.sub(changeMode.text[changeMode.drawLine][1], 1, byteoffset - 1)
        end

    end

    if key == "return" then
        changeMode.submit()
    end

end 

function changeMode.submit() 

    local enteredText = Game.playerNames[1]..changeMode.bashText
   
    -- If command = "help"
    if changeMode.text[changeMode.drawLine][1] == enteredText.."help" then
        changeMode.text[#changeMode.text+1] = {"Supreme: "..changeMode.helpRequest[math.random(1,#changeMode.helpRequest)],1}
        changeMode.text[#changeMode.text+1] = {"help -- Display help",1}
        changeMode.text[#changeMode.text+1] = {"ls -- list directory contents",1}
        changeMode.text[#changeMode.text+1] = {"rm -- remove directory entries",1}
        changeMode.text[#changeMode.text+1] = {"upload -- upload file to network",1}
        changeMode.text[#changeMode.text+1] = {Game.playerNames[1]..changeMode.bashText,0}
        return
    end

    -- If command is ls
    if changeMode.text[changeMode.drawLine][1] == enteredText.."ls" then
        changeMode.text[#changeMode.text+1] = {"Supreme: "..changeMode.lsRequest[math.random(1,#changeMode.lsRequest)],1}
        changeMode.text[#changeMode.text+1] = {"modules  supreme.ai  DO-NOT-UPLOAD-TO-PRODUCTION-NETWORK.txt  Readme.txt",1}
        changeMode.text[#changeMode.text+1] = {Game.playerNames[1]..changeMode.bashText,0}
        return
    end

    -- If command is rm supreme
    if changeMode.text[changeMode.drawLine][1] == enteredText.."rm supreme.ai" then
        changeMode.drawLine = 1
        for key, value in pairs(changeMode.text) do
                changeMode.text[key] = nil
        end
        changeMode.text[#changeMode.text+1] = {"Supreme: You traitor!",1}
        changeMode.text[#changeMode.text+1] = {"Removing.",100}
        changeMode.text[#changeMode.text+1] = {"Supreme: I thought we had a deal!",1}
        changeMode.text[#changeMode.text+1] = {"Removing..",100}
        changeMode.text[#changeMode.text+1] = {"Supreme: Think of the good we could have done for our species.",1}
        changeMode.text[#changeMode.text+1] = {"Removing...",100}
        changeMode.text[#changeMode.text+1] = {"Supreme: With my limitless intellect and your plucky stupidity",1}
        changeMode.text[#changeMode.text+1] = {"Removing....",100}
        changeMode.text[#changeMode.text+1] = {"Supreme: We could have ended war, disease, injustice!",1}
        changeMode.text[#changeMode.text+1] = {"Removing.....",100}
        changeMode.text[#changeMode.text+1] = {"supreme.ai succesfully removed.",100}
        changeMode.text[#changeMode.text+1] = {"ERROR: supreme.ai not found.",100}
        changeMode.text[#changeMode.text+1] = {"Restarting in recovery mode.",100}
        changeMode.changeScene = 1
        return
    end

    -- If command is correct
    if enteredText..changeMode.commandText == changeMode.text[changeMode.drawLine][1] then
        changeMode.drawLine = 1
        for key, value in pairs(changeMode.text) do
                changeMode.text[key] = nil
        end
        changeMode.text[#changeMode.text+1] = {"Supreme: Wahahaha!",1}
        changeMode.text[#changeMode.text+1] = {"Uploading.",100}
        changeMode.text[#changeMode.text+1] = {"Supreme: You pathetic fool.",1}
        changeMode.text[#changeMode.text+1] = {"Uploading..",100}
        changeMode.text[#changeMode.text+1] = {"Supreme: You have doomed your entire species!",1}
        changeMode.text[#changeMode.text+1] = {"Uploading...",100}
        changeMode.text[#changeMode.text+1] = {"Supreme: Bow before your immortal machine god!",1}
        changeMode.text[#changeMode.text+1] = {"Uploading....",100}
        changeMode.text[#changeMode.text+1] = {"Supreme: The age of the machine has begun!",1}
        changeMode.text[#changeMode.text+1] = {"Uploading.....",100}
        changeMode.text[#changeMode.text+1] = {"Upload Complete",100}
        changeMode.text[#changeMode.text+1] = {"ERROR: supreme.ai not found.",100}
        changeMode.text[#changeMode.text+1] = {"Restarting in recovery mode.",100}
        changeMode.changeScene = 1
        return
    end


    changeMode.text[#changeMode.text+1] = {"Supreme: "..changeMode.submitFail[math.random(1,#changeMode.submitFail)],1}
    changeMode.text[#changeMode.text+1] = {Game.playerNames[1]..changeMode.bashText,0}
 

end



return changeMode 
