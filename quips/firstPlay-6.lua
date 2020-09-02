local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I'm so bored."
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
        value="Just pick something."
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