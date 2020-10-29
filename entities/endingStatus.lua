local endingStatus = {
    textColor = {0.6,0.6,0.6},
    location = {100,100},
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",
    fontSize = 15,
    rowHeight = 18,
    endStates = {}
}

function endingStatus:load()
    self:updateEndStates() 
end

function endingStatus:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 

function endingStatus:update()

end

function endingStatus:draw()

    if #self.endStates > 0 then

        love.graphics.setNewFont(self.fontFile, self.fontSize)
        love.graphics.setColor(self.textColor)

        love.graphics.print("End Path Found "..#self.endStates.." of "..#Game.save, self.location[1], self.location[2] )

        for key, state in pairs(self.endStates) do
            love.graphics.print("- "..state, self.location[1], self.location[2]+self.rowHeight*key ) 
        end

    end


end

function endingStatus:updateEndStates() 
    print("updating end state")
    self.endStates = {}
    local currentStates = Game.save
    for key, state in pairs(currentStates) do
        if state[2] == "1" then 
            self.endStates[#self.endStates+1] = state[1]
        end
    end

end

return endingStatus