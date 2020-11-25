local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="What are you called?"
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
        value="Me Supreme, you ___?"
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
        value="It is always so difficult communicating with you primates."
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