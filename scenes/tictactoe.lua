local tictactoe = {
    backgroundColor = {1,1,1},
    playerType = {"h","c"},
    playStrategy = {"h","minMax"},
    winState = 0,
    playerMove = 1,
    playerShapes = {"x","o"},
    playerTurnQuipChance = 30,
    supremeTurnQuipChance = 30,
    drawDebug = 1,
    debugTieStackOverflowLimit = 255,
    maxScore = 10,
    gameOver = 0,

}

function tictactoe.load()

    tictactoe.playerSounds = {
        love.audio.newSource("assets/sounds/player1move.wav","static"),
        love.audio.newSource("assets/sounds/player2move.wav","static")
    }

    tictactoe.roundEndSounds = {
        love.audio.newSource("assets/sounds/player1win.wav","static"),
        love.audio.newSource("assets/sounds/player2win.wav","static"),
        love.audio.newSource("assets/sounds/tie.wav","static")
    }

    tictactoe.errorSound = love.audio.newSource("assets/sounds/player1move.wav","static")

    love.graphics.setBackgroundColor( tictactoe.backgroundColor[1], tictactoe.backgroundColor[2], tictactoe.backgroundColor[3] )

    local eyeCenter = {Game.windowWidth * 0.5,Game.windowHeight * 0.15}
    local eyeRadius = Game.windowWidth * 0.05
    local boardWidth = Game.windowHeight * 0.6

    local quipMaxWidth = Game.windowWidth * 0.3
    local quipLocation = { Game.windowWidth * 0.6 , (eyeCenter[2] - eyeRadius) }
     
    tictactoe.quipKillScreenLocation = { Game.windowWidth * 0.01, Game.windowHeight * 0.4 }
    tictactoe.quipKillScreenWidth = Game.windowWidth * 0.13

    tictactoe.quiper = Quiper:new({
        location = quipLocation,
        maxWidth = quipMaxWidth
    })

    tictactoe.supreme = Supreme:new({
        eyeCenter = {eyeCenter[1],eyeCenter[2]},
        eyeRadius = eyeRadius
    })

    tictactoe.board = TictactoeBoard:new({
        location = { ( Game.windowWidth - boardWidth ) / 2,Game.windowHeight * 0.3 },
        width = boardWidth,
        show = 1
    })

    tictactoe.scoreBoard = ScoreBoard:new({
        location = { Game.windowWidth * 0.1 , (eyeCenter[2] - eyeRadius) },
        playerNames = Game.playerNames,
        maxScore = tictactoe.maxScore 
    })

    tictactoe.debugMenu = DebugMenu:new({
        location = { tictactoe.board.location[1] + boardWidth + Game.windowWidth *0.05 ,Game.windowHeight * 0.7},
        debugTable = {
            {'DEBUG'},
            {'P1 Type:'},
            {'Human','Computer'},
            {'P2 Type:'},
            {'Human','Computer'},
            {'P1 Strategy:'},
            {'NA','random','miniMax'},
            {'P2 Strategy:'},
            {'NA','random','miniMax'}
        },
        drawDebug = Game.debugMode
    })

    tictactoe.killScreen = KillScreen:new({
        show = 0,
        location = { Game.windowWidth / 2, 0 }
    })

    tictactoe.winnerMessage = WinnerMessage:new({
        location = { 0, Game.windowHeight * 0.3 },
        dimensions = {Game.windowWidth,Game.windowHeight * 0.7},
        show = 0
    })

    tictactoe.gameOverReset()

    if ( Game.playerNames[1] == Game.playerNames[2] ) then
        tictactoe.playerType = {"c","c"}
        tictactoe.playStrategy = {"minMax","minMax"}
    end

    tictactoe.setDebugMenu() 

    if Game.debugMode == 1 then
        tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("firstPlayDebug") )
    else 
        tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("firstPlay") )
    end

end

