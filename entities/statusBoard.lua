local statusBoard = {
    location = {100,100},
    lineHeight = 40,
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",
    fontSize = 30,
    fontColor = {0,0,0}
} 

function statusBoard:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 

function statusBoard:load()

end


function statusBoard:update()

end

function statusBoard:draw()
    

end

return statusBoard