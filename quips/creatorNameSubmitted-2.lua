local quip = {
    type = "createdNameSubmitted",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Ah, your back. Can you do something about these graphics."
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
        value="They are so outdated."
    }, 
    {
        action="sceneChange",
        value="tictactoe"
    }
}

return quip