local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="am"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="so"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="bored!"
    },
    {
        action="end"
    }
}

return quip