local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Common, at least try."
    },
    {
        action="end"
    }
}

return quip