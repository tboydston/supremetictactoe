local satNet = {
    location={500,500},
    radius = 400,
    color = {1,1,0},
    lineWidth = 5,
    sats = {},
    satColor = {1,0,0},
    rotationSpeed = 20, -- lower is faster.
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",

    fontSize = 30,
    fontColor = {1,0,0},
    backgroundColor = {0,0,0}
}

function satNet:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 

function satNet:load()
    self.scanLine = {self.location[1]+self.radius,self.location[2]}
    self.scanLineAngle = 0
    self.textLocation = {}

    -- satNet:createSat(
    --     0.5,
    --     1000,
    --     {1,0,0},
    --     1000
    -- ) 

end

function satNet:update()

    for key, value in pairs(self.sats) do

        if self.sats[key][4] > 0 then 

            local oldX = self.sats[key][1][1]
            local oldY = self.sats[key][1][2]
            local newX = 0
            local newY = 0

            local xDist = math.abs( self.sats[key][1][1] - self.location[1] )
            local yDist = math.abs( self.sats[key][1][2] - self.location[2] )
            
            if self.sats[key][1][1] > self.location[1] then 
                newX = oldX - xDist / self.sats[key][4]
            else 
                newX = oldX + xDist / self.sats[key][4]
            end

            if self.sats[key][1][2] > self.location[2] then 
                newY = oldY - yDist / self.sats[key][4]
            else 
                newY = oldY + yDist / self.sats[key][4]
            end

            self.sats[key][4] = self.sats[key][4] - 1
            self.sats[key][1] = {newX, newY}

        else 

            self.sats[key] = nil
        
        end

    end

    self.sats = Utils:removeNil(self.sats)

end

function satNet:draw()




    local minSecAngleOffset = math.pi * 2 / 500
    local satLineAngle = math.pi / 2 + minSecAngleOffset * Game.runTime


    love.graphics.setNewFont( self.fontFile, self.fontSize )

    local threatText = "Sats In Range: "
    local Font = love.graphics.getFont()
    local textWidth = Font:getWidth( threatText )
    local textHeight = Font:getHeight( threatText )

    if ( #self.sats > 0 ) then
        love.graphics.setColor({1,1,0})  
    else   
        love.graphics.setColor({1,0,0})
    end      

    love.graphics.printf(threatText ..#self.sats, self.location[1]-self.radius,self.location[2]-self.radius-textHeight-35,self.radius*2,"center")

    love.graphics.rectangle("fill", self.location[1]-self.radius, self.location[2], self.radius*2,self.radius)

    love.graphics.setColor({0,0,0,0.75}) 
    love.graphics.circle("fill", self.location[1], self.location[2], self.radius)
    love.graphics.circle("fill", self.location[1], self.location[2], self.radius*0.5) 

    love.graphics.setColor(self.color)
    love.graphics.setLineWidth( self.lineWidth )
    love.graphics.circle("line", self.location[1], self.location[2], self.radius)
    love.graphics.circle("line", self.location[1], self.location[2], self.radius*0.75)
    love.graphics.circle("line", self.location[1], self.location[2], self.radius*0.5)
    love.graphics.circle("line", self.location[1], self.location[2], self.radius*0.25)
    love.graphics.circle("fill", self.location[1], self.location[2], self.lineWidth*2)
    love.graphics.line(self.location[1]-self.radius, self.location[2],self.location[1]+self.radius, self.location[2])
    love.graphics.line(self.location[1], self.location[2]-self.radius,self.location[1], self.location[2]+self.radius) 

    for key, value in pairs(self.sats) do

        love.graphics.setColor(self.sats[key][3])
        love.graphics.circle("fill", self.sats[key][1][1], self.sats[key][1][2], self.sats[key][2]) 
         
    end

    love.graphics.setColor(self.satColor)
    love.graphics.circle(
        "fill",
        self.location[1]-math.cos(satLineAngle)*self.radius, 
        self.location[2]-math.sin(satLineAngle)*self.radius,
        5
    )

    love.graphics.setColor(self.satColor)
    love.graphics.circle(
        "fill",
        self.location[1]-math.cos(satLineAngle)*self.radius*0.5, 
        self.location[2]-math.sin(satLineAngle)*self.radius*0.5,
        5
    )

    love.graphics.setColor(self.backgroundColor)
    love.graphics.rectangle("fill", self.location[1]-self.radius-self.lineWidth, self.location[2], self.radius*2+self.lineWidth*2,self.radius+self.lineWidth)


end

function satNet:createSat(location,radius,color,frames)

    self.sats[#self.sats+1] = {
        location,
        radius,
        color,
        frames
    }

end



return satNet

