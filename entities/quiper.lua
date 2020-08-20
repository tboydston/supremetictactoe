local quiper = {
    textColor = {0.1, 0.1, 0.1},
    location = {100,100},
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",
    fontSize = 25,
    rowHeight = 15,
    maxWidth = 500,
    text = "",
    textDrawIndex = 1,
    drawText = "",
    drawingQuip = 0,
    
    cursor = {"_"," "},
    cursorIndex = 1,
    cursorBlinkIntervalSeconds = 1,
    cursorLastBlink = 0,
    stopIdleBlinkTime = 0,
    idleBlinkPeriodSeconds = 3,

    quipping = 0,
    currentQuip = {},
    currentActionIndex = 1,

    pauseUntil = 0

}

function quiper:load()
    
    self.textFont = love.graphics.newFont( self.fontFile, self.fontSize )

end

function quiper:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 

function quiper:update()

    if self:pauseStatus() then 
        return
    end

    self:updateQuip()
    


end

function quiper:draw()

    if self.textDrawIndex < #self.text then

        self.textDrawIndex = self.textDrawIndex + 1

        if self.textDrawIndex == #self.text then
            self.drawingQuip = 0
            self.stopIdleBlinkTime = Game.runTime + self.idleBlinkPeriodSeconds --@todo kinda string to have blink logic outside of blink function.
            self:advanceAction()
        end 

    end 
    


    local printText = string.sub ( self.text, 1, self.textDrawIndex )
    
    if self.drawingQuip == 1 then 
        printText = printText .. self.cursor[1]
    else
        printText = printText .. self:blink()
    end
    
    love.graphics.setNewFont(self.fontFile, self.fontSize)
    love.graphics.setColor(self.textColor)
    love.graphics.printf(printText, self.location[1], self.location[2],self.maxWidth)

end

function quiper:newText(newText)
    self.text = newText
    self.textDrawIndex = 0
end

-- Blink behavior: When typing cursor should be a solid line. After typing is complete the cursor blinks for up to x seconds before not shoeing the cursor at all.
function quiper:blink()

    if Game.runTime > self.cursorLastBlink then
        self.cursorLastBlink = Game.runTime + self.cursorBlinkIntervalSeconds
        if self.cursorIndex == #self.cursor then
            self.cursorIndex = 1
        else 
            self.cursorIndex = self.cursorIndex + 1
        end
    end

    if Game.runTime > self.stopIdleBlinkTime then
        return self.cursor[2]
    else 
        return self.cursor[self.cursorIndex]
    end

end

function quiper:loadQuip(newQuip)
    print(newQuip.type)
    print(newQuip.actions[1].action)
    self.currentQuip = newQuip
    print(self.currentQuip.type)
    print(self.currentQuip.actions[1].action)
    self.currentActionIndex = 1
    self.quipping = 1
end

function quiper:updateQuip()

    if self.currentActionIndex == #self.currentQuip then
        self.quipping = 0
        return 
    end

    local currenctAction = self.currentQuip.actions[self.currentActionIndex]

    if  currenctAction.action == 'clearQuip' then
        self.text = ""
        self.textDrawIndex = 1
        self:advanceAction()
    end

    if currenctAction.action == 'pause' then
        self.pauseUntil = Game.runTime + currenctAction.value
        self:advanceAction()
    end

    if currenctAction.action == 'say' then
        if self.drawingQuip == 0 then
            self.drawingQuip = 1
            self.text = currenctAction.value
            self.textDrawIndex = 1
        end
    end

    if currenctAction.action == 'sceneChange' then
        SceneManager.change(currenctAction.value)
    end

end

function quiper:advanceAction()
    self.currentActionIndex = self.currentActionIndex + 1
end

function quiper:pauseStatus()
    
    if Game.runTime < self.pauseUntil then
        return true
    end 
    
    return false

end



return quiper