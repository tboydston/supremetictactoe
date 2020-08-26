local randomMove = {

}

function randomMove.chooseRandomMove(boardState)
    
    local emptySquares = randomMove.getAvailableMoves(boardState)
    return emptySquares[math.random(1,#emptySquares )]

end 

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