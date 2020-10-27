local debugMenu = {
    location = {100,100},
    dimensions = {100,500},
    padding = 10,
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",
    fontSize = 15,
    fontColor = {0,0,0},
    activeColor = {1,0,0},
    rowHeight = 20,
    columnPadding = "  ",
    clickLocation = {{}},
    debugTable = {{}},
    activeTable = {{}},
    drawDebug = 0,


}

function debugMenu:load()

    self.textLoc = {self.location[1]+self.padding,self.location[2]+self.padding}


end

function debugMenu:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 


function debugMenu:update()

end

function debugMenu:draw()

    if self.drawDebug ~= 1 then
        return
    end 

    love.graphics.setNewFont(self.fontFile, self.fontSize)
    local Font = love.graphics.getFont()

    for row in pairs(self.debugTable) do
        local currentText = ""
        for column in pairs(self.debugTable[row]) do

            if self.activeTable[row][column] == 1  then
                love.graphics.setColor(self.activeColor)
            else 
                love.graphics.setColor(self.fontColor)
            end

            if self.clickLocation[row] == nil then
                self.clickLocation[row] = {}
            end

            self.clickLocation[row][column] = {
                self.textLoc[1] + Font:getWidth( currentText ),
                self.textLoc[2]+self.rowHeight*row,
                Font:getWidth( self.debugTable[row][column] ),
                self.rowHeight
            }

     
            currentText = currentText..self.debugTable[row][column]..self.columnPadding   
        end
    end



end

function debugMenu:clickInTable(x,y)

    for row, value in pairs(self.clickLocation) do
        for column, value in pairs(self.clickLocation[row]) do

            if Utils:inSquare(x,y,self.clickLocation[row][column][1],
            self.clickLocation[row][column][2],
            self.clickLocation[row][column][3],
            self.clickLocation[row][column][4]) == true then

                return {row,column}
            end

        end
    end

    return false 

end 





return debugMenu