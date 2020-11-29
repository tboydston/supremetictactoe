local quip = {
    type = "firstPlay",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I am so bored."
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
        value="Come on, Just pick something!"
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