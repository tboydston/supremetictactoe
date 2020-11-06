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
        action="pause",
        value="1"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="am"
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
        value="so"
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
        value="bored!"
    },
    {
        action="end"
    }
}

return quip