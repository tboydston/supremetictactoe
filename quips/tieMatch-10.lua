local quip = {
    type = "tieMatch",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="W . A . S . T . E . . . "
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
        value="O . F . . . "
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
        value="T . I . M . E . . . "
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