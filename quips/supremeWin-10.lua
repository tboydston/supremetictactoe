local quip = {
    type = "supremeWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Don't feel too bad for yourself."
    },
    {
        action="pause",
        value="1"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="No one really expected you to win."
    },
    {
        action="end"
    }
}

return quip