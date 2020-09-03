local scoreBoard = {
    textColor = {0, 0, 0},
    textWinColor = {1, 0, 0},
    textTieColor = {0, 0, 0},
    textRestartColor = {1, 0, 0},
    location = {100,100},
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",
    fontSize = 25,
    rowHeight = 30,
    scores = {0,0,0},
    playerNames = {"Player 1","Player 2"},
    maxScore = 10,
    winState = 0,
    resetButtonText = "RESET(r)"
}

function scoreBoard:load()


end

function scoreBoard:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 

function scoreBoard:update()

end

function scoreBoard:draw()


    love.graphics.setNewFont(self.fontFile, self.fontSize)
    love.graphics.setColor(self.textColor)
    love.graphics.print("SCORE", self.location[1], self.location[2] )
    love.graphics.print(self.playerNames[1]..": "..self.scores[1].."/"..self.maxScore, self.location[1], self.location[2]+self.rowHeight )
    love.graphics.print(self.playerNames[2]..": "..self.scores[2].."/"..self.maxScore, self.location[1], self.location[2]+self.rowHeight*2 )
    love.graphics.print("Ties: "..self.scores[3], self.location[1], self.location[2]+self.rowHeight*3 )
    
    if self.winState == 1 or self.winState == 2 then
        love.graphics.setColor(self.textWinColor)
        love.graphics.print("Winner "..self.playerNames[self.winState].."!!", self.location[1], self.location[2]+self.rowHeight*4 )
    end 

    if self.winState == 3 then
        love.graphics.setColor(self.textTieColor)
        love.graphics.print("Tie Game", self.location[1], self.location[2]+self.rowHeight*4 )
    end

    if self.winState > 0 then
        love.graphics.setColor(self.textRestartColor)
        love.graphics.print("RESET(r)", self.location[1], self.location[2]+self.rowHeight*5 )
    end 
    

end

function scoreBoard:resetClick(x,y)
    
    love.graphics.setNewFont( self.fontFile, self.fontSize )
    local Font = love.graphics.getFont()
    local textWidth = Font:getWidth( self.resetButtonText)
    local textHeight = Font:getHeight( self.resetButtonText)

    return Utils:inSquare(x,y,self.location[1],self.location[2]+self.rowHeight*5,textWidth,textHeight)

end

function scoreBoard:reset()
    self.winState = 0
end

function scoreBoard:updateScore(player)
    self.scores[player] = self.scores[player] + 1 
    return self.scores[player]
end 

return scoreBoard