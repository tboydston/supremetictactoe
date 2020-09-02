local quip = {
    type = "supremeWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I can do this all day."
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
        value="Bring it on."
    },
    {
        action="end"
    }
}

return quip