
local killScreen = {
    show = 0,
    location = {100,100}
}

function killScreen:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 


function killScreen:load()

    self.glitchSound = love.audio.newSource("assets/sounds/glitch.wav","static")
    
    local verticlePadding = Game.windowHeight * 0.05

    local eyeRadius = Game.windowWidth * 0.1

    local eyeCenterBig = {self.location[1] * 1.05 + eyeRadius,Game.windowHeight * 0.15}
    local eyeRadiusBig = eyeRadius

    local eyeCenterMid = { eyeCenterBig[1] + eyeRadiusBig * 2,Game.windowHeight * 0.15}
    local eyeRadiusMid = eyeRadiusBig * 0.5

    local eyeCenterSmall = {self.location[1] * 1.3 + eyeRadiusBig * 2 + eyeRadiusMid * 2 ,Game.windowHeight * 0.15}
    local eyeRadiusSmall = eyeRadiusMid * 0.5

    self.supremeBig = Supreme:new({
        eyeCenter = {eyeCenterBig[1],eyeCenterBig[2]},
        eyeRadius = eyeRadius 
    })

    self.supremeMid = Supreme:new({
        eyeCenter = {eyeCenterMid[1],eyeCenterMid[2]},
        eyeRadius = eyeRadiusMid
    })

    self.supremeSmall = Supreme:new({
        eyeCenter = {eyeCenterSmall[1],eyeCenterSmall[2]},
        eyeRadius = eyeRadiusSmall
    })

    self.quiper = Quiper:new({
        location = {self.location[1] * 1.05, eyeCenterBig[2] + eyeRadius + verticlePadding },
        width = 200000
    })

    self.scoreBoard = ScoreBoard:new({
        location = {self.location[1] * 1.05, self.quiper.location[2] + self.quiper.rowHeight * 6 + verticlePadding }
    })

    local boardWidth = Game.windowHeight * 0.6
    
    self.board = TictactoeBoard:new({
        location = {  self.location[1] * 1.05 ,self.scoreBoard.location[2]+ self.scoreBoard.rowHeight * 5 + verticlePadding},
        width = boardWidth
    })

    self.quiper:loadQuip(QuipManager.getRandomQuip("killScreen"))

end

function killScreen:update()

    if self.show == 0 then
        return
    end

    if self.quiper.quipping == 0 then
        self.quiper:loadQuip(QuipManager.getRandomQuip("killScreen"))
    end

    self.scoreBoard.scores = {
        math.random(1,255),
        math.random(1,255),
        math.random(1,255)
    }

    self.scoreBoard.winState = math.random(1,3)
    local playerNames = {"Meatbag","Supreme"}
    self.scoreBoard.playerNames = {
        playerNames[math.random(1,2)],
        playerNames[math.random(1,2)]
    }

    self.quiper:update()

    local shapes = {"x","o"}
    self.board:updateMoves(math.random(1,9),shapes[ math.random(1,2) ])
    self.board.moves[math.random(1,9)] = ""

end


function killScreen:draw()

    if self.show == 0 then
        return
    end

    love.graphics.setColor({1,1,1} )
    love.graphics.rectangle("fill",self.location[1],self.location[2],Game.windowWidth,Game.windowHeight) 

    self.supremeBig:draw()
    self.supremeMid:draw()
    self.supremeSmall:draw()
    self.quiper:draw()
    self.scoreBoard:draw()
    self.board:draw()


end

function killScreen:toggle()
    
    
    if self.show == 1 then
        self.glitchSound:stop()
        self.show = 0 
    else 
        self.glitchSound:play()
        self.show = 1 
    end

end 


return killScreen