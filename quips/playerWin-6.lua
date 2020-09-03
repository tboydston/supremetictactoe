local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I hope you are proud of yourself."
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