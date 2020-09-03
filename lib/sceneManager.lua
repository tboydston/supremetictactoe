local sceneManager = {
    scenes = {},
    current = ""
}

--[[
    Autoload scenes from the /scenes directory. 
    @param startScene string Name of scene to start at. 
]]
function sceneManager.load(startScene) 
    
    local sceneFile = love.filesystem.getDirectoryItems( "scenes/" )
    
    for key, value in pairs(sceneFile) do

        local sceneNameTable = Utils:split(value,".")
        local sceneName = sceneNameTable[1]
        sceneManager.scenes[sceneName] = require ("scenes/"..sceneName )

    end

    sceneManager.change(startScene)
    
end

--[[
    Change to a new scene and call scenes load function. 
    @param startScene string Name of next scene.

]]
function sceneManager.change(newScene)
    
    if sceneManager.scenes[newScene] == nil then 
        return false 
    else 
        sceneManager.current = newScene
        sceneManager.scenes[newScene].load()
    end

    return true

end

--[[
    Return current string.
    @return string Current scene name. 
]]
function sceneManager.current()
    return sceneManager.current
end


--[[
    Below functions are path through functions that pass the love native funcitons to the active secene.
]]

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

--[[
    Checks it function available in scene, if so passes request to that function.
]]
function sceneManager.pass(func)
    if sceneManager.scenes[sceneManager.current][func] ~= nil then 
        sceneManager.scenes[sceneManager.current][func]()
    end
end



return sceneManager