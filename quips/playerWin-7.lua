local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You looked so sad."
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
        value="So I let you have that one."
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