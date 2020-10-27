local gameMenu = {
    
    location = {500,500},
    dimensions = {100,50},

    buttonFontSize = 15,
    bodyFontSize = 25,
    titleFontSize = 30,
    
    buttonText = "Accept",
    titleText = "- Menu -",
    show = 0

}


function gameMenu:new(newObject)
    newObject = newObject or {}          
    setmetatable(newObject,self)
    self.__index = self  
    newObject:load()    
    return newObject
end

function gameMenu:load()

    self.dialogue = Dialogue:new({
        location = self.location,
        dimensions = self.dimensions,
        titleFontSize = self.titleFontSize,
        buttonFontsize = self.buttonFontSize,
        bodyFontSize = self.bodyFontSize,
        titleText = self.titleText, 
    })

    self.closeButtonLoc = {
        self.location[1]+self.dimensions[1]*0.1,
        self.location[2]+self.dimensions[2]*0.8,
    }

    self.userMenuButtonLoc = {
        self.location[1]+self.dimensions[1]*0.1,
        self.location[2]+self.dimensions[2]*0.3
    }

    self.quitButtonLoc = {
        self.location[1]+self.dimensions[1]*0.1,
        self.location[2]+self.dimensions[2]*0.5
    }

    gameMenu.gameMenuText = {
        -- 'Flee like a coward?',
        -- "Don't be scared. It's just tic-tac-toe.",
        -- "Fine, I was getting bored with you anyway.",
    }

    self.dialogue.bodyText =  self.gameMenuText[math.random(1,#self.gameMenuText)]
    

end

function gameMenu:update()


end

function gameMenu:draw()

    if self.show == 1 then 

        self.dialogue:box()
        self.dialogue:title()
        self.dialogue:body()
        self.closeButtonDim = self.dialogue:button("Close",self.closeButtonLoc,{0,0,0},{0,0,0})
        self.userMenuButtonDim = self.dialogue:button("Change User",self.userMenuButtonLoc,{0,0,0},{0,0,0})
        self.quitButtonDim = self.dialogue:button(" Quit Game ",self.quitButtonLoc,{1,0,0},{1,0,0})
    end 

end


function gameMenu:box()

    love.graphics.setColor(self.color)
    love.graphics.setLineWidth( self.borderLineWidth )
    love.graphics.roundrect("line", self.location[1], self.location[2], self.dimensions[1], self.dimensions[2], self.corners[1], self.corners[2])

end

function gameMenu:text()

    love.graphics.setNewFont(self.fontFile, 25)
    love.graphics.setColor(self.fontColor)
    love.graphics.printf( self.titleText, self.titleLoc[1], self.titleLoc[2], self.dimensions[1], "center" )  
    love.graphics.setNewFont(self.fontFile, 20 )
    love.graphics.printf( self.gameMenuText[math.random(1,#self.gameMenuText)], 
        self.titleLoc[1]+self.padding, 
        self.titleLoc[2]+self.lineHeight*2, 
        self.dimensions[1]-self.padding, "left" 
    )  

end

-- @refactor use dynamic button widths instead of fixed. 
function gameMenu:click(x,y)

    if Utils:inSquare(x,y,self.closeButtonLoc[1],self.closeButtonLoc[2],100,50) then
        return "close"
    end

    if Utils:inSquare(x,y,self.quitButtonLoc[1],self.quitButtonLoc[2],200,50) then
        return "quit"
    end

    if Utils:inSquare(x,y,self.userMenuButtonLoc[1],self.userMenuButtonLoc[2],200,50) then
        return "userMenu"
    end


    return false

end

function gameMenu:drawMenuIcon(loc)
    self.dialogue:button("Menu",loc,{0,0,0},{0,0,0})    
end

return gameMenu