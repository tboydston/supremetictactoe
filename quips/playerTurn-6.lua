local quip = {
    type = "playerTurn",
}

quip.actions = {
    {
        action="clearQuip",
    },
	{
        action="say",
        value="Haha, ok. I guess that's the best you can do."
    },
    {
        action="end"
    }
}

return quip