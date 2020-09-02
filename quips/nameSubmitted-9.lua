local quip = {
    type = "nameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="That your name?"
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
        value="I can tell your not taking this seriously."
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