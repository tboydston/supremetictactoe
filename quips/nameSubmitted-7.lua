local quip = {
    type = "nameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="haha, seriously?"
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
        value="Thats what they call you?"
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