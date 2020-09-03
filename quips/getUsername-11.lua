local quip = {
    type = "getUsername",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Make sure you don't have the same name as me."
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
        value="That would be bad."
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