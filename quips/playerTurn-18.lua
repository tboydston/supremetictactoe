local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Are"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Boring"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Me!"
    },
    {
        action="end"
    }
}

return quip