local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="That's it?"
    },
    {
        action="end"
    }
}

return quip