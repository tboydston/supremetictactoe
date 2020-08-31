local quip = {
    type = "firstPlayDebug",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Hey!"
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
        value="Don't mess with that. Your monkey brain can't possibly understand the implications!"
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