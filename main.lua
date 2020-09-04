-- External Libraries
Utf8 = require("utf8")

-- Config
Config = require "config"

-- Local Libraries
Utils = require "lib/utilities"
SceneManager = require "lib/sceneManager"
QuipManager = require "lib/quipManager"
Game = require "lib/game"
MinMaxMove = require "lib/miniMaxMove"
RandomMove = require "lib/randomMove"

-- Entities
Supreme = require "entities/supreme"
Quiper = require "entities/quiper"
UserNameForm = require "entities/userNameForm"
TictactoeBoard = require "entities/tictactoeBoard"
ScoreBoard = require "entities/scoreBoard"
DebugMenu = require "entities/debugMenu"
KillScreen = require "entities/killScreen"
WinnerMessage = require "entities/winnerMessage"
DebugNotation = require "entities/debugNotation"
WagerDialogue = require "entities/wagerDialogue"

math.randomseed( os.time() )
love.window.setTitle( "Supreme TicTacToe" )

function love.load()
 
    love.window.setMode( Config.screenSize[1], Config.screenSize[2] )
    love.keyboard.setKeyRepeat(true)

    Game.load(Config.debug)
    QuipManager.load()
    SceneManager.load(Config.startScene)
   
end

function love.update()
    -- print(debug.getinfo(2).name)
 
    Game.update()
    SceneManager.update()

end

function love.draw()
    SceneManager.draw()
end

function love.conf(t)
	t.console = true
end

function love.textinput(text)
    SceneManager.textinput(text)
end

function love.keypressed(key)
    SceneManager.keypressed(key)
end

function love.mousepressed(x, y, button, istouch)
    SceneManager.mousepressed(x, y, button, istouch)
end

function love.graphics.roundrect(mode, x, y, width, height, xround, yround)
    local points = {}
    local precision = (xround + yround) * .1
    local tI, hP = table.insert, .5*math.pi
    if xround > width*.5 then xround = width*.5 end
    if yround > height*.5 then yround = height*.5 end
    local X1, Y1, X2, Y2 = x + xround, y + yround, x + width - xround, y + height - yround
    local sin, cos = math.sin, math.cos
    for i = 0, precision do
        local a = (i/precision-1)*hP
        tI(points, X2 + xround*cos(a))
        tI(points, Y1 + yround*sin(a))
    end
    for i = 0, precision do
        local a = (i/precision)*hP
        tI(points, X2 + xround*cos(a))
        tI(points, Y2 + yround*sin(a))
    end
    for i = 0, precision do
        local a = (i/precision+1)*hP
        tI(points, X1 + xround*cos(a))
        tI(points, Y2 + yround*sin(a))
    end
    for i = 0, precision do
        local a = (i/precision+2)*hP
        tI(points, X1 + xround*cos(a))
        tI(points, Y1 + yround*sin(a))
    end
    love.graphics.polygon(mode, points)
end