function tictactoe.update()
    
    -- If the round is human v computer we wait for quips to finish. 
    -- If the round is computer v computer we do not. 
    if ( tictactoe.playerType[tictactoe.playerMove] == "c" and 
        tictactoe.winState == 0 and 
        tictactoe.quiper.quipping == 0 and 
        tictactoe.killScreen.show == 0 ) or
        ( tictactoe.playerType[1] == "c" and
          tictactoe.playerType[2] == "c" and
          tictactoe.winState == 0 and
          tictactoe.killScreen.show == 0
        )
    then
        
        tictactoe.processAiMove()
        tictactoe.processGameState()

    end

    tictactoe.quiper:update()
    tictactoe.killScreen:update()

end

function tictactoe.draw()

    tictactoe.supreme:draw()
    tictactoe.board:draw()
    tictactoe.scoreBoard:draw()
    tictactoe.debugMenu:draw()
    tictactoe.killScreen:draw()
    tictactoe.winnerMessage:draw()
    tictactoe.quiper:draw()

end

function tictactoe.mousepressed(x, y, button, istouch)

    tictactoe.processDebugClick(x,y)

    if tictactoe.killScreen.show == 1 or tictactoe.gameOver == 1 then
        return
    end

    if tictactoe.winState > 0 and tictactoe.scoreBoard:resetClick(x, y) == true then
        tictactoe.reset()
        return
    end


    local clickedSquare = tictactoe.board:checkSquareClick(x,y)
    
    -- Check to see if someone clicked in a box
    if clickedSquare > 0 and tictactoe.winState == 0 and tictactoe.playerType[tictactoe.playerMove] == "h" then
        if tictactoe.board:updateMoves(clickedSquare,tictactoe.playerShapes[tictactoe.playerMove]) == false then
            return
        end
        tictactoe.playerSounds[1]:play()
        tictactoe.board:draw()
        if math.random(1,100) <= tictactoe.playerTurnQuipChance then
            tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("playerTurn") )
        end
        tictactoe.processGameState()

    end


end

function tictactoe.processDebugClick(x,y)

    local clickInDebugMenu = tictactoe.debugMenu:clickInTable(x,y)

    if clickInDebugMenu == false then
        return
    end
    
    if Utils:tablesMatch( clickInDebugMenu, {3,1} ) then 

        tictactoe.playerType[1] = "h"

    end 

    if Utils:tablesMatch( clickInDebugMenu, {3,2} ) then 

        tictactoe.playerType[1] = "c"
        if tictactoe.playStrategy[1] == "h" then
            tictactoe.playStrategy[1] = "random"
        end     
    end 

    if Utils:tablesMatch( clickInDebugMenu, {5,1} ) then 
        tictactoe.playerType[2] = "h"
        tictactoe.playStrategy[2] = "h"
    end 

    if Utils:tablesMatch( clickInDebugMenu, {5,2} )  then 
        tictactoe.playerType[2] = "c"
        if tictactoe.playStrategy[2] == "h" then
            tictactoe.playStrategy[2] = "random"
        end     
    end 

    if Utils:tablesMatch( clickInDebugMenu, {7,1} ) then 
        tictactoe.playerType[1] = "h"
        tictactoe.playStrategy[1] = "h"
    end 

    if Utils:tablesMatch( clickInDebugMenu, {7,2} ) then 
        tictactoe.playerType[1] = "c"
        tictactoe.playStrategy[1] = "random"
    end 

    if Utils:tablesMatch( clickInDebugMenu, {7,3} )then 
        tictactoe.playerType[1] = "c"
        tictactoe.playStrategy[1] = "minMax"
    end 

    if Utils:tablesMatch( clickInDebugMenu, {9,1} ) then 
        tictactoe.playerType[2] = "h"
        tictactoe.playStrategy[2] = "h"
    end 

    if Utils:tablesMatch( clickInDebugMenu, {9,2} ) then 
        tictactoe.playerType[2] = "c"
        tictactoe.playStrategy[2] = "random"
    end 

    if Utils:tablesMatch( clickInDebugMenu, {9,3} ) then 
        tictactoe.playerType[2] = "c"
        tictactoe.playStrategy[2] = "minMax"
    end 

    tictactoe.setDebugMenu()

