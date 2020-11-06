local quip = {
    type = "supremeWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="-sigh- Is there anyone else there who can play?"
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
        value="Maybe someone with a fully functioning brain?"
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
        value="unlike you"
    },
    {
        action="end"
    }
}

return quip