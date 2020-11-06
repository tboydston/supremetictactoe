local missleDefence = {
    backgroundColor = {0.1,0.1,0.1 }
}

function missleDefence.load()

    love.graphics.setBackgroundColor( missleDefence.backgroundColor[1], missleDefence.backgroundColor[2], missleDefence.backgroundColor[3] )

    local eyeCenter = {Game.windowWidth * 0.5,Game.windowHeight * 0.15}
    local eyeRadius = Game.windowWidth * 0.05

    local quipMaxWidth = Game.windowWidth * 0.3
    local quipLocation = { Game.windowWidth * 0.6 , (eyeCenter[2] - eyeRadius) }

    local raderRadius = Game.windowWidth * 0.2

    missleDefence.quiper = Quiper:new({
        location = quipLocation,
        maxWidth = quipMaxWidth,
        textColor = {1,1,1}
    })

    missleDefence.supreme = Supreme:new({
        eyeCenter = {eyeCenter[1],eyeCenter[2]},
        eyeRadius = eyeRadius
    })

    missleDefence.radar = Radar:new({
        location = {Game.windowWidth*0.75,eyeCenter[2]+eyeRadius+raderRadius+100},
        radius = raderRadius
    })

    missleDefence.satNet = SatNet:new({
        location = {Game.windowWidth*0.25,eyeCenter[2]+eyeRadius+raderRadius+100},
        radius = raderRadius,
        backgroundColor = missleDefence.backgroundColor
    })


    missleDefence.quiper:loadQuip(QuipManager.getRandomQuip("missleDefenceLoad") )


    
end


function missleDefence.update()

    missleDefence.quiper:update()
    missleDefence.radar:update()
    missleDefence.satNet:update()

end 

function missleDefence.draw()

    missleDefence.supreme:draw()
    missleDefence.quiper:draw()
    missleDefence.radar:draw()
    missleDefence.satNet:draw()


end





return missleDefence 
