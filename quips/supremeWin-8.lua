local quip = {
    type = "supremeWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Oh, I won."
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
        value="Forgot we were still playing."
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