local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="1,2,3 Go!!"
    },
    {
        action="end"
    }
}

return quip