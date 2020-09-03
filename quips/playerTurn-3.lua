local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
	{
        action="say",
        value="Ouch, not a great choice."
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