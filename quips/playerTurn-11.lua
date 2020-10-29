local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="At least you got it in the box."
    },
    {
        action="end"
    }
}

return quip