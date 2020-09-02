local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Name please."
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
        value="If you can't answer this first question you should probably just quit now."
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