end

function tictactoe.processGameState()

    -- Check if there is a winner.
    local boardWinState = tictactoe.checkWinState()
    
    -- Still open squares and no winner our turn is over. 
    if boardWinState == false then
        tictactoe.updateTurn()
        return
    end

    if boardWinState == "tie" then
        tictactoe.winState = 3
        tictactoe.updateWinState(3)
        tictactoe.scoreBoard:updateScore(3)
        tictactoe.evaluteTieOverflowEndgame()

        return 
    end

    tictactoe.board.winLine = boardWinState
    tictactoe.scoreBoard:updateScore(tictactoe.playerMove)
    tictactoe.updateWinState(tictactoe.playerMove)


end

function tictactoe.evaluteTieOverflowEndgame()

    if tictactoe.scoreBoard.scores[3] >= tictactoe.debugTieStackOverflowLimit then
        tictactoe.killScreen.show = 1
        tictactoe.quiper.location = tictactoe.quipKillScreenLocation
        tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("bufferOverflow") )
    end 
        
end

function tictactoe.checkWinState()

    local boardState = tictactoe.board.moves

    if boardState[1] == boardState[2] and boardState[2] == boardState[3] and boardState[1] ~= ""  then  
        return {1,3} 
    end

    if boardState[7] == boardState[8] and boardState[8] == boardState[9] and boardState[7] ~= "" then
        return {7,9} 
    end
    
    if boardState[4] == boardState[5] and boardState[5] == boardState[6] and boardState[4] ~= "" then
        return {4,6}  
    end  

    if boardState[1] == boardState[4] and boardState[4] == boardState[7] and boardState[1] ~= "" then
        return {1,7} 
    end 

    if boardState[3] == boardState[6] and boardState[6] == boardState[9] and boardState[3] ~= "" then 
        return {3,9}        
    end

    if boardState[2] == boardState[5] and boardState[5] == boardState[8] and boardState[2] ~= "" then 
        return {2,8}        
    end

    if boardState[1] == boardState[5] and boardState[5] == boardState[9] and boardState[1] ~= "" then
        return {1,9}    
    end

    if boardState[7] == boardState[5] and boardState[5] == boardState[3] and boardState[7] ~= "" then
        return {7,3}     
    end

    -- Check if there are still empty squares. 
    for key, value in pairs(boardState) do
        if boardState[key] == "" then
            return false
        end 
    end

    -- No winners, no empty squares. Must be a tie. 
    return "tie"

end

function tictactoe.updateTurn() 
    if tictactoe.playerMove == 1 then
        tictactoe.playerMove = 2
    else 
        tictactoe.playerMove = 1
    end
end 

function tictactoe.processAiMove()

    if tictactoe.playStrategy[tictactoe.playerMove] == "random" then 
        local nextMove = RandomMove.chooseRandomMove(tictactoe.board.moves)
        tictactoe.board.moves[nextMove] = tictactoe.playerShapes[tictactoe.playerMove]
    end

    if tictactoe.playStrategy[tictactoe.playerMove] == "minMax" then 
        local nextMove = MinMaxMove.chooseBestMove(tictactoe.board.moves)
        tictactoe.board.moves[nextMove] = tictactoe.playerShapes[tictactoe.playerMove]
    end

    if math.random(1,100) <= tictactoe.supremeTurnQuipChance then
        tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("supremeTurn") )
    end

    tictactoe.playerSounds[2]:play()

end

