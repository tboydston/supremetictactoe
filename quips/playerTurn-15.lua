local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Are you even paying attention?"
    },
    {
        action="end"
    }
}

return quip