local supreme = {

    eyeOutlineColor = {0.752, 0.752, 0.752},
    eyeBackgroundColor = {0, 0, 0},
    irisColor = {1, 0, 0},
    pupilColor = {1,1,1},
    eyeCenter = {0,0},
    eyeRadius = 100

}

function supreme:load() 

    self.irisRadius = self.eyeRadius*0.3
    self.pupilRadius = self.eyeRadius*0.1

end

function supreme:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 

function supreme:draw()

    love.graphics.setColor(self.eyeOutlineColor)
    love.graphics.circle("fill", self.eyeCenter[1], self.eyeCenter[2], self.eyeRadius)
    love.graphics.setColor(self.eyeBackgroundColor)
    love.graphics.circle("fill", self.eyeCenter[1], self.eyeCenter[2], self.eyeRadius*0.9) 

    self:updateIris()

end

function supreme:updateIris()

    local mouseLoc = {love.mouse.getX(),love.mouse.getY()}


    local r = self.eyeRadius - ( self.irisRadius * 1.9 )

    if  math.abs( self.eyeCenter[1] - mouseLoc[1] ) < r  and math.abs( self.eyeCenter[2] - mouseLoc[2] ) < r  then 
        
        self:drawIris(mouseLoc)  

    else 

        local vX = mouseLoc[1]-self.eyeCenter[1]
        local vY = mouseLoc[2]-self.eyeCenter[2]
        local magV = math.sqrt(vX^2+vY^2)
        self.irisLoc = {self.eyeCenter[1] + vX / magV * r,self.eyeCenter[2] + vY / magV * r}


        self:drawIris(self.irisLoc)  
    
    end 

end


function supreme:drawIris(irisLoc)

    love.graphics.setColor(self.irisColor)
    love.graphics.circle("fill", irisLoc[1], irisLoc[2], self.irisRadius)
    love.graphics.setColor(self.pupilColor)
    love.graphics.circle("fill", irisLoc[1], irisLoc[2], self.pupilRadius )   

end

function supreme:clickInIris(x,y)

    if Utils:inSquare( 
        x,y,
        self.irisLoc[1]-self.irisRadius,
        self.irisLoc[2]-self.irisRadius,
        self.irisRadius * 2,
        self.irisRadius * 2
    ) then
        return true
    else 
        return false
    end

end

return supreme