local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I hope your proud of yourself."
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