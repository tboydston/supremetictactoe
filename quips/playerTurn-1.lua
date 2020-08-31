local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="say",
        value="You sure?"
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