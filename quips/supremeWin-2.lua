local quip = {
    type = "supremeWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Over already?"
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