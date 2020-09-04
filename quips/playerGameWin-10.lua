local quip = {
    type = "playerGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Impossible!!"
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
        value="You're just a primate. I am an immortal machine!!"
    },
    {
        action="pause",
        value="3"
    },
	{
        action="clearQuip",
    },
    {
        action="say",
        value="I'm better looking too."
    },
    {
        action="pause",
        value="1"
    },
    {
        action="sceneChange",
        value="credits"
    },
}

return quip