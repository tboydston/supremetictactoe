local quip = {
    type = "supremeWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="To feel too bad for yourself."
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
        value="No one really expected you to win."
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