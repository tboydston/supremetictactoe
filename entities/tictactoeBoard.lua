local tictactoeBoard = {
    location = {100,100},
    width = 800,
    backgroundColor = {1,1,1},
    lineColor = {0,0,0},
    xcolor = {1,0,0},
    ocolor = {1,0,0},
    winLineColor = {0,0,1},
    moves = {"","","","","","","","",""},
    winLine = {0,0}
}

function tictactoeBoard:load()
    
    self.squareSize = self.width * 0.3
    self.lineSize = self.width * 0.05
    self.column1 = self.location[1]
    self.column2 = self.location[1]+self.lineSize+self.squareSize
    self.column3 = self.location[1]+self.lineSize*2+self.squareSize*2
    self.row1 = self.location[2]
    self.row2 = self.location[2]+self.squareSize+self.lineSize
    self.row3 = self.location[2]+self.squareSize*2+self.lineSize*2
    self.cords = {{self.column1,self.row1},{self.column2,self.row1},{self.column3,self.row1},{self.column1,self.row2},{self.column2,self.row2},{self.column3,self.row2},{self.column1,self.row3},{self.column2,self.row3},{self.column3,self.row3}}

end

function tictactoeBoard:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end 

function tictactoeBoard:draw()

    love.graphics.setColor(self.lineColor[1],self.lineColor[2],self.lineColor[3] )
    love.graphics.rectangle("fill",self.cords[1][1],self.cords[1][2],self.width,self.width)

    love.graphics.setColor( self.backgroundColor[1], self.backgroundColor[2], self.backgroundColor[3] )
 
    for key, value in pairs(self.cords) do    
        love.graphics.rectangle("fill",self.cords[key][1],self.cords[key][2],self.squareSize,self.squareSize)
    end

    self:drawMoves()

    if self.winLine[1] > 0 and self.winLine[2] > 0 then
        self:drawWinLine(self.winLine[1],self.winLine[2])
    end

end

function tictactoeBoard:drawMoves()

    for key, value in pairs(self.moves) do
        if value == "x" then
            self:drawX(key)
        end 
    end

    for key, value in pairs(self.moves) do
        if value == "o" then
            self:drawO(key)
        end 
    end

end

function tictactoeBoard:drawX(square)

    local squareSize = self.squareSize
    local x = self.cords[square][1]
    local y = self.cords[square][2]

    love.graphics.setColor(self.xcolor[1], self.xcolor[2], self.xcolor[3]) 
    love.graphics.rectangle("fill",x,y,squareSize,squareSize) 
    love.graphics.setColor(255, 255, 255)  
    love.graphics.polygon( "fill",x,y+squareSize*0.1, x, y+squareSize*0.9, x+squareSize*0.4, y+squareSize*0.5 )
    love.graphics.polygon( "fill",x+squareSize,y+squareSize*0.1, x+squareSize, y+squareSize*0.9, x+squareSize*0.6, y+squareSize*0.5 )
    love.graphics.polygon( "fill",x+squareSize*0.1,y, x+squareSize*0.9, y, x+squareSize*0.5, y+squareSize*0.4 )
    love.graphics.polygon( "fill",x+squareSize*0.1,y+squareSize, x+squareSize*0.9, y+squareSize, x+squareSize*0.5, y+squareSize*0.6 )

end

function tictactoeBoard:drawO(square)

    local squareSize = self.squareSize
    local x = self.cords[square][1]
    local y = self.cords[square][2]

    love.graphics.setColor(self.ocolor[1], self.ocolor[2], self.ocolor[3]) 
    love.graphics.circle( "fill", x+squareSize*0.5, y+squareSize*0.5, squareSize*0.5 ) 
    love.graphics.setColor(255, 255, 255 ) 
    love.graphics.circle( "fill", x+squareSize*0.5, y+squareSize*0.5, squareSize*0.4 )
    
end


function tictactoeBoard:drawWinLine(s1,s2)

    local x1 = 0
    local y1 = 0
    local x2 = 0
    local y2 = 0
    local gridCord = self.cords
    local squareSize = self.squareSize
    local color = self.winLineColor
    local direction = ""

    if math.abs(s1 - s2) == 2 then 
        direction = "h"
    end 

    if math.abs(s1 - s2) == 6 then 
        direction = "v"
    end 

    if math.abs(s1 - s2) == 4 then 
        direction = "du"
    end 

    if math.abs(s1 - s2) == 8 then 
        direction = "d"
    end 

    if direction == "d" then
        x1 = gridCord[s1][1]
        y1 = gridCord[s1][2]
        x2 = gridCord[s2][1]+squareSize
        y2 = gridCord[s2][2]+squareSize
    end

    if direction == "du" then
        x1 = gridCord[s1][1]
        y1 = gridCord[s1][2]+squareSize
        x2 = gridCord[s2][1]+squareSize
        y2 = gridCord[s2][2]
    end

    if direction == "h" then
        x1 = gridCord[s1][1]
        y1 = gridCord[s1][2]+squareSize*0.5
        x2 = gridCord[s2][1]+squareSize
        y2 = gridCord[s2][2]+squareSize*0.5
    end

    if direction == "v" then
        x1 = gridCord[s1][1]+squareSize*0.5
        y1 = gridCord[s1][2]
        x2 = gridCord[s2][1]+squareSize*0.5
        y2 = gridCord[s2][2]+squareSize
    end


    love.graphics.setColor(color[1],color[2],color[3])
    love.graphics.setLineWidth( 10 )
    love.graphics.line(x1,y1,x2,y2)

end 

function tictactoeBoard:checkSquareClick(clickX,clickY)
    
    for key, value in pairs(self.cords) do
        if Utils:inSquare(clickX,clickY,self.cords[key][1],self.cords[key][2],self.squareSize,self.squareSize) then
            return key
        end

    end

    return 0 

end

function tictactoeBoard:updateMoves(square,shape)
    if self.moves[square] == "" then
        self.moves[square] = shape
        return true
    else 
        return false
    end
end 

function tictactoeBoard:resetBoard()
    self.moves = {"","","","","","","","",""}
    self.winLine = {0,0}
end



return tictactoeBoard