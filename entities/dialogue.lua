local dialogue = {
    type = "button",
    location = {500,500},
    dimensions = {100,50},
    corners = {15,15},
    mode = "line",
    text = "Test",
    color = {0,0,0},
    lineWidth = 5,
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",
    fontSize = 25,
    fontColor = {0,0,0},
    maxTextWidth = 500,
    align = "left"
}

function dialogue:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end

function dialogue:draw()
    -- @TODO look for way to use strings as function names to make this less redundant. 
    if self.type == "button" then
        self:button()
    end

    if self.type == "box" then
        self:box()
    end

    if self.type == "textLine" then
        self:textLine()
    end

end

function dialogue:load()
 
    self.textFont = love.graphics.newFont( self.fontFile, self.fontSize )
end 

function dialogue:button()
    
    love.graphics.setNewFont(self.fontFile, self.fontSize)
    local Font = love.graphics.getFont()
    local textWidth = Font:getWidth( self.text )
    local textHeight = Font:getHeight( self.text )
    local buttonTextX = self.location[1] + ( self.dimensions[1] - textWidth ) / 2   
    local buttonTextY = self.location[2] + ( self.dimensions[2] - textHeight ) / 2  

    love.graphics.setColor(self.color)
    love.graphics.setLineWidth( self.lineWidth )
    love.graphics.roundrect(self.mode, self.location[1], self.location[2], self.dimensions[1], self.dimensions[2], self.corners[1], self.corners[2])
    love.graphics.setColor(self.fontColor)
    love.graphics.print(self.text, buttonTextX,buttonTextY)

end

function dialogue:box()

    love.graphics.setColor(self.color)
    love.graphics.setLineWidth( self.lineWidth )
    love.graphics.roundrect(self.mode, self.location[1], self.location[2], self.dimensions[1], self.dimensions[2], self.corners[1], self.corners[2])

end

function dialogue:textLine()

    love.graphics.setNewFont(self.fontFile, self.fontSize)
    love.graphics.setColor(self.fontColor)
    love.graphics.printf( self.text, self.location[1], self.location[2], self.maxTextWidth, self.align )

end

function dialogue:clicked(x,y)

    if (
        x > self.location[1] and 
        x < self.location[1] + self.dimensions[1] and
        y > self.location[2] and
        y < self.location[2] + self.dimensions[2]
    ) then
        return true
    end

    return false 

end 

return dialogue