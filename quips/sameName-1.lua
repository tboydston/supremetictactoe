local quip = {
    type = "sameName",
}

quip.actions = {
    {
        action="clearQuip",
    },
    {
        action="say",
        value="Wait, thats my name!"
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