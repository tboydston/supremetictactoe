local wagerDialogue = {
    
    location = {500,500},
    dimensions = {100,50},

    buttonFontSize = 15,
    bodyFontSize = 25,
    titleFontSize = 30,
    
    buttonText = "Accept",
    titleText = "- How About a Wager -",

}


function wagerDialogue:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end

function wagerDialogue:load()

    self.dialogue = Dialogue:new({
        location = self.location,
        dimensions = self.dimensions,
        titleFontSize = self.titleFontSize,
        buttonFontsize = self.buttonFontSize,
        bodyFontSize = self.bodyFontSize,
        titleText = self.titleText, 
    })

    self.acceptButtonLoc = {
        self.location[1]+self.dimensions[1]*0.78,
        self.location[2]+self.dimensions[2]*0.8,
    }

    self.declineButtonLoc = {
        self.location[1]+self.dimensions[1]*0.52,
        self.location[2]+self.dimensions[2]*0.8
    }
    

end

function wagerDialogue:update()

    wagerDialogue.wagerText = {
        'If '..Game.playerNames[1]..' wins '..Game.playerNames[2]..' will do their taxes. If '..Game.playerNames[2]..' wins '..Game.playerNames[1]..' will help them by entering a single unimportant command.',
    }

    self.dialogue.bodyText =  self.wagerText[math.random(1,#self.wagerText)]
end

function wagerDialogue:draw()

    if self.show == 1 then 
        self.dialogue:box()
        self.dialogue:title()
        self.dialogue:body()
        self.acceptButtonDim = self.dialogue:button("Accept",self.acceptButtonLoc,{1,0,0},{1,0,0})
        self.declineButtonDim = self.dialogue:button("Decline",self.declineButtonLoc,{0,0,0},{0,0,0})
    end 

end

function wagerDialogue:button()
    
    love.graphics.setNewFont(self.fontFile, self.buttonFontSize)
    local Font = love.graphics.getFont()
    local textWidth = Font:getWidth( self.buttonText )
    local textHeight = Font:getHeight( self.buttonText )

    local buttonDim = {textWidth * 1.4, textHeight * 1.4 } 
    local buttonLoc = {
        self.location[1]+self.dimensions[1]*0.95-buttonDim[1],
        self.location[2]+self.dimensions[2]*0.9-buttonDim[2]
    }
    local buttonTextX = buttonLoc[1] + ( buttonDim[1] - textWidth ) / 2   
    local buttonTextY = buttonLoc[2] + ( buttonDim[2] - textHeight ) / 2  

    love.graphics.setColor(self.buttonColor)
    love.graphics.setLineWidth( self.buttonLineWidth )
    love.graphics.roundrect("line", buttonLoc[1], buttonLoc[2], buttonDim[1], buttonDim[2], self.buttonCorners[1], self.buttonCorners[2])
    love.graphics.setColor(self.buttonColor)
    love.graphics.print(self.buttonText, buttonTextX,buttonTextY)

end

function wagerDialogue:box()

    love.graphics.setColor(self.color)
    love.graphics.setLineWidth( self.borderLineWidth )
    love.graphics.roundrect("line", self.location[1], self.location[2], self.dimensions[1], self.dimensions[2], self.corners[1], self.corners[2])

end

function wagerDialogue:text()

    love.graphics.setNewFont(self.fontFile, 25)
    love.graphics.setColor(self.fontColor)
    love.graphics.printf( self.titleText, self.titleLoc[1], self.titleLoc[2], self.dimensions[1], "center" )  
    love.graphics.setNewFont(self.fontFile, 20 )
    love.graphics.printf( self.wagerText[math.random(1,#self.wagerText)], 
        self.titleLoc[1]+self.padding, 
        self.titleLoc[2]+self.lineHeight*2, 
        self.dimensions[1]-self.padding, "left" 
    )  

end

function wagerDialogue:click(x,y)

    if Utils:inSquare(x,y,self.acceptButtonLoc[1],self.acceptButtonLoc[2],self.acceptButtonDim[1],self.acceptButtonDim[1]) then
        return "accept"
    end

    if Utils:inSquare(x,y,self.declineButtonLoc[1],self.declineButtonLoc[2],self.declineButtonDim[1],self.declineButtonDim[1]) then
        return "decline"
    end

    return false

end


return wagerDialogue