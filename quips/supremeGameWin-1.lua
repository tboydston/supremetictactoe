local quip = {
    type = "playerGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Yes, well, I don't think anyone is surprised by this outcome."
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
        value="Play again?"
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