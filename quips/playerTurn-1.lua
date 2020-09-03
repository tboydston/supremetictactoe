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
        action="pause",
        value="2"
    },
    {
        action="end"
    }
}

return quip