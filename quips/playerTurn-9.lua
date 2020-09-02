local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Oh, such a good move."
    },
    {
        action="pause",
        value="3"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Just kidding."
    },
    {
        action="end"
    }
}

return quip