local quip = {
    type = "nameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I bet you got picked on a lot in school with that name."
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
        value="I mean, I would bet. I'm not programmed for betting yet."
    },
    {
        action="pause",
        value="2"
    },
    {
        action="sceneChange",
        value="tictactoe"
    }
}

return quip