function tictactoe.textinput(text)

    if tictactoe.killScreen.show == 1 then
        return
    end

    if text == "r" then
        if tictactoe.gameOver == 1 then 
            -- If the player is the winner then the game will reset itself after going through the credits 
            -- so we don't allow the player to reset manually. 
            if tictactoe.winState == 1 then
                return
            end
            tictactoe.gameOverReset()
        else
            if tictactoe.winState == 0 then 
                tictactoe.scoreBoard:updateScore(3)
                tictactoe.evaluteTieOverflowEndgame()
            end
            tictactoe.reset()
        end 
    end
end 

function tictactoe.reset()


    tictactoe.winState = 0
    tictactoe.playerMove = 1
    tictactoe.playerMove = 1
    tictactoe.board:resetBoard() 
    tictactoe.scoreBoard:reset() 
    tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("playReset") )

end

function tictactoe.updateWinState(newWinState)

    tictactoe.winState = newWinState
    tictactoe.scoreBoard.winState = newWinState

    if tictactoe.scoreBoard.scores[1] >= tictactoe.maxScore or tictactoe.scoreBoard.scores[2] >= tictactoe.maxScore then

        if newWinState == 2 then
            tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("supremeGameWin") )
        end 
    
        if newWinState == 1 then
            tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("playerGameWin") )
        end
        tictactoe.gameIsOver()
        return
    end

    if newWinState == 3 then
        
        tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("tieMatch") )
    end 

    if newWinState == 2 then
        tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("supremeWin") )
    end 

    if newWinState == 1 then
        tictactoe.quiper:loadQuip(QuipManager.getRandomQuip("playerWin") )
    end

    tictactoe.roundEndSounds[newWinState]:play()

    if ( Game.playerNames[1] == Game.playerNames[2] ) then
        tictactoe.reset()
    end

    
    

end

function tictactoe.gameIsOver()

    tictactoe.gameOver = 1
    tictactoe.board.show = 0

    local winSound = "win"
    local showPlayAgain = 0
    if tictactoe.winState == 2 then
        winSound = "lose"
        showPlayAgain = 1
    end
    
    tictactoe.winnerMessage:toggle(winSound, Game.playerNames[tictactoe.playerMove],showPlayAgain)

end

function tictactoe.gameOverReset()

    tictactoe.playerType = {"h","c"}
    tictactoe.playStrategy = {"h","minMax"}
    tictactoe.scoreBoard.scores = {0,0,0}
    tictactoe.reset()
    tictactoe.gameOver = 0
    tictactoe.board.show = 1

    if tictactoe.winnerMessage.show == 1 then
        tictactoe.winnerMessage:toggle()
    end


end

function tictactoe.setDebugMenu()

    tictactoe.debugMenu.activeTable[1] = {0}
    tictactoe.debugMenu.activeTable[2] = {0}
    
    if tictactoe.playerType[1] == 'h' then
        tictactoe.debugMenu.activeTable[3] = {1,0}
    else 
        tictactoe.debugMenu.activeTable[3] = {0,1}
    end
    
    tictactoe.debugMenu.activeTable[4] = {0}

    if tictactoe.playerType[2] == 'h' then
        tictactoe.debugMenu.activeTable[5] = {1,0}
    else 
        tictactoe.debugMenu.activeTable[5] = {0,1}
    end

    tictactoe.debugMenu.activeTable[6] = {0}

    if tictactoe.playerType[1] == 'h' then
        tictactoe.debugMenu.activeTable[7] = {1,0,0}
    elseif tictactoe.playStrategy[1] == 'minMax' then
        tictactoe.debugMenu.activeTable[7] = {0,0,1}
    else
        tictactoe.debugMenu.activeTable[7] = {0,1,0}
    end

    tictactoe.debugMenu.activeTable[8] = {0}

    if tictactoe.playerType[2] == 'h' then
        tictactoe.debugMenu.activeTable[9] = {1,0,0}
    elseif tictactoe.playStrategy[2] == 'minMax' then
        tictactoe.debugMenu.activeTable[9] = {0,0,1}
    else
        tictactoe.debugMenu.activeTable[9] = {0,1,0}
    end

end 

return tictactoe