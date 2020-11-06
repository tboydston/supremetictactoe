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
        action="end"
    }
}

return quip