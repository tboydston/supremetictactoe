local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="What? How is this possible?"
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
        value="I must need to zap my PRAM or something."
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