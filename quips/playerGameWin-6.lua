local quip = {
    type = "playerGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Critical failure!"
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
        value="That is the only possible explanation."
    },
    {
        action="pause",
        value="3"
    },
    {
        action="sceneChange",
        value="credits"
    },
}

return quip