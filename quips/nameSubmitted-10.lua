local quip = {
    type = "nameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="I think there must be a typo."
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
        value="I can't imagine anyone could be called that."
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