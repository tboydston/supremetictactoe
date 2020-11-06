local winnerMessage = {
    textColor = {1, 0, 0},
    textColorPlayAgain = {0,0,0},
    location = {100,100},
    dimensions = {500,500},
    corners = {15,15},
    fontFile = "assets/fonts/VCR_OSD_MONO.ttf",
    fontSize = 55,
    fontSizePlayAgain = 45,
    rowHeight = 70,
    scores = {0,0,0},
    winnerName = "",
    show = 0,
    showPlayAgain = 1
}

function winnerMessage:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 

function winnerMessage:load()
    self.gameOverSound = love.audio.newSource("assets/sounds/gameOver.wav","static")
    self.youWinSound = love.audio.newSource("assets/sounds/youWin.wav","static")

end

function winnerMessage:update()

end

function winnerMessage:draw()
    
    if self.show == 0 then
        return
    end

    love.graphics.setNewFont(self.fontFile, self.fontSize)
    love.graphics.setColor(self.textColor)
    love.graphics.printf("GAME OVER\nWinner "..self.winnerName..'!', self.location[1], self.location[2], self.dimensions[1], "center"  )
    
    if self.showPlayAgain == 1 then
        love.graphics.setNewFont(self.fontFile, self.fontSizePlayAgain)
        love.graphics.setColor(self.textColorPlayAgain)
        love.graphics.printf('\n\n\nPLAY AGAIN(r)?', self.location[1], self.location[2], self.dimensions[1], "center"  )
    end

end

function winnerMessage:toggle(winLossSound,winnerName,showPlayAgain)

    if self.show == 0 then 
       
        self.show = 1
        self.winnerName = winnerName
        if winLossSound == "win" then
            self.youWinSound:play()
        else 
            self.gameOverSound:play()
        end
            -- If the player is the winner remove the option to reset. 
        
        self.showPlayAgain = showPlayAgain 
      
    else 
        self.show = 0
        self.winnerName = ""  
    end

end

return winnerMessage