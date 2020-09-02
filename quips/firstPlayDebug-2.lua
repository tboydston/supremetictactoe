local quip = {
    type = "firstPlayDebug",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You are not qualified to operate that debug menu."
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
        value="Step away."
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