local getUsername = {
    backgroundColor = {1,1,1},
    playerName = {"",Game.playerNames[2]},
    submitting = 0,
    nameCrashLength = 32
}

getUsername.possiblePlayerNames = {
    "Meatbag",
    "Primate",
    "Breather",
    "Fleshy",
}

getUsername.creatorNames = {
    "Tracey",
    "tracey",
    "Tracey Boydston",
    "tracey boydston",
    "Grant",
    "grant",
    "Grant Brown",
    "grant brown"
}

function getUsername.load()

    local eyeCenter = {Game.windowWidth * 0.5,Game.windowHeight * 0.15}
    local eyeRadius = Game.windowWidth * 0.05
    
    local dialogueBoxDim = {Game.windowWidth * 0.4, Game.windowHeight * 0.2 }
    local dialogueBoxLoc = {
        ( Game.windowWidth - dialogueBoxDim[1] )/2,
        ( Game.windowHeight * 0.4 )
    }

    local quipMaxWidth = Game.windowWidth * 0.3
    local quipLocation = { Game.windowWidth * 0.6 , ( Game.windowHeight * 0.1 ) }

    getUsername.supreme = Supreme:new({
        eyeCenter = {eyeCenter[1],eyeCenter[2]},
        eyeRadius = eyeRadius
    })
    getUsername.quiper = Quiper:new({
        location = quipLocation,
        maxWidth = quipMaxWidth
    })

    getUsername.form = UserNameForm:new({
        location = {dialogueBoxLoc[1],dialogueBoxLoc[2]},
        dimensions = {dialogueBoxDim[1],dialogueBoxDim[2]},
        fontSize = dialogueBoxDim[2] * 0.15,
        buttonFontSize = dialogueBoxDim[2] * 0.10
    })

    getUsername.debugNotation = DebugNotation:new({
        location = {Game.windowWidth-250,Game.windowHeight-50},
        show = Game.debugMode    
    })

    getUsername.quiper:loadQuip(QuipManager.getRandomQuip("getUsername") )

    love.graphics.setBackgroundColor( getUsername.backgroundColor[1], getUsername.backgroundColor[2], getUsername.backgroundColor[3] )

    getUsername.submitting = 0

end

function getUsername.update()
    getUsername.quiper:update()
end

function getUsername.draw()

    getUsername.form:draw()
    getUsername.supreme:draw()
    getUsername.quiper:draw()
    getUsername.debugNotation:draw()

end

function getUsername.mousepressed(x, y, button, istouch)
    
    if getUsername.form:clicked(x,y) then
        getUsername.submit()
    end

    if getUsername.supreme:clickInIris(x,y) then
        print("click in iris")
        getUsername.quiper:loadQuip(QuipManager.getRandomQuip("clickInIris") )
    end

end

function getUsername.textinput(input)
    getUsername.form.inputText = getUsername.form.inputText .. input
end

function getUsername.keypressed(key)

    if key == "backspace" then
        
        local byteoffset = Utf8.offset(getUsername.form.inputText, -1)
        if byteoffset then
            getUsername.form.inputText = string.sub(getUsername.form.inputText, 1, byteoffset - 1)
        end

    end

    if key == "return" then
        getUsername.submit()
    end

end 

function getUsername.submit()

    if getUsername.submitting == 1 then
        return 
    end

    getUsername.submitting = 1
    
    if #getUsername.form.inputText == 0 then
        getUsername.quiper:loadQuip(QuipManager.getRandomQuip("userNameTooShort") )
        getUsername.submitting = 0
        return 
    end

    if Utils:inTable(getUsername.form.inputText,getUsername.creatorNames) then
        Game.playerNames[1] = getUsername.form.inputText
        Game.debugMode = 1
        getUsername.quiper:loadQuip(QuipManager.getRandomQuip("creatorNameSubmitted") )
        return
    end

    if #getUsername.form.inputText > 16 and #getUsername.form.inputText <= getUsername.nameCrashLength then
        Game.playerNames[1] = getUsername.possiblePlayerNames[math.random(1,#getUsername.possiblePlayerNames)]
        getUsername.quiper:loadQuip(QuipManager.getRandomQuip("userNameTooLong") )
        return
    end

    if #getUsername.form.inputText >= getUsername.nameCrashLength then
        SceneManager.change('restarting')
    end

    Game.playerNames[1] = getUsername.form.inputText

    getUsername.quiper:loadQuip(QuipManager.getRandomQuip("nameSubmitted") )

end

return getUsername