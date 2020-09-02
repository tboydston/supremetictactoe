local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Enter your name."
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
        value="If you can't remember ask your mom."
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