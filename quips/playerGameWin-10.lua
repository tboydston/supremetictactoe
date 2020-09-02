local quip = {
    type = "playerGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Impossible!"
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
        value="Your just a primate. I am an immortal machine!"
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