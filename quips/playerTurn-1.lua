local quip = {
    type = "playerTurn",
}

quip.actions = {
	{
        action="clearQuip",
    },
    {
        action="say",
        value="You sure?"
    },
    {
        action="end"
    }
}

return quip