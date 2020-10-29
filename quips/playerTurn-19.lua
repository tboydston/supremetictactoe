local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I see you have never played this game before."
    },
    {
        action="end"
    }
}

return quip