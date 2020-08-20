local game = {

}

function game.load(debug)

    game.debugMode = debug
    game.windowWidth, game.windowHeight = love.graphics.getDimensions( )
    game.startTime = love.timer.getTime()
    game.runTime = 0
    
end

function game.update()
    game.updateRunningTime()
end 

function game.updateRunningTime()
    game.runTime = love.timer.getTime() - game.startTime
end

return game