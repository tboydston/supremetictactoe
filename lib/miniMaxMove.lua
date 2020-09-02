--[[
    MiniMax with alpha beta pruning AI manager. 
]]


local miniMaxMove = {
    recursions = 0
}

--[[
    Takes a boards state and choses the best move based on the current state. 
    @param boardState  Board state table {"","x","o","","","x","o","",""} 
    @return number Position in board state table to make next move. 
]]
function miniMaxMove.chooseBestMove(boardState)

    -- Get all available moves that need to be evaluated.
    local availableMoves = miniMaxMove.getAvailableMoves(boardState)

    -- Based on the current board state determine whose turn it is.
    local playerSymbol = miniMaxMove.getNextTurnFromBoardState(boardState)
    
    local posResults = {}
    local nulResults = {}
    local negResults = {}

    -- loop through each of the available moves to evaluate their score.
    for i=1, #availableMoves, 1 do
        
        -- Create a local working copy of the board. 
        local localBoardState = Utils:deepcopy(boardState)
        -- Make a move on the local board to evaluate.
        localBoardState[availableMoves[i]] = playerSymbol
        
        -- Sends current state to recursive function to evaluate move we are testing for current player.
        local result = miniMaxMove.miniMaxMovesAlphaBetaPruning(localBoardState,playerSymbol,-1000,1000)
 
        if result > 0 then
            table.insert(posResults,availableMoves[i])
        end 

        if result < 0 then
            table.insert(negResults,availableMoves[i])
        end 

        if result == 0 then
            table.insert(nulResults,availableMoves[i])
        end 

    end

    -- Equal results are randomized to prevent the same pattern from appearing when the same squares are selected. 
    if #posResults > 0 then
        return posResults[ math.random(1,#posResults ) ]
    end

    if #nulResults > 0 then
        return nulResults[ math.random(1,#nulResults ) ]
    end

    if #negResults > 0 then
        return negResults[ math.random(1,#negResults ) ]
    end
    
end 


--[[
    Based on the current board state returns the next players symbol.
    @param boardState table Board state table {"","x","o","","","x","o","",""}    
    @return 'x'
]]
function miniMaxMove.getNextTurnFromBoardState(boardState)

    local xcount = 0
    local ocount = 0

    for i=1, #boardState, 1 do

       if boardState[i] == 'x' then
        xcount = xcount + 1
       elseif boardState[i] == 'o' then 
        ocount = ocount + 1        
       end 

    end

    if xcount + ocount == 9 then 
        return 0
    end 

    if xcount > ocount then
        return 'o'
    else
        return 'x'
    end

    return 'x'

end

--[[
    Recursive function to determine rank moves based on a current board state. 
    @param boardState  table  Board state table {"","x","o","","","x","o","",""} 
    @param playerSymbol  string  Symbol of current player being evaluated ("x" or "o")
    @param alpha number
    @param beta number
]]
function miniMaxMove.miniMaxMovesAlphaBetaPruning(boardState, playerSymbol, alpha, beta)

    -- We count the recursion to help figure out if the algo is working too hard. 
    miniMaxMove.recursions = miniMaxMove.recursions + 1

    -- Check the current board state to see if there is a winner.
    local winner = miniMaxMove.checkEndState(boardState)

    if winner ~= 0 then 

        if winner == 3 then
            -- DEBUG
            -- print( "Found Tie")
            return 0
        end

        if winner == playerSymbol then
            -- DEBUG
            -- print( "Found Winner "..playerSymbol)
            return 1
        else
            -- DEBUG 
            -- print( "Found Winner "..winner)
            return -1
        end

    end

    -- If no winner was found we determine who the next player is based on the board state.
    local nextTurn = miniMaxMove.getNextTurnFromBoardState(boardState)
    -- Extract available moves from board state.
    local availableMoves = miniMaxMove.getAvailableMoves(boardState)

    local result = {}
    local value = 0

    -- loop through each of the available moves to evaluate their score.
    for i=1, #availableMoves, 1 do
    
        -- Create a local working copy of the board. 
        local localBoardState = Utils:deepcopy(boardState)
 
        -- Make a move on the local board to evaluate.
        localBoardState[availableMoves[i]] = nextTurn

        -- Sends current state to recursive function to evaluate move we are testing for current player.
        value = miniMaxMove.miniMaxMovesAlphaBetaPruning(localBoardState, playerSymbol, alpha, beta)


        -- Result is current players result so we are maximizing.
        if nextTurn == playerSymbol then 

            local bestMaxValue = Utils:tableLowHigh({ -1000,value })[2]
            alpha = Utils:tableLowHigh({ alpha, bestMaxValue })[2]
           
            -- If or alpha is greater then our beta we return otherwise the branch is pruned. 
            if alpha >= beta then
                return alpha
            end

        -- Result is opponents result so we are minimizing. 
        else 

            local bestMinvalue = Utils:tableLowHigh({1000,value})[1]
            beta = Utils:tableLowHigh({ beta, bestMinvalue })[1]

            -- If the beta is less then our alpha we return otherwise the branch is pruned. 
            if beta <= alpha then
                return beta
            end

        end

        table.insert(result, value ) 

    
    end

    -- Results are sorted and top result returned.
    table.sort(result)

    if nextTurn == playerSymbol then 
        return result[#result]
    else 
        return result[1]
    end

end


--[[
    Check to see if the board is in an end state. Either there is a winner or a tie.
    @param boardState table Board state table {"","x","o","","","x","o","",""} 
    @return winner number  1,2, or 3 for player 1/2 or 3 for tie.
]]
function miniMaxMove.checkEndState(boardState)

    local winner = nil

 
    if boardState[1] == boardState[2] and boardState[2] == boardState[3] and boardState[1] ~= ""  then 
        winner = boardState[1]
    end
  
    if boardState[7] == boardState[8] and boardState[8] == boardState[9] and boardState[7] ~= "" then
        winner = boardState[7]
    end
    
    if boardState[4] == boardState[5] and boardState[5] == boardState[6] and boardState[4] ~= "" then
        winner = boardState[4]
    end  

    if boardState[1] == boardState[4] and boardState[4] == boardState[7] and boardState[1] ~= "" then
        winner = boardState[1]
    end 

    if boardState[3] == boardState[6] and boardState[6] == boardState[9] and boardState[3] ~= "" then 
        winner = boardState[3]
    end

    if boardState[2] == boardState[5] and boardState[5] == boardState[8] and boardState[2] ~= "" then 
        winner = boardState[2]
    end

    if boardState[1] == boardState[5] and boardState[5] == boardState[9] and boardState[1] ~= "" then
        winner = boardState[1]
    end

    if boardState[7] == boardState[5] and boardState[5] == boardState[3] and boardState[7] ~= "" then
        winner = boardState[7]
    end

    local availableMoves = miniMaxMove.getAvailableMoves(boardState)

    if #availableMoves == 0 and winner == nil then
        return 3
    end

    if winner == nil then
        return 0 
    end 

    return winner

end

--[[
    Gets available moves from board state.
    @param boardState table Board state table {"","x","o","","","x","o","",""} 
    @return availableMoves table  
]]
function miniMaxMove.getAvailableMoves(boardState)

    local availableMoves = {}
    for i=1, #boardState, 1 do
        if boardState[i] == "" then
            table.insert(availableMoves,i)
        end
    end

    return availableMoves

end


return miniMaxMove