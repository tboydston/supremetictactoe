local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You are a cheater!"
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