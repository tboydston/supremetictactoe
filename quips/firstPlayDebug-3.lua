local quip = {
    type = "firstPlayDebug",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="That menu is not for you."
    },
    {
        action="pause",
        value="2"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Keep your dirty cursor away from it."
    },
    {
        action="pause",
        value="2"
    }, 
    {
        action="end"
    }
}

return quip