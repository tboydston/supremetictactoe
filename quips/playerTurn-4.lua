local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
	{
        action="say",
        value="Oh, you must have clicked that square by mistake."
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