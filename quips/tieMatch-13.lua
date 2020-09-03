local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Let's play hide-and-go-seek instead."
    },
    {
        action="pause",
        value="2"
    },
    {
        action="clearQuip",
    },
    {
        action="say",
        value="You hide first. I will find you."
    },
    {
        action="pause",
        value="2"
    },
	{
		action="say",
		value="I promise."
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