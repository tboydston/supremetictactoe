local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Oops-"
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
        value="Oh, you made that move on purpose."
    },
    {
        action="end"
    }
}

return quip