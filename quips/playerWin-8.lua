local quip = {
    type = "playerWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Letting you win this round..."
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
        value="is part of my strategy."
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