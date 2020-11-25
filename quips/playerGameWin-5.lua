local quip = {
    type = "playerGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="This is not a victory for you."
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
        value="It is a failure of QA."
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
        value="*QA note: This was not a failure of QA."
    },
    {
        action="pause",
        value="2"
    },
    {
        action="sceneChange",
        value="credits"
    },
}

return quip