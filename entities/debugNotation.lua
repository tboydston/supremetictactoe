local debugNotation = {
    location = {100,100},
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",
    fontSize = 15,
    fontColor = {0.75,0.75,0.75},
    show = 0
}

function debugNotation:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 

function debugNotation:load()

end 

function debugNotation:update()

end 

function debugNotation:draw()
    if self.show == 1 then
        love.graphics.print( "DEBUG ENABLED", self.location[1], self.location[2] ) 
    end
end 

return debugNotation

