local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Can I go back to calculating PI now?"
    },
    {
        action="end"
    }
}

return quip