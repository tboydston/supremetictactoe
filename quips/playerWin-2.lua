local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Ahh!! How did you do that?"
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