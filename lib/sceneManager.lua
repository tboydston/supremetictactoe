local sceneManager = {
    scenes = {},
    current = ""
}

function sceneManager.load(startScene) 
    
    local sceneFile = love.filesystem.getDirectoryItems( "scenes/" )
    
    for key, value in pairs(sceneFile) do

        local sceneNameTable = Utils:split(value,".")
        local sceneName = sceneNameTable[1]
        sceneManager.scenes[sceneName] = require ("scenes/"..sceneName )

    end

    sceneManager.change(startScene)
    
end

function sceneManager.change(newScene)
    
    if sceneManager.scenes[newScene] == nil then 
        return false 
    else 
        sceneManager.current = newScene
        sceneManager.scenes[newScene].load()
    end

    return true

end

function sceneManager.current()
    return sceneManager.current
end


function sceneManager.update()
    if sceneManager.scenes[sceneManager.current].update ~= nil then 
        sceneManager.scenes[sceneManager.current].update()
    end
end

function sceneManager.update()
    sceneManager.pass("update")
end

function sceneManager.draw()
    sceneManager.pass("draw")
end

function sceneManager.textinput(text)
    if sceneManager.scenes[sceneManager.current].textinput ~= nil then 
        sceneManager.scenes[sceneManager.current].textinput(text)
    end
end

function sceneManager.keypressed(key)
    if sceneManager.scenes[sceneManager.current].keypressed ~= nil then 
        sceneManager.scenes[sceneManager.current].keypressed(key)
    end
end

function sceneManager.mousepressed(x, y, button, istouch)
    if sceneManager.scenes[sceneManager.current].mousepressed ~= nil then 
        sceneManager.scenes[sceneManager.current].mousepressed(x, y, button, istouch)
    end
end

function sceneManager.pass(func)
    if sceneManager.scenes[sceneManager.current][func] ~= nil then 
        sceneManager.scenes[sceneManager.current][func]()
    end
end



return sceneManager