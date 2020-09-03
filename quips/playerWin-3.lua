local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Impossible!!"
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