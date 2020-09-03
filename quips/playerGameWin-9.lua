local quip = {
    type = "playerGameWin",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="What!! Impossible!!"
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
        value="I am going to review my code to find our how you did this."
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