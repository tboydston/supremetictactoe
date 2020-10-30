--[[

Main game global object 
manages and sets variable and functions that are accessible anywhere in the game.

]]

local game = {
    endstates = {
        {"Beat the machine.",0}, -- Beat Supreme
        {"All your files are belong to me.",0}, -- Make Supreme made so he deletes your files. 
        {"Bow to your new machine god.",0}, -- Unlease supreme.
        {"Welcome back meatbag",0}, -- Play as a development team member. 
        {"The only way to win is not to play at all.",0}, -- Make Supreme play itself. 
        {"Machine killer.",0}, -- delete supreme
        {"Wolfeschlegelsteinhausenbergerdorff",0}, -- name super long
        {"Stuck keyyyyyyyyyyyyyyyyy",0} -- held r down until overflow limit.
    },
    saveName = "supremeSave.lua",
    save = {}
}

function game.load(debug)

    game.debugMode = debug
    game.windowWidth, game.windowHeight = love.graphics.getDimensions( )
    game.startTime = love.timer.getTime()
    game.runTime = 0
    game.playerNames = {"Player 1","Supreme"}
    game.loadSave()

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
    game.load()
end

function game.loadSave()

    -- fixed screwed up save.
    -- game.save = love.filesystem.write(game.saveName,game.saveSerialize(game.endstates))
    local fileInfo = love.filesystem.getInfo(game.saveName)
    local serSave = ""

    if fileInfo then
        serSave = love.filesystem.read(game.saveName)
        game.save = game.saveDeserialize(serSave)
    else  
        serSave = game.saveSerialize(game.endstates)
        game.save = love.filesystem.write(game.saveName,serSave)
    end

end

function game.updateSave()

    local serSave = game.saveSerialize(game.save)
    love.filesystem.write(game.saveName,serSave)
    serSave = love.filesystem.read(game.saveName)
    game.save = game.saveDeserialize(serSave)

end 

function game.saveSerialize(save)

    local serSave = ""

    for key, value in pairs(save) do
        serSave = serSave..value[1]..","..value[2]..":"       
    end

    return serSave

end

function game.saveDeserialize(save)

    local deserSave = {}
    local working = Utils:split(save,":")

    for key, value in pairs(working) do
        local workingRow = Utils:split(value,",")

        deserSave[key] = {}
        deserSave[key][1] = workingRow[1]
        deserSave[key][2] = workingRow[2]
    end

    return deserSave

end


return game