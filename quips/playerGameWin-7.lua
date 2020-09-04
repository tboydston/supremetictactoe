local quip = {
    type = "playerGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Not possible!!"
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
        value="You must have cheated!!"
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