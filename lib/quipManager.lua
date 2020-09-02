--[[
    Loads and manages quips.
]]

local quipManager = {
    quips = {}
}

--[[
    Autoloads quips from the quips folder and adds them to the quipManager.quips object.
]]
function quipManager.load() 

    local quipFile = love.filesystem.getDirectoryItems( "quips/" )

    for key, value in pairs(quipFile) do

        local moduleName = Utils:split(value,".")[1]
        local quipName = Utils:split(value,"-")[1]

        if quipManager.quips[quipName] == nil then 
            quipManager.quips[quipName] = {}
        end
        
        table.insert( quipManager.quips[quipName] , require ("quips/"..moduleName ) )  

    end

end

--[[
    Returns a random quip with a given object key.
]]
function quipManager.getRandomQuip(quipName)
    
    local quipNumber = math.random(1,#quipManager.quips[quipName])
    print("Loading quip: "..quipName.."-"..quipNumber)
    return quipManager.quips[quipName][quipNumber]

end

return quipManager