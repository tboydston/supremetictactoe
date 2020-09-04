local wagerDialogue = {
    location = {500,500},
    dimensions = {100,50},
    corners = {15,15},
    buttonCorners = {15,15},
    color = {0,0,0},
    paddingPercent = 0.05,
    lineWidth = 4,
    buttonLineWidth = 3,
    buttonColor = {0,0,0},
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",
    fontSize = 25,
    fontColor = {0,0,0},
    buttonFontSize = 15,
    buttonText = "Accept",
    titleText = "- How About a Wager -",
    cursor = "_",
    nextCursonBlick = 0,
    cursorBlickPeriod = 0.5,
    show = 0

}


function wagerDialogue:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end

function wagerDialogue:load()

    wagerDialogue.wagerText = {
        'If '..Game.playerNames[1]..' wins '..Game.playerNames[2]..' will do their taxes. If '..Game.playerNames[2]..' wins '..Game.playerNames[1]..' will help them by entering a single unimportant command.',
    }
    

    self.padding = self.dimensions[1] * self.paddingPercent
    self.lineHeight = self.fontSize * ( 1 + self.paddingPercent )

    self.buttonDim = {self.location[1]*0.25,self.dimensions[2]*0.25}
    self.buttonLoc = {
        self.location[1]+self.dimensions[1]*0.95-self.buttonDim[1],
        self.location[2]+self.dimensions[2]*0.9-self.buttonDim[2]
    }
    self.titleLoc = { self.location[1],self.location[2]+(self.dimensions[2] * 0.05) }
    self.textLine1Loc = { self.location[1]+self.padding,self.location[2] + self.lineHeight * 2 }
    self.textLine2Loc = { self.location[1]+self.padding,self.location[2] + self.lineHeight * 3 }

end

function wagerDialogue:draw()

    if self.show == 1 then 
        self:button()
        self:box()
        self:text()
        self:cursorBlick()
    end 

end

function wagerDialogue:button()
    
    love.graphics.setNewFont(self.fontFile, self.buttonFontSize)
    local Font = love.graphics.getFont()
    local textWidth = Font:getWidth( self.buttonText )
    local textHeight = Font:getHeight( self.buttonText )
    local buttonTextX = self.buttonLoc[1] + ( self.buttonDim[1] - textWidth ) / 2   
    local buttonTextY = self.buttonLoc[2] + ( self.buttonDim[2] - textHeight ) / 2  

    love.graphics.setColor(self.buttonColor)
    love.graphics.setLineWidth( self.buttonLineWidth )
    love.graphics.roundrect("line", self.buttonLoc[1], self.buttonLoc[2], self.buttonDim[1], self.buttonDim[2], self.buttonCorners[1], self.buttonCorners[2])
    love.graphics.setColor(self.buttonColor)
    love.graphics.print(self.buttonText, buttonTextX,buttonTextY)

end

function wagerDialogue:box()

    love.graphics.setColor(self.color)
    love.graphics.setLineWidth( self.lineWidth )
    love.graphics.roundrect("line", self.location[1], self.location[2], self.dimensions[1], self.dimensions[2], self.corners[1], self.corners[2])

end

function wagerDialogue:text()

    love.graphics.setNewFont(self.fontFile, self.fontSize)
    love.graphics.setColor(self.fontColor)
    love.graphics.printf( self.titleText, self.titleLoc[1], self.titleLoc[2], self.dimensions[1], "center" )  
    love.graphics.printf( self.wagerText[math.random(1,#self.wagerText)], "left" )  

end

function wagerDialogue:clicked(x,y)

    if (
        x > self.buttonLoc[1] and 
        x < self.buttonLoc[1] + self.buttonDim[1] and
        y > self.buttonLoc[2] and
        y < self.buttonLoc[2] + self.buttonDim[2]
    ) then
        return true
    end

    return false 

end


return wagerDialogue