local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="la te da."
    },
    {
        action="end"
    }
}

return quip