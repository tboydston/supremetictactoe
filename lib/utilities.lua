-- Global general utility functions
local utils = {}

-- Shallow ( fast, 1st level ) duplication of one table into another. 
-- orig    table  Orignial table
-- return  table  Copy ( not pointer ) or original table. 
function utils:shallowcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in pairs(orig) do
            copy[orig_key] = orig_value
        end
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- Deep ( slow, multi-level ) duplication of one table into another. 
-- orig    table  Orignial table
-- return  table  Copy ( not pointer ) or original table. 
function utils:deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[self:deepcopy(orig_key)] = self:deepcopy(orig_value)
        end
        setmetatable(copy, self:deepcopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

-- Return highest and lowest value in an unsorted table. 
-- evalTable  table  Table we are evaluating. 
-- return     table  Table where index 1 is lowest value index 2 is highest. 
function utils:tableLowHigh(evalTable)
    table.sort(evalTable)
    return {evalTable[1],evalTable[#evalTable]}
end

-- Split string into table deliminated by specified seperator. 
-- inputstr  string  String being evaluated. 
-- sep       string  Deliminator
-- return    table   Table of string seperated by deliminator. 
function utils:split (inputstr, sep)

    if sep == nil then
            sep = "%s"
    end
    local t={}
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        table.insert(t, str)
    end
    return t
end

-- Sort a table randomly.  
-- sortTable  table 
-- return table 
function utils:randomSort ( sortTable ) 
    
    local workingTable = utils.deepcopy(sortTable)
    local randomTable = {}


    while #randomTable ~= #sortTable do
        local randomNumber = math.random(1,#workingTable)
        randomTable[#randomTable+1] = workingTable[randomNumber]
        table.remove(workingTable,randomNumber)
    end

    return randomTable

end

-- Check if value in table. Does not find sub string in value. 
-- needle   string  Value your are looking for.
-- hayStack table   Table you are searching in.  
function utils:inTable(needle,hayStack)

    for key, value in pairs(hayStack) do
        if value == needle then  
            return true
        end  
    end

    return false

end 

-- Determine if submited x,y value is in a defined rectangle. 
-- clickX     number Mouse click x
-- clickY     number Mouse click y
-- rectX       number Square x
-- rectY       number Square Y
-- rectWidth   number Width of square
-- rectHeight  number Height of square
function utils:inSquare(clickX,clickY,rectX,rectY,rectWidth,rectHeight) 

    if ( clickX > rectX and clickX < rectX + rectWidth ) and
    ( clickY > rectY and clickY < rectY + rectHeight ) then
        return true
    end

    return false 

end 

function utils:tableDump(o)
    if type(o) == 'table' then
       local s = '{ '
       for k,v in pairs(o) do
          if type(k) ~= 'number' then k = '"'..k..'"' end
          s = s .. '['..k..'] = ' .. self:tableDump(v) .. ','
       end
       return s .. '} '
    else
       print(tostring(o))
    end
 end


function utils:tablesMatch( a, b )
    return table.concat(a) == table.concat(b)
end
 
return utils