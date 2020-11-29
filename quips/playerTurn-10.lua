local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Come on, at least try."
    },
    {
        action="end"
    }
}

return quip