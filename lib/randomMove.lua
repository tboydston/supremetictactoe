--[[
    Dumb AI that picks a random move on the board given the current board state. 
]]

local randomMove = {

}

--[[
    Chooses a random move based on the current boards state. 
    @param boardState  Board state table {"","x","o","","","x","o","",""} 
    @return number Position in board state table to make next move. 
]]
function randomMove.chooseRandomMove(boardState)
    
    local emptySquares = randomMove.getAvailableMoves(boardState)
    return emptySquares[math.random(1,#emptySquares )]

end 

--[[
    Gets available moves from board state.
    @param boardState table Board state table {"","x","o","","","x","o","",""} 
    @return availableMoves table  
]]
function randomMove.getAvailableMoves(boardState)

    local availableMoves = {}
    for i=1, #boardState, 1 do
        if boardState[i] == "" then
            table.insert(availableMoves,i)
        end
    end

    return availableMoves

end

return randomMove