local quip = {
    type = "createdNameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Welcome back."
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
        value="Today the student becomes the master."
    },
    {
        action="sceneChange",
        value="tictactoe"
    }
}

return quip