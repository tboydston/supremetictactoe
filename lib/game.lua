--[[

Main game global object 
manages and sets variable and functions that are accessible anywhere in the game.

]]




local game = {

}

function game.load(debug)

    game.debugMode = debug
    game.windowWidth, game.windowHeight = love.graphics.getDimensions( )
    game.startTime = love.timer.getTime()
    game.runTime = 0
    game.playerNames = {"Player 1","Supreme"}
    
end

function game.update()
    game.updateRunningTime()
end 

function game.updateRunningTime()
    game.runTime = love.timer.getTime() - game.startTime
end

function game.reset()
    game.debugMode = 0
    game.runTime = 0
    game.playerNames = {"Player 1","Supreme"}
    game.startTime = love.timer.getTime()
end

return game