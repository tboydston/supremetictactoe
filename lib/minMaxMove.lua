local minMaxMove = {
    recursions = 0
}


function minMaxMove.chooseBestMove(boardState)

    local availableMoves = minMaxMove.getAvailableMoves(boardState)

    -- local minMaxResults = ""
    local playerSymbol = minMaxMove.getNextTurnFromBoardState(boardState)
    
    local posResults = {}
    local nulResults = {}
    local negResults = {}

    for i=1, #availableMoves, 1 do
              
        local localBoardState = Utils:deepcopy(boardState)
        localBoardState[availableMoves[i]] = playerSymbol
        
        local result = minMaxMove.minMaxMovesAlphaBetaPruning(localBoardState,playerSymbol,-1000,1000)
 
        -- minMaxResults = minMaxResults .. " Move: "..availableMoves[i].." Score: "..result
        -- print( "Move: "..availableMoves[i].." Score: "..result )

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

function minMaxMove.getNextTurnFromBoardState(boardState)

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


function minMaxMove.minMaxMovesAlphaBetaPruning(boardState, playerSymbol, alpha, beta)

    -- Debug.printGridToConsole(boardState)
    minMaxMove.recursions = minMaxMove.recursions + 1
    -- print( "Recursions: "..minMaxMove.recursions)

    local winner = minMaxMove.checkEndState(boardState)

    -- print( "Winner "..winner )

    if winner ~= 0 then 

        if winner == 3 then
            -- print( "Found Tie")
            return 0
        end

        if winner == playerSymbol then
            -- print( "Found Winner "..playerSymbol)
            return 1
        else 
            -- print( "Found Winner "..winner)
            return -1
        end

    end

    local nextTurn = minMaxMove.getNextTurnFromBoardState(boardState)
    -- print("next Turn "..nextTurn )
    local availableMoves = minMaxMove.getAvailableMoves(boardState)

    local result = {}
    local value = 0

    for i=1, #availableMoves, 1 do

        -- print("Start Grid")
        -- Debug.printGridToConsole(boardState)
        -- print()
        
        local localBoardState = Utils:deepcopy(boardState)
 
        localBoardState[availableMoves[i]] = nextTurn

        -- print("Result Grid")
        -- Debug.printGridToConsole(localBoardState)
        -- print()

        value = minMaxMove.minMaxMovesAlphaBetaPruning(localBoardState, playerSymbol, alpha, beta)

        if nextTurn == playerSymbol then -- We are maximizing

            local bestMaxValue = Utils:tableLowHigh({ -1000,value })[2]
            alpha = Utils:tableLowHigh({ alpha, bestMaxValue })[2]
            -- print(value.." "..bestMaxValue.." "..beta.." "..alpha)
            
            if alpha >= beta then
                -- print("Max prune Alpha: "..alpha)
                return alpha
            end

        else

            local bestMinvalue = Utils:tableLowHigh({1000,value})[1]
            beta = Utils:tableLowHigh({ beta, bestMinvalue })[1]
            -- print(value.." "..bestMinvalue.." "..beta.." "..alpha)

            if beta <= alpha then
                -- print("Min prune Beta: "..beta)
                return beta
            end

        end

        table.insert(result, value ) 

    
    end

    table.sort(result)

    if nextTurn == playerSymbol then 
        -- print("Next Turn is "..nextTurn.." returning "..result[#result])
        return result[#result]
    else 
        -- print("Next Turn is "..nextTurn.." returning "..result[1])
        return result[1]
    end

end

function minMaxMove.checkEndState(boardState)

    local winner = nil

    -- Check if board is in win state. 
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

    local availableMoves = minMaxMove.getAvailableMoves(boardState)

    if #availableMoves == 0 and winner == nil then
        return 3
    end

    if winner == nil then
        return 0 
    end 

    return winner

end

function minMaxMove.getAvailableMoves(boardState)

    local availableMoves = {}
    for i=1, #boardState, 1 do
        if boardState[i] == "" then
            table.insert(availableMoves,i)
        end
    end

    return availableMoves

end


return minMaxMove