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
        action="pause",
        value="1"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Are"
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
        value="Boring"
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
        value="Me!"
    },
    {
        action="end"
    }
}

return quip