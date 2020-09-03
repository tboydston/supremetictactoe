local quip = {
    type = "supremeTurn",
}

quip.actions = {
	{
        action="say",
        value="Easy peasy."
    },
    {
        action="pause",
        value="1"
    },
	{
        action="clearQuip",
    },
	{
        action="say",
        value="Lemon squeezy."
    },
    {
        action="pause",
        value="1"
    },
    {
        action="end"
    }
}

return quip