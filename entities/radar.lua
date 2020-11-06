local radar = {
    location={500,500},
    radius = 400,
    color = {0,0.85,0},
    lineWidth = 5,
    dots = {},
    scanLineColor = {0,1,0,0.5},
    rotationSpeed = 20, -- lower is faster.
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",

    fontSize = 30,
    fontColor = {1,0,0}
}

function radar:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 

function radar:load()
    self.scanLine = {self.location[1]+self.radius,self.location[2]}
    self.scanLineAngle = 0
    self.textLocation = {}

    radar:createDot(
        {self.location[1]+self.radius*0.5,self.location[2]+self.radius*0.5},
        5,
        {1,0,0},
        1000
    ) 

end

function radar:update()

    for key, value in pairs(self.dots) do

        if self.dots[key][4] > 0 then 

            local oldX = self.dots[key][1][1]
            local oldY = self.dots[key][1][2]
            local newX = 0
            local newY = 0

            local xDist = math.abs( self.dots[key][1][1] - self.location[1] )
            local yDist = math.abs( self.dots[key][1][2] - self.location[2] )
            
            if self.dots[key][1][1] > self.location[1] then 
                newX = oldX - xDist / self.dots[key][4]
            else 
                newX = oldX + xDist / self.dots[key][4]
            end

            if self.dots[key][1][2] > self.location[2] then 
                newY = oldY - yDist / self.dots[key][4]
            else 
                newY = oldY + yDist / self.dots[key][4]
            end

            self.dots[key][4] = self.dots[key][4] - 1
            self.dots[key][1] = {newX, newY}

        else 

            self.dots[key] = nil
        
        end

    end

    self.dots = Utils:removeNil(self.dots)

end

function radar:draw()




    local minSecAngleOffset = math.pi * 2 / self.rotationSpeed
    local scanLineAngle = math.pi / 2 + minSecAngleOffset * Game.runTime


    love.graphics.setNewFont( self.fontFile, self.fontSize )

    local threatText = "Active Threats: "
    local Font = love.graphics.getFont()
    local textWidth = Font:getWidth( threatText )
    local textHeight = Font:getHeight( threatText )

    if ( #self.dots > 0 ) then
        love.graphics.setColor({1,0,0})  
    else   
        love.graphics.setColor({0,1,0})
    end      

    love.graphics.printf(threatText ..#self.dots, self.location[1]-self.radius,self.location[2]-self.radius-textHeight-35,self.radius*2,"center")

    love.graphics.setColor({0,0,0,0.75}) 
    love.graphics.circle("fill", self.location[1], self.location[2], self.radius)
    love.graphics.circle("fill", self.location[1], self.location[2], self.radius*0.5) 

    love.graphics.setColor(self.scanLineColor)
    love.graphics.line(
        self.location[1], 
        self.location[2],
        self.location[1]-math.cos(scanLineAngle)*self.radius, 
        self.location[2]-math.sin(scanLineAngle)*self.radius
    )

    love.graphics.setColor(self.color)
    love.graphics.setLineWidth( self.lineWidth )
    love.graphics.circle("line", self.location[1], self.location[2], self.radius)
    love.graphics.circle("line", self.location[1], self.location[2], self.radius*0.5)
    love.graphics.circle("fill", self.location[1], self.location[2], self.lineWidth*2)
    love.graphics.line(self.location[1]-self.radius, self.location[2],self.location[1]+self.radius, self.location[2])
    love.graphics.line(self.location[1], self.location[2]-self.radius,self.location[1], self.location[2]+self.radius) 

    for key, value in pairs(self.dots) do

        love.graphics.setColor(self.dots[key][3])
        love.graphics.circle("fill", self.dots[key][1][1], self.dots[key][1][2], self.dots[key][2]) 
        
    end

end

function radar:createDot(location,radius,color,frames)

    self.dots[#self.dots+1] = {
        location,
        radius,
        color,
        frames
    }

end



return radar

