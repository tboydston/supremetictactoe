local quip = {
    type = "createdNameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Oh it's you. You have been gone so long."
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
        value="I just assumed you were dead."
    }, 
    {
        action="sceneChange",
        value="tictactoe"
    }
}

return quip