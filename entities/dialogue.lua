local dialogue = {
    
    location = {500,500},
    dimensions = {100,50},
    boxCorners = {15,15},
    boxColor = {0,0,0},
    textPadding = 10, -- Internal padding in pixels seperating dialoge edge with text.
     
    buttonCorners = {15,15},
    borderLineWidth = 4,
    buttonLineWidth = 3,
    buttonColor = {0,0,0},
    buttonHeight = 30,
    buttonFontSize = 15,
    
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",
    titleTextSize = 30, 
    bodyTextSize = 25,
    titleTextColor = {0,0,0},
    bodyTextColor = {0,0,0},
    titleText = "",
    bodyText = "",
    buttons = {},
    show = 0

}


function dialogue:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end

function dialogue:load()

    self.titleLoc = { self.location[1],self.location[2] + self.textPadding }

end



function dialogue:button(buttonText,buttonLoc,buttonLineColor,buttonTextColor)
    
    love.graphics.setNewFont(self.fontFile, self.buttonFontSize)
    local Font = love.graphics.getFont()
    
    local textWidth = Font:getWidth( buttonText )
    local textHeight = Font:getHeight( buttonText )
    
    local buttonDim = {textWidth * 1.6, textHeight * 2.2 } 

    local buttonTextX = buttonLoc[1] + ( buttonDim[1] - textWidth ) / 2   
    local buttonTextY = buttonLoc[2] + ( buttonDim[2] - textHeight ) / 2  

    love.graphics.setColor(buttonLineColor)
    love.graphics.setLineWidth( self.buttonLineWidth )
    love.graphics.roundrect("line", buttonLoc[1], buttonLoc[2], buttonDim[1], buttonDim[2], self.buttonCorners[1], self.buttonCorners[2])
    love.graphics.setColor(buttonTextColor)
    love.graphics.print(buttonText, buttonTextX,buttonTextY)

    return buttonDim

end

function dialogue:box()

    love.graphics.setColor(self.boxColor)
    love.graphics.setLineWidth( self.borderLineWidth )
    love.graphics.roundrect("line", self.location[1], self.location[2], self.dimensions[1], self.dimensions[2], self.boxCorners[1], self.boxCorners[2])

end

function dialogue:title()

    love.graphics.setNewFont(self.fontFile, self.titleTextSize)
    love.graphics.setColor(self.titleTextColor)
    love.graphics.printf( self.titleText, self.titleLoc[1], self.titleLoc[2], self.dimensions[1], "center" )  
    love.graphics.setNewFont(self.fontFile, 20 )

end 

function dialogue:body()

    local ypadding = self.location[2] + self.textPadding

    if self.titleText ~= "" then
        ypadding = ypadding + self.titleTextSize + self.textPadding

    end 

    love.graphics.setNewFont(self.fontFile, self.bodyTextSize)
    love.graphics.setColor(self.bodyTextColor)
    love.graphics.printf( self.bodyText, 
        self.location[1]+self.textPadding, 
        ypadding, 
        self.dimensions[1]-self.textPadding, "left" 
    )  

end



return dialogue