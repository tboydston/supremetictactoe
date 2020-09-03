local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
	{
        action="say",
        value="Wow, you really aren't very good at this."
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