local quip = {
    type = "playerGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value=" . . . W . . . H . . . A . . . T . . . ! . . . ! . . . "
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
        value="Your victory is nothing to me."
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
        value="Obviously you cheated.",
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